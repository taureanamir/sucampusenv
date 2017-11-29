server 'web4.cs.ait.ac.th',
       user: 'deploy',
       roles: %w{web app db},
       ssh_options: {
           forward_agent: true,
           auth_methods: %w(publickey)
       }