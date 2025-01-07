Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD0E18EAD;
	Tue,  7 Jan 2025 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262607; cv=none; b=KyD1iXURWSPHdDZJv+jd1Lp7OnZYuisoTdVOklDzPxU2RAavgQGbE2SdJw7K3O8Otod2ac5ebUGYM5KD7A8uF7aLDRUFjacOAUzV2nJXKLdiVbObdF+N8rY48xrOKVzaXIKM8iIvcRCCPCxf95QwWgpBP4qDN3XIk5uSUAd4Xlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262607; c=relaxed/simple;
	bh=bqXVf8rJDMaSpLyIp+na2IdVI1wHKa7ObAjC9BDCgDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eA6sejDNz7qVxBx5tUwRSRHTgBiojugtTTnZeiEtUX08udsI3GOqST/hQVqjCNngOeieg/VSxbC88kcaSG6A4ISAHQHjGcO+8LPZkAI5Tu6QiR1mVMQMXvd+HzCCG+6qimVeujWR7iO/yHVBaataHFCC0sb3XmoRlKd1D64zpA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a8ed4c8647so114412895ab.1;
        Tue, 07 Jan 2025 07:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262604; x=1736867404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SV3X9GqlQhyB/vH9MfyAZyo468xz4O8lZd4eyZJAFs8=;
        b=VxBGH+s8X8zi/E6rXNbWzLYC0roIqX9YkgoamqvO3i8WSexdXzC4nKQnuLqPQyRu/S
         EkbHn+FBzkXqe5JcxEGXr2Otc4MOwfWpifRtX6cLVQMgDzOq51v7rAiGwXbUFdK+JJzK
         MfDNb1NXvtPmaLJid5LKZTRmBlWAflWj45h8mXcO2xcOsJswlR6VsOZFobmG39Ncbms1
         S7lv8zJRJ+kR5SZwwPatX64HOKB1ha42P3XNPV+nXNDucYiwp0eIeCXa2T6d97tadftU
         CX3g2c/lgcWiUHnl1n/45UpHJ1AnMiLUfLSOrOd4TyjZ4DLwaaMYVkjsOM1tLDiGaAqb
         gcpw==
X-Forwarded-Encrypted: i=1; AJvYcCUeyXyds03w/p1FLWZt6yFrkvTOyohITaC4ooBwYzv11xotVsY/iY/03aG+DgTGC/I0+cLHjVv16z5zGxA3@vger.kernel.org, AJvYcCV/cwEKEpRGhrftsELFEBH585b9H35DaN0boDYlyLO6hh2F0AtDFh0kRoM7XQP1qqUqJeJsVT78RkE=@vger.kernel.org, AJvYcCV1xcXP1GvtXNzCmG2S3Z2uzYx5H3ESz3fZq4DkdlO8VTBRm+0MAWdmp0a0cZ3pXJFFPXguDamh5O/4HguLYZA8eSRIvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWkTS4xC9olzfpN1lw/A51/0odz9faYGh686q+6XY0ew8/BzP
	yl1VQ44GdWu65L2JHlskJu1WLqLl4tC55j59udasjVRy7m6mzAUou4FtbEDlswQ=
X-Gm-Gg: ASbGncujrIp0BgqEdAwcpTfPNvSLV7Y+OR8N0pVEtq1g4KMqUC/HwjHSwF2kC0od3Xd
	gLpjF62QwzjBXsx+Y/alOVc+POovrbNKmRwvRwJpe7Ijhtc4WWNPISBJwRu0AseKnQstnpihIyo
	NxstQT0qLObUNHbw61lsO7MgIilUfLJSLGuv/HvPd22P+Nx2DGbKA01QSw2dRhhhSo4wfYBb1yi
	INCfZ08YeGhFvF8XOfdttiFIkpsiBneNUgoqgVzc38VHMOYL8mY6Tw2dw1/e2ykWlx3Ej4HL8BA
	xJWUHpObwgFAKSpLULL7iNSnPw==
X-Google-Smtp-Source: AGHT+IEshIJPd0Rf2312Dr+azwmwhNL+SOk5oRSTezJ7imvqCat8JO45yP02aj1+UydMvp/M0f2UbQ==
X-Received: by 2002:a05:6e02:12cb:b0:3a7:4826:b057 with SMTP id e9e14a558f8ab-3c2d591996emr542919015ab.21.1736262603866;
        Tue, 07 Jan 2025 07:10:03 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c189367sm10045287173.101.2025.01.07.07.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 07:10:03 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a8ed4c8647so114412785ab.1;
        Tue, 07 Jan 2025 07:10:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrcSxA8BXgA6qezY2mZvzaYVpCRqPl/TJ/4BX+5Rcsyg9EVfxvK6MBL3AUPOaG8wCv9lG+w/40V7NNYPwDoiVAd3H6Sg==@vger.kernel.org, AJvYcCW6sZi2YE/ha2HR4BkjX7QzitFSOwtkC/H5Jc5m/6imZY+RUgRq6oJTDPdzaGkqmBRbW4yC0Rog2i4=@vger.kernel.org, AJvYcCXP/btT6+GzOj/gbkZCgDVsn8RgM2xUHKcZClFhuVaIj84bmySzWesBqecM0hkIzJ6i9aH3ECwgGlLBGc6t@vger.kernel.org
X-Received: by 2002:a05:6e02:20ca:b0:3a7:7ec0:a3dc with SMTP id
 e9e14a558f8ab-3c2d2d52a7fmr508104305ab.14.1736262603297; Tue, 07 Jan 2025
 07:10:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de> <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
 <a8011f0f-1d44-42ec-9089-2da31f3852e2@gmx.de>
In-Reply-To: <a8011f0f-1d44-42ec-9089-2da31f3852e2@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Tue, 7 Jan 2025 16:09:51 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>
Message-ID: <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi again Armin! I think I am finally with you on most of this, I think
jet lag and general craziness made me a little extra dense for a week
or two :)

Den l=C3=B6r 4 jan. 2025 kl 07:28 skrev Armin Wolf <W_Armin@gmx.de>:
>
> The reason for the firmware-attribute class original was that driver coul=
d export BIOS settings
> to userspace applications, together with some metadata (min/max values, e=
tc).
>
> Because of this the exact meaning of each firmware attribute is usually o=
nly known to the user
> changing those firmware attributes.
>
> Your driver is a bit special in that it knows the meaning of each firmwar=
e attribute. However
> you still have to follow the firmware-attribute class ABI since userspace=
 applications do not
> know this.
>

Yes ok, as said, I am with you all now on this I think :)

As a prototype for v5 I have created a new struct for each "firmware
attribute" that helps me keep everything linked together with all of
the different sub attributes for each different "fw attribute"
including allowing a link back to my samsung_galaxybook instance
without using the global pointer. At the end of the day, if I wanted
to avoid using a global pointer, I needed a way to grab the private
data based on either the kobj or the attr parameters to the show/store
method of these individual sub attributes within each "firmware
attribute", so what I have done is added the kobj_attribute as a
struct member and then manually init+filled this kobj_attributes
during probe, so I can now grab the parent struct instance using
container_of() within the show/store functions which then gets me to
my pointer. I thought about using the kset or something else for this
but it seemed like kobj_attribute supported being a struct member
better and gave the least amount of headaches from what I could tell.

After trying to fight my way through this problem, I have an idea of
what a better "dream scenario" would for me as a user/consumer of the
firmware attributes interface -- namely that there is some kind of way
to register and unregister by "type" (e.g. "I want a new enumeration
fw attr; here is its parent, its name, and all of the functions for
show/store of the required attributes, plus a data pointer that I can
pack together with my attribute/somehow reach within the show/store
functions"). I have handled a bit of this myself now in the working v5
of samsung-galaxybook (just a minimal version of what it requires) but
as said it currently relies on creating the kobj_attributes (at least
those where I need the pointer) as struct members that I can later use
with container_of() instead of creating static ones using the various
__ATTR.. macros.

Please feel free to say if any of this sounds totally (or partially?)
off, otherwise I will try to test a bit more, clean up, and work
through any checkpatch exceptions and get this sent as a v5.

> >>> +static void galaxybook_fw_attr_class_remove(void *data)
> >>> +{
> >>> +     device_destroy(fw_attr_class, MKDEV(0, 0));
> >> Please use device_unregister() instead since multiple devices might sh=
are the same devt of MKDEV(0, 0).
> >> This would also allow you to remove the global variable "fw_attr_class=
".
> >>
> > Here I am a bit confused on exactly how this would/should look; all
> > existing usages of fw_attr_class I can see use exactly this same
> > pattern: device_create() and then device_destroy() with MKDEV(0, 0).
> > Taking a look at the latest proposed changes from Thomas and it stil
> > seems the intention is the same, just that it is slightly simplified
> > and use pointer to the firmware_attributes_class directly instead of
> > fetching it using fw_attributes_class_get(). Or is there a better way
> > to do this (including usage of device_unregister() and/or something
> > different with the devt) that will help solve some other problem(s)?
>
> This is the code of device_destroy():
>
> void device_destroy(const struct class *class, dev_t devt)
> {
>         struct device *dev;
>
>         dev =3D class_find_device_by_devt(class, devt);
>         if (dev) {
>                 put_device(dev);
>                 device_unregister(dev);
>         }
> }
>
> if multiple devices of a given class are using the same devt (like MKDEV(=
0, 0)) then
> class_find_device_by_devt() might pick the wrong device.
>
> The fact that the other drivers are using this function is actually an er=
ror. The only
> reason why this error was not noticed until now seems to be that currentl=
y only a single
> driver using the firmware-attribute class is typically active at the same=
 time.
>

Yes again sorry for being dense -- now with a little sleep and time to
marinate this makes total sense, and it is a lot easier to just use
device_unregister() like you say. This will be included in v5.

> > Also there are several other platform drivers that implement a very
> > similar device attribute as ones that I have added here as a firmware
> > attribute (namely I am thinking of "USB Charging" which exists in
> > several other pdx86 drivers but a few other devices should/would
> > probably support this kind of "Power on Lid Open" attribute as well);
> > in the event that maintainers of those drivers should and eventually
> > do migrate over to use the same or similar firmware attribute for this
> > same kind of setting, should it include all of these attributes in the
> > standard "enumeration" type attribute group or is it possible / would
> > it make sense to have some sort of boolean-based fw attr type that is
> > a bit more simple and a bit more self-explanatory?
>
> Introducing a new "boolean" type would indeed be nice. This would allow u=
serspace application to use a simple
> on/off slider instead of a dropdown menu when displaying such firmware at=
tributes.
>
> In this case you could drop the "possible_values" attribute.
>
> What is the opinion of the pdx86 maintainers on this proposal?
>

Now that I have finally taken a better understanding of this, I see
your point. Yes, nice with a boolean that could give a slider in a GUI
or similar, but does not really change a whole lot in the driver
implementation. I will go with enumeration type for now as mentioned
and it can always be changed later if this new type comes.

> > I am quite certain that the code can be cleaned up and/or refactored a
> > bit, but I would hope that the result of the logic should stay the
> > same (per what I described above); having said all of that, does it
> > still make sense to try and simplify this somehow and/or any tips or
> > recommendation how to achieve the desired result in a better way?
>
> I am OK with you preferring the non-legacy modes over the legacy ones. Ho=
wever trying to limit yourself
> to the profiles currently supported by gnome (AFAIK uses platform-profile=
s-daemon) is not a good idea.
>
> I would like to see a more static mapping be implemented:
>
> PERFORMANCE_MODE_ULTRA -> performance
> PERFORMANCE_MODE_PERFORMANCE -> balanced-performance (can also be legacy =
if non-legacy is not available)
> PERFORMANCE_MODE_OPTIMIZED -> balanced (can also be legacy is non-legacy =
is not available)
> PERFORMANCE_MODE_QUIET -> quiet
> PERFORMANCE_MODE_SILENT -> low-power
>
> In this case the platform-profiles-daemon would have a similar job as the=
 Samsung service, which is to
> determine a suitable mapping for the supported modes to {performance, bal=
anced, powersave}.
>
> Looking at the code of the daemon it seems something similar is already b=
eing done, but only for the profiles
> "quiet" and "low-power" (one of which is getting mapped to the "powersave=
" mode).
>
> I am confident that the daemon could be extended be a bit more intelligen=
t when it comes to determine the
> mapping of the other modes.
>

I understand the thought here but my only problem and what sort of
"itches" at me is that most of these devices are not "Ultra" models
and they will never have an "Ultra" mode. For the non-Ultra models,
"Performance mode" *is* "Performance mode" (meaning, it is the mode
which prioritizes performance over anything else) so for me it feels
best if these non-Ultra models (again majority of these devices) can
have the Performance mode that they should have. And you can maybe
argue that "Ultra" is in fact its own mode entirely -- when you use
this mode on these devices, they really scream (the fans, mostly, that
is) and they get super hot haha :)

Other than this Ultra vs Performance question, I do agree with you and
think it makes sense. My first thought if we want to actually
"simplify" this in this way is if there could actually exist a
platform profile called "ultra" then it would be just a perfect 1:1
mapping (other than taking legacy modes into account).

This "perfect fit" for samsung-galaxybook would be to create a new
platform profile called something like PLATFORM_PROFILE_ULTRA, but
that seems like a bit of a tall order... Would it make more sense to
implement this "ultra" mode using the new PLATFORM_PROFILE_CUSTOM and
then map them like this?

PERFORMANCE_MODE_ULTRA -> custom (named "ultra" if that is possible?)
PERFORMANCE_MODE_PERFORMANCE (or PERFORMANCE_MODE_PERFORMANCE_LEGACY)
-> performance
PERFORMANCE_MODE_OPTIMIZED (or PERFORMANCE_MODE_OPTIMIZED_LEGACY) -> balanc=
ed
PERFORMANCE_MODE_QUIET -> quiet
PERFORMANCE_MODE_SILENT -> low-power

Thought admittedly I am not 100% familiar with how
PLATFORM_PROFILE_CUSTOM is implemented to work; I have a vague memory
that I read somewhere that this was roughly the intention? But I am
not sure if it is actually implemented to work this way. But if it
will in fact work "out of the box" including with
platform_profile_cycle() for the hotkey then it seems like the
cleanest and easiest approach.

If this is possible, then my best guess for the logic for this mapping
in samsung-galaxybook could be changed to loop the "supported modes"
forwards instead of backwards, and just let the "legacy" modes be
written first (as they seem to always come first in the list), and
then in case the non-legacy mode exists later in the array, it will
just replace the already-mapped legacy value with the new non-legacy
value, and thus skip any kind of condition-based checking/mapping
entirely. Is that sort of more like what you had in mind?

>
> Thanks,
> Armin Wolf
>

Thanks again!

Joshua

> [...]
