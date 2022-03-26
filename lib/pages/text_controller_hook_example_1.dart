import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextControllerHookExample1 extends HookWidget {
  const TextControllerHookExample1({Key? key, required this.title})
      : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState("");
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                label: Text("Type in something"),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
