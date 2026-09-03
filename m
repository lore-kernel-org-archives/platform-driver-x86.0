Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36437DE89;
	Thu,  3 Sep 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423961; cv=none; b=h51RjuB0h/dtrFbIYJx6JvQGTlyIf4jXnF9vsN3FVZGcb/lWRjp3XRLYvp/I/q8HuUNAzxCZIHXI6LyuyaazWQ8f9FgThNzQ9zyFuv/dmOf3mDiLbXy9/r/TSRgRYI1i6lJusuSETZ2fp6tpslTOMwtmiIBM/MoIDC0E8FV5lA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423961; c=relaxed/simple;
	bh=lwseWgjthl2gy9SP7cv3gq2besePe1WyYm/8KxOG1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3Mu2uB2MXPtye8VZmPItq6cbWldS2xym3OS0darwIrjClagvJsm/QiaPC8O7tuXPC54aPrgC9px/qegq01p4fcbr3Zu8tENVD6NmEIdymxMAW1nXDy7Z+4yiElzAlOnKcTF5zoWA1iY693E/pgZyhwJmLQiJbSt3MtHccQ6GCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEP5JxgV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEP5JxgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788423959; x=1819959959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lwseWgjthl2gy9SP7cv3gq2besePe1WyYm/8KxOG1mg=;
  b=iEP5JxgVTMhLbeSk28NdWD8Y8QypqrpAiyKMzosXvLjSobcJ8i1v+wHB
   K4Ameey5/8yJiUGDywO0OT0TCFYd3M2qgTEYnUSljUKMQhwUA6+D1xk8O
   OMcMDJUupAaInRJdtaAgZcmwcEQA4FVRQPkStPiVC6OI7W2hvDjMkG5gb
   +pZy9934pA5xcfxc4pdBtjdezw12QrXS2+ONFNbP0l5waThh1Q5C1Yegz
   yfn8QDyfVvfHY7CcEM7nsTsEo19xufBUDlrYNSeuKOuOzULtG7hyxuPeo
   EDsZx68yr+4rYVR/2HvEvbp9WvqCjziDOm45zq8yQwPh3Akls1TSAJ3JI
   w==;
X-CSE-ConnectionGUID: yl0HvcMnQYqju1KAYJIrcQ==
X-CSE-MsgGUID: yUD5NlbWQba+q07Hh3+0JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100256728"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100256728"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 01:25:58 -0700
X-CSE-ConnectionGUID: rE7lp214SLyK02UUZq7rgw==
X-CSE-MsgGUID: 4uTB9FNSSjGaOExKKjHJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263472880"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 01:25:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1E90211F7F5;
	Thu, 03 Sep 2026 11:25:55 +0300 (EEST)
Date: Thu, 3 Sep 2026 11:25:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: German <germanpapulindez@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-media@vger.kernel.org
Subject: Re: [BUG] platform/x86: int3472/discrete: unknown GPIO type 0x08
 breaks OV13858 rear camera on Surface Pro 11/12 Business (INT3472:00 /
 OVTID858)
Message-ID: <apkvE9kbfEWHrAte@kekkonen.localdomain>
References: <20260903081557.16603-1-germanpapulindez@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903081557.16603-1-germanpapulindez@gmail.com>

Hi German,

On Thu, Sep 03, 2026 at 10:15:56AM +0200, German wrote:
> Hi,
> 
> On the Microsoft Surface Pro 11/12 Business (Intel Lunar Lake, IPU7),
> the rear camera sensor (ov13858, ACPI HID OVTID858) fails to probe.
> I've traced the root cause to int3472-discrete not recognizing one of
> the GPIO types described in the device's ACPI _DSM data, which leaves
> a power/reset-related GPIO unconfigured and the sensor unable to
> respond over I2C.
> 
> System
> ------
> - Surface Pro for Business 11th Edition with Intel (Intel Lunar Lake, IPU7)
> - Kernel: 7.2.2 (Arch Linux, vanilla)

It's usually best to test with linux-next, not with distro kernels, or in
this case, the media committers tree
<URL:https://gitlab.freedesktop.org/linux-media/media-committers> next
branch.

> - CONFIG_VIDEO_OV13858=m
> 
> Evidence
> --------
> 
>   $ dmesg | grep -iE "int3472|OVTID858"
>   [    5.555231] int3472-discrete INT3472:00: GPIO type 0x08 unknown; the sensor may not work
>   [    5.788882] ov13858 i2c-OVTID858:00: failed to find sensor: -5
>   [    5.789321] ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5
> 
> The "GPIO type 0x08 unknown" warning comes from the default case in
> skl_int3472_handle_gpio_resources() in drivers/platform/x86/intel/
> int3472/discrete.c:
> 
>     default:
>         dev_warn(int3472->dev,
>                  "GPIO type 0x%02x unknown; the sensor may not work\n",
>                  type);
>         ret = 1;
>         break;

This should be addressed by commit 34e31390a3b939db2e0cbfef4c40d95052572df0
.

-- 
Regards,

Sakari Ailus
