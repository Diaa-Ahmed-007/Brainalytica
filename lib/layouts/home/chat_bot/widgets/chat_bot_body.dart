import 'package:doctors/layouts/home/chat_bot/view_model/chat_bot_view_model.dart';
import 'package:doctors/layouts/home/chat_bot/view_model/chat_bot_view_model_states.dart';
import 'package:doctors/layouts/home/chat_bot/widgets/chat_bot_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotBody extends StatefulWidget {
  final String token;

  const ChatBotBody({
    super.key,
    required this.token,
  });

  @override
  State<ChatBotBody> createState() => _ChatBotBodyState();
}

class _ChatBotBodyState extends State<ChatBotBody> {
  late final ChatBotViewModel chatBotViewModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    chatBotViewModel = context.read<ChatBotViewModel>();
  }

  void _autoScrollToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<ChatBotViewModel, ChatBotViewModelStates>(
      listener: (context, state) {
        if (state is ChatBotSuccessState || state is ChatBotLoadingState) {
          _autoScrollToBottom();
        }
      },
      builder: (context, state) {
        List<dynamic> messages = [];

        if (state is ChatBotSuccessState) {
          messages = state.messages;
        } else if (state is ChatBotLoadingState) {
          messages = state.messages;
        } else if (state is ChatBotInitialState) {
          messages = state.messages;
        } else if (state is ChatBotErrorState) {
          messages = state.messages;
        }

        final isTyping = state is ChatBotLoadingState;

        return SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: CustomScrollView(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          sliver: messages.isEmpty
                              ? SliverToBoxAdapter(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.8, // أو أي نسبة تناسبك
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Start chatting with our Shopping Assistant!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final msg = messages[index];
                                      // لو الرسالة من المستخدم
                                      if (msg.isUser) {
                                        return Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 12),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 14),
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade800,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              msg.message,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        );
                                      } else {
                                        // لو الرسالة من البوت
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (msg.emotion != null)
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.emoji_emotions,
                                                        color: Colors.orange,
                                                        size: 20),
                                                    const SizedBox(width: 4),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 4),
                                                      child: Text(
                                                        msg.emotion!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              const SizedBox(height: 5),
                                              Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  color: Colors.green.shade50,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: Colors
                                                          .green.shade200),
                                                ),
                                                child: Text(
                                                  msg.botReply ?? msg.message,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    childCount: messages.length,
                                  ),
                                ),
                        ),
                        if (isTyping)
                          const SliverToBoxAdapter(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 8),
                                child: SizedBox(
                                  width: 80,
                                  child: LinearProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: bottomInset,
                child: ChatBotInputField(
                  token: widget.token,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
