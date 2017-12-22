From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Fix const confusion in intel-mid x86 platform drivers
Date: Thu, 21 Dec 2017 16:14:43 -0800
Message-ID: <20171222001443.2067-1-andi@firstfloor.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:8045 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753482AbdLVAX1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Dec 2017 19:23:27 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

const must be marked __initconst, not __initdata

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
index dc036e511f48..2b5d86ce24c2 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
@@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct bt_sfi_data *ddata)
 	return 0;
 }
 
-static const struct bt_sfi_data tng_bt_sfi_data __initdata = {
+static const struct bt_sfi_data tng_bt_sfi_data __initconst = {
 	.setup	= tng_bt_sfi_setup,
 };
 
-- 
2.15.0
