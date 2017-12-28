From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] x86/platform/intel-mid: Revert "Make 'bt_sfi_data' const"
Date: Thu, 28 Dec 2017 14:25:23 +0200
Message-ID: <20171228122523.21802-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:53986 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753343AbdL1MZ2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 07:25:28 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bhumika Goyal <bhumirks@gmail.com>, julia.lawall@lip6.fr

The annoying static analyzer follow up patches sometimes make a pain
rather than fixing issues.

The one done by commit 276c87054751

("x86/platform/intel-mid: Make 'bt_sfi_data' const")

convert the struct to be const while it is used as a temporary container
for important data that is used to fill 'parent' and 'name' fields in
struct platform_device_info.

That's why revert the commit which had been apparently done w/o reading
the code.

Note, compiler doesn't notice this due to explicit cast, which would be
addressed separately.

Cc: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: low the tone of accusation that this made a regression
 arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
index dc036e511f48..5a0483e7bf66 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
@@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct bt_sfi_data *ddata)
 	return 0;
 }
 
-static const struct bt_sfi_data tng_bt_sfi_data __initdata = {
+static struct bt_sfi_data tng_bt_sfi_data __initdata = {
 	.setup	= tng_bt_sfi_setup,
 };
 
-- 
2.15.1
