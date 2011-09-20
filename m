From: Greg KH <gregkh@suse.de>
Subject: [patch 1/8] platform: samsung_laptop: add dmi information for Samsung R700 laptops
Date: Tue, 20 Sep 2011 09:16:08 -0700
Message-ID: <20110920161735.470788987@clark.kroah.org>
References: <20110920161743.GA32737@kroah.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37194 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751081Ab1ITQSs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 20 Sep 2011 12:18:48 -0400
In-Reply-To: <20110920161743.GA32737@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, greg@kroah.com, Stefan Beller <stefanbeller@googlemail.com>, stable <stable@kernel.org>

From: Stefan Beller <stefanbeller@googlemail.com>

My DMI model is this:
>dmesg |grep DMI
[    0.000000] DMI present.
[    0.000000] DMI: SAMSUNG ELECTRONICS CO., LTD. SR700/SR700, BIOS
04SR 02/20/2008

adding dmi information of Samsung R700 laptops
This adds the dmi information of Samsungs R700 laptops.

Signed-off-by: Stefan Beller <stefanbeller@googlemail.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/platform/x86/samsung-laptop.c |    9 +++++++++
 1 file changed, 9 insertions(+)

--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -641,6 +641,15 @@ static struct dmi_system_id __initdata s
 		.callback = dmi_check_cb,
 	},
 	{
+		.ident = "R700",
+		.matches = {
+		      DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		      DMI_MATCH(DMI_PRODUCT_NAME, "SR700"),
+		      DMI_MATCH(DMI_BOARD_NAME, "SR700"),
+		},
+		.callback = dmi_check_cb,
+	},
+	{
 		.ident = "R530/R730",
 		.matches = {
 		      DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
