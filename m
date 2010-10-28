From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] intel_scu_ipc: fix signedness bug
Date: Thu, 28 Oct 2010 14:08:39 +0800
Message-ID: <1288246119.5153.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:49769 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754081Ab0J1GGA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Oct 2010 02:06:00 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Sreedhara DS <sreedhara.ds@intel.com>, Alan Cox <alan@linux.intel.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

busy_loop() returns negative error code, thus change err variable
from u32 to int to properly propagate correct error code.

Also remove unneeded initialization for err and i variables.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/intel_scu_ipc.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 41a9e34..50f5cf3 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -160,7 +160,7 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 {
 	int i, nc, bytes, d;
 	u32 offset = 0;
-	u32 err = 0;
+	int err;
 	u8 cbuf[IPC_WWBUF_SIZE] = { };
 	u32 *wbuf = (u32 *)&cbuf;
 
@@ -403,7 +403,7 @@ EXPORT_SYMBOL(intel_scu_ipc_update_register);
  */
 int intel_scu_ipc_simple_command(int cmd, int sub)
 {
-	u32 err = 0;
+	int err;
 
 	mutex_lock(&ipclock);
 	if (ipcdev.pdev == NULL) {
@@ -433,8 +433,7 @@ EXPORT_SYMBOL(intel_scu_ipc_simple_command);
 int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 							u32 *out, int outlen)
 {
-	u32 err = 0;
-	int i = 0;
+	int err, i;
 
 	mutex_lock(&ipclock);
 	if (ipcdev.pdev == NULL) {
-- 
1.7.2
