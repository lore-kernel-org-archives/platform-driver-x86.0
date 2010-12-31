From: Feng Tang <feng.tang@intel.com>
Subject: Re: [PATCH] intel_pmic_gpio: modify EOI handling following change
 of kernel irq subsystem
Date: Fri, 31 Dec 2010 09:48:20 +0800
Message-ID: <20101231094820.351dade9@feng-i7>
References: <1293701574-28378-1-git-send-email-feng.tang@intel.com>
	<20101230134117.GA12686@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:65008 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751274Ab0LaBtj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Dec 2010 20:49:39 -0500
In-Reply-To: <20101230134117.GA12686@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "alan@linux.intel.com" <alan@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "Du, Alek" <alek.du@intel.com>

On Thu, 30 Dec 2010 21:41:17 +0800
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> On Thu, Dec 30, 2010 at 05:32:54PM +0800, Feng Tang wrote:
> > Latest kernel has many changes in IRQ subsystem and its interfaces,
> > like adding "irq_eoi" for struct irq_chip, this patch will make it
> > support both the new and old interface.
> 
> There's no point in having compatibility stubs in the mainline
> kernel. Just fix the driver up to match the new behaviour.
> 

Thanks for the comments, here is the revised one

-----
From 834453fe4cb94cfcda4487ef68967037f2b5d2f2 Mon Sep 17 00:00:00 2001
From: Feng Tang <feng.tang@intel.com>
Date: Mon, 29 Nov 2010 13:39:40 +0800
Subject: [PATCH] intel_pmic_gpio: modify EOI handling following change of kernel irq subsystem

Latest kernel has many changes in IRQ subsystem and its interfaces, like adding
"irq_eoi" for struct irq_chip, this patch will make it support both the new
and old interface.

Cc: Alek Du <alek.du@intel.com>
Signed-off-by: Feng Tang <feng.tang@intel.com>
---
 drivers/platform/x86/intel_pmic_gpio.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index e61db9d..930e627 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -244,7 +244,11 @@ static void pmic_irq_handler(unsigned irq, struct irq_desc *desc)
 			generic_handle_irq(pg->irq_base + gpio);
 		}
 	}
-	desc->chip->eoi(irq);
+
+	if (desc->chip->irq_eoi)
+		desc->chip->irq_eoi(irq_get_irq_data(irq));
+	else
+		dev_warn(pg->chip.dev, "missing EOI handler for irq %d\n", irq);
 }
 
 static int __devinit platform_pmic_gpio_probe(struct platform_device *pdev)
