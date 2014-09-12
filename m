From: Frans Klaver <fransklaver@gmail.com>
Subject: [PATCH 11/13] eeepc-laptop: propagate errors from get_cpufv
Date: Sat, 13 Sep 2014 01:06:50 +0200
Message-ID: <1410563212-31565-12-git-send-email-fransklaver@gmail.com>
References: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Frans Klaver <fransklaver@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In show_available_cpufv, show_cpufv, and store_cpufv, errors from
get_cpufv are mapped to -ENODEV. To paint a clear picture to callers,
propagate the errors instead.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 828db56..732b012 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -351,8 +351,9 @@ static ssize_t show_available_cpufv(struct device *dev,
 	int i;
 	ssize_t len = 0;
 
-	if (get_cpufv(eeepc, &c))
-		return -ENODEV;
+	i = get_cpufv(eeepc, &c);
+	if (i)
+		return i;
 	for (i = 0; i < c.num; i++)
 		len += sprintf(buf + len, "%d ", i);
 	len += sprintf(buf + len, "\n");
@@ -365,9 +366,11 @@ static ssize_t show_cpufv(struct device *dev,
 {
 	struct eeepc_laptop *eeepc = dev_get_drvdata(dev);
 	struct eeepc_cpufv c;
+	int rv;
 
-	if (get_cpufv(eeepc, &c))
-		return -ENODEV;
+	rv = get_cpufv(eeepc, &c);
+	if (rv)
+		return rv;
 	return sprintf(buf, "%#x\n", (c.num << 8) | c.cur);
 }
 
@@ -381,8 +384,9 @@ static ssize_t store_cpufv(struct device *dev,
 
 	if (eeepc->cpufv_disabled)
 		return -EPERM;
-	if (get_cpufv(eeepc, &c))
-		return -ENODEV;
+	rv = get_cpufv(eeepc, &c);
+	if (rv)
+		return rv;
 	rv = parse_arg(buf, &value);
 	if (rv < 0)
 		return rv;
-- 
2.1.0
