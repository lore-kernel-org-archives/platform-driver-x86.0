Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE3388E63;
	Thu, 26 Mar 2026 11:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523117; cv=none; b=QOFwtgCEuBLanVjplsjyrmzAoLzMky/86hqCf6kIBEff/mTBppa2MBH88ZNhxcyOo+fVw6X6zycuR6BO55HHW+p+ul2TCLd4ue7F/eSYGpEHowXkalzvjWcV4qM0RyVjVcvmkFBlB7sWgG8iVB0vfRsBggNe6QwyzoTAHE5xG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523117; c=relaxed/simple;
	bh=U0bfPeGen/0jW8wD+ZW81L8NtPL1w6k/gWrwcbwZuHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKFw5rUSfFG9i+PRjqVAu+XF+dNNJa92PysHih1RPKXgZDAbzPDko4YfElRMElYNhFlL5muxxndQgh2kHhf39trTZsbCXfLm0FY+nds30lsKi0+eJUWjwnFPo6cl1AVMFazgTewXDtuI0VoVbXXge3O+/7grujLlUmIZf+cXIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqFw4iwT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqFw4iwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774523116; x=1806059116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U0bfPeGen/0jW8wD+ZW81L8NtPL1w6k/gWrwcbwZuHg=;
  b=QqFw4iwTb9AcqZ3I4dB9oLhzhkdV191T77fOmIeSFJW0vVDV6l8jO/7q
   2NPEv3oIrJdcjE8Fv2wQyk0azV/jQexelkg8TyTW9e6ytPuvvl3lRsV0n
   t6IVXvRCrVNRhYFkl8F4in9llbYDTpmNXwv8PzU2nAZqM7Z6uau/jupa6
   UwGfbOPZUvqw6iIXBjCspjVlzX2FwGO/11f+TMrP5Crpw9US8IKQ+x1ps
   vWcw1XOmsjB2pi4xulM3lfF4rjLR0y2BqIkpjLE8pDDjlO3dieZ7uEAfG
   ZM7D6+m3E7pXjksriDtc+9O2EvfAv7lmr1u+da7u5FwHrHswh92Vo7fsu
   g==;
X-CSE-ConnectionGUID: Mn3QLrFNST6jZwG3qYFlPw==
X-CSE-MsgGUID: B142usXKSxOedBTarDauww==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74759316"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="74759316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 04:05:15 -0700
X-CSE-ConnectionGUID: XMeasyj9Q2CsHuzuKR2zAw==
X-CSE-MsgGUID: ipvh6234SoWpr7ecxRhqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225232752"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 04:05:13 -0700
Date: Thu, 26 Mar 2026 13:05:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe LED)
Message-ID: <acUS5m6hj7-uuhFz@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <cover.1774477895.git.mnencia@kcore.it>
 <1834b9729482d629c1d2d28443b88323cbae2764.1774477895.git.mnencia@kcore.it>
 <acUQq8IoQWIXOyPE@ashevche-desk.local>
 <acURKA_4Y00HQVJw@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acURKA_4Y00HQVJw@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 26, 2026 at 12:57:49PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 26, 2026 at 12:55:43PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 25, 2026 at 11:38:23PM +0100, Marco Nenciarini wrote:

...

> > >  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> > > -			ret = skl_int3472_register_led(int3472, gpio);
> > > +			ret = skl_int3472_register_led(int3472, gpio,
> > > +						       INT3472_LED_TYPE_PRIVACY);
> > 
> > Split this conversion to yet another separate change. At the end of the day
> > you should have something like this:
> > 
> > Patch 1: rename pled --> led
> > Patch 2: Use local led variable instead of dereferencing (as Ilpo asked for)
> > Patch 3: introduce led type and update API to use it
> > Patch 4: add IR flood support
> > 
> > > +			if (ret)
> > > +				err_msg = "Failed to register LED\n";
> > 
> > Move this now to the callee which may add a name/con_id of the led to the error
> > message.
> 
> With the above proposed split to the patches, this comment should be addressed
> already in patch 3.

Hmm... Looking into the current implementation, it's harder achieve than say.
So, then just

				err_msg = "Failed to register privacy LED\n";

...

Also consider using a separate data structure to list the map between type and
name (con_id)

static const char * const led_con_ids[] = {
	[INT3472_LED_TYPE_PRIVACY] = "privacy",
};

it will allow to get rid of switch-case.

-- 
With Best Regards,
Andy Shevchenko


