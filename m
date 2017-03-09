From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 05/14] platform/x86: dell-wmi: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:41 +0100
Message-ID: <20170309121150.10553-6-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

As this reduces dell_wmi_input_destroy() to one line, replace all calls
to that function with direct calls to input_unregister_device().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-wmi.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 75e637047d36..d921b26267e9 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -603,23 +603,15 @@ static int __init dell_wmi_input_setup(void)
 
 	err = input_register_device(dell_wmi_input_dev);
 	if (err)
-		goto err_free_keymap;
+		goto err_free_dev;
 
 	return 0;
 
- err_free_keymap:
-	sparse_keymap_free(dell_wmi_input_dev);
  err_free_dev:
 	input_free_device(dell_wmi_input_dev);
 	return err;
 }
 
-static void dell_wmi_input_destroy(void)
-{
-	sparse_keymap_free(dell_wmi_input_dev);
-	input_unregister_device(dell_wmi_input_dev);
-}
-
 /*
  * Descriptor buffer is 128 byte long and contains:
  *
@@ -740,7 +732,7 @@ static int __init dell_wmi_init(void)
 	status = wmi_install_notify_handler(DELL_EVENT_GUID,
 					 dell_wmi_notify, NULL);
 	if (ACPI_FAILURE(status)) {
-		dell_wmi_input_destroy();
+		input_unregister_device(dell_wmi_input_dev);
 		pr_err("Unable to register notify handler - %d\n", status);
 		return -ENODEV;
 	}
@@ -752,7 +744,7 @@ static int __init dell_wmi_init(void)
 		if (err) {
 			pr_err("Failed to enable WMI events\n");
 			wmi_remove_notify_handler(DELL_EVENT_GUID);
-			dell_wmi_input_destroy();
+			input_unregister_device(dell_wmi_input_dev);
 			return err;
 		}
 	}
@@ -766,6 +758,6 @@ static void __exit dell_wmi_exit(void)
 	if (wmi_requires_smbios_request)
 		dell_wmi_events_set_enabled(false);
 	wmi_remove_notify_handler(DELL_EVENT_GUID);
-	dell_wmi_input_destroy();
+	input_unregister_device(dell_wmi_input_dev);
 }
 module_exit(dell_wmi_exit);
-- 
2.12.0
