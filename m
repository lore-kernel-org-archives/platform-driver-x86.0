From: Carlo Caione <carlo@endlessm.com>
Subject: Re: r8169 broken when enabling the Atom PMC platform clocks
Date: Mon, 10 Jul 2017 16:23:51 +0200
Message-ID: <5bb9d7e2-7302-00eb-1596-8a4ea5f3fe3a@endlessm.com>
References: <CAL9uMOGxNGp_dgk+u0n0EngbUOgp9jT8ZpEwk-m4LzAbhYoqzg@mail.gmail.com>
 <1499696443.22624.327.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:35849 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932284AbdGJOXz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2017 10:23:55 -0400
Received: by mail-wr0-f182.google.com with SMTP id c11so141011049wrc.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jul 2017 07:23:54 -0700 (PDT)
In-Reply-To: <1499696443.22624.327.camel@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, irina.tirdea@intel.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stephen Boyd <sboyd@codeaurora.org>, nic_swsd@realtek.com, Linux Upstreaming Team <linux@endlessm.com>

On 10/07/2017 16:20, Andy Shevchenko wrote:
> On Mon, 2017-07-10 at 16:15 +0200, Carlo Caione wrote:
>> Hi,
>> We are working on an Asus Z550M shipping a baytrail processor. From
>> the 4.11 kernel we noticed that the system is not bootable anymore
>> since it hangs during boot when probing the r8169 driver, not even a
>> trace is available.
>>
>> We bisected this problem down to commit 282a4e4 ("platform/x86: Enable
>> Atom PMC platform clocks").
>>
>> We suspected that the problem is that one of the PMC clocks is being
>> used by the Ethernet board as XTAL clock and since it is not
>> explicitly claimed by the driver, it is gated at boot by the clock
>> framework, causing the system to hang.
>>
>> We have a quirk downstream in place where we basically modified the
>> r8169 driver to claim the 25MHz pmc_plt_clk_4 clock, and this seems to
>> work fine, but we really want to find a more upstreamable and
>> definitive solution.
> 
> Can you copy in-place the hack patch you have?

diff --git a/drivers/net/ethernet/realtek/r8169.c 
b/drivers/net/ethernet/realtek/r8169.c
index de013b3ba2ab..27ddda7b13b1 100644
--- a/drivers/net/ethernet/realtek/r8169.c
+++ b/drivers/net/ethernet/realtek/r8169.c
@@ -20,6 +20,8 @@
  #include <linux/crc32.h>
  #include <linux/in.h>
  #include <linux/ip.h>
+#include <linux/clk.h>
+#include <asm/cpu_device_id.h>
  #include <linux/tcp.h>
  #include <linux/interrupt.h>
  #include <linux/dma-mapping.h>
@@ -796,6 +798,7 @@ struct rtl8169_private {
  	struct ring_info tx_skb[NUM_TX_DESC];	/* Tx data buffers */
  	struct timer_list timer;
  	u16 cp_cmd;
+	struct clk *clk;

  	u16 event_slow;

@@ -8210,6 +8213,17 @@ static struct dmi_system_id rtl_dmi_table[] 
__initdata = {
  	},
  	{}
  };
+static bool is_valleyview(void)
+{
+	static const struct x86_cpu_id cpu_ids[] = {
+		{ X86_VENDOR_INTEL, 6, 55 }, /* Valleyview, Bay Trail */
+		{}
+	};
+
+	if (!x86_match_cpu(cpu_ids))
+		return false;
+	return true;
+}

  static int rtl_init_one(struct pci_dev *pdev, const struct 
pci_device_id *ent)
  {
@@ -8220,7 +8234,7 @@ static int rtl_init_one(struct pci_dev *pdev, 
const struct pci_device_id *ent)
  	struct net_device *dev;
  	void __iomem *ioaddr;
  	int chipset, i;
-	int rc;
+	int rc, ret;
  	static const struct {
  		unsigned long mask;
  		const char *type;
@@ -8254,6 +8268,39 @@ static int rtl_init_one(struct pci_dev *pdev, 
const struct pci_device_id *ent)
  	tp->pci_dev = pdev;
  	tp->msg_enable = netif_msg_init(debug.msg_enable, R8169_MSG_DEFAULT);

+	if (is_valleyview()) {
+		tp->clk = devm_clk_get(&pdev->dev, "pmc_plt_clk_4");
+		if (IS_ERR(tp->clk)) {
+			netif_err(tp, probe, dev, "Failed to get clock from pmc_plt_clk_4: 
%ld\n",
+				  PTR_ERR(tp->clk));
+			return PTR_ERR(tp->clk);
+		}
+
+		/*
+		 * The firmware might enable the clock at
+		 * boot (this information may or may not
+		 * be reflected in the enable clock register).
+		 * To change the rate we must disable the clock
+		 * first to cover these cases. Due to common
+		 * clock framework restrictions that do not allow
+		 * to disable a clock that has not been enabled,
+		 * we need to enable the clock first.
+		 */
+		ret = clk_prepare_enable(tp->clk);
+		if (!ret)
+			clk_disable_unprepare(tp->clk);
+
+		ret = clk_set_rate(tp->clk, 25000000);
+		if (ret)
+			netif_err(tp, probe, dev, "Unable to set clock\n");
+
+		ret = clk_prepare_enable(tp->clk);
+		if (ret < 0) {
+			netif_err(tp, probe, dev, "Couldn't configure clock\n");
+			return ret;
+		}
+	}
+
  	mii = &tp->mii;
  	mii->dev = dev;
  	mii->mdio_read = rtl_mdio_read;


-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
