From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: x86: PMC IPC depends on ACPI
Date: Sat, 3 Oct 2015 09:57:26 -0700
Message-ID: <20151003165726.GC110874@vmdeb7>
References: <1443199123-13979-1-git-send-email-lee.jones@linaro.org>
 <5605FAB4.9000606@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38810 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745AbbJCQ5z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 3 Oct 2015 12:57:55 -0400
Content-Disposition: inline
In-Reply-To: <5605FAB4.9000606@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, qipeng.zha@intel.com, platform-driver-x86@vger.kernel.org

On Fri, Sep 25, 2015 at 06:53:56PM -0700, Randy Dunlap wrote:
> On 09/25/15 09:38, Lee Jones wrote:
> > This patch solves:
> > 
> > on x86_64:
> > 
> > when CONFIG_ACPI is not enabled:
> > 
> > ../drivers/mfd/intel_soc_pmic_bxtwc.c: In function 'bxtwc_probe':
> > ../drivers/mfd/intel_soc_pmic_bxtwc.c:342:2:
> >     error: implicit declaration of function 'acpi_evaluate_integer' [-Werror=implicit-function-declaration]
> >         status = acpi_evaluate_integer(handle, "_HRV", NULL, &hrv);
> >         ^
> > 
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Works for me.  Thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Lee,

Since this appears to be the result of a patch applied to the mfd tree, would
you like to pick up this patch?

Acked-by: Darren Hart <dvhart@linux.intel.com>


-- 
Darren Hart
Intel Open Source Technology Center
