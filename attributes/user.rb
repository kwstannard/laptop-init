default['desktop']['user'].tap do |user|
  user['name'] = 'kwstannard'
  user['uid'] = '1000'
  user['group'] = 'kwstannard'
  user['gid'] = '1000'
  user['home'] = '/home/kwstannard'
end
