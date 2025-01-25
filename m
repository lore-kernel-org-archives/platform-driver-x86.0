Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08210207E0F;
	Sat, 25 Jan 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737807991; cv=none; b=IQnrfbqWHMdXbPRWzjSS76woREhO9cAPXCJv5c4U7DtqSHxpUuit/IPLjCkry4+Au+1pbyPrBH2s4ZyEItJTlzUo0OovMG4tC8PYd2WtXzIAEWgOT8L7yjwT2w3nDU3ZF6uobcgsfrTAaxm6K/Etf5BK390lrHy+FyYTumgU5Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737807991; c=relaxed/simple;
	bh=5WsKxLsrhYzHlb2Zxo+QF4yxwYwUsN6JWhMif8mtfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHoYdHIIs9uAj+6dqoPxrKvYDG0BDaDqa61K6U7shrHKzk3hFN5/md13bE0ce3wp9IAUWXzwP4CpmhkclbkttCkBuY3ziSEqM4NaZjFlYj26D84OrhXbw+0ZJzdolLzAk8dN4yI4ZHeIfzhsfJddL/XewUcqey/eCHl5Ao/2H4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ccILfgOb; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ccILfgOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1737807986;
	bh=5WsKxLsrhYzHlb2Zxo+QF4yxwYwUsN6JWhMif8mtfTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccILfgObyXrUG1/jrruqgK10r4Yl3czyX6JinM3ZOtdSpURdZ/0rXcZ08NuXcdw2w
	 WuDOULfyzY4oPfMB5FCR27VnvSWNu1uS4ttkgOgF4fTml5zwlhrNY6LlYmoLOOh5ku
	 /Z0IskNQTwXFTZLeUvRrzSfHZknCmPAbPBH8vAI4=
Date: Sat, 25 Jan 2025 13:26:26 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: W_Armin@gmx.de, kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <d242d780-9084-45c6-8df4-a78b48b80059@t-8ch.de>
References: <20250118202632.8352-1-josh@joshuagrisham.com>
 <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
 <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>

On 2025-01-25 12:45:02+0100, Joshua Grisham wrote:
> Hi Thomas, thank you for the review and taking the time to go through it again!
> 
> Den fre 24 jan. 2025 kl 00:42 skrev Thomas Weißschuh <linux@weissschuh.net>:
> >
> > Hi Joshua,
> >
> > looks good to me.
> > I have some nitpicks inline, but even for the current state:
> >
> > Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> >
> > > +static ssize_t charge_control_end_threshold_show(struct device *dev, struct device_attribute *attr,
> > > +                                              char *buf)
> > > +{
> > > +     struct samsung_galaxybook *galaxybook =
> > > +             container_of(attr, struct samsung_galaxybook, charge_control_end_threshold_attr);
> > > +     u8 value;
> > > +     int err;
> > > +
> > > +     err = charge_control_end_threshold_acpi_get(galaxybook, &value);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     /*
> > > +      * device stores "no end threshold" as 0 instead of 100;
> > > +      * if device has 0, report 100
> > > +      */
> > > +     if (value == 0)
> > > +             value = 100;
> > > +
> > > +     return sysfs_emit(buf, "%u\n", value);
> > > +}
> >
> > For the next revision you should be able to use the power supply
> > extension framework.
> >
> 
> I looked around a bit in the mailing lists and saw some of the
> proposed patches now which add power_supply_sysfs_add_extension() and
> similar functions, but do not see them yet in for-next of the pdx86
> repository. Do you think it makes more sense to wait on
> samsung-galaxybook and then add these changes from the start, or go
> ahead with samsung-galaxybook and then update it after with using the
> new framework?

The API is power_supply_register_extension().
Indeed this is not yet part of the pdx86/for-next branch, as that is
still based upon v6.13-rc1 while power_supply_register_extension() will
only be available with v6.14-rc1 (to be released next Sunday).
However we are currently in the middle of the merge window for v6.14.
So your driver won't make it into v6.14 in any case and by the time it
can be applied to pdx86/for-next that branch will be based on v6.14-rc1.

So either wait a week or merge in power-supply/for-next manually.

Or you decide that I am annoying to push you to adopt my own feature and
just go without it :-)

> > > +
> > > +#define gb_pfmode(profile) galaxybook->profile_performance_modes[profile]
> >
> > The usage sites of this macro don't look like regular C syntax.
> > This is iffy and can confuse some code parsers.
> > Any chance it could be reworked to look more regular?
> >
> 
> Good point, and to be honest the only reason for this was to give me a
> way to keep all of the lines below 100 characters :) Now I have just
> made it a local pointer within galaxybook_platform_profile_probe in
> order to achieve the same effect, so hopefully it looks and feels more
> "standard" now, but please take a look when I eventually send this
> later as v9 !

Sounds good.

> > > +static const struct platform_profile_ops galaxybook_platform_profile_ops = {
> > > +     .probe = galaxybook_platform_profile_probe,
> > > +     .profile_get = galaxybook_platform_profile_get,
> > > +     .profile_set = galaxybook_platform_profile_set,
> > > +};
> > > +
> > > +static int galaxybook_platform_profile_init(struct samsung_galaxybook *galaxybook)
> > > +{
> > > +     struct device *platform_profile_dev;
> > > +     u8 performance_mode;
> > > +     int err;
> > > +
> > > +     /* check that performance mode appears to be supported on this device */
> > > +     err = performance_mode_acpi_get(galaxybook, &performance_mode);
> > > +     if (err) {
> > > +             dev_dbg(&galaxybook->platform->dev,
> > > +                     "failed to get initial performance mode, error %d\n", err);
> > > +             return 0;
> > > +     }
> > > +
> > > +     galaxybook->has_performance_mode = true;
> >
> > This should be set *after* devm_platform_profile_register() succeeded, no?
> > I would prefer it slightly if the flags where set by galaxybook_probe()
> > instead of the _init() functions.
> >
> 
> Here it gets a bit tricky. Originally, I had much of the logic from
> galaxybook_platform_profile_probe in this
> galaxybook_platform_profile_init function, as I really wanted to
> evaluate if all of the ACPI methods were working and it was possible
> to map at least one Samsung "performance mode" to a profile, but
> feedback from Kurt (which I agree with) is that it is within the probe
> that should really be handling this kind of logic.
> 
> At that point I decided that it was ONLY success of
> performance_mode_acpi_get that I am now using to determine
> has_performance_mode, so I set it immediately after more from a
> "self-documenting" perspective.
> 
> Now the code works so that if galaxybook_platform_profile_probe fails,
> then that failure will bubble up to galaxybook_probe which will then
> cause the entire driver to unload ... so it will not matter anyway if
> or where the value was set, the module will no longer even be loaded
> :)
> 
> Regarding setting all of these "feature flags" in galaxybook_probe, I
> think this will be even more tricky now that I have refactored to
> actually fail the galaxybook_probe for "valid failures" (e.g. I have
> detected that the device does seem to support kbd_backlight, for
> example (the ACPI method to get the brightness gave an expected
> result) but there was some kind of failure when registering the LED
> class... which, yes, in this case I would guess we DO want that it
> should fail and the driver should be unloaded, because something that
> definitely SHOULD work has failed ---- that is the thinking, now,
> anyway)
> 
> These flags are mostly being used to control behavior after the driver
> has probed and the user is interacting with various things from the
> userspace (e.g. pressing hotkeys) -- we don't want the driver to try
> and use features that we detected during the probe are not supported
> on the particular device the driver is running on.
> 
> So essentially I want that the various init() functions called from
> galaxybook_probe will return 0 (success) even if the feature is not
> supported, but internally within that respective init() function I may
> have disabled the feature (has_kbd_backlight=false for example).
> Because of this then I think it would be a bit tricky to try and
> implement setting the flags back in galaxybook_probe (e.g. need to
> create some kind of custom return facility that indicates if there was
> a "real error" vs if the feature is not supported but the probe should
> continue?). To me it sounds a bit more complicated and potentially
> "hacky" but if you have a good suggestion on how this could be done in
> a better way then I would most definitely welcome it!
> 
> The only thing that comes immediately to mind is that I could pass a
> pointer to the flags in the init method (e.g. "err =
> galaxybook_kbd_backlight_init(galaxybook,
> &galaxybook->has_kdb_backlight);" within galaxybook_probe) but it
> feels more confusing and kind of same-same result compared to what
> there is now (that the logic for setting the value would still be
> within the init functions anyway....)
> 
> Past ALL of that I do not have any strong opinions on if setting
> has_performance_mode should come before or after
> devm_platform_profile_register and am fine to change it if it should
> be changed. As I mentioned before, I did it this way as it felt more
> "self-documenting" and also keeping in mind that if
> devm_platform_profile_register returns nonzero then the whole driver
> will be unloaded anyway so it would not matter :)

You could designate a special error code to mean:
"This feature is not supported, but that's fine and continue probing".

For example EOPNOTSUPP:

ret = init_foo();
if (ret == 0)
	priv->have_foo;
elif (ret != EOPNOTSUPP)
	return ret;

ret = init_bar();
...

[snip]
