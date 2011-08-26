From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] intel_scu_ipcutil: fix major device number handling
Date: Fri, 26 Aug 2011 11:55:46 +0100
Message-ID: <20110826105517.23671.40026.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:60893 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917Ab1HZLU6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Aug 2011 07:20:58 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

We need to save major device number to be able to use it for
unregister_chrdev() in ipc_module_exit().

ipc_module_init() must return 0 on success, not major device number.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipcutil.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipcutil.c b/drivers/platform/x86/intel_scu_ipcutil.c
index b93a032..2d0f913 100644
--- a/drivers/platform/x86/intel_scu_ipcutil.c
+++ b/drivers/platform/x86/intel_scu_ipcutil.c
@@ -24,7 +24,7 @@
 #include <linux/init.h>
 #include <asm/intel_scu_ipc.h>
 
-static u32 major;
+static int major;
 
 #define MAX_FW_SIZE 264192
 
@@ -117,7 +117,11 @@ static const struct file_operations scu_ipc_fops = {
 
 static int __init ipc_module_init(void)
 {
-	return register_chrdev(0, "intel_mid_scu", &scu_ipc_fops);
+	major = register_chrdev(0, "intel_mid_scu", &scu_ipc_fops);
+	if (major < 0)
+		return major;
+
+	return 0;
 }
 
 static void __exit ipc_module_exit(void)
