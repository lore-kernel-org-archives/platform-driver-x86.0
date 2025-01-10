Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7608206F38;
	Fri, 10 Jan 2025 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736545988; cv=none; b=fopNcSMoDLCfwYkvecxaFPNIvF3/DeTRTG7/y44k4CXUw0gx5rC3SR/ucThW3lsUJ7XycTFSTh0/hlsDQc2kn8Z7x7qGVJ18IzrAfgRCxKLYDvACYjfkAh2FB1qlMAeRh2jeFQ3kbbDWWxE3jm/V3t0FCmDoRMgfkvQzcqd09Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736545988; c=relaxed/simple;
	bh=wjUMlN5z1ClIjldHeEDLxT+KgbS/iouFcX/YWQZHqO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWtwkYDpXdktnKBceGV7LKATq4maFqyz7KdCfR7aP8WUADaB0wd2voe78XL9TV58jAN8PJ57LhX94ChqFjh7nA8QS5NT4gLvZdEXYDpyQt7+RpeSR0/28HgC4hGmVnt62HYxCCpsla6OKnhGcas1HOkofZ22KSfJ07IklB3UOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nChrLjO6; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nChrLjO6"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7bcf32a6582so7127385a.1;
        Fri, 10 Jan 2025 13:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736545986; x=1737150786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ5lYVSzY9mcd2ROq6Y8lJmDwYx1FuWpq+hscmWvjTM=;
        b=nChrLjO6Mxfqon3fmdnZTVGe3GAf6VU4nlAQO4cFFasNnF7gPX9sdtGkJsP01qRM5f
         naomR/NuX3aLmGY1hJEV0NkgNnjVaUI0Q2MPg2jPK5KXQKGM9YBuz9y15seqF1TIFjWx
         KdyhStiL1TZ1WTXaQIAg3/XHe/Pz/tgNnFy617/3NdGf+7+rDzpN25X/VpXAOOEgZQOg
         nSWCNQkaKhws3YwXXUQip9NVKQIHZ2AUsz89xUxJILF3/C3G2tQM3SXcpZUq1MeYCz+P
         ZHkH2WJgtyAnPlLaIRY68daNKQoLOqoZT2xEsw8jTLSNNYIrUA27FGTgo3lRE0FvIQAW
         tSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736545986; x=1737150786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ5lYVSzY9mcd2ROq6Y8lJmDwYx1FuWpq+hscmWvjTM=;
        b=L9mIGBi9+c1RHWOIVts+ibRd+qugJg6OK836ZJnRsjAU+MePzORftmKnl1nED4pih6
         xm6ELghOLfeADw2a9+UB7Q88/6/isqNYKI/GsXYCWwiRHk9FDWmBHq1h8Si5BNKNmIj7
         ty/Mqe2KvI6UpDxasBFwJQrG/nOwu59OjURLRuqP7HRDb/u9Wkk5OSe/LBWM1PPI5Jzh
         yJ8HcBmPxvAU7+Xx0zuSurofX8Bx2GI+8n8Dw3/7sluwDk/90/FiKlV2hkNu+DCeYgZd
         ywV+ML+Zkxgl3uyqISJDBI84/UYCfd599AVHb+7HI3mva5D6TF6z1rDVm8Lj1yBeGusE
         c/bw==
X-Forwarded-Encrypted: i=1; AJvYcCUx7zDN/wCfBzcJVgpDzx6xRYFkzk1wsUWwApzj6ZiS5V/JFVZUQeFncE1qL4bjL9ewUHz0FEaxiA4XsGjaYVePfy19sg==@vger.kernel.org, AJvYcCVEWXOwcD4czsgWFQezpZX6eeNNNcw/zwU8OePilJhp42ByWvM4D2FtsekSBfABxkee864OQbYaQ6Q=@vger.kernel.org, AJvYcCWJMZyBxzI02kWHME6d9EuLtmWQRIXb/f7H55AGA/j5Wc/+axU97nuKKntlxA687llWimfR7X/7Fs2Ju1JR@vger.kernel.org
X-Gm-Message-State: AOJu0YwFLlh+6FieHEY0hSnMAiOFORIo/2dKjdW354uiHYQQPFCFZ02Q
	cuFDxEGmIpJdHT8/5rAXORnZEQW9WaD58dqcBcMFvNqOHaT+EEVZ/1qNsg/RyRKYAfnYU90+9ys
	NalZRQ+9REMLrkV5F8+U+oBgH4So=
X-Gm-Gg: ASbGncsWuCt0/Y1e2NAHOgCjYOgiHN1DLmQ0wlBU6zOL4BWFmKY7fpzorkfD2HFM7eL
	EQyxiiN+6sdffdac4rlE/zVd5Om55AEnq3tbH/kQ=
X-Google-Smtp-Source: AGHT+IFkabY8O0/mgVgFehIYzi0rTEu2f9sPZT8TiICX3xypF1URg2sqXe45ys6MA1SNDSIVn5ZAeJ6lNqzuXxocEUc=
X-Received: by 2002:a05:620a:2916:b0:7ac:c348:6a52 with SMTP id
 af79cd13be357-7bcd97a1e92mr1530539385a.34.1736545985561; Fri, 10 Jan 2025
 13:53:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <dc5375fb-1e2e-42b9-9174-3f4a70d914e7@kernel.org> <CAFqHKTkRhaci86qBE4Zc+EeV47T22y8fuesjWN_3WzFTuEnOPg@mail.gmail.com>
 <c29e64fd-8e9c-4179-806e-db516576a153@gmx.de>
In-Reply-To: <c29e64fd-8e9c-4179-806e-db516576a153@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 10 Jan 2025 13:52:54 -0800
X-Gm-Features: AbW1kvaBSBtog4kh5UA3G9lMLylrHaLkjytK5H5tQiGV7wLarrYoTzoOJcMqM-U
Message-ID: <CAFqHKTmJKdZV2unLAZjRGSdjE5mB7H5ONuF2wfC9dnuFJ0R16g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] platform/x86: Add Lenovo Gaming Series WMI Drivers
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <superm1@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 3:20=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 02.01.25 um 19:27 schrieb Derek John Clark:
>
> > On Wed, Jan 1, 2025 at 8:01=E2=80=AFPM Mario Limonciello <superm1@kerne=
l.org> wrote:
> >>
> >>
> >> On 1/1/25 18:47, Derek J. Clark wrote:
> >>> Adds support for the Lenovo "Gaming Series" of laptop hardware that u=
se
> >>> WMI interfaces that control various power settings. There are multipl=
e WMI
> >>> interfaces that work in concert to provide getting and setting values=
 as
> >>> well as validation of input. Currently only the "GameZone", "Other
> >>> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, bu=
t
> >>> I attempted to structure the driver so that adding the "Custom Mode",
> >>> "Lighting", and other data block interfaces would be trivial in a lat=
er
> >>> patches.
> >>>
> >>> This driver is distinct from, but should be considered a replacement =
for
> >>> this patch:
> >>> https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/
> >>>
> >>> This driver attempts to standardize the exposed sysfs by mirroring th=
e
> >>> asus-armoury driver currently under review. As such, a lot of
> >>> inspiration has been drawn from that driver.
> >>> https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/
> >>>
> >>> The drivers have been tested by me on the Lenovo Legion Go.
> >>>
> >>> v2:
> >>> - Broke up initial patch into a 4 patch series.
> >>> - Removed all references to "Legion" in documentation, Kconfig,
> >>>     driver structs, functions, etc. Everything now refers either to t=
he
> >>>     interface being used or the Lenovo "Gaming Series" of laptop hard=
ware.
> >>> - Fixed all Acked changes requested by Mario and Armin.
> >>> - Capability Data is now cached before kset creation for each attribu=
te.
> >>>     If the lenovo-wmi-capdata01 interface is not present, fails to gr=
ab
> >>>     valid data, doesn't include the requested attribute id page, or t=
he
> >>>     data block indicates the attribute is not supported, the attribut=
e will
> >>>     not be created in sysfs.
> >>> - The sysfs path for the firmware-attributes class was moved from
> >>>     lenovo-legion-wmi to lenovo-wmi-other.
> >>>
> >>> - The Other Mode WMI interface no longer relies on gamezone as
> >>>     discussed. However; this creates a problem that should be discuss=
ed
> >>>     here. The current_value attribute is now only accurate when the
> >>>     "custom" profile is set on the device. Previously it would report=
 the
> >>>     value from the Capability Data 01 instance related to the current=
ly
> >>>     selected profile, which reported an accurate accounting of the cu=
rrent
> >>>     system state in all cases. I submitted this as-is since we discus=
sed
> >>>     removing that dependency, but I am not a fan of the current_value
> >>>     attribute being incorrect for 3 of the 4 available profiles, espe=
cially
> >>>     when the data is available. There is also no way to -ENOTSUPP or
> >>>     similar when not in custom mode as that would also require us to =
know
> >>>     the state of the gamezone interface. What I would prefer to do wo=
uld be
> >>>     to make the gamezone interface optional by treating custom as the
> >>>     default mode in the current_value functions, then only update the=
 mode
> >>>     if a callback to get the current fan profile is a success. That w=
ay the
> >>>     logic will work with or without the GameZone interface, but it wi=
ll be
> >>>     greatly improved if it is present.
> >>>
> >> I agree there needs to be /some/ sort of dependency.
> >> One thing I was thinking you could do is use:
> >>
> >> wmi_has_guid() to tell whether or not the "GZ" interface is even prese=
nt
> >> from the "Other" driver.  Move the GUID for the GZ interface into a
> >> common header both drivers include.
> >>
> >> However that only helps in the case of a system that supports custom b=
ut
> >> not GZ.  I think you still will need some sort of symbol to either get=
 a
> >> pointer to the platform profile class or tell if the profile for the
> >> driver is set to custom.
> >>
> >> I personally don't see a problem with a simple symbol like this:
> >>
> >> bool lenovo_wmi_gamezone_is_custom(void);
> >>
> >> You could then have your logic in all the store and show call a helper
> >> something like this:
> >>
> >> static bool lenovo_wmi_custom_mode() {
> >>          if (!wmi_has_guid(GZ_GUID)
> >>                  return true;
> >>
> >>          if (!IS_REACHABLE(CONFIG_LENOVO_WMI_GAMEZONE))
> >>                  return true;
> >>
> >>          return lenovo_wmi_gamezone_is_custom();
> >> }
> > I agree with checking wmi_has_guid() before calling anything across
> > interfaces.
>
> Please do not use wmi_has_guid() for this as WMI devices can disappear
> at any time.
>
> > As far as using a bool to determine if we are in custom,
> > that seems to me like that would be a half measure. Since we would be
> > calling across interfaces anyway there is a benefit to getting the
> > full scope, where knowing only if we are in custom or not would just
> > add the ability to exit early. What I would prefer is knowing the
> > specific state of the hardware as it will allow me to call the
> > specific method ID as related to the current profile. I'll elaborate a
> > bit on what I mean.
> >
> > Each attribute ID corresponds to a specific fan profile mode for a
> > specific attribute. It is used as both the data block ID in
> > LENOVO_CAPABILITY_DATA_01, and as the first argument when using
> > GetFeatureValue/SetFeatureValue on the Other Mode interface. I map
> > these with the lenovo_wmi_attr_id struct. The fan mode value provided
> > by the gamezone interface corresponds directly to the mode value in
> > the ID. For example, ID 0x01010100 would provide the capability data
> > for the CPU device (0x01), SPPT (0x01), in Quiet mode (0x01). There is
> > no type ID for these attributes (0x00) like there are on some
> > unimplemented attributes. Balanced mode is 0x02, Performance is 0x03,
> > Extreme mode (Which the Go doesn't use and there is no analogue for in
> > the kernel atm) is 0xE0, and custom mode is 0xFF. When the
> > GetSmartFanMode method ID is called on the gamezone interface it
> > returns one of these values, corresponding to the current state of the
> > hardware. This allows us to call GetFeatureValue for the current
> > profile. Currently we are always calling the custom mode method ID
> > (0x0101FF00) in GetFeatureValue.
> >
> > If we want to avoid an additional wmi call in GZ, then grabbing it
> > from the platform profile and translating it back would maybe suffice.
> > In that case I would need to implement the
> > LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT GUID
> > "D320289E-8FEA-41E0-86F9-611D83151B5F" to ensure that the profile is
> > updated properly when the hardware is switched profiles using the
> > physical buttons. This is probably a good idea anyway, but some
> > guidance on implementing that would be nice as I think it would be an
> > additional driver and then we have more cross referencing.
>
> I attached a prototype WMI driver for another device which had a similar =
problem.
> The solution was to provide a notifier so other event consumers can be no=
tified
> when an WMI event was received.
>
> Example event consumer callback code:
>
>         static int uniwill_wmi_notify_call(struct notifier_block *nb, uns=
igned long action, void *data)
>         {
>                 if (action !=3D UNIWILL_OSD_PERF_MODE_CHANGED)
>                         return NOTIFY_DONE;
>
>                 platform_profile_cycle();
>
>                 return NOTIFY_OK;
>         }
>
> I would also suggest that you use a notifier for communicating with the g=
amezone
> interface. Then you just have to submit commands (as action values) in th=
e form of events
> which will then be processed by the available gamezone drivers (the resul=
t can be stored in *data).
>
> Those gamezone drivers can then return NOTIFY_STOP which will ensure that=
 only a single gamezone
> driver can successfully process a given command.
>
> All in all the patch series seems to progress nicely. I am confident that=
 we will solve the remaining issues.
>
> Thanks,
> Armin Wolf
>

That's a novel approach. There are some EVENT GUID's for the gamezone
interface I'll need to incorporate to keep everything in sync. These
devices have physical buttons (Fn+Q on laptops, Legion +Y button on
handhelds) to cycle the profiles. I didn't add this previously because
we were always updating it when called. I presume that each GUID will
need a separate driver for this. Any advice or examples on how to use
this to update the pprof in GameZone would be appreciated as I've
never used .notify before.

My expected information flow will be these paths:
Physical Button press -> WMI event GUID notifier driver -> Gamezone
driver update & notify_call -> Other Mode save data to priv for lookup
when current_value is checked and return STOP .
or
platform-profile class write from sysfs -> Gamezone driver update &
notify_call ->Other Mode save data to priv for lookup when
current_value is checked and return STOP .

Thanks,
Derek

> >
> > The simplest solution IMO would be to do something closer to what I
> > was doing in v1 just for current_value_show, where we instantiate the
> > mode variable as SMARTFAN_MODE_CUSTOM (0xFF) then check if the gz
> > interface is present. If it is, pass the mode variable as a pointer to
> > GZ where it can call GetSmartFanMode and update the value. Otherwise,
> > bypass that block and treat it as custom. This does add an additional
> > WMI call, but only when reading the current_value.
> >
> >>> - I did extensive testing of this firmware-attributes interface and i=
ts
> >>>     ability to retain the value set by the user. The SPL, SPPT, FPPT,=
 and
> >>>     platform profile all retain the users last setting when resuming =
from
> >>>     suspend, a full reboot, and a full shutdown. The only time the va=
lues
> >>>     are not preserved is when the user manually selects a new platfor=
m
> >>>     profile using either the pprof interface or the manual selection
> >>>     button on the device, in which case you would not expect them to =
be
> >>>     retained as they were intentionally changed. Based on the previou=
s
> >>>     discussion it may be the case that older BIOS' will preserve the
> >>>     settings even after changing profiles, though I haven't confirmed
> >>>     this.
> >> This is good to hear considering the concerns raised by some others.
> >>
> >> But FWIW we have nothing in the firmware attributes API documentation
> >> that mandates what the firmware does for storage of settings across a
> >> power cycle so this is currently up to the platform to decide.
> >>> v1:
> >>> https://lore.kernel.org/platform-driver-x86/CAFqHKTna+kJpHLo5s4Fm1TmH=
cSSqSTr96JHDm0DJ0dxsZMkixA@mail.gmail.com/T/#t
> >>>
> >>> Suggested-by: Mario Limonciello <superm1@kernel.org>
> >>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >>>
> >>> Derek J. Clark (4):
> >>>     platform/x86: Add lenovo-wmi drivers Documentation
> >>>     platform/x86: Add Lenovo GameZone WMI Driver
> >>>     platform/x86: Add Lenovo Capability Data 01 WMI Driver
> >>>     platform/x86: Add Lenovo Other Mode WMI Driver
> >>>
> >>>    Documentation/wmi/devices/lenovo-wmi.rst    | 104 ++++++
> >>>    MAINTAINERS                                 |   9 +
> >>>    drivers/platform/x86/Kconfig                |  34 ++
> >>>    drivers/platform/x86/Makefile               |   3 +
> >>>    drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++
> >>>    drivers/platform/x86/lenovo-wmi-gamezone.c  | 203 +++++++++++
> >>>    drivers/platform/x86/lenovo-wmi-other.c     | 385 ++++++++++++++++=
++++
> >>>    drivers/platform/x86/lenovo-wmi.h           | 241 ++++++++++++
> >>>    8 files changed, 1110 insertions(+)
> >>>    create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
> >>>    create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> >>>    create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
> >>>    create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> >>>    create mode 100644 drivers/platform/x86/lenovo-wmi.h
> >>>
