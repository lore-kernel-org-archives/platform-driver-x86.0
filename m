From: Frans Klaver <fransklaver@gmail.com>
Subject: [PATCH 12/13] eeepc-laptop: store_cpufv: return error if set_acpi fails
Date: Sat, 13 Sep 2014 01:06:51 +0200
Message-ID: <1410563212-31565-13-git-send-email-fransklaver@gmail.com>
References: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Frans Klaver <fransklaver@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The result of set_acpi is left unchecked, but it may return errors. If
one occurs, send the error to the caller.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 732b012..ad221e0 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -392,7 +392,9 @@ static ssize_t store_cpufv(struct device *dev,
 		return rv;
 	if (value < 0 || value >= c.num)
 		return -EINVAL;
-	set_acpi(eeepc, CM_ASL_CPUFV, value);
+	rv = set_acpi(eeepc, CM_ASL_CPUFV, value);
+	if (rv)
+		return rv;
 	return count;
 }
 
-- 
2.1.0
