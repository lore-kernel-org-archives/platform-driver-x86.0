From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: [PATCH AUTOSEL for 4.14 097/110] x86/platform/intel-mid: Revert "Make
 'bt_sfi_data' const"
Date: Sat, 3 Feb 2018 18:01:29 +0000
Message-ID: <20180203180015.29073-97-alexander.levin@microsoft.com>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bl2nam02on0139.outbound.protection.outlook.com ([104.47.38.139]:10688
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752616AbeBCSDm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Feb 2018 13:03:42 -0500
In-Reply-To: <20180203180015.29073-1-alexander.levin@microsoft.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bhumika Goyal <bhumirks@gmail.com>, Darren Hart <dvhart@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, "julia.lawall@lip6.fr" <julia.lawall@lip6.fr>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Sasha Levin <Alexander.Levin@microsoft.com>

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 9d0513d82f1a8fe17b41f113ac5922fa57dbaf5c ]

So one of the constification patches unearthed a type casting fragility
of the underlying code:

  276c87054751 ("x86/platform/intel-mid: Make 'bt_sfi_data' const")

converted the struct to be const while it is also used as a temporary
container for important data that is used to fill 'parent' and 'name'
fields in struct platform_device_info.

The compiler doesn't notice this due to an explicit type cast that loses
the const - which fragility will be fixed separately.

This type cast turned a seemingly trivial const propagation patch into a
hard to debug data corruptor and crasher bug.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bhumika Goyal <bhumirks@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: julia.lawall@lip6.fr
Cc: platform-driver-x86@vger.kernel.org
Link: http://lkml.kernel.org/r/20171228122523.21802-1-andriy.shevchenko@lin=
ux.intel.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c b/arch/x=
86/platform/intel-mid/device_libs/platform_bt.c
index dc036e511f48..5a0483e7bf66 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
@@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct bt_sfi_data *dd=
ata)
 	return 0;
 }
=20
-static const struct bt_sfi_data tng_bt_sfi_data __initdata =3D {
+static struct bt_sfi_data tng_bt_sfi_data __initdata =3D {
 	.setup	=3D tng_bt_sfi_setup,
 };
=20
--=20
2.11.0
