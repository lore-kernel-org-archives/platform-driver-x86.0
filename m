From: Frans Klaver <fransklaver@gmail.com>
Subject: [PATCH 02/13] eeepc-laptop: coding style: add curly braces around else compound
Date: Sat, 13 Sep 2014 01:06:41 +0200
Message-ID: <1410563212-31565-3-git-send-email-fransklaver@gmail.com>
References: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Frans Klaver <fransklaver@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 982778f..702fcbb 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -692,8 +692,9 @@ static int eeepc_register_rfkill_notifier(struct eeepc_laptop *eeepc,
 		 * changed during setup.
 		 */
 		eeepc_rfkill_hotplug(eeepc, handle);
-	} else
+	} else {
 		return -ENODEV;
+	}
 
 	return 0;
 }
-- 
2.1.0
