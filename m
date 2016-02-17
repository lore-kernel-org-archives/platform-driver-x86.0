From: John Dahlstrom <jodarom@SDF.ORG>
Subject: [PATCH v2 2/2] ideapad-laptop: Add ideapad Y700 Touch-15ISK to the
 no_hw_rfkill DMI list
Date: Wed, 17 Feb 2016 16:34:24 -0600 (CST)
Message-ID: <Pine.NEB.4.64.1602171617320.23053@faeroes.freeshell.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx.sdf.org ([192.94.73.23]:53875 "EHLO sdf.lonestar.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1423442AbcBQWeu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 17:34:50 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Some Lenovo ideapad models lack a physical rfkill switch.
On a Lenovo ideapad Y700 Touch-15ISK, the ideapad-laptop module
would wrongly report all radios as blocked by hardware which
caused wireless network connections to fail.

Add this model without an rfkill switch to the no_hw_rfkill list.

Tested-by: John Dahlstrom <jodarom@sdf.org>
Signed-off-by: John Dahlstrom <jodarom@sdf.org>
---
  Relevant kernel versions: 4.5-rc4, 4.4.2, 4.3.5, 4.1.18, 3.18.27
  Patch changelog
   v2 split patch between Touch and non-Touch devices

  drivers/platform/x86/ideapad-laptop.c |    7 +++++++
  1 file changed, 7 insertions(+)

--- a/drivers/platform/x86/ideapad-laptop.c	2016-02-16 03:54:48.000000000 -0600
+++ b/drivers/platform/x86/ideapad-laptop.c	2016-02-16 03:54:48.484423725 -0600
@@ -871,4 +871,11 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-15ISK"),
 		},
+	},
+	{
+		.ident = "Lenovo ideapad Y700 Touch-15ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700 Touch-15ISK"),
+		},
 	},
 	{
