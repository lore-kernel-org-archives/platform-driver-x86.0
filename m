From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 4/7] platform/x86: alienware-wmi: constify attribute_group structures.
Date: Tue, 11 Jul 2017 16:18:17 +0530
Message-ID: <1499770100-18632-5-git-send-email-arvind.yadav.cs@gmail.com>
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
   6932	   1016	     48	   7996	   1f3c	drivers/platform/x86/alienware-wmi.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   7060	    888	     48	   7996	   1f64	drivers/platform/x86/alienware-wmi.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/alienware-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 9866fec..0831b42 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -604,7 +604,7 @@ static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
 	NULL,
 };
 
-static struct attribute_group hdmi_attribute_group = {
+static const struct attribute_group hdmi_attribute_group = {
 	.name = "hdmi",
 	.attrs = hdmi_attrs,
 };
@@ -660,7 +660,7 @@ static ssize_t show_amplifier_status(struct device *dev,
 	NULL,
 };
 
-static struct attribute_group amplifier_attribute_group = {
+static const struct attribute_group amplifier_attribute_group = {
 	.name = "amplifier",
 	.attrs = amplifier_attrs,
 };
@@ -741,7 +741,7 @@ static ssize_t toggle_deepsleep(struct device *dev,
 	NULL,
 };
 
-static struct attribute_group deepsleep_attribute_group = {
+static const struct attribute_group deepsleep_attribute_group = {
 	.name = "deepsleep",
 	.attrs = deepsleep_attrs,
 };
-- 
1.9.1
