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
  end
end
