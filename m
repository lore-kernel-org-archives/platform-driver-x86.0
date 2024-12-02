Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286070800
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 18:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733165135; cv=none; b=ZGceZwn+LoJ+Zd1j3eIUyroyD6rolh5Vz+dDzYXSkfeUcX2rtuWJsr4UausEaU5UdqJSQkb28HiSSw8jRYbcZqjIJ81Cbfk4uqAwRV3y0f7BaHoG/gGUDU2xMXK4FfVIOHA6GFbGAA7yloB8jpc+hGdKJSHhOlMCXKcze053mu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733165135; c=relaxed/simple;
	bh=a28VHAXcB8s81BoSuGbCPfR6ZtQmZ/Jle00AX1M5Glo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7bQ7pA4L+740el9xb+EgsofG5hkD/1u4WouSTreSkI4MqoX9e7momYzGU3HW3Z/TJ96Htkhqa1ejOBEx/rIq695HW5J1RtSHtKgCuDyMdYdiQYBggVRygoBy+JZ+u4aaZS9wBc33RYr6wJGeIRLYo3X7mGDh5VyhKMa2ch7JOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: lRysA8LzTo+poVSUWQUkaA==
X-CSE-MsgGUID: u8/zVlnpQN2J/agESZ4gTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32700968"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="32700968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 10:45:33 -0800
X-CSE-ConnectionGUID: 1BKKAT5lSrG1s7AWUs3PTg==
X-CSE-MsgGUID: VBlTL/RcSrqepfxZTZntTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93364993"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 10:45:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tIBQH-00000003DnX-2opI;
	Mon, 02 Dec 2024 20:45:29 +0200
Date: Mon, 2 Dec 2024 20:45:29 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU
 ATLA 10 EC battery driver
Message-ID: <Z04ASf0znID9C1FN@smile.fi.intel.com>
References: <20241116121659.57487-1-hdegoede@redhat.com>
 <20241116121659.57487-2-hdegoede@redhat.com>
 <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 02, 2024 at 08:34:01PM +0200, Ilpo Järvinen wrote:
> On Sat, 16 Nov 2024, Hans de Goede wrote:

...

> > +struct atla10_ec_battery_state {
> > +	u8 status;			/* Using ACPI Battery spec status bits */
> > +	u8 capacity;			/* Percent */
> > +	__le16 charge_now_mAh;
> > +	__le16 voltage_now_mV;
> > +	__le16 current_now_mA;
> > +	__le16 charge_full_mAh;
> > +	__le16 temp;			/* centi degrees Celsius */
> > +} __packed;
> > +
> > +struct atla10_ec_battery_info {
> > +	__le16 charge_full_design_mAh;
> > +	__le16 voltage_now_mV;		/* Should be design voltage, but is not ? */
> > +	__le16 charge_full_design2_mAh;
> > +} __packed;
> 
> Both struct have only naturally aligned members. Why is __packed needed?

Wouldn't the second one give sizeof() == 8 rather than 6? Sorry, my memory
about this in C is always flaky.

-- 
With Best Regards,
Andy Shevchenko


