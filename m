From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: ideapad-laptop: hide unused 'touchpad_store'
Date: Mon, 22 May 2017 15:07:03 +0200
Message-ID: <20170522130709.242445-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Brian Masney <masneyb@onstation.org>, Ritesh Raj Sarraf <rrs@debian.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

A readonly sysfs property must not have a 'store' function:

drivers/platform/x86/ideapad-laptop.c:438:16: error: 'touchpad_store' defined but not used [-Werror=unused-function]

We can either comment it out or remove the function entirely,
without a good reason one or or another I picked the second option.

Fixes: 7f363145992c ("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/ideapad-laptop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index f7a4608cc60b..c4c7ae3179c0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -435,6 +435,8 @@ static ssize_t touchpad_show(struct device *dev,
 	return sprintf(buf, "%lu\n", result);
 }
 
+#if 0
+/* Switch to RO for now: It might be revisited in the future */
 static ssize_t touchpad_store(struct device *dev,
 			      struct device_attribute *attr,
 			      const char *buf, size_t count)
@@ -453,7 +455,7 @@ static ssize_t touchpad_store(struct device *dev,
 	return count;
 }
 
-/* Switch to RO for now: It might be revisited in the future */
+#endif
 static DEVICE_ATTR_RO(touchpad);
 
 static struct attribute *ideapad_attributes[] = {
-- 
2.9.0
