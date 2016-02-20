From: John Dahlstrom <jodarom@SDF.ORG>
Subject: [PATCH v4 1/1] ideapad-laptop: Add ideapad Y700 (15) to the no_hw_rfkill
 DMI list
Date: Fri, 19 Feb 2016 19:34:18 -0600 (CST)
Message-ID: <Pine.NEB.4.64.1602191918380.15324@faeroes.freeshell.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx.sdf.org ([192.94.73.23]:49635 "EHLO sdf.lonestar.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1428164AbcBTBfo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 19 Feb 2016 20:35:44 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Some Lenovo ideapad models lack a physical rfkill switch.
On Lenovo models ideapad Y700 Touch-15ISK and ideapad Y700-15ISK,
ideapad-laptop would wrongly report all radios as blocked by
hardware which caused wireless network connections to fail.

Add these models without an rfkill switch to the no_hw_rfkill list.

Signed-off-by: John Dahlstrom <jodarom@sdf.org>
Cc: <stable@vger.kernel.org> # 4.5.x
Cc: <stable@vger.kernel.org> # 4.4.x
Cc: <stable@vger.kernel.org> # 4.3.x
Cc: <stable@vger.kernel.org> # 4.2.x
Cc: <stable@vger.kernel.org> # 4.1.x
Cc: <stable@vger.kernel.org> # 4.0.x
Cc: <stable@vger.kernel.org> # 3.19.x
Cc: <stable@vger.kernel.org> # 3.18.x
Cc: <stable@vger.kernel.org> # 3.17.x
Cc: <stable@vger.kernel.org> # 3.16.x
---
   Test configuration
    Hardware: Lenovo ideapad Y700 Touch-15ISK
    Kernel version: 4.4.2

   Patch changelog
    v2 split patch between Touch and non-Touch devices
    v3 undo patch split and limit summary to 72 characters
    v4 include comprehensive list of patchable kernels in Cc

   drivers/platform/x86/ideapad-laptop.c |   14 ++++++++++++++
   1 file changed, 14 insertions(+)

--- a/drivers/platform/x86/ideapad-laptop.c	2016-02-14 15:05:20.000000000 -0600
+++ b/drivers/platform/x86/ideapad-laptop.c	2016-02-16 03:54:48.484423725 -0600
@@ -864,4 +864,18 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
  			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
  		},
+	},
+	{
+		.ident = "Lenovo ideapad Y700-15ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-15ISK"),
+		},
+	},
+	{
+		.ident = "Lenovo ideapad Y700 Touch-15ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700 Touch-15ISK"),
+		},
  	},
  	{
