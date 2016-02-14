module MarkdownHelper
  def raw_markdown_from_file(path, relative_to = Rails.root)
    raw_md from_file(path, relative_to)
  end

  private

  def raw_md(content)
    renderer = Redcarpet::Markdown.new Redcarpet::Render::HTML, RAW_MARKDOWN_OPTS
    raw renderer.render(content)
  end

  def from_file(path, relative_to)
    begin
      File.read relative_to.join(path)
    rescue Error::ENOENT
      "# Error rendering the page. Contact the administrators if this issue persists."
    end
  end
end
