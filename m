From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 04/11] intel_scu_ipc: tidy up unused bits
Date: Mon, 26 Jul 2010 10:03:30 +0100
Message-ID: <20100726090317.12329.10777.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:9245 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJgk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:36:40 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Sreedhara DS <sreedhara.ds@intel.com>

Delete unused constants IPC_CMD_INDIRECT_RD and IPC_CMD_INDIRECT_WR
Remove multiple inclusion of header file "asm/mrst.h"

Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index fd78386..2245876 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -38,10 +38,6 @@
 #define IPC_CMD_PCNTRL_R      1 /* Register read */
 #define IPC_CMD_PCNTRL_M      2 /* Register read-modify-write */
 
-/* Miscelaneous Command ids */
-#define IPC_CMD_INDIRECT_RD   2 /* 32bit indirect read */
-#define IPC_CMD_INDIRECT_WR   5 /* 32bit indirect write */
-
 /*
  * IPC register summary
  *
