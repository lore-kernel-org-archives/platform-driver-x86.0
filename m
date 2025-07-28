Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C6137923
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jul 2025 22:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753743412; cv=none; b=oRfdU6uBN9l33mM/y4Sdjqu88d1WdZ+llrAyjDkJxnC9XBDpZuL4/jae1KZX6ALAQRdfQ2Cw5DH27Oe8B78LxyT3guriKJJRsM6L9gBo79bnnG3F1JTRU1g47XoyAlxr6bJQV0HR8t4+6XTbWPUgEfK0/AK9AJPZdPrDEdCI8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753743412; c=relaxed/simple;
	bh=uqw3hk/p3/LEme4pEJ6buJatDbzbFTQuy6PXc62i4Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpgjYPjUB3j6I781gGH6esaGzgDvcsq3AqO4hVrxYIyodDYiwA8w49Wc813UIIZxBpRldjwaizJrdieBEnFquldwt8HrueB9gGKAWb+m4sKiNTkYQG2yp8l8YwPbieJJhw7M4EYYeVsUS28CUkhqUxINPQnygVZOM+nsTmNx53c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K37FMS+j; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K37FMS+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753743411; x=1785279411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uqw3hk/p3/LEme4pEJ6buJatDbzbFTQuy6PXc62i4Xs=;
  b=K37FMS+jLw+N8DUbjq2mrPfNzErhNn7u5BdBWLNH/jg0+grwr4AOrHGO
   Fg9Gpazx6DJign00nV9KVyZy9dlKBUGby9JwreF8+QyrtpCMgZLJNHRcX
   EujQwY81ne28nhmFcoe/1EWwQPUNN90Js5fIJ7C7D5/4rS1Kj+PzYQXAu
   5bOsraI9nYLQBALIfK7r4Vo/Rh1dNfJwI985z+USEPdRydqhr+QBzhssE
   qFzejiW+oRYAtqJxvfqvT4HHUUKCHC6aTQ1kZtFHUsrknfLm7zMZJDTOs
   yKEGvPc3TGIJpC4OSxuo54fzlYhOCj7xqh2YIEZUpu4k/4opIMYm3VmNp
   Q==;
X-CSE-ConnectionGUID: +8ZZXiiKSD6FAOuomeUFFg==
X-CSE-MsgGUID: PNGmc+8IR2W+d7Ihnacj+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="43609926"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="43609926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 15:56:50 -0700
X-CSE-ConnectionGUID: UqS97DosT7yCVHcgyqB0DQ==
X-CSE-MsgGUID: X71hIIZLTVK6hKrMQRxHQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="161800786"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.78])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 15:56:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4E0011FC49;
	Tue, 29 Jul 2025 01:56:45 +0300 (EEST)
Date: Mon, 28 Jul 2025 22:56:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: Increase ov08x40 handshake
 GPIO delay to 45 ms
Message-ID: <aIgALTHk3sWzy0_t@kekkonen.localdomain>
References: <20250725144444.210043-1-hansg@kernel.org>
 <20250725144444.210043-3-hansg@kernel.org>
 <CAHp75Vf7yoLYNTQxgJFbA2FT2dqVJ5BBF0w-uTJsYooON7LqXQ@mail.gmail.com>
 <aIPDGsNVrd7tBvY8@kekkonen.localdomain>
 <c4b280a3-e621-483e-932c-1f0547be5e79@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4b280a3-e621-483e-932c-1f0547be5e79@kernel.org>

Hi Hans,

On Fri, Jul 25, 2025 at 10:43:17PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 25-Jul-25 7:47 PM, Sakari Ailus wrote:
> > Hi Hans, Andy,
> > 
> > On Fri, Jul 25, 2025 at 04:52:26PM +0200, Andy Shevchenko wrote:
> >> On Fri, Jul 25, 2025 at 4:44 PM Hans de Goede <hansg@kernel.org> wrote:
> >>>
> >>> On HP laptops with an ov08x40 sensor the 25 ms delay coming from Intel's
> >>> out of tree drivers is not enough. Testing has confirmed that 45 ms does
> >>> work.
> >>>
> >>> Add a quirk to the int3472_gpio_map[] to increase the delay to 45 ms to fix
> >>> probing of the ov08x40 sensor failing on these laptops.
> >>>
> >>> Note this only impacts laptops which actually use an ov08x40 sensor with
> >>> a handshake GPIO.
> >>
> >> ...
> >>
> >>> +       /*
> >>> +        * ov08x40 sensor with a handshake pin needs a 45 ms delay on some HP laptops
> >>> +        * https://bugzilla.redhat.com/show_bug.cgi?id=2333331
> >>> +        */
> >>> +       { "OVTI08F4", INT3472_GPIO_TYPE_HANDSHAKE, INT3472_GPIO_TYPE_HANDSHAKE,
> >>> +         false, "dvdd", 45 * USEC_PER_MSEC },
> >>>  };
> >>
> >> My gut feeling is that this might be needed for most of the cameras
> >> with the handshake signal. Do you have ones that work without this
> >> delay?
> 
> For those laptops with the CV chip that Sakari talks about below,
> 25 ms, which is what is currently the default delay seems to be
> enough.
> 
> > I'd expect this to depend on the CV chip, if not solely then primarily at
> > least (firmware could play a part maybe??). Isn't there a way to figure
> > that out?
> 
> These HP laptops do not appear to use a CV chip at all, yet they do
> have a handshake signal... Specifically there is no CV / USBIO chip
> on the USB bus and the I2c and GPIOs for the camera sensor come
> directly from the main SoC.
> 
> With that said, even if there were a CV chip, then given all
> the problems we're having with those I do not expect us to be
> able to get this info from the CV chip.

I wouldn't expect it from the chip, but knowing which chip is there could
be useful in determining this.

It'd be good to understand what's going on, even if that change fixes the
problem. Given there may be more pressing problems it may well remain a
mystery. :-(

But it's not the sensor I presume, 5 ms should be enough since lifting
XSHUTDOWN. It'd be good to add a comment on which models this applies to,
besides the bug URL.

I'll review v2 later this week.

> 
> Just getting the basic IO-expander functionality upstream has
> been and still is a very troublesome process.
> 
> Which includes very different behavior between USBIO chips which report
> the exact same firmware version, it looks like the fw-version reported
> over USB does not always get updated in fw updates...

Ouch!

-- 
Regards,

Sakari Ailus
