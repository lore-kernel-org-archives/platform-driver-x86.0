Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD572C15BE;
	Wed,  1 Apr 2026 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051803; cv=none; b=kCPnuoUq4lr82s8zJ1zBIi3c+uapR+bGOAnMwfo6aWVrcFOGw0tNEAhV5FAlW7fkgqMRY0o52Z/6zHMascT9s+LjZFXLS0hJ2FKI/WjX/QH1xy7KuzFl5k+lAwuXSOM4FTugeQGiWVJ+Hji12H3axp10Rvq705ng7mnpLC2QNyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051803; c=relaxed/simple;
	bh=tPHNGMHeTO/NPenrj5u9CdxjiacL02OT2nI1+jdD3mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBcrNmM9f4eiBnMfXiRfy1wzp/9CcDLhZRUoz63CeOgcnRxThgy7plp/cPmUQOfCv5Cz9Ute8nZsZUjgDKX27xvtUDzBkJyEvio1pW3UoLkIvNILtkfuXUhvq/8ximdpON8NC1fYW96HXK3ueLhwQZ7+AJ0lfmrmppfblKmwdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ix6b5Fq6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ix6b5Fq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775051801; x=1806587801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tPHNGMHeTO/NPenrj5u9CdxjiacL02OT2nI1+jdD3mA=;
  b=ix6b5Fq6UxURJmbCt+ep+xol+2PJs4a0bhQXQ58EB3XjAx3+Mzvzk/k7
   EQdc72Qvnhss1lnr7m36YI9B5NZqF6BPCRlbkApnYAOep36ZQsNlneoJQ
   y0fsZy3PMALj+XfcdkQfatsaeuINFz8MGii7PloP8GQtSUms6x9L7sPBu
   b0vQF/Z61Z91rl2MEDwEO7J4Y4lcVqXF9Ix2VZyoKQQKtARgvlJCqJxRj
   lLG6LlFczXO8JwwnvAzu3XmYoMH2Y1+AMdnX1ltS/JL6c9L4idYdW+OlB
   RpNxXYHdExWXl+voUu0mrgXL6T1csGwdg1nEc8x6KET1ZEyX7ZvvQhbFU
   A==;
X-CSE-ConnectionGUID: LuQxdQs5SiWXdrCJEl9KeQ==
X-CSE-MsgGUID: JMGhepKnRWu2VrunT/XK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87548304"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87548304"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 06:56:41 -0700
X-CSE-ConnectionGUID: zSGpAO/kSxG6bGyN06oYxw==
X-CSE-MsgGUID: Qb3NsJMLSEOAjxa4u+n3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="264610500"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.215])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 06:56:39 -0700
Date: Wed, 1 Apr 2026 16:56:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Marco Nenciarini <mnencia@kcore.it>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
Message-ID: <ac0kFP54V8S-nEX9@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-5-mnencia@kcore.it>
 <bc5c4cd6-e026-41d6-ad49-aeffb949f7fb@oss.qualcomm.com>
 <acuoEp_aH_su0q2H@ashevche-desk.local>
 <7dbd37c3-4a5e-4577-bff6-ed0826b489ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dbd37c3-4a5e-4577-bff6-ed0826b489ac@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 01, 2026 at 03:36:01PM +0200, Hans de Goede wrote:
> On 31-Mar-26 12:55, Andy Shevchenko wrote:
> > On Tue, Mar 31, 2026 at 12:36:28PM +0200, Hans de Goede wrote:
> >> On 31-Mar-26 09:52, Marco Nenciarini wrote:

...

> Why would we want to not register the lookup for the ir_flood
> case too ?
> 
> Elsewhere in the thread we're discussing actually controlling
> this LED from the v4l2-core which will require the lookup.
> 
> And if that does not materialize the lookup still does no harm.

TBH, I'm fine with either case. If you think it's better, than it will
even be simpler in the code!

-- 
With Best Regards,
Andy Shevchenko


