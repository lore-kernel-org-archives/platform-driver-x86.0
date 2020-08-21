From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 2/9] replace ACPI prints with pr_*() macros
Date: Sat, 22 Aug 2020 02:14:26 +0800
Message-ID: <20200821181433.17653-3-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Replace ACPI prints with pr_*() macros for consistency with other platform
devices.

Clean up obsolete ACPI_HOTKEY_COMPONENT code.


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 47 ++++++++-----------------
 1 file changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 21cdc2149a10..7170c36577bf 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -13,6 +13,7 @@
  *
  * ChangeLog:
  *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *			replace ACPI prints with pr_*() macros
  *		-v0.97	add support for cdpower hardware switch
  *		-v0.96	merge Lucina's enhancement
  *			Jan.13, 2009 Martin Lucina <mato@kotelna.sk>
@@ -124,12 +125,6 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/platform_device.h>
 
-#ifndef ACPI_HOTKEY_COMPONENT
-#define ACPI_HOTKEY_COMPONENT	0x10000000
-#endif
-
-#define _COMPONENT		ACPI_HOTKEY_COMPONENT
-
 MODULE_AUTHOR("Hiroshi Miura, David Bronaugh and Harald Welte");
 MODULE_DESCRIPTION("ACPI HotKey driver for Panasonic Let's Note laptops");
 MODULE_LICENSE("GPL");
@@ -255,8 +250,7 @@ static inline int acpi_pcc_get_sqty(struct acpi_device *device)
 	if (ACPI_SUCCESS(status))
 		return s;
 	else {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "evaluation error HKEY.SQTY\n"));
+		pr_err("evaluation error HKEY.SQTY\n");
 		return -EINVAL;
 	}
 }
@@ -271,21 +265,19 @@ static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc)
 	status = acpi_evaluate_object(pcc->handle, METHOD_HKEY_SINF, NULL,
 				      &buffer);
 	if (ACPI_FAILURE(status)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "evaluation error HKEY.SINF\n"));
+		pr_err("evaluation error HKEY.SINF\n");
 		return 0;
 	}
 
 	hkey = buffer.pointer;
 	if (!hkey || (hkey->type != ACPI_TYPE_PACKAGE)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Invalid HKEY.SINF\n"));
+		pr_err("Invalid HKEY.SINF\n");
 		status = AE_ERROR;
 		goto end;
 	}
 
 	if (pcc->num_sifr < hkey->package.count) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				 "SQTY reports bad SINF length\n"));
+		pr_err("SQTY reports bad SINF length\n");
 		status = AE_ERROR;
 		goto end;
 	}
@@ -295,8 +287,7 @@ static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc)
 		if (likely(element->type == ACPI_TYPE_INTEGER)) {
 			pcc->sinf[i] = element->integer.value;
 		} else
-			ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-					 "Invalid HKEY.SINF data\n"));
+			pr_err("Invalid HKEY.SINF data\n");
 	}
 	pcc->sinf[hkey->package.count] = -1;
 
@@ -563,8 +554,7 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 	rc = acpi_evaluate_integer(pcc->handle, METHOD_HKEY_QUERY,
 				   NULL, &result);
 	if (ACPI_FAILURE(rc)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				 "error getting hotkey status\n"));
+		pr_err("error getting hotkey status\n");
 		return;
 	}
 
@@ -579,8 +569,7 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 
 	if (!sparse_keymap_report_event(hotk_input_dev,
 					result & 0xf, result & 0x80, false))
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "Unknown hotkey event: %d\n", result));
+		pr_err("Unknown hotkey event: 0x%04llx\n", result);
 }
 
 static void acpi_pcc_hotkey_notify(struct acpi_device *device, u32 event)
@@ -659,15 +648,13 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
 
 	error = sparse_keymap_setup(input_dev, panasonic_keymap, NULL);
 	if (error) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "Unable to setup input device keymap\n"));
+		pr_err("Unable to setup input device keymap\n");
 		goto err_free_dev;
 	}
 
 	error = input_register_device(input_dev);
 	if (error) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "Unable to register input device\n"));
+		pr_err("Unable to register input device\n");
 		goto err_free_dev;
 	}
 
@@ -693,9 +680,6 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 	if (!pcc)
 		return -EINVAL;
 
-	ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Sticky mode restore: %d\n",
-			  pcc->sticky_mode));
-
 	return acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, pcc->sticky_mode);
 }
 #endif
@@ -712,14 +696,13 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	num_sifr = acpi_pcc_get_sqty(device);
 
 	if (num_sifr < 0 || num_sifr > 255) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "num_sifr out of range"));
+		pr_err("num_sifr out of range");
 		return -ENODEV;
 	}
 
 	pcc = kzalloc(sizeof(struct pcc_acpi), GFP_KERNEL);
 	if (!pcc) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "Couldn't allocate mem for pcc"));
+		pr_err("Couldn't allocate mem for pcc");
 		return -ENOMEM;
 	}
 
@@ -738,15 +721,13 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "Error installing keyinput handler\n"));
+		pr_err("Error installing keyinput handler\n");
 		goto out_sinf;
 	}
 
 	if (!acpi_pcc_retrieve_biosdata(pcc)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				 "Couldn't retrieve BIOS data\n"));
 		result = -EIO;
+		pr_err("Couldn't retrieve BIOS data\n");
 		goto out_input;
 	}
 	/* initialize backlight */
-- 
2.17.5
