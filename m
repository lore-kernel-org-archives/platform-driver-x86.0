Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BE3563D7;
	Mon, 19 Jan 2026 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817637; cv=none; b=EzpZlfKOR19rEEmPMUU6RsD94kJMmFRpquPpA7fjQ5SIBLllIVyYDZI/ERQ0vBSFMWt0Yt3pisiZVUgnml4hfPGvlAJPtx/8W+4lhvn8pWug2wGqNT9lDHI45di7gVmT68ut9EIEvYoscFPWoXiERsr/QCFKX4QVJ3kX3Wd5Tjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817637; c=relaxed/simple;
	bh=ytjvmRheo00FmaWFyJCmfy1/vNghHbnlfZHLnret24g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CkNdiPSaWxi4mf9QEgXfIMQqHfz96uj+S7cx9XBfX6M/8G/FBW2OknKzoBfKxmFNFmzKe6ZvlmLURxPIvG//sSuq2lvvOniVCVpWR8+s+zDffMP/c4ienZrskKoPxgcQPsKcGMs63t2/5Vs7S/cj+Wi3nKQM9kUNJJDX0fjRHPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9StP99R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9StP99R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768817635; x=1800353635;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ytjvmRheo00FmaWFyJCmfy1/vNghHbnlfZHLnret24g=;
  b=K9StP99R6DkRTM3lbaXYlhF+WoeJOwOp+R6ccEKwUptm5V8IFyS7Z9rn
   LFDYXXrdgSt92RmyLN305H7zZmK68xsiBA1Tll+0giqrYetqHK9eTSYe1
   5J9alqrZVeTMGh347unN1uu36kzz4vc8MWVEkPUROgaifB1HMYexRz3hm
   aLQPePyJod68Hwew2/gRodIMzYq7O2b5ywO9nK7YgFjd850KHoYBqO5x2
   nkdc5pyfnNq/b3HGBnhc+a5Nb6bUGwkI+debXhzB42/ebFgffY1jnIdml
   ipWHM8GZms2lAtFN9VWwltC6Z7EsaFuz8c6o4MJdcl0vAS/DPCuqDQD1M
   g==;
X-CSE-ConnectionGUID: ZDdpjlIyQOeOBVqcFehtkQ==
X-CSE-MsgGUID: wOOgmGEhSNKxLiyl4iaZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81398332"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="81398332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:13:54 -0800
X-CSE-ConnectionGUID: C4mQqM53RyeiX4VC37P4yA==
X-CSE-MsgGUID: s38zolcmSMKMXZMq7wqIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205886094"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.93])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:13:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Jan 2026 12:13:49 +0200 (EET)
To: Alexey Zagorodnikov <xglooom@gmail.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] platform/x86/amd/pmf: Introduce option to disable
 Smart PC function in PMF
In-Reply-To: <1eff30f0-f619-419b-ab26-b8c68cad87df@gmail.com>
Message-ID: <fcb61ed2-72f9-c78d-855b-f446873e54e6@linux.intel.com>
References: <20260117200819.12383-1-xglooom@gmail.com> <20260117200819.12383-2-xglooom@gmail.com> <35a7f364-a89f-4625-82e2-03c1fb42ec74@amd.com> <1eff30f0-f619-419b-ab26-b8c68cad87df@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 Jan 2026, Alexey Zagorodnikov wrote:

> Sorry for the inconvenience, it is my first time :)
> 
> Originally bugreport here https://gitlab.freedesktop.org/drm/amd/-/issues/4868

When the issue is reported in some tracker, the usual custom is to add 
a Link tag to the changelog so it will be recorded with the change into 
the kernel history.

-- 
 i.

 
> But it turned out to be not a real bug, but rather a feature of the firmware,
> which in my case is not desirable. Would nice to have a toggle to disable,
> instead of completely blacklist module.
> 
> Should I send v2 patch with a new message?
>
> On 1/18/26 20:20, Shyam Sundar S K wrote:
> > 
> > On 1/18/2026 01:38, Alexey Zagorodnikov wrote:
> > > Signed-off-by: Alexey Zagorodnikov <xglooom@gmail.com>
> > Please include the context in the commit message instead of the cover
> > letter. Additionally, if there are any bug reports or issue tracker
> > entries (e.g., Bugzilla) documenting the problem this addresses,
> > please reference them to provide justification for the change.
> > 
> > Thanks,
> > Shyam
> > 
> > > ---
> > >   drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
> > >   1 file changed, 14 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/amd/pmf/core.c
> > > b/drivers/platform/x86/amd/pmf/core.c
> > > index 8fc293c9c5380..00a4fc899c727 100644
> > > --- a/drivers/platform/x86/amd/pmf/core.c
> > > +++ b/drivers/platform/x86/amd/pmf/core.c
> > > @@ -53,6 +53,11 @@ static bool force_load;
> > >   module_param(force_load, bool, 0444);
> > >   MODULE_PARM_DESC(force_load, "Force load this driver on supported older
> > > platforms (experimental)");
> > >   +/* Force to disable Smart PC Solution */
> > > +static bool disable_smart_pc;
> > > +module_param(disable_smart_pc, bool, 0444);
> > > +MODULE_PARM_DESC(disable_smart_pc, "Disable Smart PC Solution");
> > > +
> > >   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb,
> > > unsigned long event, void *data)
> > >   {
> > >   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev,
> > > pwr_src_notifier);
> > > @@ -362,11 +367,15 @@ static void amd_pmf_init_features(struct amd_pmf_dev
> > > *dev)
> > >   		dev_dbg(dev->dev, "SPS enabled and Platform Profiles
> > > registered\n");
> > >   	}
> > >   -	amd_pmf_init_smart_pc(dev);
> > > -	if (dev->smart_pc_enabled) {
> > > -		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> > > -		/* If Smart PC is enabled, no need to check for other features
> > > */
> > > -		return;
> > > +	if (disable_smart_pc) {
> > > +		dev->smart_pc_enabled = false;
> > > +	} else {
> > > +		amd_pmf_init_smart_pc(dev);
> > > +		if (dev->smart_pc_enabled) {
> > > +			dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> > > +			/* If Smart PC is enabled, no need to check for other
> > > features */
> > > +			return;
> > > +		}
> > >   	}
> > >     	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> > 
> 

