Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A552F8E95;
	Tue,  4 Aug 2026 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843023; cv=none; b=inGFdvu8rRg41EeNBC/TrRCOVOq2ifXohUr1408Ni8U8P3DJx80ag3GBi65hAHghs0z5hjjX5uiNEqoJn9BV/fPg1gTAfyxmdrjPmweBOGxQcKJJr2s1k3rccc9xy8DN6R7lIJQ+EKHUapNIVaLa0jgiUZ8+VbjqiSm6SyZhqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843023; c=relaxed/simple;
	bh=iHqfLDz6Q1BVISfoQmEZswPwRQYzTVlFCDIOgeLalvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KG52r2l/pcuA60Y64vFtZpj7vK4NLE31r2NZn55tO3yaCnMrvgaWX2Yd6AL5vHzl6IThG+0Z2WLYp94k2nbPzhyUqfTDuRfDJzyY0wK8V7L3fhb60xOqQ+wLPqGZ47PStOvz06qBvYq7cVrT/LfXIprgpRX42sxfO9cr5rKZy64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/QulvRN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/QulvRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785843021; x=1817379021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iHqfLDz6Q1BVISfoQmEZswPwRQYzTVlFCDIOgeLalvo=;
  b=I/QulvRNH6OKYaMN4tCS/le2ol/qrHA7aE0h5Yu7ipUpY34SckZwbMcA
   wQeqY1d5gBdgj63dZuC1+lFDGAD553oLSlUqPWUcguqSe//nMl3e8ppsX
   FDigvKJ7kTPir7T6jkfHMRWgx5yYqpYXn7W2vplF7mZgKOCKSP3MlPxnp
   zmxDhg3tGiGdZYdy61g+8aSF3h30oTI1b/Av9vl2HsAeQJt7AzqOzHGEq
   yIlVY2BLexkIgwWBU3I8VRJMl5QYhuLBks8flACGpBTmd+nJmtIpSdbD6
   pQ275YRkAtmDFHAgQC1LM7PDPLHZljIPwitP588gWXQQlJZIg/+TIqirj
   A==;
X-CSE-ConnectionGUID: XLQY+LlhSfOWysspQbIpVw==
X-CSE-MsgGUID: AsT12gyFTqSTE1d0k1NLhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86589789"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86589789"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:30:21 -0700
X-CSE-ConnectionGUID: f4LX8IvKR8m45QvEcjWpAw==
X-CSE-MsgGUID: YahEwf2BTJmYcabHMwejww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263479347"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.141])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:30:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E9043121197;
	Tue, 04 Aug 2026 14:30:20 +0300 (EEST)
Date: Tue, 4 Aug 2026 14:30:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: "Vadillo, Miguel" <miguel.vadillo@intel.com>,
	linux-media@vger.kernel.org, mario.limonciello@dell.com,
	hdegoede@redhat.com, bingbu.cao@intel.com, tianshu.qiu@intel.com,
	tomas.winkler@intel.com, hverkuil-cisco@xs4all.nl,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Subject: Re: [SOLVED] Dell Panther Lake =?utf-8?Q?I?=
 =?utf-8?Q?R_camera_=28HIMX1092_=2F_Synaptics_SVP7500_06CB=3A0701=29_?=
 =?utf-8?B?4oCU?= port-2 streaming gated by bridge secure-handshake
Message-ID: <anHNTM7gr4zvSObW@kekkonen.localdomain>
References: <CAE_FnZKNn0TzpVi+kaDZd91WtO4FN9S9AtXd9UjQZfGDDsxgfA@mail.gmail.com>
 <agRvdKI9nj4qwDt8@kekkonen.localdomain>
 <CAE_FnZKC+=hq-8hi-QPaHo9o=B_KoDA6+iLY2GLa-cWADMRfGA@mail.gmail.com>
 <f7bb577c-abbe-43f5-9630-05288eeb0c41@intel.com>
 <CAE_FnZKN5447We2ATUcc1cc_bKuQkdnva7+LOX4i0t4Bm8ybTA@mail.gmail.com>
 <CAE_FnZJeNyoBnq1PXSE0kYQ2uE9aFv31WqrhQ-=WY78EWwwisg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE_FnZJeNyoBnq1PXSE0kYQ2uE9aFv31WqrhQ-=WY78EWwwisg@mail.gmail.com>

Hi Jake,

On Sat, Jul 25, 2026 at 01:51:50PM -0400, Jake Steinman wrote:
> Hi all,
> 
> Back in May I posted an RFC about the IR camera path on Intel Panther Lake
> (IPU7) laptops where a Himax HM1092 sensor sits behind a Synaptics SVP7500
> vision bridge. I could not get a single frame out of it.
> 
> It now works completely, and I would like help getting it upstream rather
> than leaving it as an out-of-tree fix pack.
> 
> What works today
> On a Dell XPS 16 (DA16260, Panther Lake), from a cold boot, surviving
> reboots and kernel upgrades:
> 
> RGB camera (OV08x40) — streaming, 3856x2176 @30
> IR camera (HM1092) — streaming, 648x368 @30
> IR face authentication via Howdy — lock-screen unlock in ~0.3 s
> s2idle suspend/resume, camera survives
> That is the entire camera subsystem on this class of machine. Dell's own
> driver packages bind the identical ACPI\HIMX1092 behind the identical
> bridge on the XPS 13 9350 and DA14260/DA16260, and the same combination
> ships on HP and Lenovo units, so this is a hardware family rather than one
> laptop.
> 
> Root cause, for the archive
> My sensor driver published V4L2_CID_LINK_FREQ = 360,960,000. That value is
> correct, but it is the per-lane MIPI bit rate; V4L2 defines LINK_FREQ as
> the DDR clock, which is half of it — 180,480,000. ipu7-isys therefore
> programmed the CSI-2 D-PHY at ~721 Mbps against a sensor transmitting at
> ~361. The clock lane came up and no data packet ever framed: zero SOF,
> indefinitely.
> 
> The wrong number came from the obvious derivation — the sensor's own PLL
> registers, 19.2 MHz * 94 / 5 = 360.96 MHz. That derivation is right; it
> simply yields the bit clock. Anyone reverse-engineering this part from its
> PLL configuration will land on the same value, which is why I think it is
> worth recording publicly.
> 
> I would like to correct the record on things I previously reported here and
> on the Intel trackers, all of which were wrong: the bridge does not gate
> the data lane (with no MIPI link config at all, the sensor's clock still
> reaches the IPU); HOST_SET_MIPI_CONFIG is not required for IR (Windows
> never sends one); the register init table was never wrong (byte-identical
> to Windows, in content and order); and there is no frame-trigger or
> slave-mode register anywhere in the sensor or in any Windows driver build.
> 
> A diagnostic others may find useful
> IPU7 CSI-2 PHY_STOPSTATE (port N base 0x2c0000 + N*0x4000, offset +0x4c)
> carries one bit per data lane plus bit 16 for the clock lane:
> 
> 0x00010001  clock idle + data idle   - nothing transmitting
> 0x00000001  clock ACTIVE, data parked - rate or format mismatch
> 0x00000000  both live                 - streaming
> The middle state is the signature of exactly this class of bug, and it is
> otherwise very hard to distinguish from a firmware-locked sensor.
> 
> One caveat: ipu7-isys reads that register roughly 29 us before the sensor's
> s_stream(1), so the value that reaches dmesg always says "idle" and is
> useless. The sensor has to be armed out of band first for the reading to
> mean anything. That single detail cost me weeks.
> 
> What I am asking for
> One patch is ready now. ipu-bridge has no HIMX1092 entry, so a stock kernel
> cannot construct the swnode graph for this sensor at all:
> 
> IPU_SENSOR_CONFIG("HIMX1092", 1, 180480000),
> alongside the existing HIMX11B1 / HIMX2170 / HIMX2172 entries. I will send
> this as a proper patch if it is wanted.

I'll pick the patch once we have rc1 in the media tree.

> 
> The sensor driver is not submittable as it stands, and I would rather hear
> that now than waste a maintainer's review cycle. It carries out-of-tree
> assumptions — vendor DKMS layout, debug module parameters — and needs CCI
> accessors, a proper link_freq menu and binding documentation. I am willing
> to do that work.

As you've noticed, Ramshouriesh has submitted versions of the HM1029
driver, latest is v6. That driver seems to be in a good shape (for a
register list based driver). Adding whatever needed for ACPI and required
frequency configuration to the driver would be very nice. I see you're
already working with him on this, good!

> 
> What I cannot supply is the judgement calls:
> 
> Is a sensor sitting behind a vendor vision bridge acceptable in
> drivers/media/i2c/, or does this topology need a different home?

The sensor driver isn't affected by this. The fact that it's behind such a
bridge is visible in the Media graph but otherwise these bridges are
effectively just pass-through devices for regular use cases.

> Would Intel prefer to take the HM1092 driver in-house, given it is your
> silicon and you already ship intel_cvs?
> Is there an existing convention for the illuminator? INT3472 exposes it as
> a LED class device, which means the sensor driver cannot drive it and the
> userspace consumer has to — that works, but it feels like the wrong layer.

The devices (sensor and the LED) are still different and there are use
cases where both are used independently. Does HM1092 support strobing flash
LED? That is in principle supported but often there's wiring missing. :-o

> Working code, full write-up and verification tooling:
> https://github.com/jibsta210/svp7500-camera-fix-pack
> 
> Prior discussion: https://github.com/intel/vision-drivers/issues/37
> https://github.com/intel/ipu7-drivers/issues/64
> 
> Happy to test patches, provide captures, or rework the driver to whatever
> shape you would accept. My preference by a wide margin is for this to end
> up maintained in-tree rather than living as a DKMS pack that breaks on
> every kernel bump.

I'd very much like to see such an outcome as well.

-- 
Kind regards,

Sakari Ailus
