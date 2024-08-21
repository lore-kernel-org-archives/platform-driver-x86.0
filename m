Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29EA1B253B
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262886; cv=none; b=lOFs9AgK/z3ik3ULfIybjWGAvBzVOYVm9LOlzjvfLAzyVSeXVuA43zgQWzMObDsonHYCXlpms9Xb1raqVA8Ifgd7fdrj8ZqOz45RW5XAyPTzXQSHrOcxYr0bL2qKSACMor7NZh7ABKE9Mrae5mxczG2CA1tm/GDGs4gyz08KnnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262886; c=relaxed/simple;
	bh=hBw4ve3MElaAH5crYy3M97DusLpUcpWc0MVUTjNoxc0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DT944p5AT/1yHK/nSN4BduSh3UC44dXk4stKrRuD30ujokLguipDt4ne6eOpTFEgmT+jvsxlv189jKeC/o645f7PpJLRIE5TtJcDqwMI6iKdAJ2WBXK8fUBWmizfXDNgezD0six5m5eJzS19xjPAulWOff7Ng9zSPHL2MTvhYfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDuc7Gu+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDuc7Gu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724262885; x=1755798885;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hBw4ve3MElaAH5crYy3M97DusLpUcpWc0MVUTjNoxc0=;
  b=DDuc7Gu+hNuD3+qszAha852uAbXmwcKABI21BJJ8xlW5xVQ/ZGqlP9Zw
   c9OokOnJZXFIRbZvjEZ2jdt/aLHrShofJZ2BFfzSN4OKKX8XxSuJ/B9Vl
   63G2hc9TsLTRx/7nQHmUwfVaNs0eiGF9MK6UzGmjddgJP1S4rveNyQgIW
   asqKenMWL4yeUKmuPkcKv7R3Oi4NHPCC3cgIEo9pwDfXDYJAwvOWWlOHn
   +TSdbvSSRAZSPwKrg5n2eGJjOTnpE7iMZbdDrtj95E2mOQJ5ZlFv2hsMm
   t7smr8mGOwE8U4Nr57L35tveBBombC5cMC6WTZ5b04xEW5ZoSTFNIpHeH
   w==;
X-CSE-ConnectionGUID: xvKYdSngT9+8ei2LVL0Ivw==
X-CSE-MsgGUID: /6CkM16BTgWDx+cBSv3FDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22510215"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22510215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:54:44 -0700
X-CSE-ConnectionGUID: BVvlYlR3Tj6yt4uRSQlCmQ==
X-CSE-MsgGUID: 8MeFgy5/QDyGuQZGbcPalw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="60887851"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:54:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Aug 2024 20:54:37 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd/pmc: Extend support for PMC features
 on new AMD platform
In-Reply-To: <ed50679e-114f-4e7b-8465-1b8d4e0622d9@amd.com>
Message-ID: <b81c2300-f18f-7087-8531-ce7bbe3a03be@linux.intel.com>
References: <20240821150446.392726-1-Shyam-sundar.S-k@amd.com> <ed50679e-114f-4e7b-8465-1b8d4e0622d9@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Aug 2024, Mario Limonciello wrote:

> On 8/21/2024 10:04, Shyam Sundar S K wrote:
> > PMC driver has capability to get the IP information, idle mask values and
> > STB data from the PMFW. Extend this support to the platforms that belong
> > to family 1Ah model 60h series.
> > 
> > Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> This is actually a fix for another commit in 6.11.  Hans, Ilpo, can you please
> take it in fixes?
> 
> Fixes: 426463d94d45d ("platform/x86/amd/pmc: Send OS_HINT command for new AMD
> platform")

For that, a proper justification is necessary in the commit message (but 
I guess Shyam was going to improve that too while respinning given the 
other replies).

-- 
 i.

> > ---
> >   drivers/platform/x86/amd/pmc/pmc.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/amd/pmc/pmc.c
> > b/drivers/platform/x86/amd/pmc/pmc.c
> > index c3e51f0a5c33..bbb8edb62e00 100644
> > --- a/drivers/platform/x86/amd/pmc/pmc.c
> > +++ b/drivers/platform/x86/amd/pmc/pmc.c
> > @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> >   		dev->smu_msg = 0x538;
> >   		break;
> >   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >   		dev->num_ips = 22;
> >   		dev->s2d_msg_id = 0xDE;
> >   		dev->smu_msg = 0x938;
> > @@ -597,6 +598,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev
> > *pdev, struct device *dev,
> >   		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
> >   		break;
> >   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >   		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
> >   		break;
> >   	default:
> > @@ -630,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev
> > *dev)
> >   	case AMD_CPU_ID_CB:
> >   	case AMD_CPU_ID_PS:
> >   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >   		return true;
> >   	default:
> >   		return false;
> 
