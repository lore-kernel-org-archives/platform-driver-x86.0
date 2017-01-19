From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 06/10] platform/x86: intel_mid_powerbtn: Acknowledge interrupts
Date: Thu, 19 Jan 2017 18:39:45 +0200
Message-ID: <20170119163949.147183-7-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:35930 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754233AbdASTYG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2017 14:24:06 -0500
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Some platforms require interrupt to be acknowledged by clearing
MSIC_PWRBTNM bit in interrupt level 1 mask register.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 596ac9f3e89d..ac02a0b8bef3 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -94,6 +94,7 @@ static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 		input_sync(input);
 	}
 
+	ddata->ack(ddata);
 	return IRQ_HANDLED;
 }
 
-- 
2.11.0
