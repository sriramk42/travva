module TripHelper
  def tabs_classes(actual_tab, target_tab)
    class_names('light-button', {active: actual_tab == target_tab})
  end

  def panes_classe(actual_tab, target_tab)
    class_names('tab-pane', {active: actual_tab == target_tab})
  end
end
