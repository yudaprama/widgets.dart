import 'package:flutter/material.dart';

import 'divider.dart';
import 'raisedbuttonwithloader.dart';

class ErrorMessageView extends StatelessWidget {
	final errorObject;
	final VoidCallback onRetry;
	final double height;
	final String title;
	final String buttonLabel;

	const ErrorMessageView({
		Key key,
		this.errorObject,
		this.onRetry,
		this.height,
		this.title = 'Terjadi Kesalahan',
		this.buttonLabel = 'Coba Lagi',
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		String message = errorObject.toString();
		Widget icon = Container();
		if (height == null)
			return Center(
				child: Padding(
					padding: const EdgeInsets.all(20.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							icon,
							sizeBox15,
							Text(
								title,
								style: Theme.of(context).textTheme.headline4,
								textAlign: TextAlign.center,
							),
							const SizedBox(height: 15),
							Text(
								message ?? '',
								textAlign: TextAlign.center,
							),
							const SizedBox(height: 25),
							RaisedButtonWithLoader(
								label: buttonLabel,
								onPressed: onRetry,
							),
						],
					),
				),
			);
		else
			return Padding(
				padding: const EdgeInsets.all(20.0),
				child: Column(
					children: <Widget>[
						SizedBox(height: height,),
						icon,
						sizeBox15,
						Text(
							title,
							style: Theme.of(context).textTheme.headline4,
							textAlign: TextAlign.center,
						),
						const SizedBox(height: 15),
						Text(
							message ?? '',
							textAlign: TextAlign.center,
						),
						const SizedBox(height: 25),
						RaisedButtonWithLoader(
							label: buttonLabel,
							onPressed: onRetry,
						)
					],
				),
			);
	}
}

class DataNotFoundView extends StatelessWidget {
	final String message;
	final String title;

	const DataNotFoundView({
		Key key,
		this.message = 'No data',
		this.title = 'Data Not Found',
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Padding(
				padding: const EdgeInsets.symmetric(horizontal: 16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						sizeBox10,
						Icon(
							Icons.error,
							size: 48,
						),
						sizeBox10,
						Text(
							title,
							style: Theme.of(context).textTheme.headline6,
							textAlign: TextAlign.center,
						),
						sizeBox5,
						Text(
							message,
							textAlign: TextAlign.center,
						),
					],
				),
			),
		);
	}
}
