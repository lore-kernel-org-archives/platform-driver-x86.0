Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9D4265606;
	Thu, 26 Mar 2026 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522672; cv=none; b=anF21IqMowuO6z6EEaVa5AT1VIFI/rhxKsAQu83VRp7kAH8Kxv0fs+POY7hnP7K/nCZbmVRX3YE5A9wr/zVW6/XHQh401YeRhSBlcCJJSDH3q+9vrx2s6JjMJU+q+k/xs4dyWnOvmM7LScUVwl4PH89RwGutBDA1c7OPrfz+KCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522672; c=relaxed/simple;
	bh=vFPwNYewh9KX40m3BeD89KhAig1AjZfjGj7kJqie2Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjxXPdktHCRMtJ6BwS6skGkMOFwaj2aeIxwdpOSOCKIcu2JA1kn/ytT228+9g765Rxl9QdTpgVbqmA4PiEG0A5DdjwKBB352/b8bDSrtZhi9RSxPy1p3zj/eIQ9KH1Cy93c1aOksJ+Z9b2Oh9tyzB9QyuGQPPaeNESVhnK2jBuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHBa4igk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHBa4igk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774522671; x=1806058671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vFPwNYewh9KX40m3BeD89KhAig1AjZfjGj7kJqie2Ys=;
  b=dHBa4igkgQN4iTPT0aMl3MJOwcYdU7XlBFjPu4s/VPWJRrScJH08SFCj
   5/YoW7p62fjtsoLrp/OTuL0rsLHTD4aEOpygHvEzrNPOE2XppiZvQEm9t
   urUw5SlnTLFqh+0Tq0Won+83RG9NHrge2smQk3ZK0TbGcAhLHe3MZioIv
   oWO7GBB87ue4RCdxtijJ+hsPUM2zfsdLfnVwkPs70z30O3oRgBDI9xJDT
   Y66YqmdDltZFBSw7Ui5HwSLpSTeU8l6feI7Qh4GlbcU1o7CO16K1m9uMp
   /ewvYimpJVhhiiGuwXoXkQu04Q8tDWOJEVpOHiTrRlomtuMznuSq7yCqK
   A==;
X-CSE-ConnectionGUID: APoFGfLUSe6+9j+XOSi/qg==
X-CSE-MsgGUID: KUux576UQJmShumcrOmbVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74758826"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="74758826"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:57:50 -0700
X-CSE-ConnectionGUID: nxJmcR2GRymOyK2055Qdkg==
X-CSE-MsgGUID: 7w8FUhDcQValwoLEP3FBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225229904"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:57:47 -0700
Date: Thu, 26 Mar 2026 12:57:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe LED)
Message-ID: <acURKA_4Y00HQVJw@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <cover.1774477895.git.mnencia@kcore.it>
 <1834b9729482d629c1d2d28443b88323cbae2764.1774477895.git.mnencia@kcore.it>
 <acUQq8IoQWIXOyPE@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acUQq8IoQWIXOyPE@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 26, 2026 at 12:55:43PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 25, 2026 at 11:38:23PM +0100, Marco Nenciarini wrote:

...

> >  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> > -			ret = skl_int3472_register_led(int3472, gpio);
> > +			ret = skl_int3472_register_led(int3472, gpio,
> > +						       INT3472_LED_TYPE_PRIVACY);
> 
> Split this conversion to yet another separate change. At the end of the day
> you should have something like this:
> 
> Patch 1: rename pled --> led
> Patch 2: Use local led variable instead of dereferencing (as Ilpo asked for)
> Patch 3: introduce led type and update API to use it
> Patch 4: add IR flood support
> 
> > +			if (ret)
> > +				err_msg = "Failed to register LED\n";
> 
> Move this now to the callee which may add a name/con_id of the led to the error
> message.

With the above proposed split to the patches, this comment should be addressed
already in patch 3.

-- 
With Best Regards,
Andy Shevchenko


