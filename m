From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ideapad: add rfkill whitelist entry for Yoga 3 1170
Date: Sat, 13 Jun 2015 15:24:32 +0200
Message-ID: <4113282.CaC1reWxk0@wuerfel>
References: <5498848.9yV42J8a1L@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:51671 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753682AbbFMNYi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 13 Jun 2015 09:24:38 -0400
In-Reply-To: <5498848.9yV42J8a1L@wuerfel>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@linux.intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

This adds one more entry to the whitelist of machines that do not have
a physical rfkill switch. Unfortunately, the Yoga 3 generation seems
to use upper-case letters for the YOGA 3 Pro-1370, while it uses normal
capitalization for its Yoga 3 1170 sibling.

In order to catch all variants of the Yoga 3, I'm now using both strings
as wildcards here, which should also cover the 1470 model, and possible
changes in the string that could happen in firmware updates.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index cb7cd8d79329..8e455c1429ee 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -855,7 +855,14 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		.ident = "Lenovo Yoga 3 Pro 1370",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3"),
+		},
+	},
+	{
+		.ident = "Lenovo Yoga 3 1170 / 1470",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 3"),
 		},
 	},
 	{}
