From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 08/14] platform/x86: ideapad-laptop: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:44 +0100
Message-ID: <20170309121150.10553-9-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/ideapad-laptop.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index f46ece2ce3c4..f64faa00c83a 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -604,14 +604,12 @@ static int ideapad_input_init(struct ideapad_private *priv)
 	error = input_register_device(inputdev);
 	if (error) {
 		pr_err("Unable to register input device\n");
-		goto err_free_keymap;
+		goto err_free_dev;
 	}
 
 	priv->inputdev = inputdev;
 	return 0;
 
-err_free_keymap:
-	sparse_keymap_free(inputdev);
 err_free_dev:
 	input_free_device(inputdev);
 	return error;
@@ -619,7 +617,6 @@ static int ideapad_input_init(struct ideapad_private *priv)
 
 static void ideapad_input_exit(struct ideapad_private *priv)
 {
-	sparse_keymap_free(priv->inputdev);
 	input_unregister_device(priv->inputdev);
 	priv->inputdev = NULL;
 }
-- 
2.12.0
