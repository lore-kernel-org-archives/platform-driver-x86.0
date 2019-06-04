From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.1 35/60] platform/x86: pmc_atom: Add several Beckhoff Automation boards to critclk_systems DMI table
Date: Tue,  4 Jun 2019 19:21:45 -0400
Message-ID: <20190604232212.6753-35-sashal@kernel.org>
References: <20190604232212.6753-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604232212.6753-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>

[ Upstream commit d6423bd03031c020121da26c41a26bd5cc6d0da3 ]

There are several Beckhoff Automation industrial PC boards which use
pmc_plt_clk* clocks for ethernet controllers. This adds affected boards
to critclk_systems DMI table so the clocks are marked as CLK_CRITICAL and
not turned off.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/pmc_atom.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index a311f48ce7c9..b1d804376237 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -413,6 +413,30 @@ static const struct dmi_system_id critclk_systems[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
 		},
 	},
+	{
+		/* pmc_plt_clk* - are used for ethernet controllers */
+		.ident = "Beckhoff CB3163",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
+			DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
+		},
+	},
+	{
+		/* pmc_plt_clk* - are used for ethernet controllers */
+		.ident = "Beckhoff CB6263",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
+			DMI_MATCH(DMI_BOARD_NAME, "CB6263"),
+		},
+	},
+	{
+		/* pmc_plt_clk* - are used for ethernet controllers */
+		.ident = "Beckhoff CB6363",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
+			DMI_MATCH(DMI_BOARD_NAME, "CB6363"),
+		},
+	},
 	{ /*sentinel*/ }
 };
 
-- 
2.20.1
