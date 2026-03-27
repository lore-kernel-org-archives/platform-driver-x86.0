Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E483DCDB8;
	Fri, 27 Mar 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607749; cv=none; b=AKyAQwSOSu/mVjkO7An4zE/gGvcoVWaRZx/WuyJ8Pm5GrDP5hY766e8NVTYRt5haBOcX0n0suTwLf86QfpFO8UZSLq9VwpviVflkrn4e/2z6uptEkquV9sc36vI3xFqDocuCE4uEsO8BepcVogy53+0Ea3aXhQ7sBM4aCaa/gms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607749; c=relaxed/simple;
	bh=Y7zAhJq2I+Uq67QM7jLJj+47I8WA1IzN3vhemfiCvSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOovHPW8x0O+ovUeVV1vqJpvWTQaMICBopLxrNKln8ihAOhHcS63oeg+L1r8YrN9XcEQ80Z96DcHbxvj1DVs9XH3RcEdJsRPtIM2VXYmMaP+8O1c/wilVa+5wuIn8c4a+9hOyvF/3AEBCm45OQDU6YLNi7q68z0r0hSzRuGAKlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2IS9ee5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2IS9ee5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774607746; x=1806143746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y7zAhJq2I+Uq67QM7jLJj+47I8WA1IzN3vhemfiCvSk=;
  b=k2IS9ee5SEtJlKCCZfE2gFHYEag4A8+DHunbUrkViVFSsQJxuRCtm2Jd
   4SNEaxNymLwn6lCzOm7jbp4e5RN/HUzUHbDbSQS19zCXlgvOSkVddIDQS
   z9zc7HnC856N9dchg5TbBVR+CAa3LgbnJ/r098A/2WtmM8bHszJRcroyg
   68ChBtYsI3/F09COrailKCMPeA2Yvmf9G7QivsHwohtobZEUngLSjLLht
   8K2KDhRnDms+Q9l7XMTUCZdw5mf63Wfs16UkwYcEV5XpJUe0PhOgZjPDp
   VppEtKZwIIQb47u7qU+fS4WFQ4WrJZnbTBd9BTL6HDWAsAHmc35agygON
   A==;
X-CSE-ConnectionGUID: 2/gKkXIERfOiHXjwuOeG1A==
X-CSE-MsgGUID: IX+eL3/QTMm3ugWviebarw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74861210"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74861210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:35:45 -0700
X-CSE-ConnectionGUID: C4u6W3jgT4+SAJbAFYGk7A==
X-CSE-MsgGUID: FQuKchIST92O/7RoSUjQYA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:35:43 -0700
Date: Fri, 27 Mar 2026 12:35:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] platform/x86: int3472: Rename pled to led in LED
 registration code
Message-ID: <acZdffxhSU-STQr4@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327090753.1481453-1-mnencia@kcore.it>
 <20260327090753.1481453-2-mnencia@kcore.it>
 <acZXD_xT_Yr2MEVR@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZXD_xT_Yr2MEVR@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 12:08:20PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 27, 2026 at 10:07:50AM +0100, Marco Nenciarini wrote:
> > Rename the privacy LED functions, struct type and member from
> > pled/int3472_pled/register_pled to led/int3472_led/register_led to
> > prepare for supporting additional LED types (e.g. strobe/IR flood).
> > 
> > No functional change.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Given the comment in the patch 2, please do not apply this (yet).

-- 
With Best Regards,
Andy Shevchenko


