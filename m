From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 2/2] acer-wmi: Add acpi_backlight=video quirk for the Acer KAV80
Date: Wed, 22 Oct 2014 16:06:38 +0200
Message-ID: <1413986798-27689-2-git-send-email-hdegoede@redhat.com>
References: <1413986798-27689-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57105 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751953AbaJVOHK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Oct 2014 10:07:10 -0400
In-Reply-To: <1413986798-27689-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <darren@dvhart.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Lee Chun-Yi <jlee@suse.com>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org

The acpi-video backlight interface on the Acer KAV80 is broken, and worse
it causes the entire machine to slow down significantly after a suspend/resume.

Blacklist it, and use the acer-wmi backlight interface instead. Note that
the KAV80 is somewhat unique in that it is the only Acer model where we
fall back to acer-wmi after blacklisting, rather then using the native
(e.g. intel) backlight driver. This is done because there is no native
backlight interface on this model.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1128309
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>

--
Changes in v2: Improve commit message
---
 drivers/platform/x86/acer-wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 96a0b75..26c4fd1 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -579,6 +579,17 @@ static const struct dmi_system_id video_vendor_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5741"),
 		},
 	},
+	{
+		/*
+		 * Note no video_set_backlight_video_vendor, we must use the
+		 * acer interface, as there is no native backlight interface.
+		 */
+		.ident = "Acer KAV80",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "KAV80"),
+		},
+	},
 	{}
 };
 
-- 
2.1.0
