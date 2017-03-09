From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 12/14] platform/x86: topstar-laptop: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:48 +0100
Message-ID: <20170309121150.10553-13-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Herton Ronaldo Krzesinski <herton@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/topstar-laptop.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index e597de05e6c2..70205d222da9 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -113,14 +113,12 @@ static int acpi_topstar_init_hkey(struct topstar_hkey *hkey)
 	error = input_register_device(input);
 	if (error) {
 		pr_err("Unable to register input device\n");
-		goto err_free_keymap;
+		goto err_free_dev;
 	}
 
 	hkey->inputdev = input;
 	return 0;
 
- err_free_keymap:
-	sparse_keymap_free(input);
  err_free_dev:
 	input_free_device(input);
 	return error;
@@ -157,7 +155,6 @@ static int acpi_topstar_remove(struct acpi_device *device)
 
 	acpi_topstar_fncx_switch(device, false);
 
-	sparse_keymap_free(tps_hkey->inputdev);
 	input_unregister_device(tps_hkey->inputdev);
 	kfree(tps_hkey);
 
-- 
2.12.0
