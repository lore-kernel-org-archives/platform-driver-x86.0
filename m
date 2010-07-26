From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 10/11] intel_scu_ipc: return -EIO for error condition in
	busy_loop
Date: Mon, 26 Jul 2010 10:06:12 +0100
Message-ID: <20100726090559.12329.87034.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:52669 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753321Ab0GZJjX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:39:23 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Hong Liu <hong.liu@intel.com>

Signed-off-by: Hong Liu <hong.liu@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 84a2d4b..23b6d46 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -148,7 +148,10 @@ static inline int busy_loop(void) /* Wait till scu status is busy */
 			return -ETIMEDOUT;
 		}
 	}
-	return (status >> 1) & 1;
+	if ((status >> 1) & 1)
+		return -EIO;
+
+	return 0;
 }
 
 /* Read/Write power control(PMIC in Langwell, MSIC in PenWell) registers */
