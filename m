From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] sony-laptop: constify sony_laptop_input_* and spic_attribute_group
Date: Fri, 23 Jun 2017 14:26:42 +0530
Message-ID: <9c35451ff9a31757b76d708733bbe5736c0d2dc6.1498208007.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: malattia@linux.it, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

File size before:
   text	   data	    bss	    dec	    hex	filename
  31273	   5176	    372	  36821	   8fd5	drivers/platform/x86/sony-laptop.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
  31593	   4856	    372	  36821	   8fd5	drivers/platform/x86/sony-laptop.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/sony-laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index aa2ee51..5fc2047 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -222,7 +222,7 @@ struct sony_laptop_keypress {
 /* Correspondance table between sonypi events
  * and input layer indexes in the keymap
  */
-static int sony_laptop_input_index[] = {
+static const int sony_laptop_input_index[] = {
 	-1,	/*  0 no event */
 	-1,	/*  1 SONYPI_EVENT_JOGDIAL_DOWN */
 	-1,	/*  2 SONYPI_EVENT_JOGDIAL_UP */
@@ -299,7 +299,7 @@ struct sony_laptop_keypress {
 	59,	/* 72 SONYPI_EVENT_VENDOR_PRESSED */
 };
 
-static int sony_laptop_input_keycode_map[] = {
+static const int sony_laptop_input_keycode_map[] = {
 	KEY_CAMERA,	/*  0 SONYPI_EVENT_CAPTURE_PRESSED */
 	KEY_RESERVED,	/*  1 SONYPI_EVENT_CAPTURE_RELEASED */
 	KEY_RESERVED,	/*  2 SONYPI_EVENT_CAPTURE_PARTIALPRESSED */
@@ -4032,7 +4032,7 @@ struct device_attribute spic_attr_##_name = __ATTR(_name,	\
 	NULL
 };
 
-static struct attribute_group spic_attribute_group = {
+static const struct attribute_group spic_attribute_group = {
 	.attrs = spic_attributes
 };
 
-- 
1.9.1
