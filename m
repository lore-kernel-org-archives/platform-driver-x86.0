From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH 1/5] firmware: dell_rbu: Make payload memory uncachable
Date: Tue, 25 Sep 2018 14:34:14 -0500
Message-ID: <20180925193418.28493-2-stuart.hayes@dell.com>
References: <20180925193418.28493-1-stuart.hayes@dell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925193418.28493-1-stuart.hayes@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stuart Hayes <stuart.w.hayes@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Stuart Hayes <stuart.w.hayes@gmail.com>

The dell_rbu driver takes firmware update payloads and puts them in memory so
the system BIOS can find them after a reboot.  This sometimes fails (though
rarely), because the memory containing the payload is in the CPU cache but
never gets written back to main memory before the system is rebooted (CPU
cache contents are lost on reboot).

With this patch, the payload memory will be changed to uncachable to ensure
that the payload is actually in main memory before the system is rebooted.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
This patch has been discussed previously, see history at
https://patchwork.kernel.org/patch/10512079/


 drivers/firmware/dell_rbu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/dell_rbu.c b/drivers/firmware/dell_rbu.c
index fb8af5cb7c9b..ccefa84f7305 100644
--- a/drivers/firmware/dell_rbu.c
+++ b/drivers/firmware/dell_rbu.c
@@ -45,6 +45,7 @@
 #include <linux/moduleparam.h>
 #include <linux/firmware.h>
 #include <linux/dma-mapping.h>
+#include <asm/set_memory.h>
 
 MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
 MODULE_DESCRIPTION("Driver for updating BIOS image on DELL systems");
@@ -181,6 +182,11 @@ static int create_packet(void *data, size_t length)
 			packet_data_temp_buf = NULL;
 		}
 	}
+	/*
+	 * set to uncachable or it may never get written back before reboot
+	 */
+	set_memory_uc((unsigned long)packet_data_temp_buf, 1 << ordernum);
+
 	spin_lock(&rbu_data.lock);
 
 	newpacket->data = packet_data_temp_buf;
@@ -349,6 +355,8 @@ static void packet_empty_list(void)
 		 * to make sure there are no stale RBU packets left in memory
 		 */
 		memset(newpacket->data, 0, rbu_data.packetsize);
+		set_memory_wb((unsigned long)newpacket->data,
+			1 << newpacket->ordernum);
 		free_pages((unsigned long) newpacket->data,
 			newpacket->ordernum);
 		kfree(newpacket);
-- 
2.19.0.221.g150f307af
