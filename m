From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/5] platform/x86: fujitsu-laptop: simplify platform device attribute definitions
Date: Tue, 14 Mar 2017 11:26:28 +0100
Message-ID: <20170314102631.8203-3-kernel@kempniu.pl>
References: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170314102631.8203-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use the DEVICE_ATTR_RO() macro to get rid of ignore_store() and shorten
attribute definitions.  Adjust whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 9b9348af7626..9719c821d64f 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -480,16 +480,8 @@ static const struct backlight_ops fujitsu_bl_ops = {
 	.update_status = bl_update_status,
 };
 
-static ssize_t
-ignore_store(struct device *dev,
-	     struct device_attribute *attr, const char *buf, size_t count)
-{
-	return count;
-}
-
-static ssize_t
-show_lid_state(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t lid_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	if (!(fujitsu_laptop->flags_supported & FLAG_LID))
 		return sprintf(buf, "unknown\n");
@@ -499,9 +491,8 @@ show_lid_state(struct device *dev,
 		return sprintf(buf, "closed\n");
 }
 
-static ssize_t
-show_dock_state(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	if (!(fujitsu_laptop->flags_supported & FLAG_DOCK))
 		return sprintf(buf, "unknown\n");
@@ -511,9 +502,8 @@ show_dock_state(struct device *dev,
 		return sprintf(buf, "undocked\n");
 }
 
-static ssize_t
-show_radios_state(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t radios_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	if (!(fujitsu_laptop->flags_supported & FLAG_RFKILL))
 		return sprintf(buf, "unknown\n");
@@ -523,9 +513,9 @@ show_radios_state(struct device *dev,
 		return sprintf(buf, "killed\n");
 }
 
-static DEVICE_ATTR(lid, 0444, show_lid_state, ignore_store);
-static DEVICE_ATTR(dock, 0444, show_dock_state, ignore_store);
-static DEVICE_ATTR(radios, 0444, show_radios_state, ignore_store);
+static DEVICE_ATTR_RO(lid);
+static DEVICE_ATTR_RO(dock);
+static DEVICE_ATTR_RO(radios);
 
 static struct attribute *fujitsu_pf_attributes[] = {
 	&dev_attr_lid.attr,
-- 
2.12.0
