From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: asus-wmi: Allow loading on systems without the Asus Management GUID
Date: Mon, 21 Jan 2019 14:24:36 +0100
Message-ID: <20190121132436.31825-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

hid-asus depends on asus-wmi through the asus_wmi_evaluate_method. Before
this commit asus-wmi and thus hid-asus could not be loaded on non Asus
systems. This breaks using Asus bluetooth keyboards such as the Asus
T100CHI keyboard with non Asus systems.

This commit fixes this by allowing asus-wmi to load on systems without the
Asus Management GUID.

This is save to do since all asus-wmi sub drivers use
asus_wmi_register_driver which also checks for the GUID.

This commit also improves the error messages in asus_wmi_register_driver
to include "ASUS" in their description tom make them more clear. This is
important since we now rely on those errors when loaded on systems without
the Asus Management GUID.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 37b5de541270..ee1fa93708ec 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2265,12 +2265,12 @@ static int asus_wmi_probe(struct platform_device *pdev)
 	int ret;
 
 	if (!wmi_has_guid(ASUS_WMI_MGMT_GUID)) {
-		pr_warn("Management GUID not found\n");
+		pr_warn("ASUS Management GUID not found\n");
 		return -ENODEV;
 	}
 
 	if (wdrv->event_guid && !wmi_has_guid(wdrv->event_guid)) {
-		pr_warn("Event GUID not found\n");
+		pr_warn("ASUS Event GUID not found\n");
 		return -ENODEV;
 	}
 
@@ -2320,11 +2320,6 @@ EXPORT_SYMBOL_GPL(asus_wmi_unregister_driver);
 
 static int __init asus_wmi_init(void)
 {
-	if (!wmi_has_guid(ASUS_WMI_MGMT_GUID)) {
-		pr_info("Asus Management GUID not found\n");
-		return -ENODEV;
-	}
-
 	pr_info("ASUS WMI generic driver loaded\n");
 	return 0;
 }
-- 
2.20.1
