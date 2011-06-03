From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Subject: [PATCH] sony-laptop: remove unused local variables
Date: Thu,  2 Jun 2011 21:27:20 -0500
Message-ID: <1307068040-2918-1-git-send-email-Gregory.Dietsche@cuw.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: malattia@linux.it
Cc: mjg@redhat.com, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>
List-Id: platform-driver-x86.vger.kernel.org

Removed two unused instances of "handle" local variable.

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/platform/x86/sony-laptop.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 6fe8cd6..9a2c319 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -961,7 +961,6 @@ static int sony_backlight_get_brightness(struct backlight_device *bd)
 static int sony_nc_get_brightness_ng(struct backlight_device *bd)
 {
 	int result;
-	int *handle = (int *)bl_get_data(bd);
 	struct sony_backlight_props *sdev =
 		(struct sony_backlight_props *)bl_get_data(bd);
 
@@ -973,7 +972,6 @@ static int sony_nc_get_brightness_ng(struct backlight_device *bd)
 static int sony_nc_update_status_ng(struct backlight_device *bd)
 {
 	int value, result;
-	int *handle = (int *)bl_get_data(bd);
 	struct sony_backlight_props *sdev =
 		(struct sony_backlight_props *)bl_get_data(bd);
 
-- 
1.7.2.5
