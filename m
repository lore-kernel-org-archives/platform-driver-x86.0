Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF44A2E2D;
	Tue,  9 Jun 2026 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022711; cv=none; b=EfEBJ72S7PKSYcHssavs9U7Xj7Xj+Wa8rlYIKWqT4yhvqtrYSJ16xPWds8L6U9kvldDjcf6xEEiyEDRvKp4mGjXB9U80rIW2l1t/GYOWMY8mQJ+cwXIqaqKOfHP/VtCBOHq4MjuJ9V1ywcP0JTzPiE/2KRvi59tJe/+xHy6aIxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022711; c=relaxed/simple;
	bh=Woy5p/USeYnenzxrwhERrUS8TS0ZAkZQl80gY6NrKsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kn8n/JxEPxUBQF/Y0Cm9Xd7H2d3nfw0QQs/oUhKILyN1W+4UNnjtsprd0dBMYN7m9FlK/D5HJL8HA7LKcOL0OWUpXPUwxZGtlfGKPVWeW9sKiyqPyQOAPTWqT5xWiYjsnXBs98m1hTQ4q4P6Ns37OxMghCPw/fDHjcc75ZdUYss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1l1tuJT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1l1tuJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781022708; x=1812558708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Woy5p/USeYnenzxrwhERrUS8TS0ZAkZQl80gY6NrKsA=;
  b=i1l1tuJTlQ8R/Pj9vhFICRniXY5ZWhmNrAJTounIjFD5Te7dZ9JtPRaH
   CQaDODkEPNIlY3wDD6snxIW60w57nNAI1smf0sakA5/BeLeQPXzozf7jb
   AgS+N6qDBo2H10hE8plSL0Q8bgieCTTGoFeLmVKwhwmktYtGYT4+SjIH3
   AanS3auds6Vo9P6yVsSgHCB7EvQ5zHJdOvGyOaCV+CZobvBA5I3Td8jQU
   ZaBB4NzHGDuHQThQkk/z1gEsuppk9xMU+8mn0+xO4knA+sQmJa5FIjOb9
   9lfQ80Fe33CyjqeYYxbS74Ii4c7SMYCG0aRmH/vbi7WU6NuBzWqfHqkRy
   w==;
X-CSE-ConnectionGUID: h4LYaP1GSDy9hUjS4WJ5sQ==
X-CSE-MsgGUID: PGNoD5zERI60bqG9Wt6tiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81979649"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81979649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 09:31:47 -0700
X-CSE-ConnectionGUID: 6HWOHSkwTimC5JAxu+2CEg==
X-CSE-MsgGUID: lrW7V2XnQxemd6uZ0myIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245940495"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 09:31:47 -0700
Date: Tue, 9 Jun 2026 09:31:46 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	"Brost, Matthew" <matthew.brost@intel.com>, 
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Message-ID: <lc7yhxkgmraaqyafgwinveazmsu2sy2g6374gfkx34e2ra4uzk@yeenjzaw3oi2>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
 <IA1PR11MB64184FD919A96888F580730CC1132@IA1PR11MB6418.namprd11.prod.outlook.com>
 <mvyzq3kislmjd2hd2nhdyphvnpz7ap5tu76sujaxprxp5rhnhx@34qt4rgvhe6n>
 <IA1PR11MB64182D9946206FC3E4A430C4C11C2@IA1PR11MB6418.namprd11.prod.outlook.com>
 <93ccf8d4-3091-2339-ab1e-7689776d893b@linux.intel.com>
 <IA1PR11MB64182001D7718AC31D5421D4C11D2@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA1PR11MB64182001D7718AC31D5421D4C11D2@IA1PR11MB6418.namprd11.prod.outlook.com>

On Tue, Jun 09, 2026 at 12:43:15PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Tuesday, June 9, 2026 6:20 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>; David Box
> ><david.e.box@linux.intel.com>
> >Cc: Brost, Matthew <matthew.brost@intel.com>;
> >thomas.hellstrom@linux.intel.com; intel-xe@lists.freedesktop.org; linux-
> >kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
> >Subject: RE: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
> >walk
> >
> >On Mon, 8 Jun 2026, Ruhl, Michael J wrote:
> >
> >> >-----Original Message-----
> >> >From: David Box <david.e.box@linux.intel.com>
> >> >Sent: Sunday, June 7, 2026 3:39 PM
> >> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >> >Cc: ilpo.jarvinen@linux.intel.com; Brost, Matthew
> >> ><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com; intel-
> >> >xe@lists.freedesktop.org; linux-kernel@vger.kernel.org; platform-driver-
> >> >x86@vger.kernel.org
> >> >Subject: Re: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for
> >header
> >> >walk
> >> >
> >> >On Wed, Jun 03, 2026 at 06:32:32PM +0000, Ruhl, Michael J wrote:
> >> >> >-----Original Message-----
> >> >> >From: David E. Box <david.e.box@linux.intel.com>
> >> >> >Sent: Friday, May 29, 2026 2:32 PM
> >> >> >To: ilpo.jarvinen@linux.intel.com; Ruhl, Michael J
> >> ><michael.j.ruhl@intel.com>;
> >> >> >david.e.box@linux.intel.com
> >> >> >Cc: Brost, Matthew <matthew.brost@intel.com>;
> >> >> >thomas.hellstrom@linux.intel.com; intel-xe@lists.freedesktop.org; linux-
> >> >> >kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
> >> >> >Subject: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
> >> >walk
> >> >> >
> >> >> >The base_addr refactor changed intel_vsec_walk_header() to pass
> >> >> >info->base_addr as the discovery-table base address. For the PCI VSEC
> >> >> >driver this info comes from driver_data, but exported callers may provide
> >> >> >their own static headers and leave base_addr unset.
> >> >> >
> >> >> >For xe, this made the discovery-table base address zero instead of the
> >BAR
> >> >> >selected by header->tbir, preventing PMT endpoints from being created.
> >> >> >
> >> >> >Restore the previous behavior for the header-walk path by falling back to
> >> >> >pci_resource_start(pdev, header->tbir) when base_addr is not specified.
> >> >> >Keep explicit base_addr override behavior unchanged.
> >> >> >
> >> >> >This preserves the refactor structure while fixing the functional
> >> >> >regression in manual-header users.
> >> >> >
> >> >> >Fixes: 904b333fc51c ("platform/x86/intel/vsec: Refactor base_addr
> >> >handling")
> >> >> >Assisted-by: Claude:claude-sonnet-4-6
> >> >> >Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> >> >> >---
> >> >> > drivers/platform/x86/intel/vsec.c | 17 ++++++++++++++++-
> >> >> > 1 file changed, 16 insertions(+), 1 deletion(-)
> >> >> >
> >> >> >diff --git a/drivers/platform/x86/intel/vsec.c
> >> >> >b/drivers/platform/x86/intel/vsec.c
> >> >> >index 1657834fd275..3c6d8a1928c0 100644
> >> >> >--- a/drivers/platform/x86/intel/vsec.c
> >> >> >+++ b/drivers/platform/x86/intel/vsec.c
> >> >> >@@ -482,10 +482,25 @@ static int intel_vsec_walk_header(struct device
> >> >> >*dev,
> >> >> > 				  const struct intel_vsec_platform_info *info)
> >> >> > {
> >> >> > 	struct intel_vsec_header **header = info->headers;
> >> >> >+	u64 base_addr;
> >> >> > 	int ret;
> >> >> >
> >> >> > 	for ( ; *header; header++) {
> >> >> >-		ret = intel_vsec_register_device(dev, *header, info, info-
> >> >>base_addr);
> >> >> >+		if (info->base_addr) {
> >> >> >+			base_addr = info->base_addr;
> >> >> >+		} else {
> >> >> >+			struct pci_dev *pdev;
> >> >> >+
> >> >> >+			if (!dev_is_pci(dev)) {
> >> >> >+				dev_err(dev, "non-PCI device without a base
> >> >address\n");
> >> >> >+				return -EINVAL;
> >> >> >+			}
> >> >> >+
> >> >> >+			pdev = to_pci_dev(dev);
> >> >> >+			base_addr = pci_resource_start(pdev, (*header)->tbir);
> >> >>
> >> >> Alternate:
> >> >>
> >> >> if (!info->base_addr) {
> >> >> 	struct pci_dev *pdev;
> >> >>
> >> >> 	if (!dev_is_pci(dev)) {
> >> >> 		dev_err(dev, "non-PCI device without a base address\n");
> >> >> 		return -EINVAL;
> >> >> 	}
> >> >>
> >> >> 	pdev = to_pci_dev(dev);
> >> >> 	info->base_addr = pci_resource_start(pdev, (*header)->tbir);}
> >> >> }
> >> >
> >> >Thanks. I'll do this in the next patch.
> >>
> >> Looking at one of your follow-on patches, I see that you are setting the info to
> >const...
> >>
> >> So setting the base_addr here, might not be "correct"?
> >>
> >> M
> >>
> >> >>
> >> >> Would it make sense to require the caller to fill this in?
> >> >>
> >> >> i.e. if (!info->base_addr) return EINVAL?
> >> >>
> >> >> Change of behavior, but forcing the caller to provide the right info seems
> >> >reasonable.
> >> >
> >> >Agreed. But that would be separate from this fixup patch.
> >> >
> >> >>
> >> >> Either way, this looks reasonable to me.
> >> >>
> >> >> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >
> >Hi David,
> >
> >Could you please enlighten me if I should expect an update to this patch
> >or not?
> >
> >While understanding it doesn't look critical for this patch, I'm unsure
> >what follow-up patches you folks are talking about?
> 
> Hi Ilpo and David,
> 
> I was referring to:
> 
> commit 9577c74c96f88d807d1ba005adbf5952e7127e55
> Author: David E. Box <david.e.box@linux.intel.com>
> Date:   Thu Mar 12 18:51:41 2026 -0700
> 
>     platform/x86/intel/vsec: Make driver_data info const
> 
> This was part of the patch set that had introduced this issue (broken base_addr).
> The *info struct is set as const, so my suggestion above is not correct.
> 
> Sorry for the confusion.
> 
> M

Right. I had forgotten that it was recently made const as well. So this
patch should go as is. Thanks.

> 
> >--
> > i.
> 
