Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8061E5B63
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924425; cv=none; b=sIcQDnYCwJhflFmvVpMEdqkjS0cxdMH1gktXSFeK8mqaGwLufQ5ACRn/gEGlF9+jP0pCsgC7DnZMYYlzXCnFLemtEuivP3dNHlb8P9aZJHjn30aOVo70yzHnbpwA4n564EyEInnt9NH82Yga9ltjiAa6raKAj/IR9z3UKMm2o+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924425; c=relaxed/simple;
	bh=O0PA8LGdg958ONG7eWelBTVlky15N/RL40XSftVgN1Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tJw5LcfWaI38lyJygQTiJdLarn8gaORY/Idg4ts8dk27IE48j+L6pBX7B48UlHdAdzikoODDGJi/kYyRX00tjLFXocNzp4/kf7n9QP/qBtT2EnEYnzr8ZWYbNj9xjLuLkbWNrBnzUrv5Ib/J3TXCShItEo3ox4AhFKnC/UAZj9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZLbL0Ay; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZLbL0Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780924423; x=1812460423;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=O0PA8LGdg958ONG7eWelBTVlky15N/RL40XSftVgN1Q=;
  b=KZLbL0AyMw30OGSk27c6k5/QJ6HKhy+hHwHS0hoGITeGQ5DRgv/WrUD3
   JMdWaXIhA1zGd5+8SwgPzw8avnfDacGNTRrSmsSl5bP3jryvArGlzRapQ
   ZCPjWmsz3yPXFXkL7a1jS3ls+7ZAduqlumL8xtkRkqhCWrO7w80MG4jVD
   fUVfbP+t2Mztj4dD0d3GVjRNU+qk2qdMTSHXQYgWEIZ9yMRSdidjIus2+
   iTd+hGiVz0W9Ub5muCHeJXVbzsYftS4YQ1vdQHJY1Exjys5LErQakhRSX
   MM+DvxvfZgeL6HjVKpULXdFd+qUeT/sHOgxVdT9LE/JyKzj2JuAi1U4OS
   w==;
X-CSE-ConnectionGUID: mlkIcuVTRvKp4flDFOwnvw==
X-CSE-MsgGUID: g7JL5lJWQVyZXGD6s6TpIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="99068636"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="99068636"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:13:42 -0700
X-CSE-ConnectionGUID: /7q9Lc9iSm6Z5lk/hEYgJg==
X-CSE-MsgGUID: IDv1SCjfSaafgGywPu9C2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="250469957"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:13:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 16:13:37 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com, 
    Sanket.Goswami@amd.com
Subject: Re: [PATCH v6 3/8] platform/x86/amd/pmf: Add feature discovery
 support to util interface
In-Reply-To: <90038882-254f-4507-ae85-867fafe295d2@kernel.org>
Message-ID: <639d2950-ad0c-801b-ca0b-4cb8966f3133@linux.intel.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com> <20260527140205.4073335-4-Shyam-sundar.S-k@amd.com> <90038882-254f-4507-ae85-867fafe295d2@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jun 2026, Hans de Goede wrote:
> On 27-May-26 4:02 PM, Shyam Sundar S K wrote:
> > Add feature discovery capability to the util layer interface, allowing
> > userspace tools to query which PMF features are supported and enabled
> > on the current platform.
> > 
> > The following features can now be queried through the
> > /dev/amdpmf_interface ioctl:
> > *  Auto Mode: Automatic power profile switching based on system activity
> > *  Static Power Slider: User-selectable power profiles
> > *  Policy Builder (Smart PC): Action based policy management
> > *  Dynamic Power Slider AC: Adaptive power profiles when on AC power
> > *  Dynamic Power Slider DC: Adaptive power profiles when on battery
> > 
> > Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > ---
> >  include/uapi/linux/amd-pmf.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> > index d29a4abe1145..9de054cfeee7 100644
> > --- a/include/uapi/linux/amd-pmf.h
> > +++ b/include/uapi/linux/amd-pmf.h
> > @@ -14,6 +14,7 @@
> >  #ifndef _UAPI_LINUX_AMD_PMF_H
> >  #define _UAPI_LINUX_AMD_PMF_H
> >  
> > +#include <linux/bits.h>
> >  #include <linux/ioctl.h>
> >  #include <linux/types.h>
> >  
> > @@ -34,9 +35,19 @@
> >  
> >  #define AMD_PMF_BIOS_PARAMS_MAX		10
> >  
> > +/* AMD PMF feature flags - bitmask indicating supported features */
> > +#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
> > +#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
> > +#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
> > +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
> > +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
> > +
> >  struct amd_pmf_info {
> >  	__u64 size;
> >  
> > +	/* Feature info */
> > +	__u32 features_supported;
> > +
> >  	/* Power and state info */
> >  	__u32 platform_type;
> >  	__u32 power_source;
> 
> You are now changing the userspace ABI between patch 1 and
> this patch. Please just squash this patch into patch 1.

I asked to only create the interface towards the end of the series so 
there is no real problem from the ordering.

-- 
 i.

