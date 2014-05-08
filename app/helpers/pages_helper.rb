module PagesHelper
  def project_euler_link(text='Project Euler')
    link_to text, 'http://projecteuler.net'
  end

  def euler_problems_link(text='Project Euler')
    link_to text, 'http://projecteuler.net/problems'
  end
end
