From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] intel_pmic_gpio: modify EOI handling following change
	of kernel irq subsystem
Date: Thu, 30 Dec 2010 13:41:17 +0000
Message-ID: <20101230134117.GA12686@srcf.ucam.org>
References: <1293701574-28378-1-git-send-email-feng.tang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38642 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945Ab0L3NlY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Dec 2010 08:41:24 -0500
Content-Disposition: inline
In-Reply-To: <1293701574-28378-1-git-send-email-feng.tang@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Feng Tang <feng.tang@intel.com>
Cc: platform-driver-x86@vger.kernel.org, alan@linux.intel.com, tglx@linutronix.de, Alek Du <alek.du@intel.com>

On Thu, Dec 30, 2010 at 05:32:54PM +0800, Feng Tang wrote:
> Latest kernel has many changes in IRQ subsystem and its interfaces, like adding
> "irq_eoi" for struct irq_chip, this patch will make it support both the new
> and old interface.

There's no point in having compatibility stubs in the mainline kernel. 
Just fix the driver up to match the new behaviour.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
