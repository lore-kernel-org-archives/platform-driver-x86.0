From: gregkh@suse.de
Subject: [patch 7/8] Platform: Samsung laptop DMI info for NC210/NC110
Date: Thu, 01 Sep 2011 15:50:09 -0700
Message-ID: <20110901225331.334955255@clark.kroah.org>
References: <20110901225401.GA26870@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110901225401.GA26870@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, Greg KH <greg@kroah.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, David Herrmann <dh.herrmann@googlemail.com>, Jason Stubbs <jasonbstubbs@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Jason Stubbs <jasonbstubbs@gmail.com>

This patch just adds the DMI info for the samsung laptop driver to work with
the NC210/NC110. It needs the brightness quirk patch for proper support.

Signed-off-by: Jason Stubbs <jasonbstubbs@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/platform/x86/samsung-laptop.c |    9 +++++++++
 1 file changed, 9 insertions(+)

--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -755,6 +755,15 @@ static struct dmi_system_id __initdata s
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
