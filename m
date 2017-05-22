From: Hao Wei Tee <angelsl@angelsl.xyz>
Subject: [PATCH v2] platform/x86: ideapad-laptop: Squelch ACPI event 1
Date: Mon, 22 May 2017 18:38:55 +0800
Message-ID: <7a7642d7-846e-9ead-a8d0-d10d7f85158b@angelsl.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:32868 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752021AbdEVKjB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 May 2017 06:39:01 -0400
Received: by mail-pf0-f171.google.com with SMTP id e193so78618556pfh.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 May 2017 03:39:00 -0700 (PDT)
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

Don't simply throw this to userspace via the sparse_keymap (which does not
have a mapping for scancode 1), as this causes KEY_UNKNOWN to be emitted,
which is a nuisance and of no use at all (it is not the right way to expose
this ACPI event to userspace, anyway, and the original intention of the commit
which added this (cfee5d63767b2e7997c1f36420d008abbe61565c) was only to suppress
an unhandled event log message).

Signed-off-by: Hao Wei Tee <angelsl@angelsl.xyz>
---
 drivers/platform/x86/ideapad-laptop.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 24ca9fbe31cc..998da7b4cd8e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -810,7 +810,6 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 			case 8:
 			case 7:
 			case 6:
-			case 1:
 				ideapad_input_report(priv, vpc_bit);
 				break;
 			case 5:
@@ -828,6 +827,13 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 			case 0:
 				ideapad_check_special_buttons(priv);
 				break;
+			case 1:
+				/* Some IdeaPads report event 1 every ~20
+				 * seconds while on battery power; some
+				 * report this when changing to/from tablet
+				 * mode. Squelch this event.
+				 */
+				break;
 			default:
 				pr_info("Unknown event: %lu\n", vpc_bit);
 			}
-- 
2.13.0
