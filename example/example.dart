import 'package:sticky_infinite_list/sticky_infinite_list.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InfiniteList(
      /// Scroll controller. `Optional`
      controller: ScrollController(),

      /// Render scroll in both directions. `Optional`
      direction: InfiniteListDirection.multi,

      /// Render 100 elements in negative direction. `Optional`
      ///
      /// If it's not provided, scroll will be infinite in negative direction
      ///
      /// Will be ignored if [direction] is forward
      ///
      /// If it's `null`, list will be infinite
      minChildCount: -100,

      /// Render 100 elements in positive direction. `Optional`
      ///
      /// If it's not provided, scroll will be infinite in positive direction
      ///
      /// If it's `null`, list will be infinite
      maxChildCount: 100,

      /// ViewPort anchor value. See [ScrollView] docs for more info
      anchor: 0.0,

      /// Item builder
      builder: (BuildContext context, int index) {
        /// Builder requires [InfiniteList] to be returned
        return InfiniteListItem(
          /// If header should be build during initial render.
          ///
          /// Will be ignored with just [headerBuilder] builder specified
          initialHeaderBuild: true,

          /// Header builder with state
          ///
          /// Will be invoked each time header changes it's position
          ///
          /// If you don't need to rerender header on each
          /// position change - use [headerBuilder] builder
          headerStateBuilder: (BuildContext context, StickyState<int> state) {
            return Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              child: Text("Header $index"),
              color: Colors.orange.withOpacity(state.position),
            );
          },

          /// This is just example
          ///
          /// In you application you should use or
          /// [headerBuilder] or [headerStateBuilder],
          /// but not both
          ///
          /// If both is specified, this invoker will be ignored
          headerBuilder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              child: Text("Header $index"),
              color: Colors.orange,
            );
          },

          /// Content builder
          contentBuilder: (BuildContext context) {
            return Container(
              height: 300,
              child: Text(
                "Content $index",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blueAccent,
            );
          },

          /// Min offset after which it
          /// should stick to the bottom edge
          /// of container
          minOffsetProvider: (StickyState<int> state) => 50,

          /// Header alignment
          ///
          /// Currently it supports top left,
          /// top right, bottom left and bottom right alignments
          ///
          /// By default [HeaderAlignment.topLeft]
          headerAlignment: HeaderAlignment.topLeft,


        );
      }
    );
  }
}