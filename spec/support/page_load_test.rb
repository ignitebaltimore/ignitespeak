module PageLoadTest
  def should_load(path)
    page.current_path.should == path
    page.status_code.should == 200
  end

  def should_404(path)
    page.current_path.should == path
    page.status_code.should == 404
  end
end
