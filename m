Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582863D3D1D;
	Tue, 20 Jan 2026 23:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952866; cv=none; b=hqRBRoNK5/dH11rViKdDq7DeFtTurPdae8q8DY86FIR3HZtjloG2yvH80+vJT2jBuZLt0DoNCUBL1cLqb2UmbfxX/aj18MgEbhf6kK9v5YBzoNlsHEezscZXeaNvQTC450fu+ny5nz8/wPtRHnNn7pHYZc5JmuxbJYTvLQC+Epg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952866; c=relaxed/simple;
	bh=zrhX0W/qJ0JAmaKwv5c/jWnQl48afpPBI7sL9OmEBsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEUWKPWam/eg4XCBEpYtTzIBBT02NrHJIidpn5+I/m3gFIGute30J9lnfQUD72pJTmcGUQtZDL7AAHub/8rH3XCzspiREA6LYqbcVMJSsJsaYZTHJT+QueHBpKtvn9uFwfeAIfdO99aJyW5Rh0bO8LSNfr3dTujV2c/9kf8ZcSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mplpTE70; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mplpTE70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768952865; x=1800488865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zrhX0W/qJ0JAmaKwv5c/jWnQl48afpPBI7sL9OmEBsw=;
  b=mplpTE70IGnuHc2E0+IIDxHOq2O0N7XdKhF7KBZy6Rbk0B3/+ik1LWVd
   4FHziHjfhUssk6icY6Zf8Nqnq7J0eyCuCP81W5V7LtLLbkUhzbYCcRqzJ
   wfmoP9lbUzIz6kgKr6qssUArNPgeH8z/c/qENnuyAUOL16yUle6F4/vda
   KC9G6y5crKsWG5cThEODfQoWR1fiGB3iGVGV7IO0cY19IONrIDfIoRLK4
   sjDPK3rm77QibalaAZc4kZnDkiZSUR2DJFnHmvKgsunXWmVM9lO89eR0P
   q5ep7jpcoZvaRfvmIfhH2qTEyfbPP39Zw6ZBlFwrN4qeRXJPjmIONwrz4
   w==;
X-CSE-ConnectionGUID: tTwtgApXRVGJTcD84iSh/g==
X-CSE-MsgGUID: IlKY2+XUTv67wWJMWJziMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87752848"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="87752848"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:47:43 -0800
X-CSE-ConnectionGUID: OVwLqeimSCmv6/HQCoV68A==
X-CSE-MsgGUID: uNZlVuXQQJml0ngiFFgz8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="236932349"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:47:43 -0800
Date: Tue, 20 Jan 2026 15:47:43 -0800
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
	irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.comn, 
	Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86/intel/vsec: Switch exported helpers
 from pci_dev to device
Message-ID: <wrljiogi3nturdsnevfdsxs3nuzrox7bimlvaqtyedxrfswsit@yawpecrjk7f2>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
 <20260107002153.63830-3-david.e.box@linux.intel.com>
 <6641348b-a9d0-360d-0080-46f95fd3d1a7@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6641348b-a9d0-360d-0080-46f95fd3d1a7@linux.intel.com>

On Thu, Jan 15, 2026 at 03:08:09PM +0200, Ilpo Järvinen wrote:
> On Tue, 6 Jan 2026, David E. Box wrote:
> 
> > Preparatory refactor for ACPI-enumerated PMT endpoints. Several exported
> > PMT/VSEC interfaces and structs carried struct pci_dev * even though
> > callers only need a generic struct device. Move those to struct device * so
> > the same APIs work for PCI and ACPI parents.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
> >  drivers/gpu/drm/xe/xe_hwmon.c                 |  2 +-
> >  drivers/gpu/drm/xe/xe_vsec.c                  |  7 +-
> >  drivers/gpu/drm/xe/xe_vsec.h                  |  2 +-
> >  drivers/platform/x86/intel/pmc/core.c         |  4 +-
> >  .../platform/x86/intel/pmc/ssram_telemetry.c  |  2 +-
> >  drivers/platform/x86/intel/pmt/class.c        |  8 +-
> >  drivers/platform/x86/intel/pmt/class.h        |  4 +-
> >  drivers/platform/x86/intel/pmt/discovery.c    |  4 +-
> >  drivers/platform/x86/intel/pmt/telemetry.c    | 13 ++--
> >  drivers/platform/x86/intel/pmt/telemetry.h    | 11 ++-
> >  drivers/platform/x86/intel/sdsi.c             |  5 +-
> >  drivers/platform/x86/intel/vsec.c             | 74 +++++++++++--------
> >  drivers/platform/x86/intel/vsec_tpmi.c        |  6 +-
> >  include/linux/intel_vsec.h                    | 18 ++---
> >  15 files changed, 86 insertions(+), 76 deletions(-)
> > 
> 

...

> > @@ -630,7 +634,7 @@ static void intel_vsec_skip_missing_dependencies(struct pci_dev *pdev)
> >  
> >  static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  {
> > -	struct intel_vsec_platform_info *info;
> > +	struct intel_vsec_platform_info info, *info_temp;
> >  	struct vsec_priv *priv;
> >  	int num_caps, ret;
> >  	int run_once = 0;
> > @@ -641,22 +645,25 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
> >  		return ret;
> >  
> >  	pci_save_state(pdev);
> > -	info = (struct intel_vsec_platform_info *)id->driver_data;
> > -	if (!info)
> > +	info_temp = (struct intel_vsec_platform_info *)id->driver_data;
> > +	if (!info_temp)
> >  		return -EINVAL;
> >  
> > +	/* XXX: Needs better fix */
> > +	info = *info_temp;
> > +
> >  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >  	if (!priv)
> >  		return -ENOMEM;
> >  
> > -	priv->info = info;
> > +	priv->info = &info;
> >  	pci_set_drvdata(pdev, priv);
> 
> What's going on here??? 'info' is a stack variable and you're taking 
> a pointer of it into priv/drvdata??

Oy vey. This chunk shouldn't even be here. It was part of an incomplete
refactor of code from heap to stack that I ended up dropping anyway.
Sorry for the noise. Ack on everything else. Thanks Ilpo.

David
