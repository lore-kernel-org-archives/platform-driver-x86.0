Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9521EB5C2;
	Mon, 30 Mar 2026 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902090; cv=none; b=LOINs6Gzm2j6ATrdFiCacSWHA1jyQltO3PiHdjF/vU9akZVwBXoV/RzZXSJADiFfGu30A9AHFhxPeq0cGKB97Ed33I1SwJzsAbBgGS6MiRm96dV7TuXVhkF78IQQeaS5mRuOuByt8uw4yPfLwYKaDapLfR2M06M78qqtaiT7O+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902090; c=relaxed/simple;
	bh=6cyMhgHbPVHVLH34YjJpoJBVhfcEX9b/fy5iiPT1wB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dqs18n1t7AoepfNJqc4W+ev14Q5ulzRYQ9WXxW0y1/zJ2SAyfsocnLfotL6bmow/Kvp6q+uNEMpytRc+umb1hmT8YlbTHYkrXUsO7SE9jJG6rQklLnlFaMDGp8+HGKFX61ylAUUj22+J18WXIjIW3vN6Ch8qSaXUeM9zzNjECro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YL/f12wn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL/f12wn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774902089; x=1806438089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6cyMhgHbPVHVLH34YjJpoJBVhfcEX9b/fy5iiPT1wB0=;
  b=YL/f12wnaw5nDHizhHrTMrcqe1eTLvpdj1lenhg0gqZPKCAbhEBaIt4T
   fUPTjIP4mWdobJ7GTF0z+66dzTnojT2v7lC3J09Jl9M1n5mzlj3+JTRWd
   uVh2NGz2Z27NanodmCXzxeJVmF2vG45+l13cJ91YuqO7ZYHhFYiIW6DeU
   +iH2rxXg9OEkMGJKH760+hItqifstu6o4ToPWu5h5s4rWQAWcQkwM73Vw
   Hy+kRvZDxcJCNe/jIrJ3XAoDggLCCdrAJjthvYq5iqFvSFrrPFgOfFx56
   22X4iI+9Wibk9yLDjhupEyOQaAWFskeOwIapHJE5dQbAvL4jxYqhoMmlq
   g==;
X-CSE-ConnectionGUID: lfRbhmnXSF2McjelQJrRdg==
X-CSE-MsgGUID: VfFlfMfBQrWb6jsGJyCd/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75793097"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75793097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 13:21:28 -0700
X-CSE-ConnectionGUID: P3tOjAMMTPOd7/ZhoYTtvg==
X-CSE-MsgGUID: 7S3BVdcwTV+txAnSD0U3IQ==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 13:21:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CBB4D11FB01;
	Mon, 30 Mar 2026 23:21:32 +0300 (EEST)
Date: Mon, 30 Mar 2026 23:21:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: johannes.goede@oss.qualcomm.com
Cc: Marco Nenciarini <mnencia@kcore.it>, djrscally@gmail.com,
	ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
Message-ID: <acrbTBh8KsHmtJN5@kekkonen.localdomain>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>
 <acqO62_87TM4UZMI@spark.kcore.it>
 <06317144-d652-466a-86e9-da2569a1acf6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06317144-d652-466a-86e9-da2569a1acf6@oss.qualcomm.com>

Hi Hans, Marco,

On Mon, Mar 30, 2026 at 05:12:21PM +0200, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 30-Mar-26 16:55, Marco Nenciarini wrote:
> > Hi Hans,
> > 
> > Thank you for the detailed feedback.
> > 
> >> My main remark on the current patch set is that IMHO
> >> the LED name really should be: OVTIxxxx:00::ir_flood_led
> >> since that is what it actually does, strobe is typically
> >> related to flash LEDs which despite the naming in Intel's
> >> side this is not.
> > 
> > The series actually started with "ir_flood" in v1-v2. It was renamed to
> > "strobe" in v3 to match the GPIO type name used in Intel's ACPI _DSM
> > tables. But I agree with you that the userspace-visible LED name should
> > describe what the hardware actually does, not mirror an internal ACPI
> > label. I am happy to go back to "ir_flood" for the LED name.
> > 
> > We could keep INT3472_GPIO_TYPE_STROBE for the define (matching the ACPI
> > type value) but pass "ir_flood" as the con_id to the LED registration,
> > so userspace sees OVTIxxxx:00::ir_flood_led. Would that work for
> > everyone?
> 
> That sounds good to me.

Seems reasonable.

> 
> >> We really need to get some input from the V4L2 maintainers
> >> here on if this is a good idea, before merging this series.
> > 
> > Agreed.
> > 
> >> I can even imagine
> >> a default simple mode where the v4l2-core just turns
> >> on the LED when streaming starts and off again when
> >> streaming stops (very much like the privacy LED) and
> >> then in the future maybe we can extend this, e.g.
> >> add a control on the sensor device to make this
> >> configurable ?
> > 
> > That makes a lot of sense. The current series intentionally keeps things
> > minimal (just exposing the LED under /sys/class/leds with no V4L2
> > integration), but this future direction sounds right.
> > 
> > I will hold off on sending v6 until we have agreement on the naming and
> > Sakari has had a chance to weigh in.
> 
> Ack, lets wait for input from Sakari here.

I wonder if there would be any deterministic ways to find the LED device
based on the sensor. It'd probably require more information via MC / V4L2
controls to allow that.

Alternatively we could use a boolean control for this, but I think I'd
avoid adding that now and rely on LED API instead.

Are there use cases for this LED, apart from Windows Hello? :-)

-- 
Regards,

Sakari Ailus
