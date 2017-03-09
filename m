From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 02/14] platform/x86: asus-laptop: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:38 +0100
Message-ID: <20170309121150.10553-3-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/asus-laptop.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 28551f5a2e07..c4768be24ba9 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1516,14 +1516,12 @@ static int asus_input_init(struct asus_laptop *asus)
 	error = input_register_device(input);
 	if (error) {
 		pr_warn("Unable to register input device\n");
-		goto err_free_keymap;
+		goto err_free_dev;
 	}
 
 	asus->inputdev = input;
 	return 0;
 
-err_free_keymap:
-	sparse_keymap_free(input);
 err_free_dev:
 	input_free_device(input);
 	return error;
@@ -1531,10 +1529,8 @@ static int asus_input_init(struct asus_laptop *asus)
 
 static void asus_input_exit(struct asus_laptop *asus)
 {
-	if (asus->inputdev) {
-		sparse_keymap_free(asus->inputdev);
+	if (asus->inputdev)
 		input_unregister_device(asus->inputdev);
-	}
 	asus->inputdev = NULL;
 }
 
-- 
2.12.0
