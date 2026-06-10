Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D4C3AFAF9;
	Wed, 10 Jun 2026 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082772; cv=none; b=uson6i8EBJ89JHXC1oI3OcwbxDRje3ZWh6caXQYzJ9XsYrtwdRU9kcHpVoCVYcM1suhCBkihyBHeFk/KfvsxgXFIuS5j6HeiKO14ZAhtfMVx3hwnAfylAzZReZAddza4bY4kHREHzVnfhZV2tckS94FgXXFZWJb5pTCAojS3JXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082772; c=relaxed/simple;
	bh=X+sdHIZNs6e+3TAMIMVwRZPP/z+dF2KTllWHD1G+h2I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pY20Vor+dCAO1wFyncLKNRrJcex+xaPoW3KX5ZKKLoJg0PVU0N5Ro3/GS/90Dq8u7r9KCuQ0ha5PbjSK/LRpdOKRR8apYTM+XwNig9lIlOyhaU3/6Xq8T86Yi/jkVbawnU+ovwe3EhXwYSFMO/8eFCsgAZdVB2WnEMbZtcKJy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T77hiQhn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T77hiQhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781082772; x=1812618772;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=X+sdHIZNs6e+3TAMIMVwRZPP/z+dF2KTllWHD1G+h2I=;
  b=T77hiQhn78Dsy3kHlR5nL7wQ3/lILKslmZELjudeYaoWYyoBeyK0lt9N
   oi0WaOWszQcKaiL0W5IalvBYptR0+0/BrlZwC/wfp287H1yvOhkBaDp13
   m2u0kSuPTany7WnQYA+HH68I484Iuxq9dGZiREowTAC6F/UobYAPwlxMP
   r1dLCG2t6JucLjxhTe4WI0zV5vHTON+GqEFqkwEs25/qNTayulinDhfhx
   znuE4p0U0NEpcaWijpGrUPmJnOGbttci84j6owHb5Qaocs+0S4YPItHyH
   TgzcbkJKskxzBI8i3Yz76nj28qR+/IziWt5h5MNzs4JDbhOtIJjkT2moz
   A==;
X-CSE-ConnectionGUID: z3/Y5VsQSJKLQdbRFIOgGQ==
X-CSE-MsgGUID: a8eVg3z3STmhzSqCuitXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81002679"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81002679"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:12:51 -0700
X-CSE-ConnectionGUID: y3UJ8r6OSBeJmcpyqtO2/A==
X-CSE-MsgGUID: pf7JE5jERlSYXqQNq5IlzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250398397"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:12:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 12:12:45 +0300 (EEST)
To: Alex Yeo <alexyeo362@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
In-Reply-To: <20260610031756.546459-1-alexyeo362@gmail.com>
Message-ID: <b687f9d8-a996-2f04-d803-e267cf140b57@linux.intel.com>
References: <bc272424-9ec6-8f3b-19c1-89fded10e230@linux.intel.com> <20260610031756.546459-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jun 2026, Alex Yeo wrote:

> I have a CF-SR4 and Linux works out of the box. Compared to
> previous models, this one seems to have the fans running at high speed
> by default when the computer starts.
> 
> When Windows 11 is booted up, the high fan speeds persist just until the
> login screen. Once the login screen shows up, the fan spins down.
> 
> I had suspected that this might be the laptop ramping down the fans when
> the OS declares that it is Windows but this does not seem to be the
> case.
> 
> After analyzing the DSDT and SSDT of the computer, I have found the
> following:
> 
> File ssdt10.dsl under \_SB.PC00.LPCB.EC0:
> 
> Name (CEFM, Zero)
> Method (SEFM, 1, Serialized)
> {
>     CEFM = Arg0
>     REFM ()
> }
> 
> Method (REFM, 0, Serialized)
> {
>     If ((\S0IX == 0x03))
>     {
>         Local0 = 0x05
>     }
>     ElseIf ((CEFM == Zero))
>     {
>         Local0 = Zero
>     }
>     Else
>     {
>         Local0 = 0x02
>     }
> 
>     \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, Local0, Zero)
> }
> 
> \_SB.PC00.LPCB.EC0.CEFM would seem be the current value
> for the fan profile. On startup, this is set to 0.
> 
> Based on the code SEFM seems the be the method to set the fan
> profile and REFM is executed right after.
> 
> I don't have access to information as to what the argument officially
> means but based on testing, any number above zero makes the fans spin
> down and behave like the older models where it stops or runs at low
> speed when its cool and ramps up when the processor gets hot.
> 
> The only relevant values for CEFM seem to be just 0 and any number above
> that just gets treated the same. I personally use just 0 and 1.
> 0 seems to be the high fan speed mode and 1 makes it behave like
> Windows.
> 
> Giving 0 as an argument reverts the fan back to the way it was during
> startup where the lowest fan speed is quite high and when load is
> applied, it seems to ramp up to an even higher speed which I think would
> be its 100%.
> 
> A value of 1 seems to have its max speed capped lower than 0.
> 
> For both modes, fan management is still automatic.
> 
> fan_mode only shows up in sysfs only if \_SB.PC00.LPCB.EC0.CEFM and
> \_SB.PC00.LPCB.EC0.SEFM are both present which should mean it should not
> show up on unsupported models. I have tried not hiding it and it just
> outputs a generic error when the value is read.
> 
> I also saw that variables such as eco_mode are kept in memory, however
> for fan_mode I rely on getting and setting the value via ACPI.
> 
> Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
> ---
> Thank you for taking the time to read the patch and give feedback.
> 
> I have revised the patch according to the comments.
> 
> However, for some parts I would like to clarify the following:
> 
> >Include for pr_err() is missing it seems.
> >This file seems to be lacking sysfs.h, please add the include now.
> 
> For both pr_err() and sysfs.h they should be included as both are
> referenced/used multiple times within the same file.

I know those are pre-existing problems. But they are still missing as 
direct includes and only become included indirectly through some other
header which is fragile if somebody wants to refactor those headers.

Thus, you should simply add the missing includes finally now when you add 
more code that uses stuff from those includes.

Obviously it would have been better to have the includes right from the 
beginning but we lack automatic tools to detect that and human reviewers 
are very fallible in checking them.

> >kstrtouint()?
> 
> It takes in input via sysfs
> something like:
> $ echo 1 | sudo tee "/sys/devices/LNXSYSTM:00/LNXSYBUS:00/MAT0019:00/fan_mode"
> and based on the other functions within the same file, the input
> is expected to be a string which is converted into an int via kstrtouint()
> as CEFM is an int

So what happens if you do echo -1 instead? Your changelog only talked 
about positive values.

It may well be other sysfs functions could use unsigned conversion variant 
too (I've not checked), but here you're adding new interface and it should 
be designed the best way possible. If negative numbers are not valid 
input, kstrtouint() does check that for you for free so why not use it?

Also, please leave more context visible next time when replying, I had to 
look it up from the other mail!

> >But I'm unsure whether sysfs is right place for this interface. acer-wmi
> >driver seems to have fan mode auto/turbo selection using hwmon interface
> >but this driver doesn't have hwmon as is...
> 
> I do get what you mean. My personal goal is to have this work smoothly
> with software like thermald as the vendor appears to use Intel Dynamic
> Tuning Technology with non-standard ACPI methods to control the fan.
> I will take a look into that and see if exposing the control via a
> different way works better.
> 
> To summarize, it appears the OS calls SEFM to let the EC know the OS
> has taken control of the fan. The fan then spins down until
> it stops completely (level 0). This then allows the OS to set
> the fan level from 0 to 100. If the processor gets too hot,
> the EC intervenes and ramps up the fan.

Sounds like pwm control to me. (Though, you haven't exactly described how 
that 0-100 control is done in OS but only about getting it to spin at low 
speed to match the speed user/you expected.)

> >From what I can gather, when running Windows, the vendor's driver
> together with Intel DTT work together to control the fan.
> 
> Given this, I would like to ask what is the most appropriate
> place in the kernel to expose this functionality?
> I understand that hwmon was mentioned but I also see that
> interacting with /sys/class/thermal may also be an option.

Can we somehow read how fast the fan currently spins so the information 
could be exposed through hwmon?

You may want to look more information about hwmon and pwm as to me it 
sounds pretty a good match to the fan control (based on your explanation 
about about OS controlling fan speed in 0-100 range).

-- 
 i.

