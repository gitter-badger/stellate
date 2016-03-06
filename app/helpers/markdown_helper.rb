module MarkdownHelper
  RAW_MARKDOWN_OPTS = {
    tables: true,
    fenced_code_blocks: true,
    autolink: true,
    disable_indented_code_blocks: true,
    strikethrough: true,
    superscript: false
  }

  def raw_markdown_from_file(path, relative_to = Rails.root)
    raw_md from_file(path, relative_to)
  end

  private

  def raw_md(content)
    renderer = Redcarpet::Markdown.new Redcarpet::Render::HTML, RAW_MARKDOWN_OPTS
    raw renderer.render(content)
  end

  def from_file(path, relative_to)
    File.read relative_to.join(path)
  end
end
