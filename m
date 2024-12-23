Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19D19E98B;
	Mon, 23 Dec 2024 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734968883; cv=none; b=pxEEgI7tV6Hq/S9v/MNvSXuqPai80KtjHwv+w2uZvEeU6aPkURXZH7CKY5uRxnv9xtSh4CG1R1aYUERYDdjF3zZCcMw6W1jhM+xso1z2cM9BwotXgBdva0QQwKIyoLNQnkYl5CHqr2FNA20J4Wre50EWYQa/ak0jhygw4M2RiZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734968883; c=relaxed/simple;
	bh=xIUtp9Uhez0lq0ny+Pgy0xIPBq/mHaBadXEp2/p4arw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2g7EvxTxvRPRzVOO7WfMjfmtodxW2w8rVqux3S8XU8KvWYRaiIuuZYKjJfdTgQlaeLH4SUnwN1FouM3cyHKSmnP0kszof355xYx9vfmjCrsqkOrWjOsux24CL6vhUUsglr/sEMv/ys/nw3pGui+820IJ/uYR8Q0gjfTsHbSY/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUB45nca; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUB45nca"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46788c32a69so51536831cf.2;
        Mon, 23 Dec 2024 07:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734968879; x=1735573679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7d9fc4586NC5IpL0UVjHh8EmgxWyKKOtzi4P63Grd0=;
        b=iUB45ncaFI/Ab4aLOUB51sdK6ON/cUtRGwekxsxKjCjywu2lv0HF8vItnX/pilFdr5
         wsvvac3aaIAXAT4BTUmthD0GoAGZcY5WVvobxdrt6/rr6B2sX0p7LWQkTHviUnzqfRwC
         jrhti8osLqYRUJ65QuAvmfktthzFFmZeoVGrV34HLUX1f2gWYPsSSdfrlZcjcMO/7qTl
         TXDJVitqZQGC2lu3Na0tjAhNJ/0QGCwdtD6+9167FKS6v7mSD+jwZO0oiHCoXu6OLgEO
         8IUBRO2T9L5mLChzRJ3E3DEoZIf1IuUNcvlQgZsAd0QLgPFJecuYS3UebktEoUpsF15T
         rB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734968879; x=1735573679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7d9fc4586NC5IpL0UVjHh8EmgxWyKKOtzi4P63Grd0=;
        b=okmZ7/a+9UjlX02n6CiCaNwzq/mU1XiX0Sr0OIlPAuDnmQ2EFKM4T0cqCT46ks9n16
         JiaoU4+sT4/vgs1D7sRF9YnRh6yVlyWPooCKFj0VA2N0Rygp920m3ZUH6yUhOsz7l0kz
         nNVWysWxBFXfld0xdOL7wL6Zk9ARR5CJIjd4jmF+Tv5xzWye95jgt9SmiwUlqxJamF8U
         5Z54RqmT+T2nVe4e7eN05aGR4luVTpDVLevONh1rF2iHTjvcDrh7k+tT5kWbIc5DKlT/
         /XG5hLRF5SwOOu+pwa78Rkd/nWrP6K49vYoM55LVj0JzmuPU9H2sRxP9YZIV6mtD5nAJ
         YxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIHGlDM25XWQzQ9dl79t/PmtEgUVG8YrXDlI008e0zXhc59WM94Tv4phsw7nl24m/T+8tRvXHYoLc=@vger.kernel.org, AJvYcCUYLG+yb1S/H2bOrle5hWU1UxusCKM8GgUWk3YtQB6R3tHOThrpQOy1VTvBvUv5PKO94hT7ZH3HjuRnJT0a@vger.kernel.org, AJvYcCVEzEhblek9WL+SIz+epTajiIegFxyzoJBIukSqnfrh/lxBGKdJmEgUNaNd9E3B/aEtD1fGTNE99y8Tc4jEL6l9tdMAKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8s6wevHu2pSqX7/H2PL96JCfOqdxsxeCCmeUeGq26RC41hSx
	B/XgmJj201QYQiBIjydD8dp8zISScAzfJXHTL+k/7oI9WyjPRAN7Q2DLGni60iljgrzx289O/6/
	8ZqeTYBhL0LsKGApBiE1uHOA01Ag=
X-Gm-Gg: ASbGncsBshomiRviNOHnYGTpUM8xoWYLFWa8Ee6CKWnRpNUqICeVD4NM2hlYnw78q1s
	bhQiSa2SRTECePM7SKWpDdwdZmF67nBoohU06pDU=
X-Google-Smtp-Source: AGHT+IFvtvfg1Pyf26vwXBz8FDEta/+LFZmus0JKgxmEyLfBl/FUONCMvCOWcVlSWkUz3oP8kpGxXHISekUS7UjxHzs=
X-Received: by 2002:a05:6214:260b:b0:6d4:1f6d:695f with SMTP id
 6a1803df08f44-6dd2332ed87mr268385836d6.2.1734968878073; Mon, 23 Dec 2024
 07:47:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <48320f65-8230-4e49-91c0-eeeca47ed2d2@kernel.org>
 <20241218035227.26707-1-derekjohn.clark@gmail.com> <0b389962-bb42-45c4-bbd5-942fac4bc9b7@gmx.de>
In-Reply-To: <0b389962-bb42-45c4-bbd5-942fac4bc9b7@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 23 Dec 2024 07:47:46 -0800
Message-ID: <CAFqHKTm_=Hdmnr84OVCk4UVy9SkmbhWmXt9YZ1ZWyj=mYOwjTw@mail.gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <superm1@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> Can do. It might still make sense to have capdata01 with the other_metho=
d
>> driver, it has no functionality on its own and is a dependency of other_=
method.
>> It isn't a problem to have capdata01 as an earlier patch than other_meth=
od
>> though if preferred. I'm not sure how I would break up the drivers furth=
er
>> than that, except the relevant header portions per c file.
>
>I think the gamezone driver should  be totally independent of the other dr=
iver.
>
>For the capdata01 and the other-guid driver i think the component framewor=
k could be handy,
>see https://docs.kernel.org/driver-api/component.html for details. Basical=
ly you will have
>a driver for capdata01 and another driver for other-guid which will both r=
egister a component.
>The firmware-attributes part will only get loaded if both components are p=
resent.

This is really cool and just what I need. I'll look into it, thanks.

>Please keep in mind that new WMI drivers need to be instantiated multiple =
times, see
>https://docs.kernel.org/wmi/driver-development-guide.html for details.

I must have missed that. I'll incorporate it into v2, thanks.

>> It does as a BIOS feature, acked for fix.
>
>So in order to use the "Other GUID" settings, custom mode has to be select=
ed first, right?
>
>Is it really necessary to do this inside the other-guid driver, or can thi=
s be done in userspace?
>The reason for this is that i want to avoid having to couple the other-gui=
d driver with the
>gamezone guid driver.
>

The only major issue is there is (currently) no way to actually set custom =
mode
from userspace. As designed, "custom" is not selectable through the
platform_profile sysfs file descriptor even when enabled as any attempt to =
write
"custom" to it returns "Invalid argument". This will need to be changed if
we're going to move forward with the interfaces decoupled, unless
there is another
way to handle this I'm not aware of.

Another, not very severe issue, is the OM interface will always permit
a write to any
page even if the gamezone interface isn't set to custom mode. I did some te=
sting
and there doesn't seem to be any effect on the hardware when this happens, =
but
having no effect when writing to the attribute endpoints could lead to erro=
neous
bug reports from uninformed users. I suppose that is better than bug
reports from
null pointer reference if something goes wrong with the gamezone interface.

I did consider trying to grab a pointer to platform_profile to watch
the state instead
of gamezone, but that isn't reliable either as it will report "custom"
any time two
providers disagree. Since amd-pmf uses "low-power" and Lenovo uses "quiet" =
as
their respective lowest settings, platform_profile will report
"custom" any time the
hardware is on the lowest profile. The obvious answer there might be to ena=
ble
the low-power enum instead of quiet on the gamezone interface, but that als=
o
assumes no other provider will ever register with another value. Do
you think this
is worth pursuing?

>> Other Method is the name Lenovo gave the interface. I'm open to suggesti=
ons,
>> but Custom Method is the name of the older Legion WMI interface so I'd l=
ike to
>> reserve that in case Lenovo wants to add it later.
>
>What is the intended purpose of this "Other Method" interface? If its prim=
ary purpose
>is to provide tuning settings to the system, then you can call it somethin=
g like:
>
>- LENOVO_WMI_TUNING_SETTINGS
>
>- LENOVO_WMI_TUNING
>
>- ...

I think we're of a similar mind here as I changed it to LENOVO_WMI_TUNABLES=
 in
my working branch already. I like LENOVO_WMI_TUNING more though.

>In general passing WMI devices between different drivers will likely resul=
t in device lifetime issues.
>
>I suggest that you decouple both drivers as much as possible and rely on u=
serspace for selecting
>custom mode before changing any tuning settings.
>
>See my above comment for more details.
>
>Thanks,
>Armin Wolf

Thanks for taking a look Armin. I will be away for the next few days with o=
nly
my mobile phone which seems to be having issues sending plain text. I might=
 not
be able to respond again until the end of the week.

Derek

On Sun, Dec 22, 2024 at 2:55=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 18.12.24 um 04:36 schrieb Derek J. Clark:
>
> > Hi Mario,
> >
> > Thank you for taking a look at it so quickly.
> >
> >>> Adds lenovo-legion-wmi.h which provides templates and some method
> >>> implementations used by the lenovo-legion-wmi driver series.
> >>>
> >>> Adds lenovo-legion-wmi-gamezone.c which provides a driver for the Len=
ovo
> >>> GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
> >>> Provides ACPI platform profiles over WMI.
> >>>
> >>> Adds lenovo-legion-wmi-other.c which provides a driver for the Lenovo
> >>> "Other Method" WMI interface that comes on some Lenovo hardware.
> >>> Provides a firmware-attributes class which enables the use of tunable
> >>> knobs for SPL, SPPT, and FPPT.
> >>>
> >>> Adds lenovo-legion-wmi-capdata01.c which provides a driver for the
> >>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Method"
> >>> enabled hardware. Provides an interface for querying if a given
> >>> attribute is supported by the hardware, as well as its default_value,
> >>> max_value, min_value, and step increment.
> >>>
> > z>> Adds lenovo-legion-wmi.rst describing the available drivers and the=
ir
> >>> function.
> >>>
> >>> Updates Kconfig, Makefile, and MAINTAINERS to include the new drivers=
.
> >>>
> >>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> Hi Derek,
> >>
> >> As a high level first comment; "larger" patches are much harder to rev=
iew.
> >>
> >> It seems that the drivers are logically split as described in your
> >> commit message already.  For the next version could you split at least
> >> each driver to it's own patch?
> >>
> >> It might also make sense to split up the individual drivers along
> >> "features".
> > Can do. It might still make sense to have capdata01 with the other_meth=
od
> > driver, it has no functionality on its own and is a dependency of other=
_method.
> > It isn't a problem to have capdata01 as an earlier patch than other_met=
hod
> > though if preferred. I'm not sure how I would break up the drivers furt=
her
> > than that, except the relevant header portions per c file.
>
> I think the gamezone driver should  be totally independent of the other d=
river.
>
> For the capdata01 and the other-guid driver i think the component framewo=
rk could be handy,
> see https://docs.kernel.org/driver-api/component.html for details. Basica=
lly you will have
> a driver for capdata01 and another driver for other-guid which will both =
register a component.
> The firmware-attributes part will only get loaded if both components are =
present.
>
> Please keep in mind that new WMI drivers need to be instantiated multiple=
 times, see
> https://docs.kernel.org/wmi/driver-development-guide.html for details.
>
> >> This is my own personal opinion and not a requirement but I personally
> >> like to see documentation for something new like this as it's own patc=
h
> >> at the beginning of the series so we can make sure everyone understand=
s
> >> and agrees on the design as they review the series and then can make
> >> sure that the implementation matches the design as the other patches a=
re
> >> reviewed.
> > Acked, will add Documentation as its own 1/ patch.
> >
> >> I've got various other comments sprinkled throughout the patch, please
> >> see them.  I'm not 100% sure on the mutex use yet, we should review th=
at
> >> after you've got all the cleanups needed done.
> >>
> >>> ---
> >>>    .../wmi/devices/lenovo-legion-wmi.rst         |  79 ++++
> >>>    MAINTAINERS                                   |   9 +
> >>>    drivers/platform/x86/Kconfig                  |  35 ++
> >>>    drivers/platform/x86/Makefile                 |  21 +-
> >>>    .../x86/lenovo-legion-wmi-capdata01.c         | 103 +++++
> >>>    .../platform/x86/lenovo-legion-wmi-gamezone.c | 233 +++++++++++
> >>>    .../platform/x86/lenovo-legion-wmi-other.c    | 377 ++++++++++++++=
++++
> >>>    drivers/platform/x86/lenovo-legion-wmi.h      | 271 +++++++++++++
> >>>    8 files changed, 1119 insertions(+), 9 deletions(-)
> >>>    create mode 100644 Documentation/wmi/devices/lenovo-legion-wmi.rst
> >>>    create mode 100644 drivers/platform/x86/lenovo-legion-wmi-capdata0=
1.c
> >>>    create mode 100644 drivers/platform/x86/lenovo-legion-wmi-gamezone=
.c
> >>>    create mode 100644 drivers/platform/x86/lenovo-legion-wmi-other.c
> >>>    create mode 100644 drivers/platform/x86/lenovo-legion-wmi.h
> >>>
> >>> diff --git a/Documentation/wmi/devices/lenovo-legion-wmi.rst b/Docume=
ntation/wmi/devices/lenovo-legion-wmi.rst
> >>> new file mode 100644
> >>> index 000000000000..37b09c82c980
> >>> --- /dev/null
> >>> +++ b/Documentation/wmi/devices/lenovo-legion-wmi.rst
> >>> @@ -0,0 +1,79 @@
> >>> +.. SPDX-License-Identifier: GPL-2.0-or-later
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >>> +Lenovo Legion WMI Interface Driver (lenovo-legion-wmi)
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +Introduction
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +The Lenovo Legion WMI interface is broken up into multiple GUID inte=
rfaces that
> >>> +require cross-references between GUID's for some functionality. The =
"Custom
> >>> +Mode" interface is a legacy interface for managing and displaying CP=
U & GPU
> >>> +power and hwmon settings and readings. The "Other Mode" interface is=
 a modern
> >>> +interface that replaces "Custom Mode" interface methods. The "GameZo=
ne"
> >>> +interface adds advanced features such as fan profiles and overclocki=
ng. The
> >>> +"Lighting" interface adds control of various status lights related t=
o different
> >>> +hardware components.
> >>> +
> >>> +Each of these interfaces has a different data structure associated w=
ith it that
> >>> +provide detailed information about each attribute provided by the in=
terface.
> >>> +These data structs are retrieved from an additional WMI device data =
block GUID:
> >>> + - The "Custom Mode" interface uses LENOVO_CAPABILITY_DATA_00
> >>> + - The "Other Mode" interface uses LENOVO_CAPABILITY_DATA_01
> >>> + - The "Lighting" interface uses LENOVO_CAPABILITY_DATA_02
> >>> +
> >>> +.. note::
> >>> +   Currently only the "Gamezone", "Other Mode", and LENOVO_CAPABILIT=
Y_DATA_01
> >>> +   interfaces are implemented by this driver.
> >> So this is to say that lighting interface is not implemented right now=
,
> >> right?
> > Custom Mode, Lighting, LENOVO_CAPABILITY_DATA_00, and LENOVO_CAPABILITY=
_DATA_02
> > are not implemented yet. For now Lenovo are okay with that but may want=
 more
> > later.
>
> >>> +
> >>> +
> >>> +GameZone
> >>> +--------
> >>> +The GameZone WMI interface provides ACPI platform profile and fan cu=
rve
> >>> +settings for devices that fall under the "Gaming Series" of Lenovo L=
egion
> >>> +devices.
> >>> +
> >>> +The following platform profiles are supported:
> >>> + - quiet
> >>> + - balanced
> >>> + - performance
> >>> + - custom
> >>> +
> >>> +Custom Profile
> >>> +~~~~~~~~~~~~~~
> >>> +The custom profile is enabled but is not user selectable. This setti=
ng
> >>> +represents a hardware mode on Lenovo Legion devices that enables use=
r
> >>> +modifications to Package Power Tracking settings. When an attribute =
exposed
> >>> +by the "Other Mode" WMI Interface is modified, the GameZone driver w=
ill switch
> >>> +to this profile automatically.
> >> I think you should explicitly mention that it's undone if the user
> >> selects a fixed platform mode too.  (It does, right?)
> > It does as a BIOS feature, acked for fix.
>
> So in order to use the "Other GUID" settings, custom mode has to be selec=
ted first, right?
>
> Is it really necessary to do this inside the other-guid driver, or can th=
is be done in userspace?
> The reason for this is that i want to avoid having to couple the other-gu=
id driver with the
> gamezone guid driver.
>
> >
> >>> +
> >>> +
> >>> +Other Mode
> >>> +----------
> >>> +The Other Mode WMI interface uses the fw_attributes class to expose =
various
> >>> +WMI functions provided by the interface in the sysfs. This enables C=
PU and GPU
> >>> +power limit tuning as well as various other attributes for devices t=
hat fall
> >>> +under the "Gaming Series" of Lenovo Legion devices. Each attribute e=
xposed by
> >>> +the "Other Method" interface has corresponding LENOVO_CAPABILITY_DAT=
A_01 pages
> >>> +that allow the driver to probe details about the attribute. Each att=
ibute has
> >>> +multiple pages, one for each of the platform profiles managed by the=
 "GameZone"
> >>> +interface, so it must be probed prior to returning the current_value=
. For
> >>> +read-only properties, only the "Custom" profile values are reported =
to ensure
> >>> +any userspace applications reading them have accurate tunable value =
ranges.
> >>> +Attributes are exposed in sysfs under the following path:
> >>> +/sys/class/firmware-attributes/lenovo-legion-wmi/attributes
> >>> +
> >>> +Supported Attibutes
> >>> +~~~~~~~~~~~~~~~~~~~
> >>> +The following attributes are supported:
> >>> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> >>> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracki=
ng
> >>> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracki=
ng
> >>> +
> >>> +Each attribute has the following properties:
> >>> + - current_value
> >>> + - default_value
> >>> + - display_name
> >>> + - max_value
> >>> + - min_value
> >>> + - scalar_increment
> >>> + - type
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index baf0eeb9a355..67f7b588aa36 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -13034,6 +13034,15 @@ S: Maintained
> >>>    W:       http://legousb.sourceforge.net/
> >>>    F:       drivers/usb/misc/legousbtower.c
> >>>
> >>> +LENOVO LEGION WMI driver
> >>> +M: Derek J. Clark <derekjohn.clark@gmail.com>
> >>> +L: platform-driver-x86@vger.kernel.org
> >>> +S: Maintained
> >>> +F: drivers/platform/x86/lenovo-legion-wmi-capdata01.c
> >>> +F: drivers/platform/x86/lenovo-legion-wmi-gamezone.c
> >>> +F: drivers/platform/x86/lenovo-legion-wmi-other.c
> >>> +F: drivers/platform/x86/lenovo-legion-wmi.h
> >>> +
> >>>    LETSKETCH HID TABLET DRIVER
> >>>    M:       Hans de Goede <hdegoede@redhat.com>
> >>>    L:       linux-input@vger.kernel.org
> >>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> >>> index 0258dd879d64..a51a1a2fe7ba 100644
> >>> --- a/drivers/platform/x86/Kconfig
> >>> +++ b/drivers/platform/x86/Kconfig
> >>> @@ -459,6 +459,41 @@ config IBM_RTL
> >>>      state =3D 0 (BIOS SMIs on)
> >>>      state =3D 1 (BIOS SMIs off)
> >>>
> >>> +config LEGION_GAMEZONE_WMI
> >>> +   tristate "Lenovo Legion GameZone WMI Driver"
> >>> +   depends on ACPI_WMI
> >>> +   select ACPI_PLATFORM_PROFILE
> >>> +   help
> >>> +     Say Y here if you have a WMI aware Lenovo Legion device and wou=
ld like to use the
> >>> +     platform-profile firmware interface.
> >>> +
> >>> +     To compile this driver as a module, choose M here: the module w=
ill
> >>> +     be called lenovo_legion_wmi_gamezone.
> >>> +
> >>> +config LEGION_DATA_01_WMI
> >>> +   tristate "Lenovo Legion WMI capability Data 01 Driver"
> >>> +   depends on ACPI_WMI
> >>> +   help
> >>> +     Say Y here if you have a WMI aware Lenovo Legion device in the =
"Gaming Series"
> >>> +     line of hardware. This interface is a dependency for exposing t=
unable power
> >>> +     settings.
> >>> +
> >>> +     To compile this driver as a module, choose M here: the module w=
ill
> >>> +     be called lenovo_legion_wmi_capdata01.
> >>> +
> >>> +config LEGION_OTHER_WMI
> >>> +   tristate "Lenovo Legion Other Method WMI Driver"
> >> As a new user coming here, how are they going to know what "other"
> >> means?  I'm sort of thinking it's better to calls this "CUSTOM_WMI"?  =
Or
> >> maybe "CUSTOM_POWER_MODES_WMI"?  Maybe Armin or others have some input
> >> here too.
> > Other Method is the name Lenovo gave the interface. I'm open to suggest=
ions,
> > but Custom Method is the name of the older Legion WMI interface so I'd =
like to
> > reserve that in case Lenovo wants to add it later.
>
> What is the intended purpose of this "Other Method" interface? If its pri=
mary purpose
> is to provide tuning settings to the system, then you can call it somethi=
ng like:
>
> - LENOVO_WMI_TUNING_SETTINGS
>
> - LENOVO_WMI_TUNING
>
> - ...
>
> >
> >>> +   depends on LEGION_GAMEZONE_WMI
> >>> +   depends on LEGION_DATA_01_WMI
> >>> +   select FW_ATTR_CLASS
> >>> +   help
> >>> +     Say Y here if you have a WMI aware Lenovo Legion device and wou=
ld like to use the
> >>> +     firmware_attributes API to control various tunable settings typ=
ically exposed by
> >>> +     Lenovo software in Windows.
> >>> +
> >>> +     To compile this driver as a module, choose M here: the module w=
ill
> >>> +     be called lenovo_legion_wmi_other.
> >>> +
> >>>    config IDEAPAD_LAPTOP
> >>>     tristate "Lenovo IdeaPad Laptop Extras"
> >>>     depends on ACPI
> >>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> >>> index e1b142947067..838ee568c3f9 100644
> >>> --- a/drivers/platform/x86/Makefile
> >>> +++ b/drivers/platform/x86/Makefile
> >>> @@ -59,15 +59,18 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)   +=3D hp/
> >>>    obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
> >>>
> >>>    # IBM Thinkpad and Lenovo
> >>> -obj-$(CONFIG_IBM_RTL)              +=3D ibm_rtl.o
> >>> -obj-$(CONFIG_IDEAPAD_LAPTOP)       +=3D ideapad-laptop.o
> >>> -obj-$(CONFIG_LENOVO_YMC)   +=3D lenovo-ymc.o
> >>> -obj-$(CONFIG_SENSORS_HDAPS)        +=3D hdaps.o
> >>> -obj-$(CONFIG_THINKPAD_ACPI)        +=3D thinkpad_acpi.o
> >>> -obj-$(CONFIG_THINKPAD_LMI) +=3D think-lmi.o
> >>> -obj-$(CONFIG_YOGABOOK)             +=3D lenovo-yogabook.o
> >>> -obj-$(CONFIG_YT2_1380)             +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >>> -obj-$(CONFIG_LENOVO_WMI_CAMERA)    +=3D lenovo-wmi-camera.o
> >>> +obj-$(CONFIG_IBM_RTL)                      +=3D ibm_rtl.o
> >>> +obj-$(CONFIG_IDEAPAD_LAPTOP)               +=3D ideapad-laptop.o
> >>> +obj-$(CONFIG_LENOVO_YMC)           +=3D lenovo-ymc.o
> >>> +obj-$(CONFIG_SENSORS_HDAPS)                +=3D hdaps.o
> >>> +obj-$(CONFIG_THINKPAD_ACPI)                +=3D thinkpad_acpi.o
> >>> +obj-$(CONFIG_THINKPAD_LMI)         +=3D think-lmi.o
> >>> +obj-$(CONFIG_YOGABOOK)                     +=3D lenovo-yogabook.o
> >>> +obj-$(CONFIG_YT2_1380)                     +=3D lenovo-yoga-tab2-pro=
-1380-fastcharger.o
> >>> +obj-$(CONFIG_LENOVO_WMI_CAMERA)            +=3D lenovo-wmi-camera.o
> >>> +obj-$(CONFIG_LEGION_GAMEZONE_WMI)  +=3D lenovo-legion-wmi-gamezone.o
> >>> +obj-$(CONFIG_LEGION_DATA_01_WMI)   +=3D lenovo-legion-wmi-capdata01.=
o
> >>> +obj-$(CONFIG_LEGION_OTHER_WMI)             +=3D lenovo-legion-wmi-ot=
her.o
> >> Don't change the whitespace of everything else; especially not in one
> >> patch.  If the whitespace is wrong, do a patch that fixes it and then
> >> another patch that introduces a driver.
> > Only done because the length of the new entries messes up the whitespac=
e of the
> > rest of the block. I can do as two patches if needed, but the whitespac=
e would
> > need to be after as it is fine without them.
> >
> >>>
> >>>    # Intel
> >>>    obj-y                            +=3D intel/
> >>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-capdata01.c b/dri=
vers/platform/x86/lenovo-legion-wmi-capdata01.c
> >>> new file mode 100644
> >>> index 000000000000..99f4f35b7176
> >>> --- /dev/null
> >>> +++ b/drivers/platform/x86/lenovo-legion-wmi-capdata01.c
> >>> @@ -0,0 +1,103 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>> +/*
> >>> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface p=
rovides
> >>> + * information on tunable attributes used by the "Other Method" WMI =
interface,
> >>> + * including if it is supported by the hardware, the default_value, =
max_value,
> >>> + * min_value, and step increment.
> >>> + *
> >>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> >>> + *
> >> I don't think you need a newline at the end here.
> > Acked for fix all newline comments. Thanks.
> >
> >>> + */
> >>> +
> >>> +#include "lenovo-legion-wmi.h"
> >>> +
> >>> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3=
BE018154"
> >>> +
> >>> +static const struct wmi_device_id capdata_01_wmi_id_table[] =3D {
> >>> +   { LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> >>> +   {}
> >>> +};
> >>> +
> >>> +static struct capdata_wmi cd01_wmi =3D {
> >>> +   .mutex =3D __MUTEX_INITIALIZER(cd01_wmi.mutex)
> >>> +};
> >>> +
> >>> +int capdata_01_wmi_get(struct om_attribute_id attr_id,
> >>> +                  struct capability_data_01 *cap_data)
> >>> +{
> >>> +   union acpi_object *ret_obj;
> >>> +   int count;
> >>> +   int instance_id;
> >>> +   u32 attribute_id =3D *(int *)&attr_id;
> >> Can please do reverse xmas tree.
> >>
> > Acked for fix all ordering comments. Thanks.
> >
> >>> +
> >>> +   mutex_lock(&cd01_wmi.mutex);
> >>> +   count =3D wmidev_instance_count(drvdata.cd01_wmi->wdev);
> >>> +   mutex_unlock(&cd01_wmi.mutex);
> >> For new mutex use I'd suggest using guard(mutex) instead so you can ha=
ve
> >> less lock/unlock/cleanup cases to worry about.
> >>
> > Good idea, I wasn't aware of this. Will fix up for v2.
> >
> >>> +   for (instance_id =3D 0; instance_id < count; instance_id++) {
> >>> +           mutex_lock(&cd01_wmi.mutex);
> >>> +           ret_obj =3D
> >>> +                   wmidev_block_query(drvdata.cd01_wmi->wdev, instan=
ce_id);
> >>> +           mutex_unlock(&cd01_wmi.mutex);
> >>> +           if (!ret_obj) {
> >>> +                   pr_err("lenovo_legion_wmi_capdata_01: block query=
 failed\n");
> >> With all the error messages you should use #define pr_fmt() at the top
> >> of the file and then you don't need to do prefixes at all like this.
> >>
> > Same as above, thanks.
> >
> >>> +                   continue;
> >>> +           }
> >>> +
> >>> +           if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> >>> +                   pr_err("lenovo_legion_wmi_capdata_01: block query=
 returned type: %u\n",
> >>> +                          ret_obj->type);
> >>> +                   kfree(ret_obj);
> >>> +                   continue;
> >>> +           }
> >>> +
> >>> +           if (ret_obj->buffer.length !=3D sizeof(*cap_data)) {
> >>> +                   pr_err("lenovo_legion_wmi_capdata_01: bad buffer =
length, %d\n",
> >>> +                          ret_obj->buffer.length);
> >>> +                   kfree(ret_obj);
> >>> +                   continue;
> >>> +           }
> >>> +
> >>> +           memcpy(cap_data, ret_obj->buffer.pointer,
> >>> +                  ret_obj->buffer.length);
> >>> +           kfree(ret_obj);
> >>> +
> >>> +           if (cap_data->id !=3D attribute_id)
> >>> +                   continue;
> >>> +           break;
> >>> +   }
> >>> +   if (cap_data->id =3D=3D 0) {
> >>> +           pr_err("lenovo_legion_wmi_capdata_01: Failed to get capab=
ility data.\n");
> >>> +           return -EINVAL;
> >>> +   }
> >>> +   return 0;
> >>> +}
> >>> +EXPORT_SYMBOL_NS_GPL(capdata_01_wmi_get, "CAPDATA_WMI");
> >>> +
> >>> +/* Driver Setup */
> >>> +static int capdata_01_wmi_probe(struct wmi_device *wdev, const void =
*context)
> >>> +{
> >>> +   cd01_wmi.wdev =3D wdev;
> >>> +   drvdata.cd01_wmi =3D &cd01_wmi;
> >>> +   pr_info("lenovo_legion_wmi_capdata_01: Added Lenovo Capability Da=
ta 01 WMI interface.\n");
> >>> +
> >> Pretty noisy; no?  I think you probably should lose this message.
> >>
> > Acked for fix all pr_info comments.
> >
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +static void capdata_01_wmi_remove(struct wmi_device *wdev)
> >>> +{
> >>> +   pr_info("lenovo_legion_wmi_capdata_01: Removed Lenovo Capability =
Data 01 WMI interface.\n");
> >> Pretty noisy; no?  I think you probably should lose this message.
> >>
> >>> +}
> >>> +
> >>> +static struct wmi_driver capdata_01_wmi_driver =3D {
> >>> +   .driver =3D { .name =3D "capdata_01_wmi" },
> >>> +   .id_table =3D capdata_01_wmi_id_table,
> >>> +   .probe =3D capdata_01_wmi_probe,
> >>> +   .remove =3D capdata_01_wmi_remove,
> >>> +};
> >>> +
> >>> +module_wmi_driver(capdata_01_wmi_driver);
> >>> +
> >>> +MODULE_DEVICE_TABLE(wmi, capdata_01_wmi_id_table);
> >>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> >>> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> >>> +MODULE_LICENSE("GPL");
> >>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-gamezone.c b/driv=
ers/platform/x86/lenovo-legion-wmi-gamezone.c
> >>> new file mode 100644
> >>> index 000000000000..2f976dc0e367
> >>> --- /dev/null
> >>> +++ b/drivers/platform/x86/lenovo-legion-wmi-gamezone.c
> >>> @@ -0,0 +1,233 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>> +/*
> >>> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface =
provides
> >>> + * platform profile and fan curve settings for devices that fall und=
er the
> >>> + * "Gaming Series" of Lenovo Legion devices.
> >>> + *
> >>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> >>> + *
> >> Drop newline here
> >>> + */
> >>> +
> >>> +#include "lenovo-legion-wmi.h"
> >>> +
> >>> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> >>> +
> >>> +/* Method IDs */
> >>> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
> >>> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
> >>> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
> >>> +
> >>> +static const struct wmi_device_id gamezone_wmi_id_table[] =3D {
> >>> +   { LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
> >>> +   {}
> >>> +};
> >>> +
> >>> +static struct gamezone_wmi gz_wmi =3D {
> >>> +   .mutex =3D __MUTEX_INITIALIZER(gz_wmi.mutex)
> >>> +};
> >>> +
> >>> +/* Platform Profile Methods */
> >>> +static int
> >>> +gamezone_wmi_platform_profile_supported(struct platform_profile_hand=
ler *pprof,
> >>> +                                   int *supported)
> >>> +{
> >>> +   int ret;
> >>> +
> >>> +   mutex_lock(&gz_wmi.mutex);
> >> I'd use guard(mutex) instead.  By doing that your function becomes a l=
ot
> >> simpler too.
> >>
> >> guard(mutex)(&gz_wmi.mutex);
> >>
> >> return lenovo_legion_evaluate_method_1();
> >>
> >>> +   ret =3D lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x0=
,
> >>> +                                         WMI_METHOD_ID_SMARTFAN_SUPP=
, 0,
> >>> +                                         supported);
> >>> +   mutex_unlock(&gz_wmi.mutex);
> >>> +   return ret;
> >>> +}
> >>> +
> >>> +int gamezone_wmi_fan_profile_get(struct platform_profile_handler *pp=
rof,
> >>> +                            int *sel_prof)
> >>> +{
> >>> +   int ret;
> >>> +   int supported;
> >>> +
> >>> +   gamezone_wmi_platform_profile_supported(&drvdata.gz_wmi->pprof,
> >>> +                                           &supported);
> >>> +   if (!supported) {
> >>> +           pr_err("lenovo_legion_wmi_gamezone: Platform profiles are=
 not supported by this device.\n");
> >> Is this error flow real?  I sort of expect that you can avoid
> >> registering if not supporting it.
> >>
> > This method is an exported symbol in GZ_WMI. I'm not aware of any hardw=
are
> > without the GameZone interface that does implement the Other Method int=
erface,
> > but if it does exist I was concerned about calling on an interface that=
 isn't
> > registered. Perhaps a null pointer check on gz_wmi or gz_wmi.pprof->sup=
ported
> > check in the other method calls to this would be better? I didn't want =
to rely
> > on pprof exising for the check. I do now realize that this would call o=
n a WMI
> > interface that doesn't exist if it was the case this hardware exists.
>
> In general passing WMI devices between different drivers will likely resu=
lt in device lifetime issues.
>
> I suggest that you decouple both drivers as much as possible and rely on =
userspace for selecting
> custom mode before changing any tuning settings.
>
> See my above comment for more details.
>
> Thanks,
> Armin Wolf
>
> >
> >>> +           return -EOPNOTSUPP;
> >>> +   }
> >>> +   mutex_lock(&gz_wmi.mutex);
> >> guard(mutex) here too.
> >>
> >>> +   ret =3D lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x0=
,
> >>> +                                         WMI_METHOD_ID_SMARTFAN_GET,=
 0,
> >>> +                                         sel_prof);
> >>> +   mutex_unlock(&gz_wmi.mutex);
> >>> +   return ret;
> >>> +}
> >>> +EXPORT_SYMBOL_NS_GPL(gamezone_wmi_fan_profile_get, "GZ_WMI");
> >>> +
> >>> +static int
> >>> +gamezone_wmi_platform_profile_get(struct platform_profile_handler *p=
prof,
> >>> +                             enum platform_profile_option *profile)
> >>> +{
> >>> +   int sel_prof;
> >>> +   int err;
> >>> +
> >>> +   err =3D gamezone_wmi_fan_profile_get(pprof, &sel_prof);
> >>> +   if (err)
> >>> +           return err;
> >>> +
> >>> +   switch (sel_prof) {
> >>> +   case SMARTFAN_MODE_QUIET:
> >>> +           *profile =3D PLATFORM_PROFILE_QUIET;
> >>> +           break;
> >>> +   case SMARTFAN_MODE_BALANCED:
> >>> +           *profile =3D PLATFORM_PROFILE_BALANCED;
> >>> +           break;
> >>> +   case SMARTFAN_MODE_PERFORMANCE:
> >>> +           *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> >>> +           break;
> >>> +   case SMARTFAN_MODE_CUSTOM:
> >>> +           *profile =3D PLATFORM_PROFILE_CUSTOM;
> >>> +           break;
> >>> +
> >> Spurious newline.
> >>
> >>> +   default:
> >>> +           return -EINVAL;
> >>> +   }
> >>> +   drvdata.gz_wmi->current_profile =3D *profile;
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +int gamezone_wmi_platform_profile_set(struct platform_profile_handle=
r *pprof,
> >>> +                                 enum platform_profile_option profil=
e)
> >>> +{
> >>> +   int ret;
> >>> +   int sel_prof;
> >>> +   int supported;
> >>> +
> >>> +   gamezone_wmi_platform_profile_supported(&drvdata.gz_wmi->pprof,
> >>> +                                           &supported);
> >>> +   if (!supported) {
> >>> +           pr_err("lenovo_legion_wmi_gamezone: Platform profiles are=
 not supported by this device.\n");
> >>> +           return -EOPNOTSUPP;
> >>> +   }
> >> Same question; is this a real error flow?
> >>
> > Also an exported symbol in GZ_WMI. Will find another way to do these ch=
ecks in
> > Other Method.
> >
> >>> +
> >>> +   switch (profile) {
> >>> +   case PLATFORM_PROFILE_QUIET:
> >>> +           sel_prof =3D SMARTFAN_MODE_QUIET;
> >>> +           break;
> >>> +   case PLATFORM_PROFILE_BALANCED:
> >>> +           sel_prof =3D SMARTFAN_MODE_BALANCED;
> >>> +           break;
> >>> +   case PLATFORM_PROFILE_PERFORMANCE:
> >>> +           sel_prof =3D SMARTFAN_MODE_PERFORMANCE;
> >>> +           break;
> >>> +   case PLATFORM_PROFILE_CUSTOM:
> >>> +           sel_prof =3D SMARTFAN_MODE_CUSTOM;
> >>> +           break;
> >>> +   default:
> >>> +           return -EOPNOTSUPP;
> >>> +   }
> >>> +
> >>> +   mutex_lock(&gz_wmi.mutex);
> >> guard(mutex) here.
> >>> +   ret =3D lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x0=
,
> >>> +                                         WMI_METHOD_ID_SMARTFAN_SET,
> >>> +                                         sel_prof, NULL);
> >>> +   mutex_unlock(&gz_wmi.mutex);
> >>> +
> >>> +   if (ret) {
> >>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to set platfor=
m profile.\n");
> >>> +           return ret;
> >>> +   }
> >>> +
> >>> +   drvdata.gz_wmi->current_profile =3D profile;
> >>> +   return 0;
> >>> +}
> >>> +EXPORT_SYMBOL_NS_GPL(gamezone_wmi_platform_profile_set, "GZ_WMI");
> >>> +
> >>> +/* Driver Setup */
> >>> +static int platform_profile_setup(struct gamezone_wmi *gz_wmi)
> >>> +{
> >>> +   int err;
> >>> +   int supported;
> >>> +
> >>> +   gamezone_wmi_platform_profile_supported(&gz_wmi->pprof, &supporte=
d);
> >>> +
> >>> +   gz_wmi->platform_profile_support =3D supported;
> >>> +
> >>> +   if (!supported) {
> >>> +           pr_warn("lenovo_legion_wmi_gamezone: Platform profiles ar=
e not supported by this device.\n");
> >>> +           return -EOPNOTSUPP;
> >>> +   }
> >> Yeah because of this you don't need that other flow I was mentioning a=
bove.
> >>
> >> IMO I don't think the pr_warn() is really needed, you'll only really
> >> have one way that you exit -EOPNOTSUPP.
> >>
> > Will remove warn, thanks.
> >
> >>> +
> >>> +   gz_wmi->pprof.profile_get =3D gamezone_wmi_platform_profile_get;
> >>> +   gz_wmi->pprof.profile_set =3D gamezone_wmi_platform_profile_set;
> >>> +
> >>> +   set_bit(PLATFORM_PROFILE_QUIET, gz_wmi->pprof.choices);
> >>> +   set_bit(PLATFORM_PROFILE_BALANCED, gz_wmi->pprof.choices);
> >>> +   set_bit(PLATFORM_PROFILE_PERFORMANCE, gz_wmi->pprof.choices);
> >>> +   set_bit(PLATFORM_PROFILE_CUSTOM, gz_wmi->pprof.choices);
> >>> +
> >>> +   err =3D gamezone_wmi_platform_profile_get(&gz_wmi->pprof,
> >>> +                                           &gz_wmi->current_profile)=
;
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to get current=
 platform profile: %d\n",
> >>> +                  err);
> >> Drop prefix on the error and use pr_fmt().
> >>
> >>> +           return err;
> >>> +   }
> >>> +
> >>> +   err =3D platform_profile_register(&gz_wmi->pprof);
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to register pl=
atform profile support: %d\n",
> >>> +                  err);
> >> Drop prefix on the error and use pr_fmt().
> >>
> >>> +           return err;
> >>> +   }
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +static int gamezone_wmi_probe(struct wmi_device *wdev, const void *c=
ontext)
> >>> +{
> >>> +   int err;
> >>> +
> >>> +   gz_wmi.wdev =3D wdev;
> >>> +   drvdata.gz_wmi =3D &gz_wmi;
> >>> +
> >>> +   err =3D platform_profile_setup(&gz_wmi);
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to add platfor=
m profile: %d\n",
> >>> +                  err);
> >>> +           kfree(&gz_wmi);
> >> Is this free correct?  It's a global isn't it?  I don't think you shou=
ld
> >> be freeing here.
> >>
> > I'll just return the error.
> >
> >>> +           return err;
> >>> +   }
> >>> +
> >>> +   pr_info("lenovo_legion_wmi_gamezone: Added platform profile suppo=
rt.\n");
> >> Too noisy.
> >>
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +static void gamezone_wmi_remove(struct wmi_device *wdev)
> >>> +{
> >>> +   int err;
> >>> +
> >>> +   mutex_lock(&gz_wmi.mutex);
> >>> +   err =3D platform_profile_remove(&drvdata.gz_wmi->pprof);
> >>> +   mutex_unlock(&gz_wmi.mutex);
> >>> +
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to remove plat=
form profile: %d\n",
> >>> +                  err);
> >>> +   } else {
> >>> +           pr_info("lenovo_legion_wmi_gamezone: Removed platform pro=
file support.\n");
> >>> +   }
> >> Considering that platform_profile_remove() doesn't really have a failu=
re
> >> path (it always returns 0). I'd just lose both of these messages and
> >> make this simple.
> >>
> >> guard(mutex)();
> >> platform_profile_remove();
> >>
> > Acked for fix.
> >
> >>> +}
> >>> +
> >>> +static struct wmi_driver gamezone_wmi_driver =3D {
> >>> +   .driver =3D { .name =3D "gamezone_wmi" },
> >>> +   .id_table =3D gamezone_wmi_id_table,
> >>> +   .probe =3D gamezone_wmi_probe,
> >>> +   .remove =3D gamezone_wmi_remove,
> >>> +};
> >>> +
> >>> +module_wmi_driver(gamezone_wmi_driver);
> >>> +
> >>> +MODULE_DEVICE_TABLE(wmi, gamezone_wmi_id_table);
> >>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> >>> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> >>> +MODULE_LICENSE("GPL");
> >>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-other.c b/drivers=
/platform/x86/lenovo-legion-wmi-other.c
> >>> new file mode 100644
> >>> index 000000000000..c09c1848eda7
> >>> --- /dev/null
> >>> +++ b/drivers/platform/x86/lenovo-legion-wmi-other.c
> >>> @@ -0,0 +1,377 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>> +/*
> >>> + * Lenovo Legion Other Method driver. This driver uses the fw_attrib=
utes
> >>> + * class to expose the various WMI functions provided by the "Other =
Method" WMI
> >>> + * interface. This enables CPU and GPU power limit as well as variou=
s other
> >>> + * attributes for devices that fall under the "Gaming Series" of Len=
ovo Legion
> >>> + * devices. Each attribute exposed by the "Other Method"" interface =
has a
> >>> + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the dr=
iver to
> >>> + * probe details about the attribute such as set/get support, step, =
min, max,
> >>> + * and default value. Each attibute has multiple pages, one for each=
 of the
> >>> + * fan profiles managed by the GameZone interface, so it must be pro=
bed prior
> >>> + * to returning the current_value.
> >>> + *
> >>> + * These attributes typically don't fit anywhere else in the sysfs a=
nd are set
> >>> + * in Windows using one of Lenovo's multiple user applications.
> >>> + *
> >>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> >>> + *
> >> Remove the new line here.
> >>> + */
> >>> +
> >>> +#include "lenovo-legion-wmi.h"
> >>> +#include "firmware_attributes_class.h"
> >>> +
> >>> +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD=
3B"
> >>> +
> >>> +/* Device IDs */
> >>> +#define WMI_DEVICE_ID_CPU 0x01
> >>> +
> >>> +/* WMI_DEVICE_ID_CPU feature IDs */
> >>> +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> >>> +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> >>> +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> >>> +
> >>> +/* Method IDs */
> >>> +#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
> >>> +#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
> >>> +
> >>> +static const struct wmi_device_id other_method_wmi_id_table[] =3D {
> >>> +   { LENOVO_OTHER_METHOD_GUID, NULL },
> >>> +   {}
> >>> +};
> >>> +
> >>> +/* Tunable Attributes */
> >>> +struct ll_tunables {
> >>> +   u32 ppt_pl1_spl;
> >>> +   u32 ppt_pl2_sppt;
> >>> +   u32 ppt_pl3_fppt;
> >>> +};
> >>> +
> >>> +static const struct class *fw_attr_class;
> >>> +
> >>> +static struct other_method_wmi om_wmi =3D {
> >>> +   .mutex =3D __MUTEX_INITIALIZER(om_wmi.mutex)
> >>> +};
> >>> +
> >>> +struct capdata_01_attr_group {
> >>> +   const struct attribute_group *attr_group;
> >>> +};
> >>> +
> >>> +/* Simple attribute creation */
> >>> +
> >>> +/*
> >>> + * att_current_value_store() - Set the current value of the given at=
tribute
> >>> + * @kobj: Pointer to the driver object.
> >>> + * @kobj_attribute: Pointer to the attribute calling this function.
> >>> + * @buf: The buffer to read from, this is parsed to `int` type.
> >>> + * @count: Required by sysfs attribute macros, pass in from the call=
ee attr.
> >>> + * @store_value: Pointer to where the parsed value should be stored.
> >>> + * @device_id: The WMI function Device ID to use.
> >>> + * @feature_id: The WMI function Feature ID to use.
> >>> + *
> >>> + * This function is intended to be generic so it can be called from =
any
> >>> + * attribute's "current_value_store" which works only with integers.=
 The
> >>> + * integer to be sent to the WMI method is range checked and an erro=
r returned
> >>> + * if out of range.
> >>> + *
> >>> + * If the value is valid and WMI is success, then the sysfs attribut=
e is
> >>> + * notified.
> >>> + *
> >>> + * Returns: Either count, or an error.
> >>> + */
> >>> +ssize_t attr_current_value_store(struct kobject *kobj,
> >>> +                            struct kobj_attribute *attr, const char =
*buf,
> >>> +                            size_t count, u32 *store_value, u8 devic=
e_id,
> >>> +                            u8 feature_id)
> >>> +{
> >>> +   struct capability_data_01 cap_data;
> >>> +   enum platform_profile_option cust_prof;
> >>> +   int err;
> >>> +   int sel_prof;
> >>> +   u32 value;
> >>> +   struct wmi_device *wdev =3D drvdata.om_wmi->wdev;
> >>> +
> >>> +   err =3D gamezone_wmi_fan_profile_get(&drvdata.gz_wmi->pprof, &sel=
_prof);
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Error getting gamezone f=
an profile.\n");
> >> Use pr_fmt() for teh file instead of prefix here.
> >>
> >>> +           return -EIO;
> >>> +   }
> >>> +
> >>> +   /* Switch to custom profile if not currently on it. */
> >>> +   if (sel_prof !=3D SMARTFAN_MODE_CUSTOM) {
> >>> +           pr_warn("lenovo_legion_wmi_other: Device must be in CUSTO=
M profile to set tunables.");
> >> As you do this "for" them, I'd lose the warning.
> >>
> > Acked for fix. Leftover from an earlier version that didn't set the pro=
file.
> >
> >>> +           cust_prof =3D PLATFORM_PROFILE_CUSTOM;
> >>> +           sel_prof =3D SMARTFAN_MODE_CUSTOM;
> >>> +           err =3D gamezone_wmi_platform_profile_set(&drvdata.gz_wmi=
->pprof,
> >>> +                                                   cust_prof);
> >>> +           if (err) {
> >>> +                   pr_err("lenovo_legion_wmi_other: Error setting ga=
mezone fan profile.\n");
> >>> +                   return -EIO;
> >>> +           }
> >>> +   }
> >>> +
> >>> +   err =3D kstrtouint(buf, 10, &value);
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Error converting value t=
o int.\n");
> >>> +           return -EIO;
> >>> +   }
> >>> +
> >>> +   /* Construct the attribute id */
> >>> +   struct om_attribute_id attr_id =3D { sel_prof << 8, feature_id,
> >>> +                                      device_id };
> >>> +
> >>> +   /* Get min/max from LENOVO_CAPABILITY_DATA_01 */
> >>> +   err =3D capdata_01_wmi_get(attr_id, &cap_data);
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Failed to get capability=
 data.\n");
> >>> +           return -EIO;
> >>> +   }
> >>> +   if (cap_data.capability < 1) {
> >>> +           pr_err("lenovo_legion_wmi_other: Capability not supported=
.\n");
> >>> +           return -EPERM;
> >>> +   }
> >>> +
> >>> +   if (value < cap_data.min_value || value > cap_data.max_value) {
> >>> +           pr_warn("lenovo_legion_wmi_other: Value %d is not between=
 %d and %d.\n",
> >>> +                   value, cap_data.min_value, cap_data.max_value);
> >>> +           return -EINVAL;
> >>> +   }
> >>> +
> >>> +   mutex_lock(&om_wmi.mutex);
> >>> +   err =3D lenovo_legion_evaluate_method_2(wdev, 0x0,
> >>> +                                         WMI_METHOD_ID_VALUE_SET,
> >>> +                                         *(int *)&attr_id, value, NU=
LL);
> >>> +   mutex_unlock(&om_wmi.mutex);
> >>> +
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Error setting attribute"=
);
> >>> +           return err;
> >>> +   }
> >>> +
> >>> +   if (store_value)
> >>> +           *store_value =3D value;
> >>> +
> >>> +   sysfs_notify(kobj, NULL, attr->attr.name);
> >>> +   return count;
> >>> +}
> >>> +
> >>> +/*
> >>> + * attr_current_value_show() - Get the current value of the given at=
tribute
> >>> + * @kobj: Pointer to the driver object.
> >>> + * @kobj_attribute: Pointer to the attribute calling this function.
> >>> + * @buf: The buffer to write to.
> >>> + * @retval: Pointer to returned data.
> >>> + * @device_id: The WMI function Device ID to use.
> >>> + * @feature_id: The WMI function Feature ID to use.
> >>> + *
> >>> + * This function is intended to be generic so it can be called from =
any "_show"
> >>> + * attribute which works only with integers.
> >>> + *
> >>> + * If the WMI is success, then the sysfs attribute is notified.
> >>> + *
> >>> + * Returns: Either count, or an error.
> >>> + */
> >>> +ssize_t attr_current_value_show(struct kobject *kobj,
> >>> +                           struct kobj_attribute *attr, char *buf,
> >>> +                           u8 device_id, u8 feature_id)
> >>> +{
> >>> +   int sel_prof; /* Current fan profile mode */
> >>> +   int err;
> >>> +   int retval;
> >>> +   struct wmi_device *wdev =3D drvdata.om_wmi->wdev;
> >>> +
> >>> +   err =3D gamezone_wmi_fan_profile_get(&drvdata.gz_wmi->pprof, &sel=
_prof);
> >>> +
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Error getting gamezone f=
an profile.\n");
> >>> +           return err;
> >>> +   }
> >>> +
> >>> +   // Construct the WMI attribute id from the given args.
> >>> +   struct om_attribute_id attribute_id =3D { sel_prof << 8, feature_=
id,
> >>> +                                           device_id };
> >>> +
> >>> +   mutex_lock(&om_wmi.mutex);
> >>> +   err =3D lenovo_legion_evaluate_method_1(wdev, 0x0,
> >>> +                                         WMI_METHOD_ID_VALUE_GET,
> >>> +                                         *(int *)&attribute_id, &ret=
val);
> >>> +   mutex_unlock(&om_wmi.mutex);
> >>> +
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Error getting attribute"=
);
> >>> +           return err;
> >>> +   }
> >>> +
> >>> +   return sysfs_emit(buf, "%u\n", retval);
> >>> +}
> >>> +
> >>> +/**
> >>> + * attr_capdata_01_show() - Get the value of the specified attribute=
 property
> >>> + * from LENOVO_CAPABILITY_DATA_01.
> >>> + * @kobj: Pointer to the driver object.
> >>> + * @kobj_attribute: Pointer to the attribute calling this function.
> >>> + * @buf: The buffer to write to.
> >>> + * @retval: Pointer to returned data.
> >>> + * @device_id: The WMI functions Device ID to use.
> >>> + * @feature_id: The WMI functions Feature ID to use.
> >>> + * @prop: The property of this attribute to be read.
> >>> + *
> >>> + * This function is intended to be generic so it can be called from =
any "_show"
> >>> + * attribute which works only with integers.
> >>> + *
> >>> + * If the WMI is success, then the sysfs attribute is notified.
> >>> + *
> >>> + * Returns: Either count, or an error.
> >>> + */
> >>> +ssize_t attr_capdata_01_show(struct kobject *kobj, struct kobj_attri=
bute *attr,
> >>> +                        char *buf, u8 device_id, u8 feature_id,
> >>> +                        enum attribute_property prop)
> >>> +{
> >>> +   struct capability_data_01 cap_data;
> >>> +   int err;
> >>> +   int retval;
> >>> +   int sel_prof =3D SMARTFAN_MODE_CUSTOM; /* Only show CUSTOM mode v=
alues */
> >>> +
> >>> +   // Construct the WMI attribute id from the given args.
> >>> +   struct om_attribute_id attribute_id =3D { sel_prof << 8, feature_=
id,
> >>> +                                           device_id };
> >>> +
> >>> +   err =3D capdata_01_wmi_get(attribute_id, &cap_data);
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Failed to get capability=
 data.\n");
> >>> +           return -EIO;
> >>> +   }
> >>> +
> >>> +   switch (prop) {
> >>> +   case DEFAULT_VAL:
> >>> +           retval =3D cap_data.default_value;
> >>> +           break;
> >>> +   case MAX_VAL:
> >>> +           retval =3D cap_data.max_value;
> >>> +           break;
> >>> +   case MIN_VAL:
> >>> +           retval =3D cap_data.min_value;
> >>> +           break;
> >>> +   case STEP_VAL:
> >>> +           retval =3D cap_data.step;
> >>> +           break;
> >>> +   default:
> >>> +           return -EINVAL;
> >>> +   }
> >>> +   return sysfs_emit(buf, "%u\n", retval);
> >>> +}
> >>> +
> >>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl", WMI_DEVICE_I=
D_CPU,
> >>> +                       WMI_FEATURE_ID_CPU_SPL,
> >>> +                       "Set the CPU sustained power limit");
> >>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt", WMI_DEVICE=
_ID_CPU,
> >>> +                       WMI_FEATURE_ID_CPU_SPPT,
> >>> +                       "Set the CPU slow package power tracking limi=
t");
> >>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt", WMI_DEVICE=
_ID_CPU,
> >>> +                       WMI_FEATURE_ID_CPU_FPPT,
> >>> +                       "Set the CPU fast package power tracking limi=
t");
> >>> +
> >>> +static const struct capdata_01_attr_group capdata_01_attr_groups[] =
=3D {
> >>> +   { &ppt_pl1_spl_attr_group },
> >>> +   { &ppt_pl2_sppt_attr_group },
> >>> +   { &ppt_pl3_fppt_attr_group },
> >>> +   {},
> >>> +};
> >>> +
> >>> +static int other_method_fw_attr_add(void)
> >>> +{
> >>> +   int err, i;
> >>> +
> >>> +   err =3D fw_attributes_class_get(&fw_attr_class);
> >>> +   if (err) {
> >>> +           pr_err("lenovo_legion_wmi_other: Failed to get firmware_a=
ttributes_class.\n");
> >>> +           return err;
> >>> +   }
> >>> +
> >>> +   om_wmi.fw_attr_dev =3D device_create(fw_attr_class, NULL, MKDEV(0=
, 0),
> >>> +                                      NULL, "%s", DRIVER_NAME);
> >>> +   if (IS_ERR(om_wmi.fw_attr_dev)) {
> >>> +           pr_err("lenovo_legion_wmi_other: Failed to create firmwar=
e_attributes_class device.\n");
> >>> +           err =3D PTR_ERR(om_wmi.fw_attr_dev);
> >>> +           goto fail_class_get;
> >>> +   }
> >>> +
> >>> +   om_wmi.fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> >>> +                                             &om_wmi.fw_attr_dev->ko=
bj);
> >>> +   if (!om_wmi.fw_attr_kset) {
> >>> +           pr_err("lenovo_legion_wmi_other: Failed to create firmwar=
e_attributes_class kset.\n");
> >>> +           err =3D -ENOMEM;
> >>> +           goto err_destroy_classdev;
> >>> +   }
> >>> +
> >>> +   for (i =3D 0; i < ARRAY_SIZE(capdata_01_attr_groups) - 1; i++) {
> >>> +           err =3D sysfs_create_group(&om_wmi.fw_attr_kset->kobj,
> >>> +                                    capdata_01_attr_groups[i].attr_g=
roup);
> >>> +           if (err) {
> >>> +                   pr_err("lenovo_legion_wmi_other: Failed to create=
 sysfs-group for %s\n",
> >>> +                          capdata_01_attr_groups[i].attr_group->name=
);
> >>> +                   goto err_remove_groups;
> >>> +           }
> >>> +   }
> >>> +
> >>> +   return 0;
> >>> +
> >>> +err_remove_groups:
> >>> +   while (--i >=3D 0) {
> >>> +           sysfs_remove_group(&om_wmi.fw_attr_kset->kobj,
> >>> +                              capdata_01_attr_groups[i].attr_group);
> >>> +   }
> >>> +err_destroy_classdev:
> >>> +   device_destroy(fw_attr_class, MKDEV(0, 0));
> >>> +fail_class_get:
> >>> +   fw_attributes_class_put();
> >>> +   return err;
> >>> +}
> >>> +
> >>> +/* Driver Setup */
> >>> +static int other_method_wmi_probe(struct wmi_device *wdev, const voi=
d *context)
> >>> +{
> >>> +   int err;
> >>> +
> >>> +   om_wmi.wdev =3D wdev;
> >>> +   drvdata.om_wmi =3D &om_wmi;
> >>> +   om_wmi.ll_tunables =3D kzalloc(sizeof(*om_wmi.ll_tunables), GFP_K=
ERNEL);
> >>> +   if (!om_wmi.ll_tunables)
> >>> +           return -ENOMEM;
> >>> +
> >>> +   err =3D other_method_fw_attr_add();
> >>> +   if (err)
> >>> +           return err;
> >>> +   pr_info("lenovo_legion_wmi_other: Firmware attributes added.\n");
> >> too noisy
> >>
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +static void other_method_wmi_remove(struct wmi_device *wdev)
> >>> +{
> >>> +   mutex_lock(&om_wmi.mutex);
> >>> +
> >>> +   kset_unregister(om_wmi.fw_attr_kset);
> >>> +   device_destroy(fw_attr_class, MKDEV(0, 0));
> >>> +   fw_attributes_class_put();
> >>> +
> >>> +   mutex_unlock(&om_wmi.mutex);
> >>> +
> >>> +   pr_info("lenovo_legion_wmi_other: Firmware attributes removed.\n"=
);
> >> too noisy.
> >>
> >>> +}
> >>> +
> >>> +static struct wmi_driver other_method_wmi_driver =3D {
> >>> +   .driver =3D { .name =3D "other_method_wmi" },
> >>> +   .id_table =3D other_method_wmi_id_table,
> >>> +   .probe =3D other_method_wmi_probe,
> >>> +   .remove =3D other_method_wmi_remove,
> >>> +};
> >>> +
> >>> +module_wmi_driver(other_method_wmi_driver);
> >>> +
> >>> +MODULE_IMPORT_NS("GZ_WMI");
> >>> +MODULE_IMPORT_NS("CAPDATA_WMI");
> >>> +MODULE_DEVICE_TABLE(wmi, other_method_wmi_id_table);
> >>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> >>> +MODULE_DESCRIPTION("Lenovo Legion Other Method Driver");
> >>> +MODULE_LICENSE("GPL");
> >>> diff --git a/drivers/platform/x86/lenovo-legion-wmi.h b/drivers/platf=
orm/x86/lenovo-legion-wmi.h
> >>> new file mode 100644
> >>> index 000000000000..65baa728f29e
> >>> --- /dev/null
> >>> +++ b/drivers/platform/x86/lenovo-legion-wmi.h
> >>> @@ -0,0 +1,271 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-or-later
> >>> + *
> >>> + * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interfa=
ce is
> >>> + * broken up into multiple GUID interfaces that require cross-refere=
nces
> >>> + * between GUID's for some functionality. The "Custom Mode" interfac=
e is a
> >>> + * legacy interface for managing and displaying CPU & GPU power and =
hwmon
> >>> + * settings and readings. The "Other Mode" interface is a modern int=
erface
> >>> + * that replaces or extends the "Custom Mode" interface methods. The=
 "GameZone"
> >>> + * interface adds advanced features such as fan profiles and overclo=
cking.
> >>> + * The "Lighting" interface adds control of various status lights re=
lated to
> >>> + * different hardware components. "Custom Mode" uses LENOVO_CAPABILI=
TY_DATA_00
> >>> + * struct for capability information, "Other Mode" uses
> >>> + * LENOVO_CAPABILITY_DATA_01 struct for capability information, and =
"Lighting"
> >>> + * uses LENOVO_CAPABILITY_DATA_02 struct for capability information.
> >>> + *
> >>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> >>> + *
> >> Lose the newline
> >>
> >>> + */
> >>> +
> >>> +#ifndef _LENOVO_LEGION_WMI_H_
> >>> +#define _LENOVO_LEGION_WMI_H_
> >>> +
> >>> +#include <linux/mutex.h>
> >>> +#include <linux/platform_profile.h>
> >>> +#include <linux/types.h>
> >>> +#include <linux/wmi.h>
> >>> +
> >>> +#define DRIVER_NAME "lenovo-legion-wmi"
> >> This is only used in one of the drivers, I'd move it there to make it
> >> clearer.
> >>
> > Acked for fix.
> >
> >>> +
> >>> +/* Platform Profile Modes */
> >>> +#define SMARTFAN_MODE_QUIET 0x01
> >>> +#define SMARTFAN_MODE_BALANCED 0x02
> >>> +#define SMARTFAN_MODE_PERFORMANCE 0x03
> >>> +#define SMARTFAN_MODE_CUSTOM 0xFF
> >>> +
> >>> +struct gamezone_wmi {
> >>> +   struct wmi_device *wdev;
> >>> +   enum platform_profile_option current_profile;
> >>> +   struct platform_profile_handler pprof;
> >>> +   bool platform_profile_support;
> >>> +   struct mutex mutex; /* Ensure single operation on WMI device */
> >>> +};
> >>> +
> >>> +struct other_method_wmi {
> >>> +   struct wmi_device *wdev;
> >>> +   struct device *fw_attr_dev;
> >>> +   struct kset *fw_attr_kset;
> >>> +   struct ll_tunables *ll_tunables;
> >>> +   struct mutex mutex; /* Ensure single operation on WMI device */
> >>> +};
> >>> +
> >>> +struct capdata_wmi {
> >>> +   struct wmi_device *wdev;
> >>> +   struct mutex mutex; /* Ensure single operation on WMI device */
> >>> +};
> >>> +
> >>> +struct ll_drvdata {
> >>> +   struct other_method_wmi *om_wmi; /* Other method GUID device */
> >>> +   struct gamezone_wmi *gz_wmi; /* Gamezone GUID device */
> >>> +   struct capdata_wmi *cd01_wmi; /* Capability Data 01 GUID device *=
/
> >>> +} drvdata;
> >>> +
> >>> +struct wmi_method_args {
> >>> +   u32 arg0;
> >>> +   u32 arg1;
> >>> +};
> >>> +
> >>> +struct om_attribute_id {
> >>> +   u32 mode_id : 16; /* Fan profile */
> >>> +   u32 feature_id : 8; /* Attribute (SPL/SPPT/...) */
> >>> +   u32 device_id : 8; /* CPU/GPU */
> >>> +} __packed;
> >>> +
> >>> +enum attribute_property {
> >>> +   DEFAULT_VAL =3D 0,
> >>> +   MAX_VAL,
> >>> +   MIN_VAL,
> >>> +   STEP_VAL,
> >>> +   SUPPORTED,
> >>> +};
> >>> +
> >>> +struct capability_data_01 {
> >>> +   u32 id;
> >>> +   u32 capability;
> >>> +   u32 default_value;
> >>> +   u32 step;
> >>> +   u32 min_value;
> >>> +   u32 max_value;
> >>> +};
> >>> +
> >>> +static int lenovo_legion_evaluate_method(struct wmi_device *wdev, u8=
 instance,
> >>> +                                    u32 method_id, struct acpi_buffe=
r *in,
> >>> +                                    struct acpi_buffer *out)
> >>> +{
> >>> +   acpi_status status;
> >>> +
> >>> +   status =3D wmidev_evaluate_method(wdev, instance, method_id, in, =
out);
> >>> +
> >>> +   if (ACPI_FAILURE(status)) {
> >>> +           pr_err("lenovo_legion_wmi: wmidev_evaluate_method failed =
for method_id %u instance %u.\n",
> >>> +                  method_id, instance);
> >>> +           return -EIO;
> >>> +   }
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +int lenovo_legion_evaluate_method_2(struct wmi_device *wdev, u8 inst=
ance,
> >>> +                               u32 method_id, u32 arg0, u32 arg1,
> >>> +                               u32 *retval);
> >>> +
> >>> +int lenovo_legion_evaluate_method_2(struct wmi_device *wdev, u8 inst=
ance,
> >>> +                               u32 method_id, u32 arg0, u32 arg1,
> >>> +                               u32 *retval)
> >>> +{
> >>> +   int ret;
> >>> +   u32 temp_val;
> >>> +   struct wmi_method_args args =3D { arg0, arg1 };
> >>> +   struct acpi_buffer input =3D { (acpi_size)sizeof(args), &args };
> >>> +   struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> >>> +   union acpi_object *ret_obj =3D NULL;
> >> Reverse xmas tree please.
> >>
> >>> +
> >>> +   ret =3D lenovo_legion_evaluate_method(wdev, instance, method_id, =
&input,
> >>> +                                       &output);
> >>> +
> >>> +   if (ret) {
> >>> +           pr_err("lenovo_legion_wmi: Attempt to get method_id %u va=
lue failed with error: %u\n",
> >>> +                  method_id, ret);
> >>> +           return ret;
> >>> +   }
> >>> +
> >>> +   if (retval) {
> >>> +           ret_obj =3D (union acpi_object *)output.pointer;
> >>> +           if (ret_obj && ret_obj->type =3D=3D ACPI_TYPE_INTEGER)
> >>> +                   temp_val =3D (u32)ret_obj->integer.value;
> >> This is a pretty bad failure if it's not the case, no?  Should you set=
 a
> >> return value here instead perhaps?
> >>
> >>> +
> >>> +           *retval =3D temp_val
> >> If that above error I mentioned happens then you'll be assigning garba=
ge
> >> data out.
> >>
> >> ;
> > True, good catch. Someone built with clang+lto and it warned about this=
 section
> > as well as temp val is not initialized. Will fix both.
> >
> >>> +   }
> >>> +
> >>> +   kfree(ret_obj);
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +int lenovo_legion_evaluate_method_1(struct wmi_device *wdev, u8 inst=
ance,
> >>> +                               u32 method_id, u32 arg0, u32 *retval)=
;
> >>> +
> >>> +int lenovo_legion_evaluate_method_1(struct wmi_device *wdev, u8 inst=
ance,
> >>> +                               u32 method_id, u32 arg0, u32 *retval)
> >>> +{
> >>> +   return lenovo_legion_evaluate_method_2(wdev, instance, method_id,=
 arg0,
> >>> +                                          0, retval);
> >>> +}
> >>> +
> >>> +int capdata_01_wmi_get(struct om_attribute_id attr_id,
> >>> +                  struct capability_data_01 *cap_data);
> >>> +
> >>> +int gamezone_wmi_platform_profile_set(struct platform_profile_handle=
r *pprof,
> >>> +                                 enum platform_profile_option sel_pr=
of);
> >>> +
> >>> +int gamezone_wmi_fan_profile_get(struct platform_profile_handler *pp=
rof,
> >>> +                            int *sel_prof);
> >>> +
> >>> +/* current_value */
> >>> +ssize_t attr_current_value_store(struct kobject *kobj,
> >>> +                            struct kobj_attribute *attr, const char =
*buf,
> >>> +                            size_t count, u32 *store_value, u8 devic=
e_id,
> >>> +                            u8 feature_id);
> >>> +
> >>> +ssize_t attr_current_value_show(struct kobject *kobj,
> >>> +                           struct kobj_attribute *attr, char *buf,
> >>> +                           u8 device_id, u8 feature_id);
> >>> +
> >>> +/* LENOVO_CAPABILITY_DATA_01 */
> >>> +ssize_t attr_capdata_01_show(struct kobject *kobj, struct kobj_attri=
bute *attr,
> >>> +                        char *buf, u8 device_id, u8 feature_id,
> >>> +                        enum attribute_property prop);
> >>> +
> >>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *a=
ttr,
> >>> +                 char *buf);
> >>> +
> >>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *a=
ttr,
> >>> +                 char *buf)
> >>> +{
> >>> +   return sysfs_emit(buf, "integer\n");
> >>> +}
> >>> +
> >>> +#define __LL_ATTR_RO(_func, _name)                                  =
  \
> >>> +   {                                                             \
> >>> +           .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> >>> +           .show =3D _func##_##_name##_show,                       \
> >>> +   }
> >>> +
> >>> +#define __LL_ATTR_RO_AS(_name, _show)                               =
  \
> >>> +   {                                                             \
> >>> +           .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> >>> +           .show =3D _show,                                        \
> >>> +   }
> >>> +
> >>> +#define __LL_ATTR_RW(_func, _name) \
> >>> +   __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_sto=
re)
> >>> +
> >>> +/* Shows a formatted static variable */
> >>> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)               =
          \
> >>> +   static ssize_t _attrname##_##_prop##_show(                       =
     \
> >>> +           struct kobject *kobj, struct kobj_attribute *attr, char *=
buf) \
> >>> +   {                                                                =
     \
> >>> +           return sysfs_emit(buf, _fmt, _val);                      =
     \
> >>> +   }                                                                =
     \
> >>> +   static struct kobj_attribute attr_##_attrname##_##_prop =3D      =
       \
> >>> +           __LL_ATTR_RO(_attrname, _prop)
> >>> +
> >>> +/* Attribute current_value show/store */
> >>> +#define __LL_TUNABLE_RW_CAP01(_attrname, _dev_id, _feat_id)         =
          \
> >>> +   static ssize_t _attrname##_current_value_store(                  =
     \
> >>> +           struct kobject *kobj, struct kobj_attribute *attr,       =
     \
> >>> +           const char *buf, size_t count)                           =
     \
> >>> +   {                                                                =
     \
> >>> +           return attr_current_value_store(                         =
     \
> >>> +                   kobj, attr, buf, count,                          =
     \
> >>> +                   &om_wmi.ll_tunables->_attrname, _dev_id, _feat_id=
);   \
> >>> +   }                                                                =
     \
> >>> +   static ssize_t _attrname##_current_value_show(                   =
     \
> >>> +           struct kobject *kobj, struct kobj_attribute *attr, char *=
buf) \
> >>> +   {                                                                =
     \
> >>> +           return attr_current_value_show(kobj, attr, buf, _dev_id, =
     \
> >>> +                                          _feat_id);                =
     \
> >>> +   }                                                                =
     \
> >>> +   static struct kobj_attribute attr_##_attrname##_current_value =3D=
       \
> >>> +           __LL_ATTR_RW(_attrname, current_value)
> >>> +
> >>> +/* Attribute property show only */
> >>> +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _dev_id, _feat_id, _=
prop_type) \
> >>> +   static ssize_t _attrname##_##_prop##_show(                       =
      \
> >>> +           struct kobject *kobj, struct kobj_attribute *attr, char *=
buf)  \
> >>> +   {                                                                =
      \
> >>> +           return attr_capdata_01_show(kobj, attr, buf, _dev_id,    =
      \
> >>> +                                       _feat_id, _prop_type);       =
      \
> >>> +   }                                                                =
      \
> >>> +   static struct kobj_attribute attr_##_attrname##_##_prop =3D      =
        \
> >>> +           __LL_ATTR_RO(_attrname, _prop)
> >>> +
> >>> +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dev_id, _fe=
at_id,    \
> >>> +                               _dispname)                           =
     \
> >>> +   __LL_TUNABLE_RW_CAP01(_attrname, _dev_id, _feat_id);             =
     \
> >>> +   __LL_TUNABLE_RO_CAP01(default_value, _attrname, _dev_id, _feat_id=
,    \
> >>> +                         DEFAULT_VAL);                              =
     \
> >>> +   __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);     =
     \
> >>> +   __LL_TUNABLE_RO_CAP01(max_value, _attrname, _dev_id, _feat_id,   =
     \
> >>> +                         MAX_VAL);                                  =
     \
> >>> +   __LL_TUNABLE_RO_CAP01(min_value, _attrname, _dev_id, _feat_id,   =
     \
> >>> +                         MIN_VAL);                                  =
     \
> >>> +   __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, _dev_id, _feat=
_id, \
> >>> +                         STEP_VAL);                                 =
     \
> >>> +   static struct kobj_attribute attr_##_attrname##_type =3D         =
       \
> >>> +           __LL_ATTR_RO_AS(type, int_type_show);                    =
     \
> >>> +   static struct attribute *_attrname##_attrs[] =3D {               =
       \
> >>> +           &attr_##_attrname##_current_value.attr,                  =
     \
> >>> +           &attr_##_attrname##_default_value.attr,                  =
     \
> >>> +           &attr_##_attrname##_display_name.attr,                   =
     \
> >>> +           &attr_##_attrname##_max_value.attr,                      =
     \
> >>> +           &attr_##_attrname##_min_value.attr,                      =
     \
> >>> +           &attr_##_attrname##_scalar_increment.attr,               =
     \
> >>> +           &attr_##_attrname##_type.attr,                           =
     \
> >>> +           NULL,                                                    =
     \
> >>> +   };                                                               =
     \
> >>> +   static const struct attribute_group _attrname##_attr_group =3D { =
       \
> >>> +           .name =3D _fsname, .attrs =3D _attrname##_attrs          =
         \
> >>> +   }
> >>> +
> >>> +#endif /* !_LENOVO_LEGION_WMI_H_ */
