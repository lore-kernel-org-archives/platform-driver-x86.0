Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC533F58D;
	Wed,  9 Sep 2026 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967169; cv=none; b=pki4ZO9l5BuB6bhF9/dkIfZdCtEPy+V0id7D2bUNdlQb3Efkkd9fzG6tloeiiGVPMO3x4+gJftnlraBMwZlErvBBzop60jHAzuC1BK0uQd5TwZPHTUY04+Qp+Dq2B5Ou79doPnOckebfRX5LT9yvKb94sDUwhjpG08ffwD3ZcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967169; c=relaxed/simple;
	bh=0mgrh78PgG7TwlNmjLhHCstIhvbN8+glVlBQXojHU5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TK72jecPBUqk/97UEro4NJK62ccEuCEDClpGibQWg0/+tHALCUCOGliR3/QNpdLL6oK1JPo4Ex8sIbsRDid34ZwrhtBeXO8AZUh/q3yT6Mp8UF+a7sHsv1LYFBwLWg0nWcsh/mcr8pD5vrdNOygNbhbczoVhIgvYnQ1Kfcc/WnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTrtVNkx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTrtVNkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788967168; x=1820503168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0mgrh78PgG7TwlNmjLhHCstIhvbN8+glVlBQXojHU5E=;
  b=KTrtVNkx5QzaoZJH6F3of74f91NdY94FvnkBvi43sFidzkv4wrirtmlf
   KdD0h0lcrVyCMSkFiUIdACMZiw7IC0CGbwREx1t5zFCcU0ju22DED4H3G
   h3iu13qvLej72sQEmTQqfZemQtH02Cp8Z0APQ5V23SO9Zbc1ty10rAYeK
   hDSY3VpZTy5b68TBfnkkRGarq6XBkddvwC4a4UYkBmWrnNggq7TM8QTgz
   x3F4X2D/2SSPNO/Ayw62zpQ+h318hnZou2mizgJMIlDupw4vZ2Bn4A//p
   1/FKKwpbtCXmoeNXhE/Abyc/BkhZEbGFbKLsVAzeeZlhuArlaliuj/np5
   g==;
X-CSE-ConnectionGUID: SPZSu7tSTj6s/+rAKvWe5g==
X-CSE-MsgGUID: peK9s1jyTD+Syu5SQWeReA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93089175"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93089175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:19:27 -0700
X-CSE-ConnectionGUID: g73Yf+ncQSeV+JkYCy8oxw==
X-CSE-MsgGUID: xXSRtAjCRySPPrNcTock2g==
X-ExtLoop1: 1
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.132])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:19:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 601F4121BE3;
	Wed, 09 Sep 2026 18:19:26 +0300 (EEST)
Date: Wed, 9 Sep 2026 18:19:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: "D. Manresa" <dmanresa@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thierry Chatard <tchatard@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource
 conflict quirk
Message-ID: <aqF4_jwcqT2UFsNc@kekkonen.localdomain>
References: <20260831160754.9857-2-tchatard@gmail.com>
 <20260908161629.335223-1-dmanresa@gmail.com>
 <aqDkwTkAsvs8Escx@ashevche-desk.local>
 <20260909065104.15817-1-dmanresa@gmail.com>
 <20260909151027.GA2133376@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909151027.GA2133376@google.com>

Hi Lee,

On Wed, Sep 09, 2026 at 04:10:27PM +0100, Lee Jones wrote:
> On Wed, 09 Sep 2026, D. Manresa wrote:
> 
> > On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> > > Do not fold, just add into the series this one as patch 2, for example.
> > 
> > Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
> > Reviewed-by; no need to change anything else.
> 
> Why can't I just apply it?

There are no direct dependencies to the rest. For the functionality, it
might be nice to merge it via one tree and the rest of the set would go in
via the media tree.

In case you prefer to merge the patch,

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
