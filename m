From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 63/99] platform/x86: i2c-multi-instantiate: Fail the probe if no IRQ provided
Date: Sat, 26 Oct 2019 09:15:24 -0400
Message-ID: <20191026131600.2507-63-sashal@kernel.org>
References: <20191026131600.2507-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191026131600.2507-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ammy Yi <ammy.yi@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 832392db9747b9c95724d37fc6a5dadd3d4ec514 ]

For APIC case of interrupt we don't fail a ->probe() of the driver,
which makes kernel to print a lot of warnings from the children.

We have two options here:
- switch to platform_get_irq_optional(), though it won't stop children
  to be probed and failed
- fail the ->probe() of i2c-multi-instantiate

Since the in reality we never had devices in the wild where IRQ resource
is optional, the latter solution suits the best.

Fixes: 799d3379a672 ("platform/x86: i2c-multi-instantiate: Introduce IOAPIC IRQ support")
Reported-by: Ammy Yi <ammy.yi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 70efa3d298253..b66e5aa6bf588 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -110,6 +110,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 			if (ret < 0) {
 				dev_dbg(dev, "Error requesting irq at index %d: %d\n",
 					inst_data[i].irq_idx, ret);
+				goto error;
 			}
 			board_info.irq = ret;
 			break;
-- 
2.20.1
