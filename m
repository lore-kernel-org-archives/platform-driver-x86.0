From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: sony-laptop: revert 'const' on keymap
Date: Fri, 30 Jun 2017 17:45:09 +0200
Message-ID: <20170630154524.3611399-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mattia Dongili <malattia@linux.it>, Darren Hart <dvhart@infradead.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Marking sony_laptop_input_keycode_map 'const' sounds like a good
idea in principle, but unfortunately causes a compiler warning:

drivers/platform/x86/sony-laptop.c: In function 'sony_laptop_setup_input':
drivers/platform/x86/sony-laptop.c:494:19: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-array-qualifiers]

This reverts that part of the previous cleanup patch.

Fixes: a0f0a5e1978b ("platform/x86: sony-laptop: constify few static structures")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/sony-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 5fc20473d51e..bfae79534f44 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -299,7 +299,7 @@ static const int sony_laptop_input_index[] = {
 	59,	/* 72 SONYPI_EVENT_VENDOR_PRESSED */
 };
 
-static const int sony_laptop_input_keycode_map[] = {
+static int sony_laptop_input_keycode_map[] = {
 	KEY_CAMERA,	/*  0 SONYPI_EVENT_CAPTURE_PRESSED */
 	KEY_RESERVED,	/*  1 SONYPI_EVENT_CAPTURE_RELEASED */
 	KEY_RESERVED,	/*  2 SONYPI_EVENT_CAPTURE_PARTIALPRESSED */
-- 
2.9.0
