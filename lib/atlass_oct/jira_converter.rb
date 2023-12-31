# frozen_string_literal: true

module AtlassOct
  class JiraConverter
    # def initialize
    #   @jira_content = jira_content
    # end
    #
    # attr_reader :jira_content

    def self.convert_headings(jira_content)
      converted_jira_content = jira_content.gsub(/^h1\. /, '# ')
      converted_jira_content = converted_jira_content.gsub(/^h2\. /, '## ')
      converted_jira_content = converted_jira_content.gsub(/^h3\. /, '### ')
      converted_jira_content = converted_jira_content.gsub(/^h4\. /, '#### ')
      converted_jira_content = converted_jira_content.gsub(/^h5\. /, '##### ')
      converted_jira_content.gsub(/^h6\. /, '###### ')
    end

    def self.convert_strong(jira_content)
      jira_content.gsub(/\*{1}(.+?)\*{1}/, '**\1**')
    end

    def self.convert_emphasis(jira_content)
      jira_content.gsub(/_(.+?)__/, '*\1_*').gsub(/_{1}(.+?)_{1}/, '*\1*')
    end

    def self.convert_deleted(jira_content)
      jira_content.gsub(/-{1}(.+?)-{1}/, '~~\1~~')
    end
  end
end
