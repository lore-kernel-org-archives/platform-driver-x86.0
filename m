From: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
Subject: [PATCH] intel_ips: fix a comment typo
Date: Thu, 18 Sep 2014 11:59:05 +0800
Message-ID: <1411012745-7066-1-git-send-email-chenhanxiao@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:26137 "EHLO
	heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757331AbaIRD6v (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Sep 2014 23:58:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Chen Hanxiao <chenhanxiao@cn.fujitsu.com>

s/tempurature/temperature

Signed-off-by: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
---
 drivers/platform/x86/intel_ips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index c0242ed..3c03232 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -33,7 +33,7 @@
  * performance by allocating more power or thermal budget to the CPU or GPU
  * based on available headroom and activity.
  *
- * The basic algorithm is driven by a 5s moving average of tempurature.  If
+ * The basic algorithm is driven by a 5s moving average of temperature.  If
  * thermal headroom is available, the CPU and/or GPU power clamps may be
  * adjusted upwards.  If we hit the thermal ceiling or a thermal trigger,
  * we scale back the clamp.  Aside from trigger events (when we're critically
-- 
1.9.0
