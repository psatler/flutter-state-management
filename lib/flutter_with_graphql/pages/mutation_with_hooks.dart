import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'model_serialization.dart';
import 'mutations.dart';

class MutationExample2WithHooks extends HookWidget {
  const MutationExample2WithHooks({Key? key}) : super(key: key);

  static const routeName = '/mutation_with_hooks';

  @override
  Widget build(BuildContext context) {
    final categoryName = useState('');
    final textController = useTextEditingController();

    final result = useMutation(
      MutationOptions<AddCategoryModel>(
        document: gql(CREATE_CATEGORY),
        parserFn: (json) => AddCategoryModel.fromMap(json),
      ),
    );

    // print(result.result.data);
    // print(result.result.parsedData?.addCategory.name ?? 'test ');

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: textController,
          ),
          TextButton(
            onPressed: () async {
              final mutationResult = result.runMutation(
                {
                  'name': textController.value.text,
                },
              );

              print('callback');
              print(mutationResult.eagerResult.parsedData?.addCategory.name);

              final netResult = await mutationResult.networkResult;
              print('netResult');
              print(netResult?.parsedData?.addCategory.name);

              categoryName.value = netResult?.parsedData?.addCategory.name ??
                  "not yet retrieved";
            },
            child: const Text('Run add category mutation'),
          ),
          const Text('The category created was'),
          Text(categoryName.value),
        ],
      ),
    );
  }
}
