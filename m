From: <linux-kernel-dev@beckhoff.com>
Subject: [PATCH 0/1] Add several Beckhoff Automation boards to critclk_systems DMI table
Date: Thu, 2 May 2019 15:03:50 +0200
Message-ID: <20190502130351.5341-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>

There are several Beckhoff Automation industrial PC boards which use
pmc_plt_clk* clocks for ethernet controllers. The patch adds affected boards
to critclk_systems DMI table so the clocks are marked as CLK_CRITICAL and
not turned off.
This should be applied on top of another patch as both change
the same table:
[PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table

Steffen Dirkwinkel (1):
  platform/x86: pmc_atom: Add several Beckhoff Automation boards to
    critclk_systems DMI table

 drivers/platform/x86/pmc_atom.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.21.0
