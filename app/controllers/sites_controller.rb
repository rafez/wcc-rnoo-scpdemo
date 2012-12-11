require 'net/ssh'
require 'net/scp'
require 'net/sftp'
require 'rufus/scheduler'


class SitesController < ApplicationController
  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find(params[:id])

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
      
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new 
    puts "Got here"
    #2.times { @site.connections.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  def connect
    @site = Site.find(params[:id])

     Net::SSH.start(
    @site.src_sitename,
    @site.src_username,
    :key_data => [@site.src_privatekey],
    :passphrase => @site.src_privatekeypw,
    :keys_only => true) do |ssh|
       data = ssh.scp.download! @site.src_filepath
    end

    Net::SSH.start(
    @site.dest_sitename,
    @site.dest_username,
    :key_data => [@site.dest_privatekey],
    :passphrase => @site.dest_privatekeypw,
    :keys_only => true) do |ssh2|

    # upload from an in-memory buffer
      #ssh2.scp.upload! StringIO.new( @data, @site.dest_filepath )
      ssh2.sftp.upload! StringIO.new( @data, @site.dest_filepath )
    end
  end

  def connect_test_src
    #@site = Site.new
    @site = Site.find(params[:id])
    Net::SSH.start(
    @site.src_sitename,
    @site.src_username,
    :key_data => [@site.src_privatekey],
    :passphrase => @site.src_privatekeypw,
    :keys_only => true) do |ssh|
      
      respond_to do |format|
        if output = ssh.exec!("hostname")
          format.html { redirect_to @site, notice: "Source server tested correctly. "+output }
        else
          format.html { redirect_to @site, notice: "FAILED: Couldn't connect to Source server."+output }
        end
      end
  end
  end

  def connect_test_dest
    @site = Site.find(params[:id])
  
    Net::SSH.start(
    @site.dest_sitename,
    @site.dest_username,
    :key_data => [@site.dest_privatekey],
    :passphrase => @site.dest_privatekeypw,
    :keys_only => true) do |ssh|
      
      respond_to do |format|
        if output = ssh.exec!("hostname")
          format.html { redirect_to @site, notice: "Destination server tested correctly. "+output }
        else
          format.html { redirect_to @site, notice: "FAILED: Couldn't connect to Source server."+output }
        end
      end
  end
  end


  def transfer
    @site = Site.find(params[:id])

    Net::SSH.start(
    @site.src_sitename,
    @site.src_username,
    :key_data => [@site.src_privatekey],
    :passphrase => @site.src_privatekeypw,
    :keys_only => true) do |ssh|
        @data = ssh.scp.download! @site.src_filepath
    end
    puts "Downloaded data"
    Net::SSH.start(
      @site.dest_sitename,
      @site.dest_username,
      :key_data => [@site.dest_privatekey],
      :passphrase => @site.dest_privatekeypw,
      :keys_only => true) do |ssh2|
          respond_to do |format|
            if output = ( ssh2.sftp.upload! StringIO.new( @data ), @site.dest_filepath )
              format.html { redirect_to @site, notice: "Successfully transferred " + @site.dest_filepath + " to " + @site.dest_sitename }
             else
              format.html { redirect_to @site, notice: "FAILED: Couldn't transfer file "+ @site.dest_filepath + " to " + @site.dest_sitename }
            end
          end
        puts "Finished downloading data"
      end
    end
    
  def schedule
    @site = Site.find(params[:id])

    scheduler = Rufus::Scheduler.start_new

    scheduler.every '10s' do
      puts "rufus scheduler schedule loaded"
#      :notice => 'Successfully scheduled'  
    end
  end
  
  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end
end
