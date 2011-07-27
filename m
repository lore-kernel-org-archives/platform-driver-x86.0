From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] platform-drivers-x86: ideapad-laptop: add missing
 ideapad_input_exit in ideapad_acpi_add error path
Date: Wed, 27 Jul 2011 15:27:34 +0800
Message-ID: <1311751654.4818.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:42965 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751862Ab1G0H1q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2011 03:27:46 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

In the case of ideapad_backlight_init() failure,
we need to free the resources allocated by ideapad_input_init().

Aslo drop __devexit annotation for ideapad_input_exit() because
we also call it in ideapad_acpi_add() error path.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 8811c68..0c59541 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -406,7 +406,7 @@ err_free_dev:
 	return error;
 }
 
-static void __devexit ideapad_input_exit(struct ideapad_private *priv)
+static void ideapad_input_exit(struct ideapad_private *priv)
 {
 	sparse_keymap_free(priv->inputdev);
 	input_unregister_device(priv->inputdev);
@@ -563,6 +563,7 @@ static int __devinit ideapad_acpi_add(struct acpi_device *adevice)
 backlight_failed:
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 		ideapad_unregister_rfkill(adevice, i);
+	ideapad_input_exit(priv);
 input_failed:
 	ideapad_platform_exit(priv);
 platform_failed:
-- 
1.7.4.1
