import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:go_router/go_router.dart';

class AddressDisplayer extends StatefulWidget {
  const AddressDisplayer({super.key, required this.placemark});

  final geo.Placemark placemark;

  @override
  State<AddressDisplayer> createState() => _AddressDisplayerState();
}

class _AddressDisplayerState extends State<AddressDisplayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.placemark.street!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      _renderAddressText(),
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines:
                          GoRouter.of(context).state.uri.path ==
                              "/add-story/map"
                          ? 1
                          : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (GoRouter.of(context).state.uri.path == "/add-story/map")
            OutlinedButton(
              onPressed: () {
                context.go("/add-story");
              },
              child: Text("set mark!"),
            )
          else
            SizedBox(),
        ],
      ),
    );
  }

  _renderAddressText() {
    final addressList = [
      widget.placemark.subLocality,
      widget.placemark.locality,
      widget.placemark.postalCode,
      widget.placemark.country,
    ];
    return addressList
        .where((element) => element != null && element.trim().isNotEmpty)
        .join(', ');
  }
}
