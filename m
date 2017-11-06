From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: pmc_atom: Fix parent clocks
Date: Mon,  6 Nov 2017 16:17:52 +0200
Message-ID: <20171106141752.11827-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:13056 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752829AbdKFOS4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Nov 2017 09:18:56 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

PLL or XTAL is a choice of parents. They are not dependent to
each other (direct citation):

	The source of the frequencies can be XTAL or PLL, depending on
	the configuration. Any of the two available frequencies can be
	selected for each of the platform clocks.

According to datasheet on hand CherryTrail has them, though they both
provide 19.2MHz frequency.

Fixes: 282a4e4ce5f9 ("platform/x86: Enable Atom PMC platform clocks")
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/pmc_atom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 77bac859342d..56734112e5fe 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -65,7 +65,7 @@ static const struct pmc_clk byt_clks[] = {
 	{
 		.name = "pll",
 		.freq = 19200000,
-		.parent_name = "xtal",
+		.parent_name = NULL,
 	},
 	{},
 };
@@ -76,6 +76,11 @@ static const struct pmc_clk cht_clks[] = {
 		.freq = 19200000,
 		.parent_name = NULL,
 	},
+	{
+		.name = "pll",
+		.freq = 19200000,
+		.parent_name = NULL,
+	},
 	{},
 };
 
-- 
2.14.2
