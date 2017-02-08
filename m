From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 06/10] platform/x86: fujitsu-laptop: remove redundant forward declarations
Date: Wed,  8 Feb 2017 14:46:29 +0100
Message-ID: <20170208134633.5152-7-kernel@kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Both acpi_fujitsu_bl_notify() and acpi_fujitsu_laptop_notify() are
defined before they are first used, so remove their forward declarations
as they are redundant.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index deef40a03b6d..ba0c0c211251 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -178,8 +178,6 @@ struct fujitsu_laptop {
 
 static struct fujitsu_laptop *fujitsu_laptop;
 
-static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event);
-
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 static enum led_brightness logolamp_get(struct led_classdev *cdev);
 static int logolamp_set(struct led_classdev *cdev,
@@ -227,8 +225,6 @@ static struct led_classdev eco_led = {
 static u32 dbg_level = 0x03;
 #endif
 
-static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event);
-
 /* Fujitsu ACPI interface function */
 
 static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
-- 
2.11.1
