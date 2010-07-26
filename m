From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 06/11] Fix stack buffer size for IPC writev messages
Date: Mon, 26 Jul 2010 10:04:24 +0100
Message-ID: <20100726090405.12329.49342.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:61331 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJhf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:37:35 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Arjan van de Ven <arjan@linux.intel.com>

The stack buffer for IPC messages was 16 bytes, limiting messages to a
size of 4 (each message is 32 bit).
However, the touch screen driver is trying to send messages of size 5....

(AC: Set to 20 bytes having checked the max size allowed)

Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 5258749..1b0d0d5 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -58,8 +58,8 @@
 
 #define IPC_BASE_ADDR     0xFF11C000	/* IPC1 base register address */
 #define IPC_MAX_ADDR      0x100		/* Maximum IPC regisers */
-#define IPC_WWBUF_SIZE    16		/* IPC Write buffer Size */
-#define IPC_RWBUF_SIZE    16		/* IPC Read buffer Size */
+#define IPC_WWBUF_SIZE    20		/* IPC Write buffer Size */
+#define IPC_RWBUF_SIZE    20		/* IPC Read buffer Size */
 #define IPC_I2C_BASE      0xFF12B000	/* I2C control register base address */
 #define IPC_I2C_MAX_ADDR  0x10		/* Maximum I2C regisers */
 
