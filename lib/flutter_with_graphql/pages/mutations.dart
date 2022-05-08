import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'model_serialization.dart';

const CREATE_CATEGORY = """
mutation CreateCategory(\$name: String!) {
  addCategory(input: {
    name: \$name,
  }) {
    name
  }
}
""";

class MutationExample1 extends StatelessWidget {
  const MutationExample1({Key? key}) : super(key: key);

  static const String routeName = '/mutation_example_1';

  Future<void> _createCategory(
      BuildContext context, String categoryName) async {
    // Passing the Model as a type and also passing the fromMap at parserFn callback
    MutationOptions<AddCategoryModel> _options =
        MutationOptions<AddCategoryModel>(
      document: gql(CREATE_CATEGORY),
      variables: {
        "name": categoryName,
      },
      parserFn: (json) => AddCategoryModel.fromMap(json),
    );

    final result = await GraphQLProvider.of(context).value.mutate(_options);

    print(result.data);
    print(result.parsedData?.addCategory.name ?? "Not found");
  }

  Future<void> _addCategory(
    BuildContext context,
    RunMutation runMutation,
  ) async {
    /// Trigger the mutation query by calling [runMutation] and passing in the mutation variable
    final mutationResult = runMutation(
      {
        'name': "Flutter Test 1",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Mutation(
            options: MutationOptions(
              document: gql(CREATE_CATEGORY),
              onCompleted: (data) {
                print('data $data');
              },
              parserFn: AddCategoryModel.fromMap,
            ),
            builder: (RunMutation runMutation, QueryResult? result) {
              if (result != null) {
                if (result.isLoading) {
                  return const CircularProgressIndicator();
                }

                if (result.hasException) {
                  return Center(
                    child: Text('Error ${result.exception}'),
                  );
                }
              }

              return TextButton(
                onPressed: () {
                  _addCategory(context, runMutation);
                },
                child: const Text('Add Category'),
              );
            },
          ),
          TextButton.icon(
            onPressed: () => _createCategory(context, "Flutter test 22"),
            icon: const Icon(Icons.send),
            label: const Text('client mutate'),
          ),
          Expanded(
            child: ListView(
              children: const [],
            ),
          ),
        ],
      ),
    );
  }
}
