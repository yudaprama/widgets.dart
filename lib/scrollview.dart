import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/loading.dart';

class CupertinoScrollView extends StatelessWidget {
  final Widget child;
  final String title;
  final String previousPageTitle;
  final bool automaticallyImplyLeading;
  final Widget trailing;

  const CupertinoScrollView({
	  Key key,
	  @required this.child,
	  @required this.title,
	  @required this.previousPageTitle,
	  this.automaticallyImplyLeading = true,
	  this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
	    backgroundColor: Theme.of(context).canvasColor,
	    child: CustomScrollView(
		    slivers: <Widget>[
			    CupertinoTheme(
				    data: CupertinoThemeData(
					    primaryColor: CupertinoColors.black,
				    ),
				    child: CupertinoSliverNavigationBar(
					    automaticallyImplyLeading: automaticallyImplyLeading,
					    largeTitle: Text(title),
					    previousPageTitle: previousPageTitle,
					    trailing: trailing,
				    ),
			    ),
			    child,
		    ],
	    ),
    );
  }
}

Widget sliverList({Widget child}) {
	return SliverList(
		delegate: SliverChildListDelegate([
			Material(
				child: child,
			)
		]),
	);
}

Widget sliverLoading({String text}) {
	return SliverFillRemaining(
		child: cupertinoLoadingIndicator(text: text),
	);
}
