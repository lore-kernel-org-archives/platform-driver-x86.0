From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 09/14] platform/x86: msi-laptop: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:45 +0100
Message-ID: <20170309121150.10553-10-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

As this reduces msi_laptop_input_destroy() to one line, replace all
calls to that function with direct calls to input_unregister_device().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/msi-laptop.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 42317704629d..9e90827c176a 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -976,23 +976,15 @@ static int __init msi_laptop_input_setup(void)
 
 	err = input_register_device(msi_laptop_input_dev);
 	if (err)
-		goto err_free_keymap;
+		goto err_free_dev;
 
 	return 0;
 
-err_free_keymap:
-	sparse_keymap_free(msi_laptop_input_dev);
 err_free_dev:
 	input_free_device(msi_laptop_input_dev);
 	return err;
 }
 
-static void msi_laptop_input_destroy(void)
-{
-	sparse_keymap_free(msi_laptop_input_dev);
-	input_unregister_device(msi_laptop_input_dev);
-}
-
 static int __init load_scm_model_init(struct platform_device *sdev)
 {
 	u8 data;
@@ -1037,7 +1029,7 @@ static int __init load_scm_model_init(struct platform_device *sdev)
 	return 0;
 
 fail_filter:
-	msi_laptop_input_destroy();
+	input_unregister_device(msi_laptop_input_dev);
 
 fail_input:
 	rfkill_cleanup();
@@ -1158,7 +1150,7 @@ static void __exit msi_cleanup(void)
 {
 	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
-		msi_laptop_input_destroy();
+		input_unregister_device(msi_laptop_input_dev);
 		cancel_delayed_work_sync(&msi_rfkill_dwork);
 		cancel_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
-- 
2.12.0
