From: Jason Stubbs <jasonbstubbs@gmail.com>
Subject: [PATCH] Platform: Samsung laptop DMI info for NC210/NC110
Date: Fri, 26 Aug 2011 21:57:54 +1000
Message-ID: <4E578A42.4080809@gmail.com>
References: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com> <20110824231053.GA7697@kroah.com> <4E55C11E.8000704@gmail.com> <20110826000348.GB1314@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:57143 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751213Ab1HZLxm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Aug 2011 07:53:42 -0400
Received: by pzk37 with SMTP id 37so4149878pzk.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2011 04:53:41 -0700 (PDT)
In-Reply-To: <20110826000348.GB1314@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Jason Stubbs <jasonbstubbs@gmail.com>

This patch just adds the DMI info for the samsung laptop driver to work with
the NC210/NC110. It needs the brightness quirk patch for proper support.

Signed-off-by: Jason Stubbs <jasonbstubbs@gmail.com>

---

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index b193bf0..bae1a97 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -728,6 +728,15 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
 		},
 		.callback = dmi_check_cb,
 	},
+	{
+		.ident = "NC210/NC110",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "NC210/NC110"),
+			DMI_MATCH(DMI_BOARD_NAME, "NC210/NC110"),
+		},
+		.callback = dmi_check_cb,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
