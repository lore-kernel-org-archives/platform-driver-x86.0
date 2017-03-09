From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 14/14] platform/x86: toshiba_acpi: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:50 +0100
Message-ID: <20170309121150.10553-15-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/toshiba_acpi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 074bf2fa1c55..d0daf75cbed1 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2849,7 +2849,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 		error = i8042_install_filter(toshiba_acpi_i8042_filter);
 		if (error) {
 			pr_err("Error installing key filter\n");
-			goto err_free_keymap;
+			goto err_free_dev;
 		}
 
 		dev->ntfy_supported = 1;
@@ -2880,8 +2880,6 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
  err_remove_filter:
 	if (dev->ntfy_supported)
 		i8042_remove_filter(toshiba_acpi_i8042_filter);
- err_free_keymap:
-	sparse_keymap_free(dev->hotkey_dev);
  err_free_dev:
 	input_free_device(dev->hotkey_dev);
 	dev->hotkey_dev = NULL;
@@ -3018,10 +3016,8 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 		cancel_work_sync(&dev->hotkey_work);
 	}
 
-	if (dev->hotkey_dev) {
+	if (dev->hotkey_dev)
 		input_unregister_device(dev->hotkey_dev);
-		sparse_keymap_free(dev->hotkey_dev);
-	}
 
 	backlight_device_unregister(dev->backlight_dev);
 
-- 
2.12.0
