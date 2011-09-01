From: gregkh@suse.de
Subject: [patch 2/8] Platform: samsung_laptop: add support for X520 machines.
Date: Thu, 01 Sep 2011 15:50:04 -0700
Message-ID: <20110901225330.784324727@clark.kroah.org>
References: <20110901225401.GA26870@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110901225401.GA26870@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, greg@kroah.com, stable <stable@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Tommaso Massimi <tmassimi@gmail.com>

my samsung laptop would be very happy if you add
these lines to the file drivers/platform/x86/samsung-laptop.c

Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/platform/x86/samsung-laptop.c |    9 +++++++++
 1 file changed, 9 insertions(+)

--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -695,6 +695,15 @@ static struct dmi_system_id __initdata s
 		},
 		.callback = dmi_check_cb,
 	},
+		{
+		.ident = "X520",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X520"),
+			DMI_MATCH(DMI_BOARD_NAME, "X520"),
+		},
+		.callback = dmi_check_cb,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
