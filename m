From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 11/11] intel_scu_ipc: fix size field for intel_scu_ipc_command
Date: Mon, 26 Jul 2010 10:06:31 +0100
Message-ID: <20100726090619.12329.82658.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:53401 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753321Ab0GZJjm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:39:42 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Hong Liu <hong.liu@intel.com>

Size for PMIC read/write command is byte, while it is DWORD for other
IPC commands.

Signed-off-by: Hong Liu <hong.liu@intel.com>
Signed-off-by: ALan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 23b6d46..943f908 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -444,7 +444,7 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 	for (i = 0; i < inlen; i++)
 		ipc_data_writel(*in++, 4 * i);
 
-	ipc_command((sub << 12) | cmd | (inlen << 18));
+	ipc_command((inlen << 16) | (sub << 12) | cmd);
 	err = busy_loop();
 
 	for (i = 0; i < outlen; i++)
