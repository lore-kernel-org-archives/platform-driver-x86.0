Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4EE192B74;
	Sat, 25 Jan 2025 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737805518; cv=none; b=FTxIi9MF19IZ4279JlV7eGr6pQc0KJb91mzVhRNN4MNh3cyqc/RYQOOZYKxHOnRW9sU3ET/JfeVHmoJ0CU5JTA9YXpAgmnvJfuDWgtF9Mqfx6U3FBHqzVvDQqnxuEXAPhxBZCbVeBnsDpH0/bRVnlhUNlihSPSS+XuAFnPU5E78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737805518; c=relaxed/simple;
	bh=O+O9XFMUOIfEtwyMv6cWgTEbE478kC4HVjNm52RXYno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugpFnhKADP98mLijlAyfkF5oU1EQbF2sSYVeYWmDCg3T+WiVhH34ljhc0YcjVzgVd/rkdAW5GqdBW0jSLrGEosPSh+I24qmBAcj/zFFrJBouHgTrrFfggjuPsQpURsghiflkdo4qAIC7ZsaejW59JpHtiJC4XtONZGPicfg2S+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ce87d31480so9088615ab.2;
        Sat, 25 Jan 2025 03:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737805515; x=1738410315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEf5etmqyzGkuXtGRWBT6v2Ks3npZYSZ+KWs5DlHyww=;
        b=PD4wn0SYJqIQLx6kIyuyXCAzll5tJjWL9F8TnhIsSfVAAu2rkah8wihgfYW99b9hu6
         Bnwd9ot+GDygVGcN8sdzRE+l1ARwPrnKaw+nl5ApDW2hD9ybjv4tvzl+5hpiv+nUd5gE
         kLWvdHcP/5h2ddmqGB6s6o3MjDaysSMKZKbYfGEE1wBPpA2T0yzy1eHCfHuZiyUROHWa
         uZZqExfvccLeS3Hs74al/oiD4xML3v5uf0xNJsZcm6h/UEgNQnviXWoehUQ57SXA7ciZ
         zILMk15rLyT5QutCUx/bGxuKny4U8FoVoMGF6vwBKi0oAn+aIOEvwwCUZtrekA+0BmOk
         u3dg==
X-Forwarded-Encrypted: i=1; AJvYcCU8t1bjZ3bBxX2wGUiMaO6MfjcbbZwC+siUzNSYYNqR9Z7XspJ2vpTakqUNIplztXtN5GcKE/wxd/iOGm6cAcIfwSnOkQ==@vger.kernel.org, AJvYcCWx9aaMS0Bt08HQvDoSfo8Qkt+db1iD1tmCRaUYRmKmHJj+8bj1mIPKi9gUsuTIvCu7aZ7Z8dWgvdg=@vger.kernel.org, AJvYcCXbGnVNg3CAq+usbXD0aIv2gdKvK3YsPzZBdkYXF8ifL8C/HGRHZQTMCur7E7BH7gyS/yIJvIFAvFsRURhk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ROUKYukbxfV1yKjwCjor4AhsWr9OgQDtGn/mKZ36f04dDQgx
	37uXcJ1JXN4A8YcM/KysMu3Qud9McmR1PHjcBVaSZrkxIkRNH7eXiexzNdYpp3Q=
X-Gm-Gg: ASbGncuUZ7FQimtl4iWzoFmxCU62/feDve/hR424zJDaV2BsVNtzIZxvqPkSt9RRAh+
	o3gBr57uQ2BemZg4fbLWXoWd5qywEVE2TVPQfFS3BHsWjc7S3eovn0cyq3lRnJgz5ztqtGqkVqZ
	F2uemMqNjR6OhLOTHRxku47avo5bjS0e1zIjvXoa5OwCwshLklywmpmArpuKiMmDHeTK1akN+YC
	VhBpQr4Y/SHli718Rt0/XwU6shLFX8ho8tz04Zmmp7s3RPV/maI8u/2rS2HP1f1XXAl7xdx6dVj
	FeGCjW7jCh2X94n6Saryc1lvxF/uxJYJXUYNh823YQpiJA==
X-Google-Smtp-Source: AGHT+IG7n+yp16Df8POwUUNGxV4eneP5lqESN2lIU/DYc2APPJYW2Cz5u0bjg5Vsls3bgkqbjNCMhA==
X-Received: by 2002:a05:6e02:1fc1:b0:3cf:b7c0:8819 with SMTP id e9e14a558f8ab-3cfb7c08acfmr96210235ab.9.1737805514489;
        Sat, 25 Jan 2025 03:45:14 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da03a18sm1319612173.23.2025.01.25.03.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 03:45:14 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-84cdacbc373so86404139f.1;
        Sat, 25 Jan 2025 03:45:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5ZKT7N4/eQzLwu4R8U5C54JRJOATVToDmyS0T4bAPX4lRmdMtZCCr3E9FrcztBhMxxGSXII3QC3j4zXllKGjOlblA1w==@vger.kernel.org, AJvYcCVKY3ZlNx9KuLM3YriLb53C9AtnXDKa75x+GOI+X8srmBIURZr+AiR3ThIOCT9imi1UQa7VTHMPCQQ=@vger.kernel.org, AJvYcCWsgIrGwUTTGqPXQxEsb2uDldaOahoFHYmwBzPrTbyaTP27IGI9ATh9E0KQ7iQX8KZoRNRCpCsAE/cubt1f@vger.kernel.org
X-Received: by 2002:a92:cda5:0:b0:3ce:6758:2500 with SMTP id
 e9e14a558f8ab-3cf74418e88mr209106165ab.13.1737805513952; Sat, 25 Jan 2025
 03:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118202632.8352-1-josh@joshuagrisham.com> <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
In-Reply-To: <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sat, 25 Jan 2025 12:45:02 +0100
X-Gmail-Original-Message-ID: <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>
X-Gm-Features: AWEUYZlI2XyjPACzgATKR4hd2QpSon3pkkDqOmhMmXMVT1SYwvIXKS3iA909AQk
Message-ID: <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: W_Armin@gmx.de, kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas, thank you for the review and taking the time to go through it ag=
ain!

Den fre 24 jan. 2025 kl 00:42 skrev Thomas Wei=C3=9Fschuh <linux@weissschuh=
.net>:
>
> Hi Joshua,
>
> looks good to me.
> I have some nitpicks inline, but even for the current state:
>
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
> > +static ssize_t charge_control_end_threshold_show(struct device *dev, s=
truct device_attribute *attr,
> > +                                              char *buf)
> > +{
> > +     struct samsung_galaxybook *galaxybook =3D
> > +             container_of(attr, struct samsung_galaxybook, charge_cont=
rol_end_threshold_attr);
> > +     u8 value;
> > +     int err;
> > +
> > +     err =3D charge_control_end_threshold_acpi_get(galaxybook, &value)=
;
> > +     if (err)
> > +             return err;
> > +
> > +     /*
> > +      * device stores "no end threshold" as 0 instead of 100;
> > +      * if device has 0, report 100
> > +      */
> > +     if (value =3D=3D 0)
> > +             value =3D 100;
> > +
> > +     return sysfs_emit(buf, "%u\n", value);
> > +}
>
> For the next revision you should be able to use the power supply
> extension framework.
>

I looked around a bit in the mailing lists and saw some of the
proposed patches now which add power_supply_sysfs_add_extension() and
similar functions, but do not see them yet in for-next of the pdx86
repository. Do you think it makes more sense to wait on
samsung-galaxybook and then add these changes from the start, or go
ahead with samsung-galaxybook and then update it after with using the
new framework?

> > +
> > +#define gb_pfmode(profile) galaxybook->profile_performance_modes[profi=
le]
>
> The usage sites of this macro don't look like regular C syntax.
> This is iffy and can confuse some code parsers.
> Any chance it could be reworked to look more regular?
>

Good point, and to be honest the only reason for this was to give me a
way to keep all of the lines below 100 characters :) Now I have just
made it a local pointer within galaxybook_platform_profile_probe in
order to achieve the same effect, so hopefully it looks and feels more
"standard" now, but please take a look when I eventually send this
later as v9 !

> > +static const struct platform_profile_ops galaxybook_platform_profile_o=
ps =3D {
> > +     .probe =3D galaxybook_platform_profile_probe,
> > +     .profile_get =3D galaxybook_platform_profile_get,
> > +     .profile_set =3D galaxybook_platform_profile_set,
> > +};
> > +
> > +static int galaxybook_platform_profile_init(struct samsung_galaxybook =
*galaxybook)
> > +{
> > +     struct device *platform_profile_dev;
> > +     u8 performance_mode;
> > +     int err;
> > +
> > +     /* check that performance mode appears to be supported on this de=
vice */
> > +     err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> > +     if (err) {
> > +             dev_dbg(&galaxybook->platform->dev,
> > +                     "failed to get initial performance mode, error %d=
\n", err);
> > +             return 0;
> > +     }
> > +
> > +     galaxybook->has_performance_mode =3D true;
>
> This should be set *after* devm_platform_profile_register() succeeded, no=
?
> I would prefer it slightly if the flags where set by galaxybook_probe()
> instead of the _init() functions.
>

Here it gets a bit tricky. Originally, I had much of the logic from
galaxybook_platform_profile_probe in this
galaxybook_platform_profile_init function, as I really wanted to
evaluate if all of the ACPI methods were working and it was possible
to map at least one Samsung "performance mode" to a profile, but
feedback from Kurt (which I agree with) is that it is within the probe
that should really be handling this kind of logic.

At that point I decided that it was ONLY success of
performance_mode_acpi_get that I am now using to determine
has_performance_mode, so I set it immediately after more from a
"self-documenting" perspective.

Now the code works so that if galaxybook_platform_profile_probe fails,
then that failure will bubble up to galaxybook_probe which will then
cause the entire driver to unload ... so it will not matter anyway if
or where the value was set, the module will no longer even be loaded
:)

Regarding setting all of these "feature flags" in galaxybook_probe, I
think this will be even more tricky now that I have refactored to
actually fail the galaxybook_probe for "valid failures" (e.g. I have
detected that the device does seem to support kbd_backlight, for
example (the ACPI method to get the brightness gave an expected
result) but there was some kind of failure when registering the LED
class... which, yes, in this case I would guess we DO want that it
should fail and the driver should be unloaded, because something that
definitely SHOULD work has failed ---- that is the thinking, now,
anyway)

These flags are mostly being used to control behavior after the driver
has probed and the user is interacting with various things from the
userspace (e.g. pressing hotkeys) -- we don't want the driver to try
and use features that we detected during the probe are not supported
on the particular device the driver is running on.

So essentially I want that the various init() functions called from
galaxybook_probe will return 0 (success) even if the feature is not
supported, but internally within that respective init() function I may
have disabled the feature (has_kbd_backlight=3Dfalse for example).
Because of this then I think it would be a bit tricky to try and
implement setting the flags back in galaxybook_probe (e.g. need to
create some kind of custom return facility that indicates if there was
a "real error" vs if the feature is not supported but the probe should
continue?). To me it sounds a bit more complicated and potentially
"hacky" but if you have a good suggestion on how this could be done in
a better way then I would most definitely welcome it!

The only thing that comes immediately to mind is that I could pass a
pointer to the flags in the init method (e.g. "err =3D
galaxybook_kbd_backlight_init(galaxybook,
&galaxybook->has_kdb_backlight);" within galaxybook_probe) but it
feels more confusing and kind of same-same result compared to what
there is now (that the logic for setting the value would still be
within the init functions anyway....)

Past ALL of that I do not have any strong opinions on if setting
has_performance_mode should come before or after
devm_platform_profile_register and am fine to change it if it should
be changed. As I mentioned before, I did it this way as it felt more
"self-documenting" and also keeping in mind that if
devm_platform_profile_register returns nonzero then the whole driver
will be unloaded anyway so it would not matter :)

> > +static ssize_t current_value_store(struct kobject *kobj, struct kobj_a=
ttribute *attr,
> > +                                const char *buf, size_t count)
> > +{
> > +     struct galaxybook_fw_attr *fw_attr =3D
> > +             container_of(attr, struct galaxybook_fw_attr, current_val=
ue);
> > +     struct samsung_galaxybook *galaxybook =3D fw_attr->galaxybook;
> > +     bool value;
> > +     int err;
> > +
> > +     if (!count)
> > +             return -EINVAL;
> > +
> > +     err =3D kstrtobool(buf, &value);
> > +     if (err)
> > +             return err;
> > +
> > +     guard(mutex)(&galaxybook->fw_attr_lock);
> > +
> > +     err =3D fw_attr->set_value(galaxybook, value);
> > +     if (err)
> > +             return err;
> > +
> > +     return count;
> > +}
> > +
> > +static ssize_t current_value_show(struct kobject *kobj, struct kobj_at=
tribute *attr, char *buf)
> > +{
> > +     struct galaxybook_fw_attr *fw_attr =3D
> > +             container_of(attr, struct galaxybook_fw_attr, current_val=
ue);
> > +     bool value;
> > +     int err;
> > +
> > +     err =3D fw_attr->get_value(fw_attr->galaxybook, &value);
> > +     if (err)
> > +             return err;
> > +
> > +     return sysfs_emit(buf, "%u\n", value);
> > +}
>
> _show() is normally defined before _store().
>

Thanks for catching this! I have now gone through the entire driver
and tried to match this pattern ("get" before "set" for the ACPI
method functions, and "show" before "store" for all of the sysfs attr
functions) -- this update will come in v9 of the patch.

> > +     err =3D sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_=
attr->attr_group);
> > +     if (err)
> > +             return err;
> > +
> > +     return devm_add_action_or_reset(&galaxybook->platform->dev,
> > +                                     galaxybook_fw_attr_remove, fw_att=
r);
>
> I think it is unnecessary to manually clean up the group.
> When the kset gets unregistered all its children and their attributes
> should be cleaned up automatically.
>

Thank you, good catch! I tested this and you are absolutely right, it
works exactly as you say. So I have removed this for the coming v9 :)

> > +static int galaxybook_probe(struct platform_device *pdev)
> > +{
> > +     struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
> > +     struct samsung_galaxybook *galaxybook;
> > +     int err;
> > +
> > +     if (!adev)
> > +             return -ENODEV;
> > +
> > +     galaxybook =3D devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_=
KERNEL);
> > +     if (!galaxybook)
> > +             return -ENOMEM;
> > +
> > +     galaxybook->platform =3D pdev;
> > +     galaxybook->acpi =3D adev;
> > +     galaxybook->has_kbd_backlight =3D false;
> > +     galaxybook->has_block_recording =3D false;
> > +     galaxybook->has_performance_mode =3D false;
>
> Nit: These are already initialized to false due to kzalloc() above.
>

Thank you, good catch again. I think I got stuck in my head when I
fixed an uninitialized local variable somewhere else and was thinking
more in terms of malloc here.. I have removed these :)


I will wait another day or two in case there are any other comments
(or answer to the above question on timing for implementing the power
supply extension framework); if I don't hear anything by then then I
will go ahead and send what I have now (per comments above) as v9.

Thank you again!

Best regards,
Joshua
