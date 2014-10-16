From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] acer-wmi: Add acpi_backlight=video quirk for the Acer KAV80
Date: Thu, 16 Oct 2014 14:36:31 +0200
Message-ID: <1413462991-1463-2-git-send-email-hdegoede@redhat.com>
References: <1413462991-1463-1-git-send-email-hdegoede@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1413462991-1463-1-git-send-email-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, Lee Chun-Yi <jlee@suse.com>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

https://bugzilla.redhat.com/show_bug.cgi?id=1128309

Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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
