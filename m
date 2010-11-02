From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -resend] ibm_rtl: fix printk format warning
Date: Tue, 2 Nov 2010 13:17:42 -0700
Message-ID: <20101102131742.313f7fbf.randy.dunlap@oracle.com>
References: <1288728491-2216-1-git-send-email-vernux@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62180 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758Ab0KBUSZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Nov 2010 16:18:25 -0400
In-Reply-To: <1288728491-2216-1-git-send-email-vernux@us.ibm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vernon Mauery <vernux@us.ibm.com>, Keith Mannthey <kmannth@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning:

drivers/platform/x86/ibm_rtl.c:305:warning: format '%#llx' expects type 'long long unsigned int', but argument 2 has type 'phys_addr_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Keith Mannthey <kmannth@us.ibm.com>
Cc: Vernon Mauery <vernux@us.ibm.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/ibm_rtl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20101022.orig/drivers/platform/x86/ibm_rtl.c
+++ linux-next-20101022/drivers/platform/x86/ibm_rtl.c
@@ -302,7 +302,7 @@ static int __init ibm_rtl_init(void) {
 			RTL_DEBUG("rtl_cmd_width = %u, rtl_cmd_type = %u\n",
 			      rtl_cmd_width, rtl_cmd_type);
 			addr = ioread32(&rtl_table->cmd_port_address);
-			RTL_DEBUG("addr = %#llx\n", addr);
+			RTL_DEBUG("addr = %#llx\n", (unsigned long long)addr);
 			plen = rtl_cmd_width/sizeof(char);
 			rtl_cmd_addr = rtl_port_map(addr, plen);
 			RTL_DEBUG("rtl_cmd_addr = %#llx\n", (u64)rtl_cmd_addr);
