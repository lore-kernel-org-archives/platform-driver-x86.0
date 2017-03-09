From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 03/14] platform/x86: asus-wmi: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:39 +0100
Message-ID: <20170309121150.10553-4-kernel@kempniu.pl>
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
 drivers/platform/x86/asus-wmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8fe5890bf539..d817e6327fec 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -269,12 +269,10 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 
 	err = input_register_device(asus->inputdev);
 	if (err)
-		goto err_free_keymap;
+		goto err_free_dev;
 
 	return 0;
 
-err_free_keymap:
-	sparse_keymap_free(asus->inputdev);
 err_free_dev:
 	input_free_device(asus->inputdev);
 	return err;
@@ -282,10 +280,8 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 
 static void asus_wmi_input_exit(struct asus_wmi *asus)
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
