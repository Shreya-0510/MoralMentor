import 'package:flutter/material.dart';
import 'package:moral_mentor/widgets/appbar.dart';
import 'package:moral_mentor/widgets/appdrawer.dart';

class ScenarioPage extends StatelessWidget {
  const ScenarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResponsiveAppBar(),
      endDrawer: const AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 24),
                  _buildScenarioList(context, constraints),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'Ethical Scenarios',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildScenarioList(BuildContext context, BoxConstraints constraints) {
    // This is a placeholder list of scenarios. In a real app, this would likely come from a database or API.
    final scenarios = [
      'The Trolley Problem',
      'The Prisoner\'s Dilemma',
      'The Veil of Ignorance',
      'The Experience Machine',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 700 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: scenarios.length,
          itemBuilder: (context, index) {
            return _buildScenarioCard(context, scenarios[index]);
          },
        );
      },
    );
  }

  Widget _buildScenarioCard(BuildContext context, String scenario) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to the specific scenario page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You tapped on $scenario')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                scenario,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Explore this ethical dilemma and test your moral reasoning.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
