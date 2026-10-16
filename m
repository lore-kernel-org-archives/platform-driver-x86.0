Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86137882A;
	Fri, 16 Oct 2026 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137382; cv=none; b=r391nnJto/xUYlOlCmbeg/5zx5IKAJT3iobzxCcWSRRtttXkFQkcK3JsGdeoEJnxEgf9eFVCm3BPPuYvkFB0wIy3d2/j2Q8aw1Vjai8I4A/8scQDWEpzVJiXEgBePUe3uelWOQZtUAjThCTltNc3PEfK7+cMTx1Ewy0D1zCN4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137382; c=relaxed/simple;
	bh=+drlSrJPTY/pu5rpNmgJYnF6iYPtFEufsY2xeEh6AQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhUfiekdok1gg3MjhJ+J7yApC9ml4I81uro43flHZT7ElROeUnxZDpyGvO2t2VvLjuizOMTDnCiWw9kAxOVfPc+w4amQt+QPiu6pdwEWHfZAQih6xCPYhEzia21F7C+9U+W0ZJcO43xDtFUlY5oJRH/xzAv+CMBA3iMqaJ53Bgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0s+bGmL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0s+bGmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B00A1F000C4;
	Fri, 16 Oct 2026 07:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137381;
	bh=vJntNNnJE05BLx+i3AFhrRvMHPGgrpV5I5IEsjodr/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L0s+bGmLFoR9LcyDnyZ/CTHSnMQEsFftjcl11NZp1TX0z2l6yn+auCuUQzM44aIrJ
	 Pg9ELB8ysAWQF2FaAxEH/SWZWDnHxP1BHLFWr2X/2e4NUZOLL19vMho7N34RXFT4OF
	 sULgwuz1/71/Ff9h7RxiDWDD5XA76bEIVZLcLJmQnaKZDujM+kBmzEdzEBszFossQC
	 GCUlUtYLugJ8HWZBvjvn1WRcWltAvcMQvVFDgLK2hdA7Jz4JRZr1dvgk9nV+Zt2zoW
	 uS0mzDfIdFWhewl1ceSKPcGADBDoScTV61IVcVAn/ZIJCfJGXGv0plVyevKLvZu0qX
	 vnLrv9tu0c0Yw==
Date: Fri, 16 Oct 2026 07:56:18 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, tfiga@chromium.org
Subject: Re: [PATCH] platform/x86/intel/pmc: Disable ACPI PM timer during
 suspend on Panther Lake
Message-ID: <atHYognzBSwCrF1f@google.com>
References: <20261015035712.3604634-1-tzungbi@kernel.org>
 <6075cb9a-b739-644a-2dac-998e7893ec31@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6075cb9a-b739-644a-2dac-998e7893ec31@linux.intel.com>

On Thu, Oct 15, 2026 at 11:52:05AM +0300, Ilpo Järvinen wrote:
> > diff --git a/drivers/platform/x86/intel/pmc/ptl.c b/drivers/platform/x86/intel/pmc/ptl.c
> > index a7d5d4f77934..8c32f9be9302 100644
> > --- a/drivers/platform/x86/intel/pmc/ptl.c
> > +++ b/drivers/platform/x86/intel/pmc/ptl.c
> > @@ -6,6 +6,7 @@
> >   * Copyright (c) 2025, Intel Corporation.
> >   */
> >  
> > +#include <linux/io.h>
> >  #include <linux/pci.h>
> >  
> >  #include "core.h"
> > @@ -548,6 +549,9 @@ static const u8 ptl_pmc_list[] = {PMC_IDX_MAIN};
> >  #define PTL_NPU_PCI_DEV                0xb03e
> >  #define PTL_IPU_PCI_DEV                0xb05d
> >  
> > +#define ACPI_TMR_CTL_OFFSET            0x18fc
> > +#define ACPI_TIM_DIS                   BIT(1)
> 
> Please add include for this as well.

Ack, fixed in v2.

> > +static void ptl_set_acpi_pm_timer_on_suspend(struct pmc_dev *pmcdev, bool suspend)
> > +{
> > +	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
> > +	bool enabled;
> > +	u8 val;
> > +
> > +	if (!pmc || !pmc->regbase)
> > +		return;
> > +
> > +	if (!suspend && !pmcdev->pm_timer_enabled)
> > +		return;
> > +
> > +	val = readb(pmc->regbase + ACPI_TMR_CTL_OFFSET);
> > +	enabled = !(val & ACPI_TIM_DIS);
> > +	if (suspend && enabled)
> > +		writeb(val | ACPI_TIM_DIS, pmc->regbase + ACPI_TMR_CTL_OFFSET);
> > +	else if (!suspend)
> > +		writeb(val & ~ACPI_TIM_DIS, pmc->regbase + ACPI_TMR_CTL_OFFSET);
> 
> Change val on a separate line for clarity.
> 
> How about using this alternative:
> 
> 	old_val = val;
> 	if (...)
> 		val |= ACPI_TIM_DIS;
> 	else if (...)
> 		val &= ~ACPI_TIM_DIS;
> 	if (val != old_val)
> 		writeb(...);

Ack, tried something similar in v2.
