Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD6207E1A;
	Fri, 10 Jan 2025 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526868; cv=none; b=d2LmsMfMXWhmYiHQKT7tqL46Q6L2AXk1KZVQr1DywDpB2fKjgaeqA7SP11cdfaNxTAJczX21fhlKV4f2Kxs+qRJA7StUPgt0ZhCIygd7AmOr6DEuhXzifxYUAqA2rOXzL1tnEjELmrlUPMrSuUWGUVv8oFE2uGnGZ3MGcc/btgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526868; c=relaxed/simple;
	bh=yhP2Vqc8NbLu93cOumFGXx36oWtEDGP6VEhMcMW67EY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a4ZiGu3MMXRo6Z3CkXgFstouXvuTV9YpQWxkcN6bmG04uJbnkmnaErm406KdyP9xrG1tnPHsB2ZgPNfST/jW82iVDCx86Gt7XT0sEK5WG6wX+BU4j0MU6MvW0RHDq6dxnEZMkYOAJILQaBorCvQtLnQd+GSQdDXtMeXR813dLk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UF7WVvNv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UF7WVvNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736526866; x=1768062866;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=yhP2Vqc8NbLu93cOumFGXx36oWtEDGP6VEhMcMW67EY=;
  b=UF7WVvNvEsroT6jnqQSbBJd68+MH0lV/FdTQNTz/gh8dZdT20Ji1NWYr
   xuvRZDi4PPzeG8vvYx95PfG9o5uKfqqLFDdgzlb4L6gDqv+tOwhCq9O/u
   YLbLRGpnVzZ9s4TO0kQHO8sF0qNCjC8+SkJX23Nt2VZClk7V88uDn+owX
   uxchsYe90VZjvk7mpiVAT2yhZIV/e3fphddnDaM7re1TMEkHWMjcLcPB6
   kL5Hv8XU2nvGAGNbEOJUtcSbv2uVo6nZSB/27k6Irh1RPPALd5lle5zFB
   nJjl1BeFaavbDSNw3wKTILtpy7HQs6i+9Qc+aR+P++9VipYw9185b4QUu
   g==;
X-CSE-ConnectionGUID: /Lpkhmz8SSSyA8K0Wo7Sfg==
X-CSE-MsgGUID: EepM8gHOS7enl4MsjTkxjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36726620"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36726620"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:34:25 -0800
X-CSE-ConnectionGUID: 0Nhx7WClT6+p5w+k3xX69g==
X-CSE-MsgGUID: YS08ah/XSce+UX8SyBxUIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108782139"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO localhost) ([10.245.244.158])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:34:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jan 2025 18:34:18 +0200 (EET)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: W_Armin@gmx.de, thomas@t-8ch.de, kuurtb@gmail.com, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    corbet@lwn.net, linux-doc@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
In-Reply-To: <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>
Message-ID: <2ce20c14-cc74-5c06-e473-717705e3d7f7@linux.intel.com>
References: <20250109220745.69977-1-josh@joshuagrisham.com> <30f6644c-bf35-dd5e-4f1c-d1f1915b97da@linux.intel.com> <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1750871031-1736526167=:1003"
Content-ID: <5397441f-8819-4c6b-2560-3799bd3d7d30@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1750871031-1736526167=:1003
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <aff43592-cc2c-eb4b-2369-8ac5f2508445@linux.intel.com>

On Fri, 10 Jan 2025, Joshua Grisham wrote:

> Hi Ilpo, thanks for taking the time! Few clarifications/comments below...
>=20
> Den fre 10 jan. 2025 kl 12:30 skrev Ilpo J=E4rvinen
> <ilpo.jarvinen@linux.intel.com>:
> >
> > > +static int get_performance_mode_profile(struct samsung_galaxybook *g=
alaxybook,
> > > +                                     const u8 performance_mode,
> > > +                                     enum platform_profile_option *p=
rofile)
> > > +{
> > > +     for (int i =3D 0; i < PLATFORM_PROFILE_LAST; i++) {
> >
> > unsigned int is preferred for loop variables that never should become
> > negative.
> >
>=20
> Thanks for the catch! There are a few other places with a for loop
> using int i so I will go ahead and change all of them to unsigned ints
> for the next version unless you say otherwise.
>=20
> > > +     if (num_mapped =3D=3D 0) {
> > > +             dev_dbg(&galaxybook->platform->dev, "failed to map any =
performance modes\n");
> > > +             return 0;
> >
> > Should this return error instead? I assume it's because you want to
> > initialize with part of the features only but...
> >
>=20
> Yes at this point it is "no harm, no foul": the profile_handler has
> not been set up, platform profile has not been registered, and
> has_performance_mode is false, so I want that it just exits and the
> probe continues to init other features (e.g. devices with SAM0427 have
> kbd backlight controller and firmware attributes but not this specific
> performance_mode implementation, so for them this function will just
> stop anywhere along the way at whatever point it fails and just "not
> doing anything else" but still let them use the other features of the
> driver... all other features that then check against
> has_performance_mode will see that it is false and just skip that
> part). Does this still seem ok or is there any adjustment you would
> like to see for this?
>=20
> > > +     /* if startup performance_mode fails to match a profile, try to=
 set init mode */
> > > +     err =3D get_performance_mode_profile(galaxybook, performance_mo=
de, NULL);
> > > +     if (err) {
> > > +             if (init_performance_mode =3D=3D GB_PERFORMANCE_MODE_UN=
KNOWN) {
> > > +                     dev_err(&galaxybook->platform->dev, "missing in=
itial performance mode\n");
> > > +                     return -ENODATA;
> > > +             }
> > > +             err =3D performance_mode_acpi_set(galaxybook, init_perf=
ormance_mode);
> > > +             if (err) {
> > > +                     dev_err(&galaxybook->platform->dev,
> > > +                             "failed to set initial performance mode=
 0x%x\n",
> > > +                             init_performance_mode);
> > > +                     return err;
> >
> > ...why these two cases then result in failing everything vs. just platf=
orm
> > profile feature? Not an end of the world but it feels inconsistent to m=
e.
> >
>=20
> I am glad you bring this up, as it forces me think through this a few
> more rounds... basically what happens is that the device will always
> come up from a fresh boot with the value of 0x0 as the "current
> performance mode" as response from the ACPI method, even though for
> most devices value 0x0 is the "legacy" optimized value that should not
> be used.
>=20
> In Windows, the Samsung background apps take care of this by storing
> last-used value from previous session and then re-applying it after
> startup (and the same happens with various userspace services on
> platform profile from what I have seen, actually).
>=20
> But since the driver does not map 0x0 to any valid profile unless the
> device only has the "legacy" optimized mode, then my function
> get_performance_mode_profile() will return -ENODATA in this initial
> startup state of 0x0. What I noticed is that the first time after this
> that you run platform_profile_cycle() after this, there is a little
> "hiccup" and an error "Failed to get profile for handler .." is
> printed in the kernel log from platform_profile.c (without pr_fmt by
> the way), but then it just works anyway and starts to pick up from the
> first enabled profile and then can continue to cycle.
>=20
> My bit of code here was to basically try to "force" to set the profile
> to whatever was successfully mapped as "balanced" upon a fresh startup
> so that when platform_profile_cycle() first runs there would not be
> any condition where get_performance_mode_profile() would return
> -ENODATA. Then the userspace tools would take over anyway and restore
> your last session's latest used profile so it would not matter so
> much. In the end, really the aim I guess is to avoid this error
> message in the kernel log, but otherwise everything works even though
> there is an error message printed, but this is maybe a bit overkill?
> And by the way, that, as you say, we should probably not fail the
> entire feature just because of this, but let the error happen anyway
> and let everything work after that.
>=20
> Possibly more "simple" alternatives I can think of off the top of my head=
:
>=20
> 1. Let get_performance_mode_profile() return 0 instead of -ENODATA if
> nothing is matched , this way a non-mapped performance mode would
> always just set platform_profile_cycle() to the start of the cycle I
> guess/would hope? and/or add a special case in
> get_performance_mode_profile() for performance_mode=3D0 to just return 0
> to get the same effect ? (though what happens if we have not enabled
> PLATFORM_PROFILE_LOW_POWER in the choices? even though the function
> returned 0, will platform_profile see that 0 is not supported, and
> just keep moving on until it gets to the first one that is? If so then
> this will work, but I have not yet tested or fully checked the code to
> ensure that this will actually be the behavior...)
>=20
> 2. Try to do the logic which I did with this init_performance_mode,
> but in case init_profile_mode is not set, just skip it and let the
> error come from platform_profile_cycle() anyway and it should start to
> work. In this case I think it would be good if the user is maybe
> flagged somehow and create a bug for this, because I would want to be
> able to work with them to see what modes are reported by their device
> and see if the mapping needs to be updated in some way.
>=20
> 3. Do neither of these, remove everything with init_performance_mode,
> and just let platform_profile_cycle() fail upon startup and print the
> error message and then it should just start working after anyway.
>=20
> 4. Map 0x0 performance_mode to PLATFORM_PROFILE_CUSTOM in case the
> "legacy" mode with this value is not mapped, then the hotkey would not
> work to cycle the profile at first as the user would be forced to set
> the profile to a value via either a GUI or the sysfs interface before
> they can begin to use the hotkey to cycle the profile. Once they do
> this the very first time, then the userspace tools should kick in
> after this (upon every restart for example) to set the profile to the
> prior session's last used profile and then the hotkey will start to
> work to cycle the profile anyway in that session without any
> intervention from the user at all (so it is the very first time that
> they start their environment up, assuming that the prior value does
> not get cleared somehow due to some combo like the module being
> removed/blacklisted and then they restart, then add it back, etc, or
> some other corner-case situation?)
>=20
> I do think that something should change, maybe the most
> straight-forward are either 1 or 2 in this list, but not sure if there
> are any opinions or preferences on these or if there are other better
> options I did not think of here?

I think you entirely missed my point, which is that also=20
galaxybook_probe() will fail if you return an error from this function.=20
That is, you won't have battery, backlight, etc. when the probe fails.=20
This is a bit inconsistent with the other case I mentioned above where you=
=20
get everything else but platform profiles because 0 is returned.

Also, devm_platform_profile_register() won't be called regardless of=20
whether you return errno or 0 at this point so there won't be platform=20
profile handling registered anyway so most of your discussion seems=20
irrelevant.

> > > +static ssize_t current_value_store(struct kobject *kobj, struct kobj=
_attribute *attr,
> > > +                                const char *buf, size_t count)
> > > +{
> > > +     struct galaxybook_fw_attr *fw_attr =3D
> > > +             container_of(attr, struct galaxybook_fw_attr, current_v=
alue);
> > > +     struct samsung_galaxybook *galaxybook =3D fw_attr->galaxybook;
> > > +
> > > +     bool value;
> >
> > Remove the extra empty line from within variable declarations.
> >
>=20
> Yes sorry this was just a miss when so much got moved around due to
> the big changes between v4 and v5; will fix this and the other small
> straight-forward issues for v6 :)

No need to be sorry about things like that, it happens to everyone when=20
things are moving rapidly.

--=20
 i.
--8323328-1750871031-1736526167=:1003--
