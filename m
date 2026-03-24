Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B15274FE8
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357212; cv=none; b=dRr6N03E8QQeMbD1Y/+0hceXyqVYUYa+d8iHCEJoDY7m6WQ90LiwyTbpCbeFms3RSasbMJA43u0VE8RVU5FKEYPrpf68IrVDXbEJcUSqZxf8Ih/bW2RcJ/FrdW6TMsFaZwXblp654jmxJ5tXVbeynuXJBndLOXp1u5YkPWLm2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357212; c=relaxed/simple;
	bh=7I+Up6/IdQhix0UhYAHcw3zr7DCjt4yX6O6fDqh8vKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYee/Pf2Lk+5mxYpYHxRQKAlTVOeqSv3aHAabg3fLzgF9ygZHd9A+BZ1QrTOBYkAUnKNmfMOI1Dn0x6EJXhSZ4eXx1V2UrhlMhxo9tU9XjRge3vBXM9n4+mjm1M2hTf9prwcbVobMAlqXlTgHXnmj0CLv97KmCXx7YtROJhfjNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyHCA2de; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyHCA2de"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774357211; x=1805893211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7I+Up6/IdQhix0UhYAHcw3zr7DCjt4yX6O6fDqh8vKo=;
  b=KyHCA2de89E5C4yZoBN63mwliZHp7xF2uF121lzmMvdzBS39aGQN0I66
   ntrLORs99/11lKsMnPF1DEj3d6zjfF9TANhEWFSgLb3cWkoBCN2DqXCzi
   9WJ3tvio6GW4IaF6p9/O7SuHAbxAdrjuLfOQ0W4pdYyQiy0hOo0xoPzcd
   IZi2j3Bg1DjPzxkPId17u0tMUneUXPTcRw9xcvlT9KouT5/LDf//j069i
   jMmDsCJGTqNiGptNV6izFqUzLyTaa3/nNS+xb9C0n2iRw3JevXRMyPk3I
   kBrUIHLqrgSPo5yhjc/gn+7cL8CvIzZfuuvtvwU2EXgg863uoS8FtHDSB
   Q==;
X-CSE-ConnectionGUID: VwQs73/oTg+pwTCPQwlruw==
X-CSE-MsgGUID: ty0q1FSMRLmYyiy+kxkrdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74392946"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74392946"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:00:10 -0700
X-CSE-ConnectionGUID: iPFtIwSZRj+YF5nVS3/SMg==
X-CSE-MsgGUID: 9qmjHSeVRnqEPfx1eOgQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223560943"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:00:08 -0700
Date: Tue, 24 Mar 2026 15:00:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: platform-driver-x86@vger.kernel.org, dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com, hdegoede@redhat.com, andy@kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Handle GPIO type 0x02 (strobe)
 as IR  flood LED
Message-ID: <acKK1jx716lXQ0II@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260323213535.1410678-1-mnencia@kcore.it>
 <acKJ5W12MFgZWPew@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKJ5W12MFgZWPew@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 02:56:09PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 10:35:35PM +0100, Marco Nenciarini wrote:

...

> So, this one
> 
> > +int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> > +			    struct gpio_desc *gpio, const char *led_name,
> > +			    const char *lookup_con_id)
> 
> Becomes first
> 
> int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> 			    struct gpio_desc *gpio, const char *con_id)
> 
> followed by
> 
> int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> 			    struct gpio_desc *gpio, const char *con_id,
> 			    bool add_lookup)

Alternatively we may pass a enum of led type...

...

> > -	int3472->pled.lookup.provider = int3472->pled.name;
> > -	int3472->pled.lookup.dev_id = int3472->sensor_name;
> > -	int3472->pled.lookup.con_id = "privacy";
> > -	led_add_lookup(&int3472->pled.lookup);
> > +	if (lookup_con_id) {
> > +		int3472->pled.lookup.provider = int3472->pled.name;
> > +		int3472->pled.lookup.dev_id = int3472->sensor_name;
> > +		int3472->pled.lookup.con_id = lookup_con_id;
> > +		led_add_lookup(&int3472->pled.lookup);
> > +	}
> >  
> >  	return 0;
> 
> And this
> 
> 	if (!add_lookup)
> 		return 0;
> 
> 	int3472->pled.lookup.provider = int3472->pled.name;
> 	int3472->pled.lookup.dev_id = int3472->sensor_name;
> 	int3472->pled.lookup.con_id = con_id;
> 	led_add_lookup(&int3472->pled.lookup);
> 
> 	return 0;

and use switch-case here

	switch (led_type) {
	case _PRIVACY:
		...add lookup...
		break;
	case _IR:
		// do nothing;
		break;
	default:
		break;
	}

-- 
With Best Regards,
Andy Shevchenko


