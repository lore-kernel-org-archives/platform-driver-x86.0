Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112962C182;
	Sat, 25 Jan 2025 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737817570; cv=none; b=DsBQCRObSAQfJOERRDZJKHF5eN8XUsnPl9Mb5Ewm5oBeKNLNqSiTmpJ2ShH/axsDqsIy13A5MEr0WmcvRZCnFv91Pbr2Y7gCx1bVWdzSz2BSzEG2RO4NEj51k5fmnWmLT4nhUIPIgE2cbOLPBFvUCL3PSjlu3fJAgf9K/X2anGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737817570; c=relaxed/simple;
	bh=tvSKsD8sEeZCkG+X+SJtr99/UFgR21E7ga+5Ouv5D9k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aS2Wii/vol9Oylq1247ivHL9xDrqhQlM/pM0BqcGx1SW8qQYzca420AyCWOCclW55gRptgyQ9VhW+YQrh+3qFsdVDNfjRGBLNSFx9bYC2xPgb7VVtnmfBDOFpb7R7FSIlQHA3TmgsV+zUC2Uvtc9BzHi9KI9ssKuSZCxe1hqMFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh0kC38Z; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh0kC38Z"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe1009960so871007137.0;
        Sat, 25 Jan 2025 07:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737817568; x=1738422368; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/kSqHNdH7P4UHdpG66YvsFnSYhhiZiiR7KZ3EeD/P8=;
        b=Lh0kC38ZtWWhPkpw3eoMTFnipIQaV4S9YQszISCFmrOSJDJZEipubpVH9M8ZYeLJc2
         0DhTxlIKxwhryhO0V/W5qMfflKMxrz/LwtCKUIkwOrp5P8z9P6ewfDF1MrRtDF1CZJIF
         Db6KGmGHy5CeRgUNZbB3ELFNSFcAdnC7topo9Jz3GJ9C47RpL16GBsPUUHzi1+53NUD2
         0Bb73Fi7MRoWPDvb2oSh6wSRS8zY+vhY8xWnhgVvUJLI3BJDQR2eqt7b/qzQeFTvPjQ5
         YctPa5rjMSe4Pcj5jP5ySN7ipD0lnq8gkVd5CjMCcS3aiNjnmdIczC5Y9mmGGYozDcOL
         gk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737817568; x=1738422368;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/kSqHNdH7P4UHdpG66YvsFnSYhhiZiiR7KZ3EeD/P8=;
        b=Qdz4ZciY5fYcMJ2IyUuqoUnaxvO0ZHr7lNYevthmlgsd1ekHGLKqYMrkCwsVjd0ahE
         HxtfAz1lU7SMmnVc86SzXjngifGzEAa+h/JKtG/Xi8NF9+rOEU2/27EVdIALP0hU4a+4
         IfwKLrFncEMgYsSP2uB8yts0r9OqoraauSJteokIKpmnepR8gAXsfxTknYIq+NmM7Eki
         qrEa/m4g3HD8QvZA5dPU5o76vHRCM+lJozQBivwFIzu88kFhgbAzkcrRl+l5sjSjUVfG
         DW5STuKpGgsyZphg/9VPttT4YK+RadH64A7RYTWnk0eTZM5ZkC3hP86mDrGZ7uOlgVFZ
         3A+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFc5gqYIRw0Pw5VE0ZX2g+IB8eNFoRjHokHXgpEtgmR1n4rHMtKSu6KLUoixJdy3sbrqmGY7oP7vc=@vger.kernel.org, AJvYcCXaskchW+Bi/A/f7xU0z03KEBks3Asi+wvoz96o3KOlt6PR3VKY42n9OIi6oAJSNkCBpVH06lJu7ArRRqEIPMpDuEjtGw==@vger.kernel.org, AJvYcCXchJ5tlv+RCE238d/Sc4XsmvAn+dx4IuTvS2uSWlp4W0LDLBw4b97HOpTSGfzuqIbWuV+rbnq+TMRImsRd@vger.kernel.org
X-Gm-Message-State: AOJu0YwcI6oAzU2V7FatiGvPV9gKe0wBl+7TlnRy+ziqnItnqfMn58DI
	p/Nm5Qs7x97lWOBkSI5pLh98uzQGkwW6YfRsIjWnOUhLp/SdY5U8
X-Gm-Gg: ASbGncvGOX0My+/hiBNVpP6c2Evfu5sjk/VmaILtkgmUump0pRGYp99kLph7l7ISPLm
	E8G5/lVnPhMMY4dAlLHpvBy9cL43GK1CKZCtboqqcYiuhBnao7sPXvqePDOVl73VQHLCkD9L/lb
	BQtaAI7ktc6KI5W00VYsTf0RKDTuR/tc6f3tr1ryO6lf0LeGNusf+cJG/U+ozc/aVJqtHCm208+
	tjTNQW7joSZ+VajiX//CFWahOJ8afxrTU1nKzs/uZFiXn2wog031cwCrevxYz2KQc5NVnv9
X-Google-Smtp-Source: AGHT+IFk/GRPkQa6clfhSvtBKMR1sBD5LN5ZsWGuTBod2LcG6jHT+dqojz8rDGXxjQGksKJwV43HEg==
X-Received: by 2002:a05:6122:d91:b0:50a:318:b3c2 with SMTP id 71dfb90a1353d-51d592b3380mr32385656e0c.2.1737817567805;
        Sat, 25 Jan 2025 07:06:07 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4eab083asm798327e0c.25.2025.01.25.07.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 07:06:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jan 2025 10:06:04 -0500
Message-Id: <D7B8WVUD7F4B.1BL2WE2BNRCX6@gmail.com>
Cc: <W_Armin@gmx.de>, <ilpo.jarvinen@linux.intel.com>,
 <hdegoede@redhat.com>, <platform-driver-x86@vger.kernel.org>,
 <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Joshua Grisham" <josh@joshuagrisham.com>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250118202632.8352-1-josh@joshuagrisham.com>
 <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
 <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>
In-Reply-To: <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>

On Sat Jan 25, 2025 at 6:45 AM -05, Joshua Grisham wrote:
> Hi Thomas, thank you for the review and taking the time to go through it =
again!
>
> Den fre 24 jan. 2025 kl 00:42 skrev Thomas Wei=C3=9Fschuh <linux@weisssch=
uh.net>:
>>
>> Hi Joshua,
>>
>> looks good to me.
>> I have some nitpicks inline, but even for the current state:
>>
>> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>
>> > +static ssize_t charge_control_end_threshold_show(struct device *dev, =
struct device_attribute *attr,
>> > +                                              char *buf)
>> > +{
>> > +     struct samsung_galaxybook *galaxybook =3D
>> > +             container_of(attr, struct samsung_galaxybook, charge_con=
trol_end_threshold_attr);
>> > +     u8 value;
>> > +     int err;
>> > +
>> > +     err =3D charge_control_end_threshold_acpi_get(galaxybook, &value=
);
>> > +     if (err)
>> > +             return err;
>> > +
>> > +     /*
>> > +      * device stores "no end threshold" as 0 instead of 100;
>> > +      * if device has 0, report 100
>> > +      */
>> > +     if (value =3D=3D 0)
>> > +             value =3D 100;
>> > +
>> > +     return sysfs_emit(buf, "%u\n", value);
>> > +}
>>
>> For the next revision you should be able to use the power supply
>> extension framework.
>>
>
> I looked around a bit in the mailing lists and saw some of the
> proposed patches now which add power_supply_sysfs_add_extension() and
> similar functions, but do not see them yet in for-next of the pdx86
> repository. Do you think it makes more sense to wait on
> samsung-galaxybook and then add these changes from the start, or go
> ahead with samsung-galaxybook and then update it after with using the
> new framework?
>
>> > +
>> > +#define gb_pfmode(profile) galaxybook->profile_performance_modes[prof=
ile]
>>
>> The usage sites of this macro don't look like regular C syntax.
>> This is iffy and can confuse some code parsers.
>> Any chance it could be reworked to look more regular?
>>
>
> Good point, and to be honest the only reason for this was to give me a
> way to keep all of the lines below 100 characters :) Now I have just
> made it a local pointer within galaxybook_platform_profile_probe in
> order to achieve the same effect, so hopefully it looks and feels more
> "standard" now, but please take a look when I eventually send this
> later as v9 !
>
>> > +static const struct platform_profile_ops galaxybook_platform_profile_=
ops =3D {
>> > +     .probe =3D galaxybook_platform_profile_probe,
>> > +     .profile_get =3D galaxybook_platform_profile_get,
>> > +     .profile_set =3D galaxybook_platform_profile_set,
>> > +};
>> > +
>> > +static int galaxybook_platform_profile_init(struct samsung_galaxybook=
 *galaxybook)
>> > +{
>> > +     struct device *platform_profile_dev;
>> > +     u8 performance_mode;
>> > +     int err;
>> > +
>> > +     /* check that performance mode appears to be supported on this d=
evice */
>> > +     err =3D performance_mode_acpi_get(galaxybook, &performance_mode)=
;
>> > +     if (err) {
>> > +             dev_dbg(&galaxybook->platform->dev,
>> > +                     "failed to get initial performance mode, error %=
d\n", err);
>> > +             return 0;
>> > +     }
>> > +
>> > +     galaxybook->has_performance_mode =3D true;
>>
>> This should be set *after* devm_platform_profile_register() succeeded, n=
o?
>> I would prefer it slightly if the flags where set by galaxybook_probe()
>> instead of the _init() functions.
>>
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

Now I understand the original problem better. I didn't consider this
possibility when designing the callback.

While this is a fine solution I believe Thomas' EOPNOTSUPP solution is
the way to go. I think positive err value would be the safest but you
should wait for the advice of someone with more experience.

Aside from that I really like how the whole platform profile sections
works now. Good design choices :)

~ Kurt

> <snip>
