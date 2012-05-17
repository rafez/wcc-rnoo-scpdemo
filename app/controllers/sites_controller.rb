require 'net/ssh'
require 'net/scp'
require 'rufus/scheduler'
#require 'rufus/scheduler'


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

=begin    
    # This works - RNOO - 2012-03-12 17:07
    #Net::SSH.start( "wvtcent2", "rafez", :password => "password" ) do |ssh|
    #ssh.scp.download! "/home/rafez/maven-repos.txt", "/maven-repos.txt"
    #end

    # This works - RNOO - 2012-03-12 17:07
    keyPublic = Net::SSH::KeyFactory.load_data_public_key( "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB+/Oo/MjYK9fJo1LTUyhytusSuOcj3/pGw5BDZHt8SnOaUJ6R4xr0GbNnRG8BFIlYzL0PBcSP91Tau1me4Zo02Ae64wC3hWgO//VIhB4USdD114FlSO4xhtwoX08cM2qHSjleVCv36C7uIRWPqJjQDWYCGI46rmMObIdFJNsW9gw== rsa-key-20090526", "" )
    keyPrivate = Net::SSH::KeyFactory.load_data_private_key( 
"-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,880C2C2175C41173

Qqk7WpAbEIabzqGCNGQcpYrYGhyfXAIfGSlLQyzSSjiQG/JLbMCvrNmVN8M9hZM4
J8HodwtPUlrKeU9fMQqeiXiEJ0TOkrt5+GPvFy+ZhuLR2zLa5pFgyP+jrxF50D8a
A6bm9WrrC48YKQx8Jur/0eKJHJDNz7E+7ehPZTbUHFJaz+BdK5W4/GMh3exIkaD1
giezq8x88/l7YKaxjP/VGLIkGSRiIKj1BBDPeZ2uXD67qZ9lVW0Bs+CxLoB3ThZs
b1J67io2jPMgJAJP4LLruoReXmIIuUNbCY6ZzRk14+2WHObcYyhiSCLvuapsaR5s
SnnwErrKrKGLH4gvsRRc8/8p5RDzVw1Q1y92t+9oufhV42OhtispA48uh9wM7myI
8FkhzR8WthoTbk6G+YmIX7RjGC+Sdet6Caf+ywctCjkbqLqeoLkYh6HcfBzlcOcu
i82I3CO1yZ2xzjE94DcvdCG2PAEiorWQz+VoC+82ka+KlsmzPEsZbHPbZ9/Dwq6g
aKBvmZgfLDWu1mOWLbVBQ9hXPVPoRO65aggmfkOvlJMmdXIoV9RayZS18TfVOt0F
IjXgRfnULoHuRPvDf44HWU27OUO/7lrgqM8V1xD3iPNwWcfmr6BR3vCGSI9mVnuh
reinjdhnfDGALQJ+JK67olTdcEc492bTMt9E2H5ixqMFFwdQav7WQqWCvs/Nm2lv
BO3Ndafk3sFiL723fcDtbDEO6/7EEoMSxY9GqcqHBJF5BC1qRHQhZOdRWjr/pSe3
66k/bGY8UrOp/7dAi3CLZxlE3SE3wllWkk3rwGd0gzw=
-----END RSA PRIVATE KEY-----", "gazelleisgood","" )       
    
     
    Net::SSH.start(
    "wvtcent2", "rafez",
    :key_data => [
      "-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,880C2C2175C41173

Qqk7WpAbEIabzqGCNGQcpYrYGhyfXAIfGSlLQyzSSjiQG/JLbMCvrNmVN8M9hZM4
J8HodwtPUlrKeU9fMQqeiXiEJ0TOkrt5+GPvFy+ZhuLR2zLa5pFgyP+jrxF50D8a
A6bm9WrrC48YKQx8Jur/0eKJHJDNz7E+7ehPZTbUHFJaz+BdK5W4/GMh3exIkaD1
giezq8x88/l7YKaxjP/VGLIkGSRiIKj1BBDPeZ2uXD67qZ9lVW0Bs+CxLoB3ThZs
b1J67io2jPMgJAJP4LLruoReXmIIuUNbCY6ZzRk14+2WHObcYyhiSCLvuapsaR5s
SnnwErrKrKGLH4gvsRRc8/8p5RDzVw1Q1y92t+9oufhV42OhtispA48uh9wM7myI
8FkhzR8WthoTbk6G+YmIX7RjGC+Sdet6Caf+ywctCjkbqLqeoLkYh6HcfBzlcOcu
i82I3CO1yZ2xzjE94DcvdCG2PAEiorWQz+VoC+82ka+KlsmzPEsZbHPbZ9/Dwq6g
aKBvmZgfLDWu1mOWLbVBQ9hXPVPoRO65aggmfkOvlJMmdXIoV9RayZS18TfVOt0F
IjXgRfnULoHuRPvDf44HWU27OUO/7lrgqM8V1xD3iPNwWcfmr6BR3vCGSI9mVnuh
reinjdhnfDGALQJ+JK67olTdcEc492bTMt9E2H5ixqMFFwdQav7WQqWCvs/Nm2lv
BO3Ndafk3sFiL723fcDtbDEO6/7EEoMSxY9GqcqHBJF5BC1qRHQhZOdRWjr/pSe3
66k/bGY8UrOp/7dAi3CLZxlE3SE3wllWkk3rwGd0gzw=
-----END RSA PRIVATE KEY-----"
    ], 
    :keys_only => true ) do |ssh|
      # This line works to transfer a file
      # ssh.scp.download! "/home/rafez/maven-repos.txt", "/maven-repos.txt"
      data = ssh.scp.download! "/home/rafez/maven-repos.txt"
      
      #puts data
      File.open( "/maven-tmp.txt", 'w') {|f| f.write( data ) }
    end
=end

  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new

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

   # This works - RNOO - 2012-03-12 17:07
    #Net::SSH.start( "wvtcent2", "rafez", :password => "password" ) do |ssh|
    #ssh.scp.download! "/home/rafez/maven-repos.txt", "/maven-repos.txt"
    #end

    # This works - RNOO - 2012-03-12 17:07
    #keyPublic = Net::SSH::KeyFactory.load_data_public_key( "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB+/Oo/MjYK9fJo1LTUyhytusSuOcj3/pGw5BDZHt8SnOaUJ6R4xr0GbNnRG8BFIlYzL0PBcSP91Tau1me4Zo02Ae64wC3hWgO//VIhB4USdD114FlSO4xhtwoX08cM2qHSjleVCv36C7uIRWPqJjQDWYCGI46rmMObIdFJNsW9gw== rsa-key-20090526", "" )
    #keyPrivate = Net::SSH::KeyFactory.load_data_private_key( @site.privatekey, @site.privatekeypw, "" )
     
    Net::SSH.start(
    @site.sitename,
    @site.username,
    :key_data => [@site.privatekey],
    :passphrase => @site.privatekeypw,
    :keys_only => true) do |ssh|
      
      # This line works to transfer a file
      # ssh.scp.download! "/home/rafez/maven-repos.txt", "/maven-repos.txt"
      #data = ssh.scp.download! "/home/rafez/maven-repos.txt"
      data = ssh.scp.download! @site.remotefilepath

      #puts data
      if File.open( @site.localfilepath, 'w') {|f| f.write( data ) }
        redirect_to @site, notice: 'File successfully downloaded from: '+@site.sitename+':'+@site.remotefilepath+
        '==>'+@site.localfilepath
      end
      
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
