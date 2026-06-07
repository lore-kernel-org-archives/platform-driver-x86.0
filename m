Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8A6175A75;
	Sun,  7 Jun 2026 19:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780861119; cv=none; b=Qvu6yCSBO/kXBw//fWH8MdzvHYq/A7bVhbjDlrb4CeJPxk7HQKPqeH+0E0l+ZNaa6W6u5y+bMwo7ajFYHnawaDn1IWdJhMoS2czcqHfyKUtzFiQK0c6gZsOv/A43amFHwNYjFDvKu8M/a4IepEzR2/HTJdV216Wpt+R7hKi0xE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780861119; c=relaxed/simple;
	bh=5ufYGRwKqymL5z2jTabX52n2PN+iHbJs0SalGzK8k2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4lqXORihrl9C2JIWep3hOm7V6bC+IT1yOAwsnvVRKqYhBUy+GMhw7PaeJJOXyBFL/whaRl1e72kizGsctGTllKFfrUowh1bmcT0XV4L131GY+Ei6Ucrbx1D/9NUJVZpKTuHDNNfwVzmUe92wBoN3TTwBfwYPt5w+4cIHBCKGFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkDUcpHk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkDUcpHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780861118; x=1812397118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ufYGRwKqymL5z2jTabX52n2PN+iHbJs0SalGzK8k2M=;
  b=IkDUcpHkZ3yKksoD9hr3JlBUwMZ7zpa1k7cV/EKbDEnCMUcx6xzW8EuN
   pZouhQzR4I/EkwQDZ1qCC60nwSlfCuVit3cHaUlK6Z17jLKbCWtaS7CDV
   iny+Yt2/NgyA0CY9yW7cUsTQu6DnM69tGmQ9iJmxDzHZZR2lV9Secj0nG
   YEHepa71SkITbSlp7tyKA/wyaOu1iV0Aq0onvRqeISzIgg7iUfRkRvIYd
   PhW6+cr6OcvRwsCpuiM9En6NAEfFkI8e3wrpFE8BiY12l1bZIFqKZYsRw
   CRix75F4Fw3MkWuOgsquXtM8vBHODBiLqIqa0UEVwDoUfUvOeog2Ct1Yj
   A==;
X-CSE-ConnectionGUID: c43f36ZBS3OyvhTYxcqYjg==
X-CSE-MsgGUID: Mky9OxEPRYe2TQHRJBA6hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81665942"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="81665942"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 12:38:37 -0700
X-CSE-ConnectionGUID: /JHMJSWZRFiQ+dqE7oj5ug==
X-CSE-MsgGUID: GYkwGwKQSE6KZhV5Q3M/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="269048803"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 12:38:36 -0700
Date: Sun, 7 Jun 2026 12:38:36 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, 
	"Brost, Matthew" <matthew.brost@intel.com>, 
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header
 walk
Message-ID: <mvyzq3kislmjd2hd2nhdyphvnpz7ap5tu76sujaxprxp5rhnhx@34qt4rgvhe6n>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
 <IA1PR11MB64184FD919A96888F580730CC1132@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <IA1PR11MB64184FD919A96888F580730CC1132@IA1PR11MB6418.namprd11.prod.outlook.com>

On Wed, Jun 03, 2026 at 06:32:32PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: David E. Box <david.e.box@linux.intel.com>
> >Sent: Friday, May 29, 2026 2:32 PM
> >To: ilpo.jarvinen@linux.intel.com; Ruhl, Michael J <michael.j.ruhl@intel.com>;
> >david.e.box@linux.intel.com
> >Cc: Brost, Matthew <matthew.brost@intel.com>;
> >thomas.hellstrom@linux.intel.com; intel-xe@lists.freedesktop.org; linux-
> >kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
> >Subject: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header walk
> >
> >The base_addr refactor changed intel_vsec_walk_header() to pass
> >info->base_addr as the discovery-table base address. For the PCI VSEC
> >driver this info comes from driver_data, but exported callers may provide
> >their own static headers and leave base_addr unset.
> >
> >For xe, this made the discovery-table base address zero instead of the BAR
> >selected by header->tbir, preventing PMT endpoints from being created.
> >
> >Restore the previous behavior for the header-walk path by falling back to
> >pci_resource_start(pdev, header->tbir) when base_addr is not specified.
> >Keep explicit base_addr override behavior unchanged.
> >
> >This preserves the refactor structure while fixing the functional
> >regression in manual-header users.
> >
> >Fixes: 904b333fc51c ("platform/x86/intel/vsec: Refactor base_addr handling")
> >Assisted-by: Claude:claude-sonnet-4-6
> >Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> >---
> > drivers/platform/x86/intel/vsec.c | 17 ++++++++++++++++-
> > 1 file changed, 16 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/platform/x86/intel/vsec.c
> >b/drivers/platform/x86/intel/vsec.c
> >index 1657834fd275..3c6d8a1928c0 100644
> >--- a/drivers/platform/x86/intel/vsec.c
> >+++ b/drivers/platform/x86/intel/vsec.c
> >@@ -482,10 +482,25 @@ static int intel_vsec_walk_header(struct device
> >*dev,
> > 				  const struct intel_vsec_platform_info *info)
> > {
> > 	struct intel_vsec_header **header = info->headers;
> >+	u64 base_addr;
> > 	int ret;
> >
> > 	for ( ; *header; header++) {
> >-		ret = intel_vsec_register_device(dev, *header, info, info->base_addr);
> >+		if (info->base_addr) {
> >+			base_addr = info->base_addr;
> >+		} else {
> >+			struct pci_dev *pdev;
> >+
> >+			if (!dev_is_pci(dev)) {
> >+				dev_err(dev, "non-PCI device without a base address\n");
> >+				return -EINVAL;
> >+			}
> >+
> >+			pdev = to_pci_dev(dev);
> >+			base_addr = pci_resource_start(pdev, (*header)->tbir);
> 
> Alternate:
> 
> if (!info->base_addr) {
> 	struct pci_dev *pdev;
> 
> 	if (!dev_is_pci(dev)) {
> 		dev_err(dev, "non-PCI device without a base address\n");
> 		return -EINVAL;
> 	}
> 
> 	pdev = to_pci_dev(dev);
> 	info->base_addr = pci_resource_start(pdev, (*header)->tbir);}
> }

Thanks. I'll do this in the next patch.

> 
> Would it make sense to require the caller to fill this in?
> 
> i.e. if (!info->base_addr) return EINVAL?
> 
> Change of behavior, but forcing the caller to provide the right info seems reasonable.

Agreed. But that would be separate from this fixup patch.

> 
> Either way, this looks reasonable to me.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Thanks

David

> 
> M
> 
> >+		}
> >+
> >+		ret = intel_vsec_register_device(dev, *header, info, base_addr);
> > 		if (ret)
> > 			return ret;
> > 	}
> >
> >base-commit: a167ae8eace52dd6c80438b77d92450fe12cd4be
> >--
> >2.43.0
> 
