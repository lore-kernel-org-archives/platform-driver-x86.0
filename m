From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ideapad-laptop: include Yoga 3 1170 in add rfkill whitelist
Date: Fri, 06 Nov 2015 23:26:59 +0100
Message-ID: <4760270.MzzySUYc0g@wuerfel>
References: <3945339.hkrnUBKIiS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:58906 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030298AbbKFW1Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Nov 2015 17:27:25 -0500
In-Reply-To: <3945339.hkrnUBKIiS@wuerfel>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org

This changes the entry to the whitelist of machines that do not have
a physical rfkill switch. Unfortunately, the Yoga 3 generation seems
to use upper-case letters for the YOGA 3 Pro-1370, while it uses normal
capitalization for its Yoga 3 1170 and 1470 siblings.

In order to catch all variants of the Yoga 3, I'm changing both
the entry for the 1470 (using "Yoga" as the name) and the entry for
the Pro 1370 (using all-caps "YOGA") to not match the exact model number
but only the generation. This way, the 1170 and 1470 models share one
entry, but if the firmware changes from one format to the other, it will
still work.

The second entry for Yoga 2 Pro that was recently added for some
reason ended up not being added in alphanumeric order, and I'm
moving the Yoga 3 1470 entry down while making the change, so they
are sorted more logically.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I realized that this patch didn't make it in when I sent it back in may.
I have adapted it to the changes that happened since.

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index db76d011bedd..c11f40f37bd0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -872,24 +872,24 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
-		.ident = "Lenovo Yoga 3 14",
+		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 3 14"),
+			DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
 		},
 	},
 	{
-		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
+		.ident = "Lenovo Yoga 3 1170 / 1470",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 3"),
 		},
 	},
 	{
 		.ident = "Lenovo Yoga 3 Pro 1370",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3"),
 		},
 	},
 	{}
