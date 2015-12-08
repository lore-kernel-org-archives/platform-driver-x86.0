From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V8 1/2] intel_pmc_ipc: update acpi resource structure
 for Punit
Date: Tue, 08 Dec 2015 15:19:17 +0200
Message-ID: <1449580757.30729.52.camel@linux.intel.com>
References: <1449507305-51709-1-git-send-email-qipeng.zha@intel.com>
	 <20151207234514.GA12897@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:15378 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755978AbbLHNTE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Dec 2015 08:19:04 -0500
In-Reply-To: <20151207234514.GA12897@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, 2015-12-07 at 15:45 -0800, Darren Hart wrote:
> On Tue, Dec 08, 2015 at 12:55:04AM +0800, Qipeng Zha wrote:
> > BIOS restructure exported memory resources for Punit
> > in acpi table, So update resources for Punit.
> > 
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> 
> Thank you for the update Qipeng. I will review shortly.
> 
> +Andriy who originally raised the concern over the ACPI resource
> assumptions in
> the previous version. Andriy, this resource allocation looks to be a
> substantial
> improvement to me. Do you have any further concerns?

So, regarding to the second patch

1. In excerpts like following

if (IS_ERR(addr)) {
		dev_err(&pdev->dev, "Failed to map resouce for BIOS
DATA\n");
		return PTR_ERR(addr);
	}

No need to have an error message. Core already has something to print
at that point.


2. No need to explicitly cast to / from void *.

IPC_DEV *ipcdev = (IPC_DEV *)dev_id;


Otherwise looks much better than very first version!

Thanks for an update.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
