Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A8A4534A0;
	Tue, 20 Jan 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922010; cv=none; b=oS6Ug+TyHJMDch7V751roN10GiAYahOwfUpl2LAe8vonR3NLiu//pnFD1uOf9yl8To9H6zTIqrWMEV+CAL/51O1ZesL4rZDo2tW7CAOQ4nOVzGY5a2mavS4ASpGAOGLqWo5WAVLS/KfvgW0Mi8y9bvq2dubWLfTIAxrvQqpxTNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922010; c=relaxed/simple;
	bh=huV6Tf4eMf6oOy9brbDQ/XceSGiG+k/jFw8+8W0PuZ0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=efSgnaxSBUnR0wKq2Zw1EfF8f0emseJULpoEQ2SwwNtilOhF9LltSFEYkeZRc2Zp/kj1jeYBaoclxaX8Np/nh+NenbwGC7ehHvGuzqOg88y9F75QKodfv4Q8MQ0wWhilNt4iFb6oQ239JGLbkzcqOtYnD1hcz22e97RofHSHdMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZ7rA4vL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZ7rA4vL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922009; x=1800458009;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=huV6Tf4eMf6oOy9brbDQ/XceSGiG+k/jFw8+8W0PuZ0=;
  b=nZ7rA4vL3fzHz3xaetZX/Fdi8dRZPGjMVbHOzl7bny0LrQ06YT2Q13ak
   J8lopiwujTQmmJwMkj3JSIlJYeGQ80KlEf70zcRwvnfC8zC9XCWFDSLRJ
   9X0HWTOaYZGAPrsadEVqaB+dHveL5s0l88y6D0MEsIEB5HOLJHIGOstw6
   XQa4gJqQyCSAe7D776Nu9uUxukZSN3Uuzlcp6/PO6sObyrS9L36jcKsaS
   uRJYGwh5WGYMhDvLvJmkbg8JadsksHtEC0qsyFNGx/fdhjgr5pqW2eKus
   Dfy4zevsUN4jf1b/Qmbl+RUT/+jXNpboUv7GN1uO2/tYQxTEPT3isb7zd
   Q==;
X-CSE-ConnectionGUID: ighA5r0/Ta6dN0CSj0nmhA==
X-CSE-MsgGUID: FlyRwTB+QvSKbL+WVjJd9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69865590"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69865590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:13:28 -0800
X-CSE-ConnectionGUID: GBjQnoDfRDSpUYL6QafQRA==
X-CSE-MsgGUID: ys6saEUnTGSOOJmC4PczaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210612826"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:13:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Jan 2026 17:13:22 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: pranaypawarofficial@gmail.com, jlee@suse.com, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: acer-wmi: Extend support for Acer
 Nitro AN515-58
In-Reply-To: <2eb1b234-99cd-449d-88d5-623c108e2ce4@gmx.de>
Message-ID: <41f1d093-21eb-7621-96eb-1b51f8b62541@linux.intel.com>
References: <20260108164716.14376-1-W_Armin@gmx.de> <2eb1b234-99cd-449d-88d5-623c108e2ce4@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Jan 2026, Armin Wolf wrote:

> Am 08.01.26 um 17:45 schrieb Armin Wolf:
> 
> > The Acer Nitro AN515-58 additionally supports fan control. Modify
> > the quirk list to enable said feature on this machine.
> 
> Any updates on this?

Hi,

I'm sorry, I thought I had applied this (and it was marked as accepted in 
patchwork as well as a result) but apparently hadn't. Thanks for the 
reminder.

Now it's in the review-ilpo-fixes branch.

-- 
 i.

