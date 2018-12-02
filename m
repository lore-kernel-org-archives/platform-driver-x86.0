From: Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH] platform/x86: intel_ips: NULL check before some freeing
 functions is not needed.
Date: Sun, 02 Dec 2018 21:52:11 +0100
Message-ID: <1543760930051-726829870-3-diffsplit-thomas@m3y3r.de>
References: <1543760930050-1499171309-0-diffsplit-thomas@m3y3r.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543760930050-1499171309-0-diffsplit-thomas@m3y3r.de>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

NULL check before some freeing functions is not needed.

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

diff -u -p a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1300,8 +1300,7 @@ static const struct file_operations ips_
 
 static void ips_debugfs_cleanup(struct ips_driver *ips)
 {
-	if (ips->debug_root)
-		debugfs_remove_recursive(ips->debug_root);
+	debugfs_remove_recursive(ips->debug_root);
 	return;
 }
 
