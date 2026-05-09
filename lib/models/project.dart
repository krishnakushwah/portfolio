class PortfolioProject {
  const PortfolioProject({
    required this.name,
    required this.category,
    required this.overview,
    required this.features,
    required this.technologies,
    required this.architecture,
    required this.contribution,
  });

  final String name;
  final String category;
  final String overview;
  final List<String> features;
  final List<String> technologies;
  final String architecture;
  final String contribution;
}
