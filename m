Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6311AF0C3;
	Sat, 11 Jan 2025 17:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736615725; cv=none; b=TVBa2BEw8qW+JttvvdtDqrJtpdbL8B+sMIAwvzaWtsQyJcGG6g3F9iEyU6SojEjrvgEIKaeHr73fZ0Ni8MVXZneCF47vfWU5bvq+M+n/+1HYlC59pF/MZhg3nq9YedD3FMdd2CrN45KX7IZ+9spctY8K5eNC4wOF63RVf286e/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736615725; c=relaxed/simple;
	bh=XQDpZB8dJKan93pEmAi42YnBwLaM1/HgSkej09AI/TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxzRGCpkLu30se/S+IACqxI+J809uNjrqyYAatU6wgLKtY3kcHgGHmd5/0THWHbOCkUEc7hAs69+1pmwQBrTAj9/D/ly8AlTRhpBK/AjDrdnwLHM1JfjRnu6P8hgYEPn4Vobrdc2hrprBy7j3+AXdBN5RHcJB8ZldN3N8A3rp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoiVFSrJ; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoiVFSrJ"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5160f1870f3so1056329e0c.0;
        Sat, 11 Jan 2025 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736615722; x=1737220522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dy7VdZCpZwIgXTmQS0p8FpgFyTRyG1x5S6oR0hEEgVg=;
        b=DoiVFSrJHxqxXI08ZA1F7yxYV8EIEM33/iD0WFXwsVHL8va+1vyH2wJfFsEBgIInM8
         +GTVHKGIS6xzd2TBKBwLMCRmivhMZfhZPEG/ExiBxCGAeZCx420ypXniAykLyTDPh02P
         bnuoOYSdllxMVfyzMD7msx4PZwW+fM28uKwJNdJHztRcjVhx1TrLC58aNDXsnjYHolOH
         amMNoeGnEnfgtnCYyQJH4mRFB8tu+3Gv4978h4d1IGuOe4GbmelZ+iD8XLkqKimBxnhS
         hpSeMNL4p8OQyAmJz74AHBWx8u5e+GCAlkaFkF4/f2MvFi+S5YCkgeGB48msQs1bLN4n
         yR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736615722; x=1737220522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dy7VdZCpZwIgXTmQS0p8FpgFyTRyG1x5S6oR0hEEgVg=;
        b=Kzwdk/lskIVNpIrOBJTdQ6nTWSFofRqFd9xfGe1dSVV3aHgAJHGaS4ScOnaXhCE5Yp
         A7VL39MrNHDYmkbku/vrDC+Hw61HUwP5RBAyqQ3BzQoF5TXzJQT424VTQ3xwPSZ16dGa
         J1BMcbxMbvD/+QuHJffdGIkFXMfF9AV6hShgE4Q72Vf1qmUqGzgjE3uvcJ9e5/XDUj+5
         q073/qjmuKdRKUbpHwpmK5ma9KJKARKtYpHlzHwyG8RLJv/F9Wrvr5ts7/tpsWf0X5WD
         eZ3u/C6wYw9MwQWq2BfChViZZiUK9vrlEBMJiKBqH2kxwrKIAey/GFUmtgMg9Y0u7rf7
         7vvw==
X-Forwarded-Encrypted: i=1; AJvYcCVZyhnys6SYw6gXI+20WjoDEZc4ES7Axci1Sqkxnv5EfkAf1XGPFzPjyMhAeaHUBJfFQn3HpNwQ8hjj3gwu@vger.kernel.org, AJvYcCWRnytLS4nGpMNGrlYSp45ciRKo4BGcbfjMOSor2wf1shdqFuQApTs7yiuaSMq/Cr5JdVNciBW2DDixjE081nZYCsTD3Q==@vger.kernel.org, AJvYcCWmT9VtKZCIh8Wcc/SJ9VTpG23C4y1fA76sOxh4551PjU0p9+oCA9qMYaubOPZtL8gPmckC+gub2AY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3XLVcoHRUEQIf98FQ0fb+WT1N0X+cU6hXFNzRkuPxO/J0hYV
	M71R3TPQTFyAncCZtSm2KAO6DfHLorvEwS4n4fH+pawCHwO7mbqM
X-Gm-Gg: ASbGncuI51DSv2GjDrFWmy/GWh53baDTm9etvtX+tjSal4ny7UjFsaQ+RAt5CggbFSC
	k1ttgAfXbxvblMN3udrTZy633gZhY1Qj38dwOUKhO9Y256m42rGbMSTG18lUp6urWuzWPiaCMUJ
	wLOX+DeYVO106XiWqfB3UpOO6brumIUqJhd5YjNypyHBqn7cEtVM41luOo42KFqAQxuFCwkF9uR
	Pg0j+OwF7Nk64TW9fSNPXfLU3UA8sb0e39+FDXcJSZdRM0bHlFL5Q==
X-Google-Smtp-Source: AGHT+IF9A5iTeWlskwifh/0CqWcYIS5FZsCAPJsR6+4GND988RvDgFgIrX8riaQCLyJnTInNe6liyA==
X-Received: by 2002:a05:6122:7d1:b0:518:78c7:9b4f with SMTP id 71dfb90a1353d-51c6c437fc9mr14180597e0c.3.1736615722459;
        Sat, 11 Jan 2025 09:15:22 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fbfdc4fsm3053502e0c.23.2025.01.11.09.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 09:15:21 -0800 (PST)
Date: Sat, 11 Jan 2025 12:15:18 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	W_Armin@gmx.de, thomas@t-8ch.de, Hans de Goede <hdegoede@redhat.com>, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <rseoqwcxpgrnnub7spna4ped3mjlgtke4tet4cov37dseqid43@i23cikzwn3ac>
References: <20250109220745.69977-1-josh@joshuagrisham.com>
 <30f6644c-bf35-dd5e-4f1c-d1f1915b97da@linux.intel.com>
 <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>

Hi Joshua,

On Fri, Jan 10, 2025 at 04:59:16PM +0100, Joshua Grisham wrote:
> <snip>
> > > +     /* if startup performance_mode fails to match a profile, try to set init mode */
> > > +     err = get_performance_mode_profile(galaxybook, performance_mode, NULL);
> > > +     if (err) {
> > > +             if (init_performance_mode == GB_PERFORMANCE_MODE_UNKNOWN) {
> > > +                     dev_err(&galaxybook->platform->dev, "missing initial performance mode\n");
> > > +                     return -ENODATA;
> > > +             }
> > > +             err = performance_mode_acpi_set(galaxybook, init_performance_mode);
> > > +             if (err) {
> > > +                     dev_err(&galaxybook->platform->dev,
> > > +                             "failed to set initial performance mode 0x%x\n",
> > > +                             init_performance_mode);
> > > +                     return err;
> >
> > ...why these two cases then result in failing everything vs. just platform
> > profile feature? Not an end of the world but it feels inconsistent to me.
> >
> 
> I am glad you bring this up, as it forces me think through this a few
> more rounds... basically what happens is that the device will always
> come up from a fresh boot with the value of 0x0 as the "current
> performance mode" as response from the ACPI method, even though for
> most devices value 0x0 is the "legacy" optimized value that should not
> be used.

Is this 0x0 mode real or just a placeholder value? i.e. the device always
starts with legacy low-power? 

> 
> In Windows, the Samsung background apps take care of this by storing
> last-used value from previous session and then re-applying it after
> startup (and the same happens with various userspace services on
> platform profile from what I have seen, actually).
> 
> But since the driver does not map 0x0 to any valid profile unless the
> device only has the "legacy" optimized mode, then my function
> get_performance_mode_profile() will return -ENODATA in this initial
> startup state of 0x0. What I noticed is that the first time after this
> that you run platform_profile_cycle() after this, there is a little
> "hiccup" and an error "Failed to get profile for handler .." is
> printed in the kernel log from platform_profile.c (without pr_fmt by
> the way), but then it just works anyway and starts to pick up from the
> first enabled profile and then can continue to cycle.
> 
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
> 
> Possibly more "simple" alternatives I can think of off the top of my head:
> 
> 1. Let get_performance_mode_profile() return 0 instead of -ENODATA if
> nothing is matched , this way a non-mapped performance mode would
> always just set platform_profile_cycle() to the start of the cycle I
> guess/would hope? and/or add a special case in
> get_performance_mode_profile() for performance_mode=0 to just return 0
> to get the same effect ? (though what happens if we have not enabled
> PLATFORM_PROFILE_LOW_POWER in the choices? even though the function
> returned 0, will platform_profile see that 0 is not supported, and
> just keep moving on until it gets to the first one that is? If so then
> this will work, but I have not yet tested or fully checked the code to
> ensure that this will actually be the behavior...)

I don't know if this has been discussed before. If it was you should
follow their advice instead.

The platform_profile module doesn't enforce selected choices when
getting the current profile. Choices are only enforced when setting it.

I suggest that galaxybook_platform_profile_get() should map all known
values to valid platform profile options. Something like:

switch() {
case GB_PERFORMANCE_MODE_SILENT:
	*profile = PLATFORM_PROFILE_LOW_POWER;
	break;
case GB_PERFORMANCE_MODE_QUIET:
	*profile = PLATFORM_PROFILE_QUIET;
	break;
case GB_PERFORMANCE_MODE_OPTIMIZED:
case GB_PERFORMANCE_MODE_OPTIMIZED_LEGACY:
	*profile = PLATFORM_PROFILE_BALANCED;
	break;
case GB_PERFORMANCE_MODE_PERFORMANCE:
case GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY:
	if (ultra)
		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
	else
		*profile = PLATFORM_PROFILE_PERFORMANCE;
	break;
case GB_PERFORMANCE_MODE_ULTRA:
	*profile = PLAFORM_PROFILE_PERFORMANCE;
	break;
default:
	return -ENODATA;
}

Also a quick question. Why isn't silent mapped to
PLATFORM_PROFILE_QUIET. Are there devices that support both
GB_PERFORMANCE_MODE_SILENT and GB_PERFORMANCE_MODE_QUIET? Are this modes
different in nature?

> 
> 2. Try to do the logic which I did with this init_performance_mode,
> but in case init_profile_mode is not set, just skip it and let the
> error come from platform_profile_cycle() anyway and it should start to
> work. In this case I think it would be good if the user is maybe
> flagged somehow and create a bug for this, because I would want to be
> able to work with them to see what modes are reported by their device
> and see if the mapping needs to be updated in some way.
> 
> 3. Do neither of these, remove everything with init_performance_mode,
> and just let platform_profile_cycle() fail upon startup and print the
> error message and then it should just start working after anyway.
> 
> 4. Map 0x0 performance_mode to PLATFORM_PROFILE_CUSTOM in case the

I don't think CUSTOM should be used as a placeholder value.

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
> 
> I do think that something should change, maybe the most
> straight-forward are either 1 or 2 in this list, but not sure if there
> are any opinions or preferences on these or if there are other better
> options I did not think of here?
> 
> > > +static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> > > +                                const char *buf, size_t count)
> > > +{
> > > +     struct galaxybook_fw_attr *fw_attr =
> > > +             container_of(attr, struct galaxybook_fw_attr, current_value);
> > > +     struct samsung_galaxybook *galaxybook = fw_attr->galaxybook;
> > > +
> > > +     bool value;
> >
> > Remove the extra empty line from within variable declarations.
> >
> 
> Yes sorry this was just a miss when so much got moved around due to
> the big changes between v4 and v5; will fix this and the other small
> straight-forward issues for v6 :)
> 
> > --
> >  i.
> 
> Thanks again!
> Joshua
