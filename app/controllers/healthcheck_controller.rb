class HealthcheckController < ApplicationController

  #skip_before_filter :require_auth

  # the basic health status object
  class Health
    attr_accessor :healthy
    attr_accessor :message

    def initialize( status, message )
      @healthy = status
      @message = message
    end

  end

  # the response
  class HealthCheckResponse

    attr_accessor :repository
    attr_accessor :mysql
    attr_accessor :env_password
    attr_accessor :env_sender
    attr_accessor :env_receiver

    def is_healthy?
      mysql.healthy && env_password.healthy && env_sender.healthy && env_receiver.healthy
    end
  end

  # # GET /healthcheck
  # # GET /healthcheck.json
  def index
    status = get_health_status( )
    response = make_response( status )
    render json: response, :status => response.is_healthy? ? 200 : 500
  end

  private

  def get_health_status
    status = {}

    # check mysql
    connected = ActiveRecord::Base.connection_pool.with_connection { |con| con.active? }  rescue false
    status[ :mysql ] = Health.new( connected, connected ? '' : 'Database connection error' )

    # check environment variables
    msg = ''
    msg = !ENV['env_password'].nil? ? '' : 'Environment variable password is not defined.'
    status[:env_password] = Health.new(!ENV['env_password'].nil?, msg)

    msg = !ENV['SENDER'].nil? ? '' : 'Environment variable SENDER is not defined.'
    status[:env_sender] = Health.new(!ENV['SENDER'].nil?, msg)

    msg = !ENV['RECEIVER'].nil? ? '' : 'Environment variable RECEIVER is not defined.'
    status[:env_receiver] = Health.new(!ENV['RECEIVER'].nil?, msg)

    return( status )
  end

  def make_response( health_status )
    r = HealthCheckResponse.new
    r.mysql = health_status[ :mysql ]
    r.env_password = health_status[ :env_password ]
    r.env_sender = health_status[ :env_sender ]
    r.env_receiver = health_status[ :env_receiver ]
    return( r )
  end

end