Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1732114;
	Thu,  2 Jan 2025 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842455; cv=none; b=LF8o1bTD9Y3PQYuzDSIXYmSILCax3zlNt293xqXieI9/Yh8FItIGn+hTLzj2cBPmopbAe3MarS29Eg4imNaAinhWANuLnLhZyQxSOU5ub1mQvjhxvanfnnLdALVx6+e/yQNQsjp80HJmik9UZB4N2uXaOIXDZiysTgng9YfNeWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842455; c=relaxed/simple;
	bh=DsttcM9sa4oX58/HolDJaLSsKyCLsswdbXNx6An2OZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPag9uJclef3klELlLt41oGOquEyqfLJGsF3g3lc1UvVB2Y8OXxKPC72oVfqUmVfwUPeLBJ/k15mS2XkwQYf4Bf7ClabFmKskHYzQfL7JZ15SO6YSk1hia7xCN7/rhL4stEr6n113UXakdjfATvBzKZ308f6yXQl/uLc0K4532s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXOvdIz4; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXOvdIz4"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d8f916b40bso153412876d6.3;
        Thu, 02 Jan 2025 10:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735842452; x=1736447252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC4mY52TeKp0Jg6F2FGBx3V+suogUXydugTxjlMux8I=;
        b=fXOvdIz4/viK/lTekx6Q0RWp2mUpTzThtboIqv2oQDj3b4A132m2pDaZ6FCU7GhDY8
         DHzaU49ZUWCVQysf1QcpEePVjGIQQKRoOvbcIkquwefoyj90vzBJS1wookFC1GhanE/x
         cs0Cv3fnXIVFRZWcfswL978mF2qJIGJOBdR/vVWAJUaHsw2NoNiC3mOHXIWd7epp0GIn
         JZLI+/VN3gthOLliXYHnEwfViLjnG2pSMMUfi1STpZzAGISunV3m8ftvSMoCFcusG0zp
         SrrhKSyq2Ct8Pjr+hQXqjc4Hu90jmXjcc6ebg0um6RUL06Dhj6aAQ2sdIMxm1InxC5LO
         Cy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735842452; x=1736447252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IC4mY52TeKp0Jg6F2FGBx3V+suogUXydugTxjlMux8I=;
        b=Jy+5hLU4eilNml6SgWlmDDFFOjjFSEJyhm0ULUBOZpP+We01Q1/tt95C3sVeNDLqwk
         V4qKaPZApBt9kzXExNA+p2e6gfmtJvked2WCazaUyks/tKpP8g+VM0BKKMiZ5ImtC0Eb
         VUvQ1YGYZyt0Y+V8hAej/66NuPgC+Xp3qcKdjYzCLvVBaNy4Z0eofu4FeZ18rLIudnt1
         33jlTjkRPA/R8WwbKzzxpsOUeqMHoRaWGWVy3M4RZOdHHU/m6Osc6WTTUfJs+P7YpazI
         VEjCvQfTDETFMFqwQaTdLrey1t+ZuK1WcJlCy6c+yiknpyNA6O+jDTdnSVOp13L/7RHN
         B82A==
X-Forwarded-Encrypted: i=1; AJvYcCWFCw5zwiW+/2aB1SmBY/pCDXaoUk+YDzDEqCqFhK3xNlR820alcFZjTFRIYFKbAazpKJeh6dbCf0w=@vger.kernel.org, AJvYcCWIEKj/FqyE7zU+wAXk+Cd7hEzWEUGNKnlsf03r71jh5P6bjwFQxNMkbEC9n5ShN9zdbJsg0vR//5D5KVWb@vger.kernel.org, AJvYcCWwdxj9zdboi0W/V+ggnOy0aelutDRNQbEqu4tIhCwHwKfsN5Cyludenl0ur1+d4DgShCpg/TYrNlmEKknBBmD0NAQr2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1zvO0Z2CY+SoJjXqFiZ8d1DpphGkvhwV/Olw655KIJOnnmTVp
	S2JdU5Nr1idVuZM+w8Pcd0xY0Fmn+6gEwaFhkvxSX8n4yiELFalJ67sF3gR0t8kX4DFG8mUBSy4
	oL+re7ASneRtrgMeeciMgMwu70/4=
X-Gm-Gg: ASbGnctgPXONgDnj+Rdeg3oPXcaY7OjiW7bAi4x64Ks8iZS2yeddCsI9MuBghBikb5R
	YMcaCSVfE0Y/YLhROdTkqZ3TtihqGM7Noe0lLSw0=
X-Google-Smtp-Source: AGHT+IHrFxCf6DzwryxzZfqIyBeZHDfn0vgYO2s7LND1iOJ/2TXw7V2Y41Wcjo9TYEhTiX59BNlnUmPW5X2FKwt1pxQ=
X-Received: by 2002:a05:6214:21ed:b0:6d8:ae2c:504d with SMTP id
 6a1803df08f44-6dd233a13edmr692689216d6.41.1735842451944; Thu, 02 Jan 2025
 10:27:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com> <dc5375fb-1e2e-42b9-9174-3f4a70d914e7@kernel.org>
In-Reply-To: <dc5375fb-1e2e-42b9-9174-3f4a70d914e7@kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 2 Jan 2025 10:27:21 -0800
Message-ID: <CAFqHKTkRhaci86qBE4Zc+EeV47T22y8fuesjWN_3WzFTuEnOPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] platform/x86: Add Lenovo Gaming Series WMI Drivers
To: Mario Limonciello <superm1@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 1, 2025 at 8:01=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
>
>
> On 1/1/25 18:47, Derek J. Clark wrote:
> > Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> > WMI interfaces that control various power settings. There are multiple =
WMI
> > interfaces that work in concert to provide getting and setting values a=
s
> > well as validation of input. Currently only the "GameZone", "Other
> > Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> > I attempted to structure the driver so that adding the "Custom Mode",
> > "Lighting", and other data block interfaces would be trivial in a later
> > patches.
> >
> > This driver is distinct from, but should be considered a replacement fo=
r
> > this patch:
> > https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/
> >
> > This driver attempts to standardize the exposed sysfs by mirroring the
> > asus-armoury driver currently under review. As such, a lot of
> > inspiration has been drawn from that driver.
> > https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/
> >
> > The drivers have been tested by me on the Lenovo Legion Go.
> >
> > v2:
> > - Broke up initial patch into a 4 patch series.
> > - Removed all references to "Legion" in documentation, Kconfig,
> >    driver structs, functions, etc. Everything now refers either to the
> >    interface being used or the Lenovo "Gaming Series" of laptop hardwar=
e.
> > - Fixed all Acked changes requested by Mario and Armin.
> > - Capability Data is now cached before kset creation for each attribute=
.
> >    If the lenovo-wmi-capdata01 interface is not present, fails to grab
> >    valid data, doesn't include the requested attribute id page, or the
> >    data block indicates the attribute is not supported, the attribute w=
ill
> >    not be created in sysfs.
> > - The sysfs path for the firmware-attributes class was moved from
> >    lenovo-legion-wmi to lenovo-wmi-other.
> >
> > - The Other Mode WMI interface no longer relies on gamezone as
> >    discussed. However; this creates a problem that should be discussed
> >    here. The current_value attribute is now only accurate when the
> >    "custom" profile is set on the device. Previously it would report th=
e
> >    value from the Capability Data 01 instance related to the currently
> >    selected profile, which reported an accurate accounting of the curre=
nt
> >    system state in all cases. I submitted this as-is since we discussed
> >    removing that dependency, but I am not a fan of the current_value
> >    attribute being incorrect for 3 of the 4 available profiles, especia=
lly
> >    when the data is available. There is also no way to -ENOTSUPP or
> >    similar when not in custom mode as that would also require us to kno=
w
> >    the state of the gamezone interface. What I would prefer to do would=
 be
> >    to make the gamezone interface optional by treating custom as the
> >    default mode in the current_value functions, then only update the mo=
de
> >    if a callback to get the current fan profile is a success. That way =
the
> >    logic will work with or without the GameZone interface, but it will =
be
> >    greatly improved if it is present.
> >
>
> I agree there needs to be /some/ sort of dependency.
> One thing I was thinking you could do is use:
>
> wmi_has_guid() to tell whether or not the "GZ" interface is even present
> from the "Other" driver.  Move the GUID for the GZ interface into a
> common header both drivers include.
>
> However that only helps in the case of a system that supports custom but
> not GZ.  I think you still will need some sort of symbol to either get a
> pointer to the platform profile class or tell if the profile for the
> driver is set to custom.
>
> I personally don't see a problem with a simple symbol like this:
>
> bool lenovo_wmi_gamezone_is_custom(void);
>
> You could then have your logic in all the store and show call a helper
> something like this:
>
> static bool lenovo_wmi_custom_mode() {
>         if (!wmi_has_guid(GZ_GUID)
>                 return true;
>
>         if (!IS_REACHABLE(CONFIG_LENOVO_WMI_GAMEZONE))
>                 return true;
>
>         return lenovo_wmi_gamezone_is_custom();
> }

I agree with checking wmi_has_guid() before calling anything across
interfaces. As far as using a bool to determine if we are in custom,
that seems to me like that would be a half measure. Since we would be
calling across interfaces anyway there is a benefit to getting the
full scope, where knowing only if we are in custom or not would just
add the ability to exit early. What I would prefer is knowing the
specific state of the hardware as it will allow me to call the
specific method ID as related to the current profile. I'll elaborate a
bit on what I mean.

Each attribute ID corresponds to a specific fan profile mode for a
specific attribute. It is used as both the data block ID in
LENOVO_CAPABILITY_DATA_01, and as the first argument when using
GetFeatureValue/SetFeatureValue on the Other Mode interface. I map
these with the lenovo_wmi_attr_id struct. The fan mode value provided
by the gamezone interface corresponds directly to the mode value in
the ID. For example, ID 0x01010100 would provide the capability data
for the CPU device (0x01), SPPT (0x01), in Quiet mode (0x01). There is
no type ID for these attributes (0x00) like there are on some
unimplemented attributes. Balanced mode is 0x02, Performance is 0x03,
Extreme mode (Which the Go doesn't use and there is no analogue for in
the kernel atm) is 0xE0, and custom mode is 0xFF. When the
GetSmartFanMode method ID is called on the gamezone interface it
returns one of these values, corresponding to the current state of the
hardware. This allows us to call GetFeatureValue for the current
profile. Currently we are always calling the custom mode method ID
(0x0101FF00) in GetFeatureValue.

If we want to avoid an additional wmi call in GZ, then grabbing it
from the platform profile and translating it back would maybe suffice.
In that case I would need to implement the
LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT GUID
"D320289E-8FEA-41E0-86F9-611D83151B5F" to ensure that the profile is
updated properly when the hardware is switched profiles using the
physical buttons. This is probably a good idea anyway, but some
guidance on implementing that would be nice as I think it would be an
additional driver and then we have more cross referencing.

The simplest solution IMO would be to do something closer to what I
was doing in v1 just for current_value_show, where we instantiate the
mode variable as SMARTFAN_MODE_CUSTOM (0xFF) then check if the gz
interface is present. If it is, pass the mode variable as a pointer to
GZ where it can call GetSmartFanMode and update the value. Otherwise,
bypass that block and treat it as custom. This does add an additional
WMI call, but only when reading the current_value.

> > - I did extensive testing of this firmware-attributes interface and its
> >    ability to retain the value set by the user. The SPL, SPPT, FPPT, an=
d
> >    platform profile all retain the users last setting when resuming fro=
m
> >    suspend, a full reboot, and a full shutdown. The only time the value=
s
> >    are not preserved is when the user manually selects a new platform
> >    profile using either the pprof interface or the manual selection
> >    button on the device, in which case you would not expect them to be
> >    retained as they were intentionally changed. Based on the previous
> >    discussion it may be the case that older BIOS' will preserve the
> >    settings even after changing profiles, though I haven't confirmed
> >    this.
>
> This is good to hear considering the concerns raised by some others.
>
> But FWIW we have nothing in the firmware attributes API documentation
> that mandates what the firmware does for storage of settings across a
> power cycle so this is currently up to the platform to decide.
> >
> > v1:
> > https://lore.kernel.org/platform-driver-x86/CAFqHKTna+kJpHLo5s4Fm1TmHcS=
SqSTr96JHDm0DJ0dxsZMkixA@mail.gmail.com/T/#t
> >
> > Suggested-by: Mario Limonciello <superm1@kernel.org>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >
> > Derek J. Clark (4):
> >    platform/x86: Add lenovo-wmi drivers Documentation
> >    platform/x86: Add Lenovo GameZone WMI Driver
> >    platform/x86: Add Lenovo Capability Data 01 WMI Driver
> >    platform/x86: Add Lenovo Other Mode WMI Driver
> >
> >   Documentation/wmi/devices/lenovo-wmi.rst    | 104 ++++++
> >   MAINTAINERS                                 |   9 +
> >   drivers/platform/x86/Kconfig                |  34 ++
> >   drivers/platform/x86/Makefile               |   3 +
> >   drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++
> >   drivers/platform/x86/lenovo-wmi-gamezone.c  | 203 +++++++++++
> >   drivers/platform/x86/lenovo-wmi-other.c     | 385 +++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi.h           | 241 ++++++++++++
> >   8 files changed, 1110 insertions(+)
> >   create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi.h
> >
>
