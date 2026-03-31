Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8433B3DDDD0;
	Tue, 31 Mar 2026 21:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774992505; cv=none; b=YBovLUGdy0JCMLaX5KT7Ze3pO6mBweM209COFw/IkXgUewSTtwcLTnB7hAFoQy2329eNFkWYvX0hI93AhwOYDNojkKWU+ShvpktWPKbxdtoG7Aqh2gjS+U4uNAUGawSyBcIhgclW6ba6KnfWECCknFTRa8A7OGH4HDwbpJQVsJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774992505; c=relaxed/simple;
	bh=zsjE4hp5jU5bOTfiMkVhXXiqDBseYLZgA9VTss7idLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAP8tcvCFGnu5AMoEllMNyMtTbKBK4sw/fb+UKQrKbNbU1GStZkkzZUc/fJnwkXrzCouLMmrfQ8Sqk9HSoXYSysfqcg+Mm/PgdNjQfUxkgTcvOGlo9tgsEcXg32mQyx9LexEOsB6s6IcuRQySdb1XlKNUAjVl7Lf0O/k6G7LVtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CY7527Xq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CY7527Xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774992503; x=1806528503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zsjE4hp5jU5bOTfiMkVhXXiqDBseYLZgA9VTss7idLM=;
  b=CY7527XqrUCdQ7iDakG9kR3teF0uOrVYriLAQjv5eVDgNotbw1+jO/GW
   r/YOjU3DNT+/t188nrV8pVgpzPnn7dJ+6xcYT+YkaGjk4PhPiTc3SmmfW
   AdDQH0vgDxU2vDv1NvlUlmSFjlrNIvNupY5QJXMcrLv9XU/ZK2Kosu7Ej
   8rEDBbirmteWZMh1fe7cHdKLBZplRN9Eab/jySMMrzefWX4O5zUPltZOa
   UeU4NdCpn3rtlP2S+75SotnVd96xulHf1puU13HQfI14Sby81pTuY12rZ
   oe5mtPT/2GxaRtKqNlOPoCMLHxwDTJ7QyCePpnGRvx8GPubrDUKmF4T1N
   A==;
X-CSE-ConnectionGUID: A+DVVd1kRC2LpYdH0bWltw==
X-CSE-MsgGUID: /IcIyR5FRrGfmNrsd07Umw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75193081"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75193081"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:28:23 -0700
X-CSE-ConnectionGUID: fe7GyusjRBmqxstZlp7OpA==
X-CSE-MsgGUID: DRgoiAuyTiSXoGWFDU50jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223176401"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.81])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:28:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A203C120213;
	Wed, 01 Apr 2026 00:28:28 +0300 (EEST)
Date: Wed, 1 Apr 2026 00:28:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: johannes.goede@oss.qualcomm.com
Cc: Marco Nenciarini <mnencia@kcore.it>, djrscally@gmail.com,
	ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
Message-ID: <acw8fB6-s3pDYCSH@kekkonen.localdomain>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>
 <acqO62_87TM4UZMI@spark.kcore.it>
 <06317144-d652-466a-86e9-da2569a1acf6@oss.qualcomm.com>
 <acrbTBh8KsHmtJN5@kekkonen.localdomain>
 <55510bea-30ff-45f2-b4c7-4a191ff214a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55510bea-30ff-45f2-b4c7-4a191ff214a1@oss.qualcomm.com>

Hi Hans,

On Tue, Mar 31, 2026 at 12:15:55PM +0200, johannes.goede@oss.qualcomm.com wrote:
> Hi Sakari,
> 
> On 30-Mar-26 22:21, Sakari Ailus wrote:
> > Hi Hans, Marco,
> > 
> > On Mon, Mar 30, 2026 at 05:12:21PM +0200, johannes.goede@oss.qualcomm.com wrote:
> >> Hi,
> >>
> >> On 30-Mar-26 16:55, Marco Nenciarini wrote:
> >>> Hi Hans,
> >>>
> >>> Thank you for the detailed feedback.
> >>>
> >>>> My main remark on the current patch set is that IMHO
> >>>> the LED name really should be: OVTIxxxx:00::ir_flood_led
> >>>> since that is what it actually does, strobe is typically
> >>>> related to flash LEDs which despite the naming in Intel's
> >>>> side this is not.
> >>>
> >>> The series actually started with "ir_flood" in v1-v2. It was renamed to
> >>> "strobe" in v3 to match the GPIO type name used in Intel's ACPI _DSM
> >>> tables. But I agree with you that the userspace-visible LED name should
> >>> describe what the hardware actually does, not mirror an internal ACPI
> >>> label. I am happy to go back to "ir_flood" for the LED name.
> >>>
> >>> We could keep INT3472_GPIO_TYPE_STROBE for the define (matching the ACPI
> >>> type value) but pass "ir_flood" as the con_id to the LED registration,
> >>> so userspace sees OVTIxxxx:00::ir_flood_led. Would that work for
> >>> everyone?
> >>
> >> That sounds good to me.
> > 
> > Seems reasonable.
> > 
> >>
> >>>> We really need to get some input from the V4L2 maintainers
> >>>> here on if this is a good idea, before merging this series.
> >>>
> >>> Agreed.
> >>>
> >>>> I can even imagine
> >>>> a default simple mode where the v4l2-core just turns
> >>>> on the LED when streaming starts and off again when
> >>>> streaming stops (very much like the privacy LED) and
> >>>> then in the future maybe we can extend this, e.g.
> >>>> add a control on the sensor device to make this
> >>>> configurable ?
> >>>
> >>> That makes a lot of sense. The current series intentionally keeps things
> >>> minimal (just exposing the LED under /sys/class/leds with no V4L2
> >>> integration), but this future direction sounds right.
> >>>
> >>> I will hold off on sending v6 until we have agreement on the naming and
> >>> Sakari has had a chance to weigh in.
> >>
> >> Ack, lets wait for input from Sakari here.
> > 
> > I wonder if there would be any deterministic ways to find the LED device
> > based on the sensor. It'd probably require more information via MC / V4L2
> > controls to allow that.
> 
> Yes, the int3472 code adds a LED lookup table entry with the consumer-
> device being the sensor.
> 
> So just like v4l2-subdev.c currently does:
> 
> 	sd->privacy_led = led_get(sd->dev, "privacy");
> 
> it will also be able to do:
> 
> 	sd->privacy_led = led_get(sd->dev, "ir_flood");
> 
> > Alternatively we could use a boolean control for this, but I think I'd
> > avoid adding that now and rely on LED API instead.
> > 
> > Are there use cases for this LED, apart from Windows Hello? :-)
> 
> As mentioned for now we could just treat it exactly the same
> as the privacy LED and simply turn it on while streaming
> inside the v4l2-core / v4l2-subdev code.
> 
> This would nicely cover the face ID use-case for which
> Linux implementations exist to.
> 
> And then later of some other use-case comes up we could
> make this a menu-control with on/off/auto values, defaulting
> to auto which would preserve the turn it on while streaming
> behavior.
> 
> We do need to come up with something here, since use-cases
> like Howdy (Linux face-id) will need it. My vote goes to
> give it the same treatment as the privacy LED in the v4l2-core
> for now making things "just work".
> 
> Alternatively we could document that userspace needs to
> find the LED and turn it on itself through the LED classdev
> but that will be painful for userspace to do for various
> reasons including classdev access requiring root rights.

That was actually my concern as well.

Still, if we bind this to the privacy LED now and the LED will effectively
be powered whenever the camera is streaming, we can't drop that interaction
in the future as doing so would break existing users. I'm not sure if there
would ever be a need though.

Either way, I'm starting to feel the V4L2 control might actually be the
best way to go from here.

-- 
Kind regards,

Sakari Ailus
