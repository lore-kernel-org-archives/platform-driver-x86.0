From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 2/7] platform/x86: compal-laptop: constify attribute_group structures.
Date: Tue, 11 Jul 2017 16:18:15 +0530
Message-ID: <1499770100-18632-3-git-send-email-arvind.yadav.cs@gmail.com>
References: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, jwoithe@just42.net, cezary.jackiewicz@gmail.com, corentin.chary@gmail.com, laforge@gnumonks.org, coproscefalo@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

attribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work
with const attribute_group. So mark the non-const structs as const.

File size before:
   text	   data	    bss	    dec	    hex	filename
   6781	   6144	     34	  12959	   329f	drivers/platform/x86/compal-laptop.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   6845	   6080	     34	  12959	   329f	drivers/platform/x86/compal-laptop.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/compal-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index e1c2b6d..a8e4a53 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -718,7 +718,7 @@ static DEVICE_ATTR(pwm1_enable,
 	&dev_attr_wake_up_mouse.attr,
 	NULL
 };
-static struct attribute_group compal_platform_attr_group = {
+static const struct attribute_group compal_platform_attr_group = {
 	.attrs = compal_platform_attrs
 };
 
-- 
1.9.1
