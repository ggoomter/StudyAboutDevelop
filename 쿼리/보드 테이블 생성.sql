lare_modifier_cannot_be_used_in_an_already_ambient_context);
                        }
                        else if (ts.isPrivateIdentifierClassElementDeclaration(node)) {
                            return grammarErrorOnNode(modifier, ts.Diagnostics._0_modifier_cannot_be_used_with_a_private_identifier, "declare");
                        }
                        flags |= 2 /* Ambient */;
                        lastDeclare = modifier;
                        break;
                    case 126 /* AbstractKeyword */:
                        if (flags & 128 /* Abstract */) {
                            return grammarErrorOnNode(modifier, ts.Diagnostics._0_modifier_already_seen, "abstract");
                        }
                        if (node.kind !== 255 /* ClassD