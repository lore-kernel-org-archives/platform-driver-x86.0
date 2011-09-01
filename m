From: gregkh@suse.de
Subject: [patch 8/8] Platform: fix samsung-laptop DMI identification for N220 model
Date: Thu, 01 Sep 2011 15:50:10 -0700
Message-ID: <20110901225331.430431479@clark.kroah.org>
References: <20110901225401.GA26870@kroah.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49235 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932675Ab1IAW4b (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Sep 2011 18:56:31 -0400
In-Reply-To: <20110901225401.GA26870@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, greg@kroah.com, Raul Gutierrez Segales <rgs@collabora.co.uk>

This is a follow-up for commit 78a7539b, which didn't cover the
Samsung N220 laptop. With this backlight brightness works nicely
on the N220 netbook.

Signed-off-by: Raul Gutierrez Segales <rgs@collabora.co.uk>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/platform/x86/samsung-laptop.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -663,6 +663,16 @@ static struct dmi_system_id __initdata s
 		.callback = dmi_check_cb,
 	},
 	{
+		.ident = "N220",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+					"SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N220"),
+			DMI_MATCH(DMI_BOARD_NAME, "N220"),
+		},
+		.callback = dmi_check_cb,
+	},
+	{
 		.ident = "N150/N210/N220/N230",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR,
