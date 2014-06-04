module PageLoadTest
  def should_load(path)
    expect(page.current_path).to eq(path)
    expect(page.status_code).to eq(200)
  end

  def should_404(path)
    expect(page.current_path).to eq(path)
    expect(page.status_code).to eq(404)
  end
end
