# encoding: utf-8

#  Copyright (c) 2008-2016, Puzzle ITC GmbH. This file is part of
#  Cryptopus and licensed under the Affero General Public License version 3 or later.
#  See the COPYING file at the top-level directory or at
#  https://github.com/puzzle/cryptopus.

class Api::TeamsController < ApiController
  before_filter :check_for_admin

  def last_teammember_teams
    
    user = User.find(params['user_id'])
    teams = user.last_teammember_teams
    render_json teams
  end

  def destroy 
    team = Team.find(params['id'])
    team.destroy
    render_json ''
  end

  protected

  def check_for_admin
    unless User.find(session[:user_id]).admin?
      add_error t('flashes.admin.admin.no_access')
      render_json and return
    end
  end
end
