From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 07/11] zero the stack buffer before giving random garbage to
	the SCU
Date: Mon, 26 Jul 2010 10:04:37 +0100
Message-ID: <20100726090431.12329.72634.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:58472 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJhx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:37:53 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Arjan van de Ven <arjan@linux.intel.com>

some messages take 4 bytes, but only fill 3 bytes....
this patch makes sure that whatever we send to the SCU is zeroed first

Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 1b0d0d5..b903420 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -162,6 +162,8 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 
 	mutex_lock(&ipclock);
 
+	memset(cbuf, 0, sizeof(cbuf));
+
 	if (ipcdev.pdev == NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
