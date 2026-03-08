Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBAB3358D6
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772963144; cv=none; b=Ekgc11IUoEt2ydkjPv554oeC1mexY/bqYn+qHrr+KvArFbltaKoVyCFUF3IqXmytZpZX9IrRybwfSWGuTfehMUVVhfSLx9gmZY8oZtlhANuw27yAk8qJHP0YVZcj4Qz8V2Pv2fU1uqLS+Riqjmc7C1Du/9ix8usvE8Bc0rhAqXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772963144; c=relaxed/simple;
	bh=c+f7w0p/0mG9LuZ1/cE1wPBCYTT2zzYdF65G5uXx5s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNiVFuoxCWgED72ynTJzUMcio0lmkf9ZC8Lq7awGBo/96Y43/2rk7zs1EXqrp0f8T3KG6neswO3rQtZmmVzqHJvj+i9d7LQZNhcXDvx1qmtJI1GEBE7HNiwtfcQNn7j775yUvDZv3qIveLttAFbdYPG8bJfz4Fpo6jgv0CXoeSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QhxvSsGc; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QhxvSsGc"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 8B93DC01A0
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 11:45:41 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 4DD32C5880
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 11:45:40 +0200 (EET)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 8EADF200B8C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 11:45:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772963140;
	bh=E+uENpnNzL0ICbx07UEw+/r7IZ3dJqJyxnjN01ILNss=;
	h=Received:From:Subject:To;
	b=QhxvSsGcngdSXMiR6/V2OyIzjhmRXG4pnQM6UJnfeV4U9YpE4S2/XJhq8miEARatG
	 Of6/+v0OVILhSuQ6kHw3zeY+eO45HtI9xl1LV0JwaFtwyQpMACQxXZAjgn7s3nZce4
	 rvh5x2GLOt7+ThgvImkupvzY/RiL3MdZAf8au9GkcIxNpr54HHve0+B9rkolJZq48j
	 YdcczaahDAQhsE2XTt6XAseq7p7h/gMDowSas1zT6Y3tX+I2cL7gajdUrETe2RKOa4
	 recJ4I6NR7RaN3yVVegJePpyfWuKwvSNITVgoj8krCV8Iz0mta9UB5plPG3nMzv0GA
	 JQCKBmFtHPoBg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.210.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pf1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-829781b2b01so2681254b3a.2
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 08 Mar 2026 01:45:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWINTxuKxOHP40VahJGUndSJGrv6q+gJAFydNIgnjv706xVeiiLiXiVmzEdjwrbeRkvH0qvUrsvhU5BJCHFVPzqpUB/@vger.kernel.org
X-Gm-Message-State: AOJu0YxWueNOLIkP0LZAkZv1R9OIZhEBikd5rtzWT06izh0GLMfmy7wV
	iUR0Ud4ubS+xT3kHbhR5eFUjvo8/t1MrYk2mrEDS4kBegbFUoye92iLzPmc47ziNM6Q5pKJPPJ7
	hXQd6d5+NW1tUGg68YdtjFcjeEyzd2E4=
X-Received: by 2002:a05:6a00:2e98:b0:81e:4476:f67c with SMTP id
 d2e1a72fcca58-829a2d6e534mr7059310b3a.3.1772963138172; Sun, 08 Mar 2026
 01:45:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307115516.26892-1-lkml@antheas.dev>
 <20260307115516.26892-4-lkml@antheas.dev>
 <f416507304bb4c7c179109ff10bc97a2daeb7e87.camel@rong.moe>
 <CAGwozwH9+rcdqgTufBXBX+ocB9uYU==X5OciQijuFAVmX19YMw@mail.gmail.com>
 <e99134fb56ec3d660a85886626be237921950d3d.camel@rong.moe>
In-Reply-To: <e99134fb56ec3d660a85886626be237921950d3d.camel@rong.moe>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 8 Mar 2026 10:45:24 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF5OGcBJuTKV1XvuwotEVCR=LifsaXMqeJHxErE1=ebiA@mail.gmail.com>
X-Gm-Features: AaiRm51t7g3EKf4opAonjpcjdCug-v4elV35ghvhKMkbMT9m7tfl8KgKYxOPfhE
Message-ID: 
 <CAGwozwF5OGcBJuTKV1XvuwotEVCR=LifsaXMqeJHxErE1=ebiA@mail.gmail.com>
Subject: Re: [RFC v3 3/4] platform/x86/amd: dptc: Add platform profile support
To: Rong Zhang <i@rong.moe>
Cc: Mario.Limonciello@amd.com, W_Armin@gmx.de, sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com, derekjohn.clark@gmail.com, denis.benato@linux.dev,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177296313998.1815832.724883826206696812@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 8 Mar 2026 at 10:36, Rong Zhang <i@rong.moe> wrote:
>
> Hi Antheas,
>
> On Sat, 2026-03-07 at 23:45 +0100, Antheas Kapenekakis wrote:
> > On Sat, 7 Mar 2026 at 22:57, Rong Zhang <i@rong.moe> wrote:
> > >
> > > Hi Antheas,
> > >
> > > On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> > > > Register a platform_profile handler so the driver exposes standard
> > > > power profiles (low-power, balanced, performance, max-power) alongside
> > > > the manual tunable interface. max-power is only supplied when the
> > > > performance profile's preset values are below the tunable limits.
> > > >
> > > > When a non-custom profile is active, parameter writes are blocked
> > > > (-EPERM) and current_value reflects the profile's preset values.
> > > > Selecting the "custom" profile returns control to the user for manual
> > > > staging and committing. On resume, the active profile is automatically
> > > > re-applied.
> > > >
> > > > Assisted-by: Claude:claude-opus-4-6
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  drivers/platform/x86/amd/Kconfig |   1 +
> > > >  drivers/platform/x86/amd/dptc.c  | 116 +++++++++++++++++++++++++++++--
> > > >  2 files changed, 113 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> > > > index d610092467fc..41ffbd722524 100644
> > > > --- a/drivers/platform/x86/amd/Kconfig
> > > > +++ b/drivers/platform/x86/amd/Kconfig
> > > > @@ -48,6 +48,7 @@ config AMD_ISP_PLATFORM
> > > >  config AMD_DPTC
> > > >       tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
> > > >       depends on X86_64 && ACPI && DMI
> > > > +     select ACPI_PLATFORM_PROFILE
> > > >       select FIRMWARE_ATTRIBUTES_CLASS
> > > >       help
> > > >         Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> > > > diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> > > > index acfe9cc01bab..1f07e2e6f278 100644
> > > > --- a/drivers/platform/x86/amd/dptc.c
> > > > +++ b/drivers/platform/x86/amd/dptc.c
> > > > @@ -23,6 +23,7 @@
> > > >  #include <linux/module.h>
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/platform_device.h>
> > > > +#include <linux/platform_profile.h>
> > > >  #include <linux/processor.h>
> > > >  #include <linux/sysfs.h>
> > > >  #include <linux/unaligned.h>
> > > > @@ -56,8 +57,13 @@ struct dptc_param_limits {
> > > >       u32 expanded_max;
> > > >  };
> > > >
> > > > +struct dptc_profile {
> > > > +     u32 vals[DPTC_NUM_PARAMS];      /* 0 = don't set / unstage this param */
> > > > +};
> > > > +
> > > >  struct dptc_device_limits {
> > > >       struct dptc_param_limits params[DPTC_NUM_PARAMS];
> > > > +     struct dptc_profile profiles[PLATFORM_PROFILE_LAST];
> > > >  };
> > > >
> > > >  struct dptc_param_desc {
> > > > @@ -85,6 +91,10 @@ static const struct dptc_device_limits limits_maxhh = { .params = {
> > > >       [DPTC_PPT_PL2_SPPT] = {  0,  4, 27,  82, 100 },
> > > >       [DPTC_PPT_PL3_FPPT] = {  0,  4, 40,  85, 100 },
> > > >       [DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
> > > > +}, .profiles = {
> > > > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = { 15, 15, 25, 0 } },
> > > > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 25, 27, 40, 0 } },
> > > > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 60, 63, 85, 0 } },
> > > >  }};
> > > >
> > > >  /* Substring matches against boot_cpu_data.x86_model_id; order matters. */
> > > > @@ -134,6 +144,9 @@ struct dptc_priv {
> > > >
> > > >       bool expanded;
> > > >
> > > > +     enum platform_profile_option profile;
> > > > +     struct device *ppdev;
> > > > +
> > > >       enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;
> > > >
> > > >       u32 staged[DPTC_NUM_PARAMS];
> > > > @@ -269,6 +282,14 @@ static ssize_t dptc_current_value_show(struct kobject *kobj,
> > > >
> > > >       guard(mutex)(&dptc->lock);
> > > >
> > > > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
> > > > +             u32 val = dptc->dev_limits->profiles[dptc->profile].vals[ps->idx];
> > > > +
> > > > +             if (!val)
> > > > +                     return sysfs_emit(buf, "\n");
> > > > +             return sysfs_emit(buf, "%u\n", val);
> > > > +     }
> > > > +
> > > >       if (!dptc->has_staged[ps->idx])
> > > >               return sysfs_emit(buf, "\n");
> > > >       return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> > > > @@ -287,6 +308,8 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
> > > >       if (count == 1 && buf[0] == '\n') {
> > > >               guard(mutex)(&dptc->lock);
> > > >
> > > > +             if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> > > > +                     return -EPERM;
> > >
> > > It has nothing to do with permissions. I'd prefer -EBUSY.
> >
> > I will defer to other drivers and update if necessary based on their choices.
>
> Here it isn't about consistency, but correctness. If something has
> nothing to do with permissions, -EPERM is confusing. -EBUSY tells users
> that the interface is under some other thing's (i.e., platform profile)
> control.

Both EBUSY and EPERM are non-ideal. I will edge towards EBUSY or
implement the error of the other drivers if it is different as it is
precedent.

> >
> > > To maintain readability, usually a blank line should be added after
> > > returning early.
> > >
> > > >               dptc->has_staged[ps->idx] = false;
> > > >               return count;
> > > >       }
> > > > @@ -297,6 +320,8 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
> > > >
> > > >       guard(mutex)(&dptc->lock);
> > > >
> > > > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> > > > +             return -EPERM;
> > > >       min = dptc_get_min(dptc, ps->idx);
> > > >       max = dptc_get_max(dptc, ps->idx);
> > > >       if (val < min || (max && val > max))
> > > > @@ -426,6 +451,8 @@ static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
> > > >
> > > >       guard(mutex)(&dptc->lock);
> > > >
> > > > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> > > > +             return -EPERM;
> > >
> > > IMO kstrtou32() isn't really a blocker of acquiring the mutex earlier
> > > to prevent duplicating the same check. After all, firmware-attributes
> > > is not a performance critical interface, and dptc_save_settings_store()
> > > also calls sysfs_eq() with the mutex held.
> > >
> > > >       dptc->expanded = val;
> > > >       /* Clear staged values: limits changed, old values may be out of range */
> > > >       memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> > > > @@ -594,6 +621,78 @@ static void dptc_kset_unregister(void *data)
> > > >       kset_unregister(data);
> > > >  }
> > > >
> > > > +/* Platform profile */
> > > > +
> > > > +static void dptc_apply_profile(struct dptc_priv *dptc,
> > > > +                            enum platform_profile_option profile)
> > > > +{
> > > > +     const struct dptc_profile *pp;
> > > > +     int i;
> > > > +
> > > > +     memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> > > > +
> > > > +     if (profile == PLATFORM_PROFILE_CUSTOM)
> > > > +             return;
> > > > +
> > > > +     pp = &dptc->dev_limits->profiles[profile];
> > > > +     for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> > > > +             if (!pp->vals[i])
> > > > +                     continue;
> > > > +             dptc->staged[i] = pp->vals[i];
> > > > +             dptc->has_staged[i] = true;
> > > > +     }
> > > > +}
> > > > +
> > > > +static int dptc_pp_probe(void *drvdata, unsigned long *choices)
> > > > +{
> > > > +     struct dptc_priv *dptc = drvdata;
> > > > +     int i, j;
> > > > +
> > > > +     set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> > > > +     for (i = 0; i < PLATFORM_PROFILE_LAST; i++) {
> > > > +             for (j = 0; j < DPTC_NUM_PARAMS; j++) {
> > > > +                     if (dptc->dev_limits->profiles[i].vals[j]) {
> > > > +                             set_bit(i, choices);
> > > > +                             break;
> > > > +                     }
> > > > +             }
> > > > +     }
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int dptc_pp_get(struct device *dev,
> > > > +                    enum platform_profile_option *profile)
> > > > +{
> > > > +     struct dptc_priv *dptc = dev_get_drvdata(dev);
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     *profile = dptc->profile;
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int dptc_pp_set(struct device *dev,
> > > > +                    enum platform_profile_option profile)
> > > > +{
> > > > +     struct dptc_priv *dptc = dev_get_drvdata(dev);
> > > > +     int ret = 0;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     dptc->profile = profile;
> > > > +     dptc_apply_profile(dptc, profile);
> > > > +     if (profile != PLATFORM_PROFILE_CUSTOM)
> > > > +             ret = dptc_alib_save(dptc);
> > >
> > > I'd prefer simply calling dptc_alib_save() in dptc_apply_profile()
> > > since the latter already checks the profile.
> >
> > This way you will propagate an error because custom unstages all values.
>
> I meant:
>
> static int dptc_apply_profile(struct dptc_priv *dptc,
>                               enum platform_profile_option profile)
> {
>         const struct dptc_profile *pp;
>         int i;
>
>         memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
>
>         if (profile == PLATFORM_PROFILE_CUSTOM)
>                 return 0; /* You've checked this and returned early!
> */
>
>         pp = &dptc->dev_limits->profiles[profile];
>         for (i = 0; i < DPTC_NUM_PARAMS; i++) {
>                 if (!pp->vals[i])
>                         continue;
>                 dptc->staged[i] = pp->vals[i];
>                 dptc->has_staged[i] = true;
>         }
>
>         return dptc_alib_save(dptc);
> }
>
> How can an error being propagated?

I missed that. I inferred your comment as suggesting to remove the `
if (profile != PLATFORM_PROFILE_CUSTOM)` block, which would propagate
an error. I will consider consolidating apply_profile.

Antheas

> >
> > Antheas
> >
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static const struct platform_profile_ops dptc_pp_ops = {
> > > > +     .probe       = dptc_pp_probe,
> > > > +     .profile_get = dptc_pp_get,
> > > > +     .profile_set = dptc_pp_set,
> > > > +};
> > > > +
> > > >  static int dptc_resume(struct device *dev)
> > > >  {
> > > >       struct dptc_priv *dptc = dev_get_drvdata(dev);
> > > > @@ -601,10 +700,14 @@ static int dptc_resume(struct device *dev)
> > > >
> > > >       guard(mutex)(&dptc->lock);
> > > >
> > > > -     if (dptc->save_mode == SAVE_SINGLE)
> > > > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
> > > > +             dptc_apply_profile(dptc, dptc->profile);
> > > >               ret = dptc_alib_save(dptc);
> > > > -     else
> > > > +     } else if (dptc->save_mode == SAVE_SINGLE) {
> > > > +             ret = dptc_alib_save(dptc);
> > > > +     } else {
> > > >               ret = 0;
> > > > +     }
> > > >
> > > >       if (ret)
> > > >               dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
> > > > @@ -636,8 +739,7 @@ static int dptc_probe(struct platform_device *pdev)
> > > >                boot_cpu_data.x86_model_id);
> > > >
> > > >       dptc->fw_attr_dev = device_create(&firmware_attributes_class,
> > > > -                                       NULL, MKDEV(0, 0), NULL,
> > > > -                                       DRIVER_NAME);
> > > > +                                       NULL, MKDEV(0, 0), NULL, DRIVER_NAME);
> > >
> > > Squash the change into the previous patch.
> > >
> > > Thanks,
> > > Rong
> > >
> > > >       if (IS_ERR(dptc->fw_attr_dev))
> > > >               return PTR_ERR(dptc->fw_attr_dev);
> > > >
> > > > @@ -680,6 +782,12 @@ static int dptc_probe(struct platform_device *pdev)
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > +     dptc->profile = PLATFORM_PROFILE_CUSTOM;
> > > > +     dptc->ppdev = devm_platform_profile_register(dev, "amd-dptc", dptc,
> > > > +                                                  &dptc_pp_ops);
> > > > +     if (IS_ERR(dptc->ppdev))
> > > > +             return PTR_ERR(dptc->ppdev);
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > >
>

