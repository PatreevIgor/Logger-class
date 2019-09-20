# Example call:
#
# Case 1 - I want log only string,       I write: Logger.log(['Some text without args!']){}
# Case 2 - I want log only var_name,     I write: Logger.log([:var_name]){}
# Case 3 - I want log changed var name,  I write: Logger.log([:var_name, 'new_var_name']){}
#

class Logger
  def self.log(m, &b)
    if i_want_add_only_commet?(m)
      puts m.first
    else
      var_name = m[0]
      comment  = m[1]

      if comment.nil?
        puts '-------------------------------------------------------------------------------------------------------'
        puts "#{var_name} = #{eval(var_name.to_s, b.binding)}"
        puts '-------------------------------------------------------------------------------------------------------'
      else
        puts '-------------------------------------------------------------------------------------------------------'
        puts "#{comment} = #{eval(var_name.to_s, b.binding)}"
        puts '-------------------------------------------------------------------------------------------------------'
      end
    end
  end

  def self.i_want_add_only_commet?(massive_args)
    massive_args.size == 1 || massive_args.first.kind_of?(String) ? true : false
  end
end
