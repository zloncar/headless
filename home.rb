require_relative 'search_pod'

class Home < SitePrism::Page
  section :search_pod, Monarch::SearchPodSection, "#form"
  set_url "/"

  def fill_form
    search_pod.fill_form
  end

  def submit_form
    search_pod.submit_form
  end

  def screenshot
    page.save_screenshot('monarch_home.png', full: false)
  end
end