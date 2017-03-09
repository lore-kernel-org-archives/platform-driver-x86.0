From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 04/14] platform/x86: dell-wmi-aio: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:40 +0100
Message-ID: <20170309121150.10553-5-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-wmi-aio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-aio.c b/drivers/platform/x86/dell-wmi-aio.c
index dbc97a33bbc8..50c2078715d6 100644
--- a/drivers/platform/x86/dell-wmi-aio.c
+++ b/drivers/platform/x86/dell-wmi-aio.c
@@ -152,12 +152,10 @@ static int __init dell_wmi_aio_input_setup(void)
 	err = input_register_device(dell_wmi_aio_input_dev);
 	if (err) {
 		pr_info("Unable to register input device\n");
-		goto err_free_keymap;
+		goto err_free_dev;
 	}
 	return 0;
 
-err_free_keymap:
-	sparse_keymap_free(dell_wmi_aio_input_dev);
 err_free_dev:
 	input_free_device(dell_wmi_aio_input_dev);
 	return err;
@@ -192,7 +190,6 @@ static int __init dell_wmi_aio_init(void)
 	err = wmi_install_notify_handler(guid, dell_wmi_aio_notify, NULL);
 	if (err) {
 		pr_err("Unable to register notify handler - %d\n", err);
-		sparse_keymap_free(dell_wmi_aio_input_dev);
 		input_unregister_device(dell_wmi_aio_input_dev);
 		return err;
 	}
@@ -206,7 +203,6 @@ static void __exit dell_wmi_aio_exit(void)
 
 	guid = dell_wmi_aio_find();
 	wmi_remove_notify_handler(guid);
-	sparse_keymap_free(dell_wmi_aio_input_dev);
 	input_unregister_device(dell_wmi_aio_input_dev);
 }
 
-- 
2.12.0
