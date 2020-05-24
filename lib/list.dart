import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'divider.dart';

class ContainerPaddingDivider extends StatelessWidget {
  final List<Widget> children;
  final double topMargin;
  final CrossAxisAlignment crossAxisAlignment;

  const ContainerPaddingDivider({
    Key key,
    @required this.children,
    this.topMargin = 20.0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color dividerColor = theme.dividerColor;

    return Container(
      margin: EdgeInsets.only(top: topMargin),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: dividerColor),
          top: BorderSide(color: dividerColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}

class ContainerBoxDecoration extends StatelessWidget {
  final List<Widget> children;
  final double topMargin;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets padding;

  const ContainerBoxDecoration({
    Key key,
    @required this.children,
    this.topMargin = 20.0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBoxDecorationSingleChild(
      padding: padding,
      topMargin: topMargin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}

class ContainerBoxDecorationSingleChild extends StatelessWidget {
  final Widget child;
  final double topMargin;
  final EdgeInsets padding;

  const ContainerBoxDecorationSingleChild({
    Key key,
    @required this.child,
    this.topMargin = 20.0,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color dividerColor = theme.dividerColor;

    return Container(
      margin: EdgeInsets.only(top: topMargin),
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: dividerColor),
          top: BorderSide(color: dividerColor),
        ),
      ),
      child: child,
    );
  }
}

class ContainerBoxPaddingWithHeader extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final EdgeInsets padding;
  final String footer;

  const ContainerBoxPaddingWithHeader({
    Key key,
    @required this.title,
    @required this.children,
    this.padding,
    this.footer = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 40.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ContainerBoxDecoration(
          topMargin: 5.0,
          children: children,
          padding: padding,
        ),
        footer.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Text(
                  footer,
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            : Container(),
      ],
    );
  }
}

class ContainerBoxDecorationSingleChildWithHeader extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets padding;
  final String footer;

  const ContainerBoxDecorationSingleChildWithHeader({
    Key key,
    @required this.title,
    @required this.child,
    this.padding,
    this.footer = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 40.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ContainerBoxDecorationSingleChild(
          topMargin: 5.0,
          child: child,
          padding: padding,
        ),
        footer.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Text(
                  footer,
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            : Container(),
      ],
    );
  }
}

class ContainerBoxDecorationSeparated extends StatelessWidget {
  final double topMargin;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController controller;
  final Widget separator;
  final ScrollPhysics physics;
  final Color color;

  const ContainerBoxDecorationSeparated({
    Key key,
    this.topMargin = 20.0,
    @required this.itemBuilder,
    @required this.itemCount,
    this.controller,
    this.separator = dividerIndent,
    this.physics,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color dividerColor = theme.dividerColor;

    return Container(
      margin: EdgeInsets.only(top: topMargin),
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: BorderSide(color: dividerColor),
          top: BorderSide(color: dividerColor),
        ),
      ),
      child: ListViewSeparated(
        controller: controller,
        physics: physics,
        itemBuilder: itemBuilder,
        separator: separator,
        itemCount: itemCount,
      ),
    );
  }
}

class ListViewSeparated extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController controller;
  final Widget separator;
  final ScrollPhysics physics;

  const ListViewSeparated({
    Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.controller,
    this.separator = dividerIndent,
    this.physics = const NeverScrollableScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      shrinkWrap: true,
      physics: physics,
      itemBuilder: itemBuilder,
      separatorBuilder: (BuildContext context, int index) {
        return separator;
      },
      itemCount: itemCount,
    );
  }
}

class ContainerBoxDecorationSeparatedWithHeader extends StatelessWidget {
  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const ContainerBoxDecorationSeparatedWithHeader({
    Key key,
    this.title,
    @required this.itemBuilder,
    @required this.itemCount,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
        ContainerBoxDecorationSeparated(
          topMargin: 5.0,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        )
      ],
    );
  }
}
