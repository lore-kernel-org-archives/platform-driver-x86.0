From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH] ips: use interruptible waits in ips-monitor
Date: Fri, 25 Mar 2011 11:27:59 -0700
Message-ID: <20110325112759.584e7034@jbarnes-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oproxy2-pub.bluehost.com ([67.222.39.60]:42156 "HELO
	oproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754882Ab1CYS2K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Mar 2011 14:28:10 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org
Cc: Andreas Hartmann <andihartmann@freenet.de>

This is what I intended to do since:
  1) the driver handles variable waits just fine, and
  2) interruptible waits aren't reported as load in the load avg.

Reported-and-tested-by: Andreas Hartmann <andihartmann@freenet.de>
Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 1294a39..85c8ad4 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1111,7 +1111,7 @@ static int ips_monitor(void *data)
                last_msecs = jiffies_to_msecs(jiffies);
                expire = jiffies + msecs_to_jiffies(IPS_SAMPLE_PERIOD);
 
-               __set_current_state(TASK_UNINTERRUPTIBLE);
+               __set_current_state(TASK_INTERRUPTIBLE);
                mod_timer(&timer, expire);
                schedule();
