From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 10/15] fujitsu-tablet: Mark DMI callbacks as __init code
Date: Wed, 16 Jul 2014 19:43:12 +0200
Message-ID: <1405532597-28262-11-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:39914 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965428AbaGPRnq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:46 -0400
Received: by mail-wg0-f42.google.com with SMTP id l18so1262233wgh.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:45 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Robert Gerlach <khnz@gmx.de>

The DMI table is already marked as __initconst, so can be the callback
functions as they're only used in that context.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Robert Gerlach <khnz@gmx.de>
---
 drivers/platform/x86/fujitsu-tablet.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
index c3784bacea..53bdbb01bd 100644
--- a/drivers/platform/x86/fujitsu-tablet.c
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -315,21 +315,21 @@ static irqreturn_t fujitsu_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void fujitsu_dmi_common(const struct dmi_system_id *dmi)
+static void __init fujitsu_dmi_common(const struct dmi_system_id *dmi)
 {
 	pr_info("%s\n", dmi->ident);
 	memcpy(fujitsu.config.keymap, dmi->driver_data,
 			sizeof(fujitsu.config.keymap));
 }
 
-static int fujitsu_dmi_lifebook(const struct dmi_system_id *dmi)
+static int __init fujitsu_dmi_lifebook(const struct dmi_system_id *dmi)
 {
 	fujitsu_dmi_common(dmi);
 	fujitsu.config.quirks |= INVERT_TABLET_MODE_BIT;
 	return 1;
 }
 
-static int fujitsu_dmi_stylistic(const struct dmi_system_id *dmi)
+static int __init fujitsu_dmi_stylistic(const struct dmi_system_id *dmi)
 {
 	fujitsu_dmi_common(dmi);
 	fujitsu.config.quirks |= FORCE_TABLET_MODE_IF_UNDOCK;
-- 
1.7.10.4
