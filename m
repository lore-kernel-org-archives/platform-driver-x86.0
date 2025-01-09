Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9611A4F1F;
	Thu,  9 Jan 2025 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736464847; cv=none; b=NRbI19Dufh/rdpU2FiTWE4CBEXtmAmYGdxhi2KL7hztob0oDeW0ahbFqq74WcWYZnXh3l0HC3stgX4xqFXr/Aw4JjuC91r9bnKTTwYZVhOvXo8PAIrv1ke8fbUz3VNXn2uGZZZQ/nmX5q50vYqXKKgmKJRTVtb/cjcya9+HAKr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736464847; c=relaxed/simple;
	bh=WLJt4UDKGk6oFxDcRWUpMQhwmS0F9k5/rgATN8aTrfk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=g/pablg4P1Rae3LCZHQzQYnXNjfMvaVVnWIr160gBuCTck09+3B4AtDGiGpAR8JX6ynwupxdx14hgXzLcLg1v0TxZgaB4qurMvchloIrMnVIbkWKoyhWYEGTRhk/aohZbCo/GP1OwtltXOuMs2CV3CAiO46fLMMrJumuA1MAfwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OQ7K721N; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OQ7K721N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736464823; x=1737069623; i=w_armin@gmx.de;
	bh=H5H0UJIsAdiTT7FumgWyRTw/KNYQhcnLts28U4SuEGs=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OQ7K721NNQ9FgTKLcdapinYu4F7lC4dVHs8AJV6HS8LSMqHFjWFoerfmaGvogoOA
	 goI+SqWzbApA8k04W8kV9m2GhHhAR+cC5x2JUKPjFVepFZwk8G/20P8LSNDcecswz
	 cipMLnhz1mjhXU/+Bs8Za50z3Vdm6EY1uwR0VqCJ7dMO4HdS5EShP2gJTBw5awORk
	 RSNyGy402Sr+xpsOtLOkbEnG+ycAjzofFYtMx1Lku00C0eMZFicf15lLiqjYyQW3z
	 Abu3JuE67stVTdZwOVeCeqFPycYdvI6311hp2vrsn1ZUAV/zVCZoTLRjwTqakGaTh
	 PNNtIVsD7P5/ike+Hg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1twwcu3Ofi-00MFQd; Fri, 10
 Jan 2025 00:20:23 +0100
Content-Type: multipart/mixed; boundary="------------T7cLSj0mYsRMIxCI0xyspyX0"
Message-ID: <c29e64fd-8e9c-4179-806e-db516576a153@gmx.de>
Date: Fri, 10 Jan 2025 00:20:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] platform/x86: Add Lenovo Gaming Series WMI Drivers
To: Derek John Clark <derekjohn.clark@gmail.com>,
 Mario Limonciello <superm1@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <dc5375fb-1e2e-42b9-9174-3f4a70d914e7@kernel.org>
 <CAFqHKTkRhaci86qBE4Zc+EeV47T22y8fuesjWN_3WzFTuEnOPg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKTkRhaci86qBE4Zc+EeV47T22y8fuesjWN_3WzFTuEnOPg@mail.gmail.com>
X-Provags-ID: V03:K1:GLVHD6C6ZBbv8+HzEiy/bGxsI9l+9Y6UwXrGP5iLiyfaC6gsozk
 tcouSIbUBba6TD7EkChVCEeNpqr0LEhvQbBnXWmGDjc6jdeayJtaZuRXSnPwfN9IYMGEXwB
 98ZCL6IrxTBkKYUXu/jr6JKgPADMfYl1B8ShWQlz/gESw5JhT74t+iN6DvDjh77fWB4mFtT
 AhcRY/nDK2WeYfYwdolzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p0oI2cy54ns=;XNMizKRMJ16PlWaCkYZz8RAmybj
 sTr4jsnMRA7a0pi4R2ZjYHWkNY5vE5h33vsx1C4bgxReDVgR1n1j2omwQoMU1+vnAKUqtwekl
 Taedq5WVe1an10T2G7hN3SRPjfsKcxLLM4JmpCqMgHtrUunqF8tNx8V59jI5N++DJExfwI9YC
 1lmkmHM7aW2zh80+9Q9mfh+eLopaNdGTMY5khPnD8rBhH7nYMg3N6BcIwH3pMqSnHUkvI+2oJ
 PkmI8nxp5pHDRZ5mSK6Cur21lleDefveM4KyrTVVuA1hwgIzgWlBLgnVvIaxBCQRIeq+gWtUA
 7bPiYCTognIbMBsJ6sEWy/PemZ6DjO2Vo6MKYB4ZXfKxfVk2v8YTtmmdN3LuDfZIQO1zTCCaB
 XAOHgiMfDa+fRjKs35N3/2Xnqcz/ZYqqrKMJaNN8b5lpDZ8jwi3q/4qEy2ZDVtyFI8piT8VjG
 uCPk1eW8ed55x3mPJ/6vuzTQOqlUD2bdlblV9wCQp86+F06wL/JRN5u44oASzxlbBTiOxhTjt
 ut7dXnJfXVGSWYgjBRbLbRN5TR1U94Dvr+X91dEfmPGH5wEOipPhFxYFSY98L5j3TlcmsO6RS
 y99Je3so14hjvq+q9LRdVzB9kgsoCTRl7UpU0Srjh3Te57lVTBFwGy9gB6YIRFXvUISzFPgV4
 adtxnIrpPHfS5sgXd0bIaWh4O+l6fXvu+mb7ZOtscJ/Ro64dERB9+WyIvwUbgBD6rEbes2MkV
 X4ogVPHgHBOBznpbWAjptgmhmnc8etoQLQUotpF16Lof4nSpJIIVSFIcdGh2fF73nXbUWD6d2
 Z9iqjRKOZrLVLimqrCjsVVS/XRUVWj81V/rMmarquBSp/nEjz+9BdAPvPc6rNCw1qDJZ/iLOT
 uoq+uLIYe6NFVQTgHaViV2jSn95AbUT0L/UW78q0oECV0z148M6v0xwNs1S1BGLTJxZbmeDnW
 g/Q6fcDe5sg4auqhVrTK6eYy6MCy0JHp9crky1msprH24vgXPC0H6sKuK+4hQ7GrItmweCrQz
 Pucw6JJx0wJFmL/gcH3dc2EJptvVAGG8RRNHCzztH3mH7FfhPSo15KVDuvOh9/8FsMyYHnh9E
 i0uh9nGYDK/ZCvarEIRROz1NLc1oqz

This is a multi-part message in MIME format.
--------------T7cLSj0mYsRMIxCI0xyspyX0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 02.01.25 um 19:27 schrieb Derek John Clark:

> On Wed, Jan 1, 2025 at 8:01=E2=80=AFPM Mario Limonciello <superm1@kernel=
.org> wrote:
>>
>>
>> On 1/1/25 18:47, Derek J. Clark wrote:
>>> Adds support for the Lenovo "Gaming Series" of laptop hardware that us=
e
>>> WMI interfaces that control various power settings. There are multiple=
 WMI
>>> interfaces that work in concert to provide getting and setting values =
as
>>> well as validation of input. Currently only the "GameZone", "Other
>>> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
>>> I attempted to structure the driver so that adding the "Custom Mode",
>>> "Lighting", and other data block interfaces would be trivial in a late=
r
>>> patches.
>>>
>>> This driver is distinct from, but should be considered a replacement f=
or
>>> this patch:
>>> https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/
>>>
>>> This driver attempts to standardize the exposed sysfs by mirroring the
>>> asus-armoury driver currently under review. As such, a lot of
>>> inspiration has been drawn from that driver.
>>> https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/
>>>
>>> The drivers have been tested by me on the Lenovo Legion Go.
>>>
>>> v2:
>>> - Broke up initial patch into a 4 patch series.
>>> - Removed all references to "Legion" in documentation, Kconfig,
>>>     driver structs, functions, etc. Everything now refers either to th=
e
>>>     interface being used or the Lenovo "Gaming Series" of laptop hardw=
are.
>>> - Fixed all Acked changes requested by Mario and Armin.
>>> - Capability Data is now cached before kset creation for each attribut=
e.
>>>     If the lenovo-wmi-capdata01 interface is not present, fails to gra=
b
>>>     valid data, doesn't include the requested attribute id page, or th=
e
>>>     data block indicates the attribute is not supported, the attribute=
 will
>>>     not be created in sysfs.
>>> - The sysfs path for the firmware-attributes class was moved from
>>>     lenovo-legion-wmi to lenovo-wmi-other.
>>>
>>> - The Other Mode WMI interface no longer relies on gamezone as
>>>     discussed. However; this creates a problem that should be discusse=
d
>>>     here. The current_value attribute is now only accurate when the
>>>     "custom" profile is set on the device. Previously it would report =
the
>>>     value from the Capability Data 01 instance related to the currentl=
y
>>>     selected profile, which reported an accurate accounting of the cur=
rent
>>>     system state in all cases. I submitted this as-is since we discuss=
ed
>>>     removing that dependency, but I am not a fan of the current_value
>>>     attribute being incorrect for 3 of the 4 available profiles, espec=
ially
>>>     when the data is available. There is also no way to -ENOTSUPP or
>>>     similar when not in custom mode as that would also require us to k=
now
>>>     the state of the gamezone interface. What I would prefer to do wou=
ld be
>>>     to make the gamezone interface optional by treating custom as the
>>>     default mode in the current_value functions, then only update the =
mode
>>>     if a callback to get the current fan profile is a success. That wa=
y the
>>>     logic will work with or without the GameZone interface, but it wil=
l be
>>>     greatly improved if it is present.
>>>
>> I agree there needs to be /some/ sort of dependency.
>> One thing I was thinking you could do is use:
>>
>> wmi_has_guid() to tell whether or not the "GZ" interface is even presen=
t
>> from the "Other" driver.  Move the GUID for the GZ interface into a
>> common header both drivers include.
>>
>> However that only helps in the case of a system that supports custom bu=
t
>> not GZ.  I think you still will need some sort of symbol to either get =
a
>> pointer to the platform profile class or tell if the profile for the
>> driver is set to custom.
>>
>> I personally don't see a problem with a simple symbol like this:
>>
>> bool lenovo_wmi_gamezone_is_custom(void);
>>
>> You could then have your logic in all the store and show call a helper
>> something like this:
>>
>> static bool lenovo_wmi_custom_mode() {
>>          if (!wmi_has_guid(GZ_GUID)
>>                  return true;
>>
>>          if (!IS_REACHABLE(CONFIG_LENOVO_WMI_GAMEZONE))
>>                  return true;
>>
>>          return lenovo_wmi_gamezone_is_custom();
>> }
> I agree with checking wmi_has_guid() before calling anything across
> interfaces.

Please do not use wmi_has_guid() for this as WMI devices can disappear
at any time.

> As far as using a bool to determine if we are in custom,
> that seems to me like that would be a half measure. Since we would be
> calling across interfaces anyway there is a benefit to getting the
> full scope, where knowing only if we are in custom or not would just
> add the ability to exit early. What I would prefer is knowing the
> specific state of the hardware as it will allow me to call the
> specific method ID as related to the current profile. I'll elaborate a
> bit on what I mean.
>
> Each attribute ID corresponds to a specific fan profile mode for a
> specific attribute. It is used as both the data block ID in
> LENOVO_CAPABILITY_DATA_01, and as the first argument when using
> GetFeatureValue/SetFeatureValue on the Other Mode interface. I map
> these with the lenovo_wmi_attr_id struct. The fan mode value provided
> by the gamezone interface corresponds directly to the mode value in
> the ID. For example, ID 0x01010100 would provide the capability data
> for the CPU device (0x01), SPPT (0x01), in Quiet mode (0x01). There is
> no type ID for these attributes (0x00) like there are on some
> unimplemented attributes. Balanced mode is 0x02, Performance is 0x03,
> Extreme mode (Which the Go doesn't use and there is no analogue for in
> the kernel atm) is 0xE0, and custom mode is 0xFF. When the
> GetSmartFanMode method ID is called on the gamezone interface it
> returns one of these values, corresponding to the current state of the
> hardware. This allows us to call GetFeatureValue for the current
> profile. Currently we are always calling the custom mode method ID
> (0x0101FF00) in GetFeatureValue.
>
> If we want to avoid an additional wmi call in GZ, then grabbing it
> from the platform profile and translating it back would maybe suffice.
> In that case I would need to implement the
> LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT GUID
> "D320289E-8FEA-41E0-86F9-611D83151B5F" to ensure that the profile is
> updated properly when the hardware is switched profiles using the
> physical buttons. This is probably a good idea anyway, but some
> guidance on implementing that would be nice as I think it would be an
> additional driver and then we have more cross referencing.

I attached a prototype WMI driver for another device which had a similar p=
roblem.
The solution was to provide a notifier so other event consumers can be not=
ified
when an WMI event was received.

Example event consumer callback code:

	static int uniwill_wmi_notify_call(struct notifier_block *nb, unsigned lo=
ng action, void *data)
	{
         	if (action !=3D UNIWILL_OSD_PERF_MODE_CHANGED)
                 	return NOTIFY_DONE;

         	platform_profile_cycle();

         	return NOTIFY_OK;
	}

I would also suggest that you use a notifier for communicating with the ga=
mezone
interface. Then you just have to submit commands (as action values) in the=
 form of events
which will then be processed by the available gamezone drivers (the result=
 can be stored in *data).

Those gamezone drivers can then return NOTIFY_STOP which will ensure that =
only a single gamezone
driver can successfully process a given command.

All in all the patch series seems to progress nicely. I am confident that =
we will solve the remaining issues.

Thanks,
Armin Wolf

>
> The simplest solution IMO would be to do something closer to what I
> was doing in v1 just for current_value_show, where we instantiate the
> mode variable as SMARTFAN_MODE_CUSTOM (0xFF) then check if the gz
> interface is present. If it is, pass the mode variable as a pointer to
> GZ where it can call GetSmartFanMode and update the value. Otherwise,
> bypass that block and treat it as custom. This does add an additional
> WMI call, but only when reading the current_value.
>
>>> - I did extensive testing of this firmware-attributes interface and it=
s
>>>     ability to retain the value set by the user. The SPL, SPPT, FPPT, =
and
>>>     platform profile all retain the users last setting when resuming f=
rom
>>>     suspend, a full reboot, and a full shutdown. The only time the val=
ues
>>>     are not preserved is when the user manually selects a new platform
>>>     profile using either the pprof interface or the manual selection
>>>     button on the device, in which case you would not expect them to b=
e
>>>     retained as they were intentionally changed. Based on the previous
>>>     discussion it may be the case that older BIOS' will preserve the
>>>     settings even after changing profiles, though I haven't confirmed
>>>     this.
>> This is good to hear considering the concerns raised by some others.
>>
>> But FWIW we have nothing in the firmware attributes API documentation
>> that mandates what the firmware does for storage of settings across a
>> power cycle so this is currently up to the platform to decide.
>>> v1:
>>> https://lore.kernel.org/platform-driver-x86/CAFqHKTna+kJpHLo5s4Fm1TmHc=
SSqSTr96JHDm0DJ0dxsZMkixA@mail.gmail.com/T/#t
>>>
>>> Suggested-by: Mario Limonciello <superm1@kernel.org>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>
>>> Derek J. Clark (4):
>>>     platform/x86: Add lenovo-wmi drivers Documentation
>>>     platform/x86: Add Lenovo GameZone WMI Driver
>>>     platform/x86: Add Lenovo Capability Data 01 WMI Driver
>>>     platform/x86: Add Lenovo Other Mode WMI Driver
>>>
>>>    Documentation/wmi/devices/lenovo-wmi.rst    | 104 ++++++
>>>    MAINTAINERS                                 |   9 +
>>>    drivers/platform/x86/Kconfig                |  34 ++
>>>    drivers/platform/x86/Makefile               |   3 +
>>>    drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++
>>>    drivers/platform/x86/lenovo-wmi-gamezone.c  | 203 +++++++++++
>>>    drivers/platform/x86/lenovo-wmi-other.c     | 385 +++++++++++++++++=
+++
>>>    drivers/platform/x86/lenovo-wmi.h           | 241 ++++++++++++
>>>    8 files changed, 1110 insertions(+)
>>>    create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi.h
>>>

--------------T7cLSj0mYsRMIxCI0xyspyX0
Content-Type: text/x-csrc; charset=UTF-8; name="uniwill-wmi.c"
Content-Disposition: attachment; filename="uniwill-wmi.c"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKLyoKICogTGlu
dXggaG90a2V5IGRyaXZlciBmb3IgVW5pd2lsbCBub3RlYm9va3MuCiAqCiAqIENvcHlyaWdo
dCAoQykgMjAyNCBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KICovCgojaW5jbHVkZSA8
bGludXgvYWNwaS5oPgojaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiNpbmNsdWRlIDxsaW51
eC9lcnJuby5oPgojaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CiNpbmNsdWRlIDxsaW51eC9p
bnB1dC5oPgojaW5jbHVkZSA8bGludXgvaW5wdXQvc3BhcnNlLWtleW1hcC5oPgojaW5jbHVk
ZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+CiNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
I2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+CiNpbmNsdWRlIDxsaW51eC9ub3RpZmllci5oPgoj
aW5jbHVkZSA8bGludXgvcHJpbnRrLmg+CiNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgojaW5jbHVkZSA8bGludXgvd21pLmg+CgojaW5jbHVkZSAi
dW5pd2lsbC13bWkuaCIKCiNkZWZpbmUgRFJJVkVSX05BTUUJCSJ1bml3aWxsLXdtaSIKI2Rl
ZmluZSBVTklXSUxMX0VWRU5UX0dVSUQJIkFCQkMwRjcyLThFQTEtMTFEMS0wMEEwLUM5MDYy
OTEwMDAwMCIKCnN0cnVjdCB1bml3aWxsX3dtaV9kYXRhIHsKCXN0cnVjdCBtdXRleCBpbnB1
dF9sb2NrOwkvKiBQcm90ZWN0cyBpbnB1dCBzZXF1ZW5jZSBkdXJpbmcgbm90aWZ5ICovCglz
dHJ1Y3QgaW5wdXRfZGV2ICppbnB1dF9kZXZpY2U7Cn07CgpzdGF0aWMgQkxPQ0tJTkdfTk9U
SUZJRVJfSEVBRCh1bml3aWxsX3dtaV9jaGFpbl9oZWFkKTsKCnN0YXRpYyBjb25zdCBzdHJ1
Y3Qga2V5X2VudHJ5IHVuaXdpbGxfd21pX2tleW1hcFtdID0gewoJLyogUmVwb3J0ZWQgdmlh
IGtleWJvYXJkIGNvbnRyb2xsZXIgKi8KCXsgS0VfSUdOT1JFLAlVTklXSUxMX0tFWV9DQVBT
TE9DSywJCQl7IEtFWV9DQVBTTE9DSyB9fSwKCXsgS0VfSUdOT1JFLAlVTklXSUxMX0tFWV9O
VU1MT0NLLAkJCXsgS0VZX05VTUxPQ0sgfX0sCgl7IEtFX0lHTk9SRSwJVU5JV0lMTF9LRVlf
U0NST0xMTE9DSywJCQl7IEtFWV9TQ1JPTExMT0NLIH19LAoKCXsgS0VfSUdOT1JFLAlVTklX
SUxMX0tFWV9UT1VDSFBBRF9PTiwJCXsgS0VZX1RPVUNIUEFEX09OIH19LAoJeyBLRV9JR05P
UkUsCVVOSVdJTExfS0VZX1RPVUNIUEFEX09GRiwJCXsgS0VZX1RPVUNIUEFEX09GRiB9fSwK
CgkvKiBSZXBvcnRlZCB2aWEgInZpZGVvIGJ1cyIgKi8KCXsgS0VfSUdOT1JFLAlVTklXSUxM
X0tFWV9CUklHSFRORVNTVVAsCQl7IEtFWV9CUklHSFRORVNTVVAgfX0sCgl7IEtFX0lHTk9S
RSwJVU5JV0lMTF9LRVlfQlJJR0hUTkVTU0RPV04sCQl7IEtFWV9CUklHSFRORVNTRE9XTiB9
fSwKCgkvKgoJICogUmVwb3J0ZWQgaW4gYXV0b21hdGljIG1vZGUgd2hlbiByZmtpbGwgc3Rh
dGUgY2hhbmdlcy4KCSAqIFdlIGlnbm9yZSB0aG9zZSBldmVudHMgc2luY2UgdW5pd2lsbC1s
YXB0b3AgYWx3YXlzIHB1dHMKCSAqIHRoZSBFQyBpbnRvIG1hbnVhbCBtb2RlLgoJICovCgl7
IEtFX0lHTk9SRSwJVU5JV0lMTF9PU0RfUkFESU9PTiwJCQl7LnN3ID0geyBTV19SRktJTExf
QUxMLCAxIH19fSwKCXsgS0VfSUdOT1JFLAlVTklXSUxMX09TRF9SQURJT09GRiwJCQl7LnN3
ID0geyBTV19SRktJTExfQUxMLCAwIH19fSwKCgkvKiBSZXBvcnRlZCB2aWEga2V5Ym9hcmQg
Y29udHJvbGxlciAqLwoJeyBLRV9JR05PUkUsCVVOSVdJTExfS0VZX01VVEUsCQkJeyBLRVlf
TVVURSB9fSwKCXsgS0VfSUdOT1JFLAlVTklXSUxMX0tFWV9WT0xVTUVET1dOLAkJCXsgS0VZ
X1ZPTFVNRURPV04gfX0sCgl7IEtFX0lHTk9SRSwJVU5JV0lMTF9LRVlfVk9MVU1FVVAsCQkJ
eyBLRVlfVk9MVU1FVVAgfX0sCgoJeyBLRV9JR05PUkUsCVVOSVdJTExfT1NEX0xJR0hUQkFS
X09OLAkJeyBLRVlfUkVTRVJWRUQgfX0sCgl7IEtFX0lHTk9SRSwJVU5JV0lMTF9PU0RfTElH
SFRCQVJfT0ZGLAkJeyBLRVlfUkVTRVJWRUQgfX0sCgoJeyBLRV9LRVksCVVOSVdJTExfT1NE
X0tCX0xFRF9MRVZFTDAsCQl7IEtFWV9LQkRJTExVTVRPR0dMRSB9fSwKCXsgS0VfS0VZLAlV
TklXSUxMX09TRF9LQl9MRURfTEVWRUwxLAkJeyBLRVlfS0JESUxMVU1UT0dHTEUgfX0sCgl7
IEtFX0tFWSwJVU5JV0lMTF9PU0RfS0JfTEVEX0xFVkVMMiwJCXsgS0VZX0tCRElMTFVNVE9H
R0xFIH19LAoJeyBLRV9LRVksCVVOSVdJTExfT1NEX0tCX0xFRF9MRVZFTDMsCQl7IEtFWV9L
QkRJTExVTVRPR0dMRSB9fSwKCXsgS0VfS0VZLAlVTklXSUxMX09TRF9LQl9MRURfTEVWRUw0
LAkJeyBLRVlfS0JESUxMVU1UT0dHTEUgfX0sCgoJeyBLRV9JR05PUkUsCVVOSVdJTExfT1NE
X1NVUEVSX0tFWV9MT0NLX0VOQUJMRSwJeyBLRVlfUkVTRVJWRUQgfX0sCgl7IEtFX0lHTk9S
RSwJVU5JV0lMTF9PU0RfU1VQRVJfS0VZX0xPQ0tfRElTQUJMRSwJeyBLRVlfUkVTRVJWRUQg
fX0sCgoJLyoKCSAqIE5vdCByZXBvcnRlZCBieSBvdGhlciBtZWFucyB3aGVuIGluIG1hbnVh
bCBtb2RlLAoJICogaGFuZGxlZCBhdXRvbWF0aWNhbGx5IHdoZW4gaW4gYXV0b21hdGljIG1v
ZGUKCSAqLwoJeyBLRV9LRVksCVVOSVdJTExfS0VZX1JGS0lMTCwJCQl7IEtFWV9SRktJTEwg
fX0sCgoJeyBLRV9JR05PUkUsCVVOSVdJTExfT1NEX1NVUEVSX0tFWV9MT0NLX1RPR0dMRSwJ
eyBLRVlfUkVTRVJWRUQgfX0sCgl7IEtFX0lHTk9SRSwJVU5JV0lMTF9PU0RfTElHSFRCQVJf
U1RBVEVfQ0hBTkdFRCwJeyBLRVlfUkVTRVJWRUQgfX0sCgl7IEtFX0lHTk9SRSwJVU5JV0lM
TF9PU0RfRkFOX0JPT1NUX1NUQVRFX0NIQU5HRUQsCXsgS0VZX1JFU0VSVkVEIH19LAoJeyBL
RV9JR05PUkUsCVVOSVdJTExfT1NEX0RDX0FEQVBURVJfQ0hBTkdFRCwJCXsgS0VZX1JFU0VS
VkVEIH19LAoKCXsgS0VfSUdOT1JFLAlVTklXSUxMX09TRF9QRVJGX01PREVfQ0hBTkdFRCwJ
CXsgS0VZX1JFU0VSVkVEIH19LAoKCS8qCgkgKiBOb3QgcmVwb3J0ZWQgYnkgb3RoZXIgbWVh
bnMgd2hlbiBpbiBtYW51YWwgbW9kZSwKCSAqIGhhbmRsZWQgYXV0b21hdGljYWxseSB3aGVu
IGluIGF1dG9tYXRpYyBtb2RlCgkgKi8KCXsgS0VfS0VZLAlVTklXSUxMX0tFWV9LQkRJTExV
TURPV04sCQl7IEtFWV9LQkRJTExVTURPV04gfX0sCgl7IEtFX0tFWSwJVU5JV0lMTF9LRVlf
S0JESUxMVU1VUCwJCQl7IEtFWV9LQkRJTExVTVVQIH19LAoJeyBLRV9LRVksCVVOSVdJTExf
S0VZX0ZOX0xPQ0ssCQkJeyBLRVlfRk5fRVNDIH19LAoKCXsgS0VfS0VZLAlVTklXSUxMX0tF
WV9LQkRJTExVTVRPR0dMRSwJCXsgS0VZX0tCRElMTFVNVE9HR0xFIH19LAoKCXsgS0VfSUdO
T1JFLAlVTklXSUxMX09TRF9LQkRfQkFDS0xJR0hUX0NIQU5HRUQsCXsgS0VZX1JFU0VSVkVE
IH19LAoKCXsgS0VfRU5EIH0KfTsKCmludCB1bml3aWxsX3dtaV9yZWdpc3Rlcl9ub3RpZmll
cihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKQp7CglyZXR1cm4gYmxvY2tpbmdfbm90aWZp
ZXJfY2hhaW5fcmVnaXN0ZXIoJnVuaXdpbGxfd21pX2NoYWluX2hlYWQsIG5iKTsKfQpFWFBP
UlRfU1lNQk9MX05TX0dQTCh1bml3aWxsX3dtaV9yZWdpc3Rlcl9ub3RpZmllciwgVU5JV0lM
TCk7CgppbnQgdW5pd2lsbF93bWlfdW5yZWdpc3Rlcl9ub3RpZmllcihzdHJ1Y3Qgbm90aWZp
ZXJfYmxvY2sgKm5iKQp7CglyZXR1cm4gYmxvY2tpbmdfbm90aWZpZXJfY2hhaW5fdW5yZWdp
c3RlcigmdW5pd2lsbF93bWlfY2hhaW5faGVhZCwgbmIpOwp9CkVYUE9SVF9TWU1CT0xfTlNf
R1BMKHVuaXdpbGxfd21pX3VucmVnaXN0ZXJfbm90aWZpZXIsIFVOSVdJTEwpOwoKc3RhdGlj
IHZvaWQgZGV2bV91bml3aWxsX3dtaV91bnJlZ2lzdGVyX25vdGlmaWVyKHZvaWQgKmRhdGEp
CnsKCXN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIgPSBkYXRhOwoKCXVuaXdpbGxfd21pX3Vu
cmVnaXN0ZXJfbm90aWZpZXIobmIpOwp9CgppbnQgZGV2bV91bml3aWxsX3dtaV9yZWdpc3Rl
cl9ub3RpZmllcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bmIpCnsKCWludCByZXQ7CgoJcmV0ID0gdW5pd2lsbF93bWlfcmVnaXN0ZXJfbm90aWZpZXIo
bmIpOwoJaWYgKHJldCA8IDApCgkJcmV0dXJuIHJldDsKCglyZXR1cm4gZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KGRldiwgZGV2bV91bml3aWxsX3dtaV91bnJlZ2lzdGVyX25vdGlmaWVy
LCBuYik7Cn0KRVhQT1JUX1NZTUJPTF9OU19HUEwoZGV2bV91bml3aWxsX3dtaV9yZWdpc3Rl
cl9ub3RpZmllciwgVU5JV0lMTCk7CgpzdGF0aWMgdm9pZCB1bml3aWxsX3dtaV9ub3RpZnko
c3RydWN0IHdtaV9kZXZpY2UgKndkZXYsIHVuaW9uIGFjcGlfb2JqZWN0ICpvYmopCnsKCXN0
cnVjdCB1bml3aWxsX3dtaV9kYXRhICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKCZ3ZGV2LT5k
ZXYpOwoJdTMyIHZhbHVlOwoJaW50IHJldDsKCglpZiAob2JqLT50eXBlICE9IEFDUElfVFlQ
RV9JTlRFR0VSKQoJCXJldHVybjsKCgl2YWx1ZSA9IG9iai0+aW50ZWdlci52YWx1ZTsKCglk
ZXZfZGJnKCZ3ZGV2LT5kZXYsICJSZWNlaXZlZCBXTUkgZXZlbnQgJXVcbiIsIHZhbHVlKTsK
CglyZXQgPSBibG9ja2luZ19ub3RpZmllcl9jYWxsX2NoYWluKCZ1bml3aWxsX3dtaV9jaGFp
bl9oZWFkLCB2YWx1ZSwgTlVMTCk7CglpZiAocmV0ID09IE5PVElGWV9CQUQpCgkJcmV0dXJu
OwoKCW11dGV4X2xvY2soJmRhdGEtPmlucHV0X2xvY2spOwoJc3BhcnNlX2tleW1hcF9yZXBv
cnRfZXZlbnQoZGF0YS0+aW5wdXRfZGV2aWNlLCB2YWx1ZSwgMSwgdHJ1ZSk7CgltdXRleF91
bmxvY2soJmRhdGEtPmlucHV0X2xvY2spOwp9CgpzdGF0aWMgaW50IHVuaXdpbGxfd21pX3By
b2JlKHN0cnVjdCB3bWlfZGV2aWNlICp3ZGV2LCBjb25zdCB2b2lkICpjb250ZXh0KQp7Cglz
dHJ1Y3QgdW5pd2lsbF93bWlfZGF0YSAqZGF0YTsKCWludCByZXQ7CgoJZGF0YSA9IGRldm1f
a3phbGxvYygmd2Rldi0+ZGV2LCBzaXplb2YoKmRhdGEpLCBHRlBfS0VSTkVMKTsKCWlmICgh
ZGF0YSkKCQlyZXR1cm4gLUVOT01FTTsKCglyZXQgPSBkZXZtX211dGV4X2luaXQoJndkZXYt
PmRldiwgJmRhdGEtPmlucHV0X2xvY2spOwoJaWYgKHJldCA8IDApCgkJcmV0dXJuIHJldDsK
CglkZXZfc2V0X2RydmRhdGEoJndkZXYtPmRldiwgZGF0YSk7CgoJZGF0YS0+aW5wdXRfZGV2
aWNlID0gZGV2bV9pbnB1dF9hbGxvY2F0ZV9kZXZpY2UoJndkZXYtPmRldik7CglpZiAoIWRh
dGEtPmlucHV0X2RldmljZSkKCQlyZXR1cm4gLUVOT01FTTsKCglyZXQgPSBzcGFyc2Vfa2V5
bWFwX3NldHVwKGRhdGEtPmlucHV0X2RldmljZSwgdW5pd2lsbF93bWlfa2V5bWFwLCBOVUxM
KTsKCWlmIChyZXQgPCAwKQoJCXJldHVybiByZXQ7CgoJZGF0YS0+aW5wdXRfZGV2aWNlLT5u
YW1lID0gIlVuaXdpbGwgV01JIGhvdGtleXMiOwoJZGF0YS0+aW5wdXRfZGV2aWNlLT5waHlz
ID0gIndtaS9pbnB1dDAiOwoJZGF0YS0+aW5wdXRfZGV2aWNlLT5pZC5idXN0eXBlID0gQlVT
X0hPU1Q7CgoJcmV0dXJuIGlucHV0X3JlZ2lzdGVyX2RldmljZShkYXRhLT5pbnB1dF9kZXZp
Y2UpOwp9CgovKgogKiBXZSBjYW5ub3QgZnVsbHkgdHJ1c3QgdGhpcyBHVUlEIHNpbmNlIFVu
aXdpbGwganVzdCBjb3BpZWQgdGhlIFdNSSBHVUlECiAqIGZyb20gdGhlIFdpbmRvd3MgZHJp
dmVyIGV4YW1wbGUsIGFuZCBvdGhlcnMgcHJvYmFibHkgZGlkIHRoZSBzYW1lLgogKgogKiBC
ZWNhdXNlIG9mIHRoaXMgd2UgY2Fubm90IHVzZSB0aGlzIFdNSSBHVUlEIGZvciBhdXRvbG9h
ZGluZy4KICovCnN0YXRpYyBjb25zdCBzdHJ1Y3Qgd21pX2RldmljZV9pZCB1bml3aWxsX3dt
aV9pZF90YWJsZVtdID0gewoJeyBVTklXSUxMX0VWRU5UX0dVSUQsIE5VTEwgfSwKCXsgfQp9
OwoKc3RhdGljIHN0cnVjdCB3bWlfZHJpdmVyIHVuaXdpbGxfd21pX2RyaXZlciA9IHsKCS5k
cml2ZXIgPSB7CgkJLm5hbWUgPSBEUklWRVJfTkFNRSwKCQkucHJvYmVfdHlwZSA9IFBST0JF
X1BSRUZFUl9BU1lOQ0hST05PVVMsCgl9LAoJLmlkX3RhYmxlID0gdW5pd2lsbF93bWlfaWRf
dGFibGUsCgkucHJvYmUgPSB1bml3aWxsX3dtaV9wcm9iZSwKCS5ub3RpZnkgPSB1bml3aWxs
X3dtaV9ub3RpZnksCgkubm9fc2luZ2xldG9uID0gdHJ1ZSwKfTsKbW9kdWxlX3dtaV9kcml2
ZXIodW5pd2lsbF93bWlfZHJpdmVyKTsKCk1PRFVMRV9BVVRIT1IoIkFybWluIFdvbGYgPFdf
QXJtaW5AZ214LmRlPiIpOwpNT0RVTEVfREVTQ1JJUFRJT04oIlVuaXdpbGwgbm90ZWJvb2sg
aG90a2V5IGRyaXZlciIpOwpNT0RVTEVfTElDRU5TRSgiR1BMIik7Cg==
--------------T7cLSj0mYsRMIxCI0xyspyX0
Content-Type: text/x-chdr; charset=UTF-8; name="uniwill-wmi.h"
Content-Disposition: attachment; filename="uniwill-wmi.h"
Content-Transfer-Encoding: base64

LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgKi8KLyoKICog
TGludXggaG90a2V5IGRyaXZlciBmb3IgVW5pd2lsbCBub3RlYm9va3MuCiAqCiAqIENvcHly
aWdodCAoQykgMjAyNCBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KICovCgojaWZuZGVm
IFVOSVdJTExfV01JX0gKI2RlZmluZSBVTklXSUxMX1dNSV9ICgojZGVmaW5lIFVOSVdJTExf
S0VZX0NBUFNMT0NLCQkJMHgwMQojZGVmaW5lIFVOSVdJTExfS0VZX05VTUxPQ0sJCQkweDAy
CiNkZWZpbmUgVU5JV0lMTF9LRVlfU0NST0xMTE9DSwkJCTB4MDMKCiNkZWZpbmUgVU5JV0lM
TF9LRVlfVE9VQ0hQQURfT04JCQkweDA0CiNkZWZpbmUgVU5JV0lMTF9LRVlfVE9VQ0hQQURf
T0ZGCQkweDA1CgojZGVmaW5lIFVOSVdJTExfS0VZX0JSSUdIVE5FU1NVUAkJMHgxNAojZGVm
aW5lIFVOSVdJTExfS0VZX0JSSUdIVE5FU1NET1dOCQkweDE1CgojZGVmaW5lIFVOSVdJTExf
T1NEX1JBRElPT04JCQkweDFBCiNkZWZpbmUgVU5JV0lMTF9PU0RfUkFESU9PRkYJCQkweDFC
CgojZGVmaW5lIFVOSVdJTExfS0VZX01VVEUJCQkweDM1CiNkZWZpbmUgVU5JV0lMTF9LRVlf
Vk9MVU1FRE9XTgkJCTB4MzYKI2RlZmluZSBVTklXSUxMX0tFWV9WT0xVTUVVUAkJCTB4MzcK
CiNkZWZpbmUgVU5JV0lMTF9PU0RfTElHSFRCQVJfT04JCQkweDM5CiNkZWZpbmUgVU5JV0lM
TF9PU0RfTElHSFRCQVJfT0ZGCQkweDNBCgojZGVmaW5lIFVOSVdJTExfT1NEX0tCX0xFRF9M
RVZFTDAJCTB4M0IKI2RlZmluZSBVTklXSUxMX09TRF9LQl9MRURfTEVWRUwxCQkweDNDCiNk
ZWZpbmUgVU5JV0lMTF9PU0RfS0JfTEVEX0xFVkVMMgkJMHgzRAojZGVmaW5lIFVOSVdJTExf
T1NEX0tCX0xFRF9MRVZFTDMJCTB4M0UKI2RlZmluZSBVTklXSUxMX09TRF9LQl9MRURfTEVW
RUw0CQkweDNGCgojZGVmaW5lIFVOSVdJTExfT1NEX1NVUEVSX0tFWV9MT0NLX0VOQUJMRQkw
eDQwCiNkZWZpbmUgVU5JV0lMTF9PU0RfU1VQRVJfS0VZX0xPQ0tfRElTQUJMRQkweDQxCgoj
ZGVmaW5lIFVOSVdJTExfS0VZX1JGS0lMTAkJCTB4QTQKCiNkZWZpbmUgVU5JV0lMTF9PU0Rf
U1VQRVJfS0VZX0xPQ0tfVE9HR0xFCTB4QTUKCiNkZWZpbmUgVU5JV0lMTF9PU0RfTElHSFRC
QVJfU1RBVEVfQ0hBTkdFRAkweEE2CgojZGVmaW5lIFVOSVdJTExfT1NEX0ZBTl9CT09TVF9T
VEFURV9DSEFOR0VECTB4QTcKCiNkZWZpbmUgVU5JV0lMTF9PU0RfRENfQURBUFRFUl9DSEFO
R0VECQkweEFCCgojZGVmaW5lIFVOSVdJTExfT1NEX1BFUkZfTU9ERV9DSEFOR0VECQkweEIw
CgojZGVmaW5lIFVOSVdJTExfS0VZX0tCRElMTFVNRE9XTgkJMHhCMQojZGVmaW5lIFVOSVdJ
TExfS0VZX0tCRElMTFVNVVAJCQkweEIyCgojZGVmaW5lIFVOSVdJTExfS0VZX0ZOX0xPQ0sJ
CQkweEI4CiNkZWZpbmUgVU5JV0lMTF9LRVlfS0JESUxMVU1UT0dHTEUJCTB4QjkKCiNkZWZp
bmUgVU5JV0lMTF9PU0RfS0JEX0JBQ0tMSUdIVF9DSEFOR0VECTB4RjAKCnN0cnVjdCBub3Rp
Zmllcl9ibG9jazsKCmludCB1bml3aWxsX3dtaV9yZWdpc3Rlcl9ub3RpZmllcihzdHJ1Y3Qg
bm90aWZpZXJfYmxvY2sgKm5iKTsKaW50IHVuaXdpbGxfd21pX3VucmVnaXN0ZXJfbm90aWZp
ZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYik7CmludCBkZXZtX3VuaXdpbGxfd21pX3Jl
Z2lzdGVyX25vdGlmaWVyKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG5vdGlmaWVyX2Js
b2NrICpuYik7CgojZW5kaWYgLyogVU5JV0lMTF9XTUlfSCAqLwo=

--------------T7cLSj0mYsRMIxCI0xyspyX0--
