From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] intel_ips: fix sparse non-ANSI function warning
Date: Sat, 8 Jan 2011 19:55:40 -0800
Message-ID: <20110108195540.554e45e8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:55001 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911Ab1AIEA5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 8 Jan 2011 23:00:57 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platx86 <platform-driver-x86@vger.kernel.org>
Cc: Matthew Garrett <mjg@redhat.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix sparse warning for non-ANSI function declaration:

drivers/platform/x86/intel_ips.c:1477:25: warning: non-ANSI function declaration of function 'ips_link_to_i915_driver'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/intel_ips.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx0107.orig/drivers/platform/x86/intel_ips.c
+++ lnx0107/drivers/platform/x86/intel_ips.c
@@ -1474,7 +1474,7 @@ ips_gpu_turbo_enabled(struct ips_driver 
 }
 
 void
-ips_link_to_i915_driver()
+ips_link_to_i915_driver(void)
 {
 	/* We can't cleanly get at the various ips_driver structs from
 	 * this caller (the i915 driver), so just set a flag saying
