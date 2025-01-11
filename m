Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B341FDD;
	Sat, 11 Jan 2025 00:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736555112; cv=none; b=KoA2vzTBwMtPbVbQ3BCpB7pmOYQR0twUEjf9io92uBWLsh3C5/uf7nmepI4RL5g80x49w6g5VRYUN53OA+pb0+8U4Z1dwDkkux1az0Z9JS0trYuR9PxLJlONgfdHpmQEfBvjjskNtErw2g+/PkVoBwaYUeUx3W/T7NYzrwUcthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736555112; c=relaxed/simple;
	bh=+UqbqCnaBfuEqzDPWwKkg+tEFD+qprqdnexWHhjRI/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXiXQDWBOPcMiSVf86G9JDsid6aWHCpzuvdj8mZEPKcq6QHLUSELftTIVfYNdute6tdPDb5LHn4ekOCFjZryCo8EFTf6WyP/omzOZWs0oSviZcMtlwkXxvH57Aq8iavJm5ijebs0Kf+B0yy0WEVuxBLTQtUXavOVz57nXwNj3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WxJfYTzj; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WxJfYTzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736555107; x=1737159907; i=w_armin@gmx.de;
	bh=Jfi/EeMZI9Ux/AMvxKTRiwOYAFCaAwoax4HgU8Cj9fg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WxJfYTzjHjeLliZ0+7/jXzVu0dW33eBftuyCngf5Sx1j4YBgRwMudQQ7qqNkeBdW
	 sRXCWoB44AjKSpU+KbrBzDCzZV1vo3dKcdvgIUXsOU6S6bvAb8TRsKvEEZwiBXMqD
	 x/V3q0rDTSKWdKqBcjhk78Z5hCxG1ml2JcrxVfXCH23PFoYrXzbhJ2gBqdzM3Fzni
	 ZfZg8XnkMrcShJnamVs2JJQ9uhD6Txi9FZHK2oJHYM1KV6Op1UeTXjrZvbQ01a/gR
	 5k2VZpB4mKU9Kfn7fLZ+WxqmHcKB0GamNzVzl2smWJLD2yN275FACDuKzZvaL8s9f
	 WXyXTrow6LSIBd3/Nw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GMq-1tRt58497w-00qpEL; Sat, 11
 Jan 2025 01:25:07 +0100
Message-ID: <fd250291-4102-4dcd-8448-d878c3a013bf@gmx.de>
Date: Sat, 11 Jan 2025 01:25:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] platform/x86: Add Lenovo Gaming Series WMI Drivers
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
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
 <c29e64fd-8e9c-4179-806e-db516576a153@gmx.de>
 <CAFqHKTmJKdZV2unLAZjRGSdjE5mB7H5ONuF2wfC9dnuFJ0R16g@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKTmJKdZV2unLAZjRGSdjE5mB7H5ONuF2wfC9dnuFJ0R16g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P2mooIXAKviQPWHPxqcKsKpBskRCQ/u8zM1+IAOzO0xfHfSuQUm
 Z5ylDJQJ18hvja4TTrqQAQEn63SFayoaP6cT1Gtfojx/MW333puqREIbzofbPrrIX6tsr4b
 JJgV9tn+hbVHgTa0KkoMy+ichI78HK9zG7YAOIROh3wkhAmylL9dASis6+CqFPxbnaJc6Gz
 ozS3M/McB476nrpDY/ylg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yaCePmQJbh0=;H3XcokcDEZA3j5z96MW5GMGUBBf
 FDWThr9fWPP/7wQydEeTepv5MhQY4VDl8Us1C7ssx+Q8Yn16ezS1mH3dWSSpoSCI2pHl+v87R
 I7Zqq6ZMvrNoiM09jGftC54wwtk3DeKlvvBXNhOficFBjGCI9SXG5/E9r35o+hDiFO5LIfTQJ
 s3xej5zgIKfShYqsvBjUqOktNTvqGCzhZBY6cfwyHug/xmQtlaiQRK+m2BCpj+4ff7L1cNqef
 L+gexWaBbyYjw1xhm6Zo0RNHk8bzr48fAWYY6IwnmpHNSbTSs1FJXVbKlCj1sDZXC7Cn/1NJx
 5jO9E6k0sD6Wsp/ugCrV3MS/h/TZVDgvnN752L0mkTv108GANY7dQYnKVmtEEfCoO9jGG4HVH
 exFYT4IsShksCtZMDqjDg8Rtr7JNYZSMc5cfJcYvBXrqd0XQNuxWVEGB5lAOnWVgYQMVOtuoY
 D1c6yz8Tvor4Ws5x9j0jxpTIuV5O0HhYhSXLKn9MauzFRUY9DwV3bLoxhIXbeBvA+A4XKoitz
 K5wPedF7h0YkYhD18ZJUlasJnhL7MIZ+nBdFFZMomwmoP/r26YMisewYoSV0K1JqCPfwnPeEI
 i6MzTjGr6zdXird1bZUzLNFMBczzfLXlUUSc6aZWx+KVP95k97xas2JzPUGlIcKDmDXnX8xH+
 SGc07p0GATt3BDltGNANgzU4Vd5vqPIl2/47Ws3s4afef91E978b05TYP9SKM7qwl1mcSu3Cb
 K1bCuPqZDiWEBMBlRWGW8zemK51FWkyhFGfWoldozPyuG5j5sbM5IXKaivNnh3wmXFvOwVTa2
 EjGzBBif6FtmVkd3/5FSUrL1QIw5LdkaArqYpdt+jKs6jImG49+/8hqyIAMtSThQXnSiwHM87
 1YXMWmUWf5wwZq/9DxcbciCA/0/mqS8UD2O3keyZb4+gGd7rZju0w6mpi4O/sJVWIx0UrjTW/
 TIkdHLq6b9/mhJKZ9fwcmJGN0iPPeOHM/LJ3eMVLaPfsos9YzGFGsuaF3Z6R+8StcjI/0ccMs
 Qdaa1zmBH2bxTjHcWnyUAy+NcK9Lg3idYQU7S66StAy6+KuGdnJj3hoDgA9iBkffn7OXpQigQ
 hqVLnlVHCL4tnipdLVrpzTASujQ66W

Am 10.01.25 um 22:52 schrieb Derek John Clark:

> On Thu, Jan 9, 2025 at 3:20=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Am 02.01.25 um 19:27 schrieb Derek John Clark:
>>
>>> On Wed, Jan 1, 2025 at 8:01=E2=80=AFPM Mario Limonciello <superm1@kern=
el.org> wrote:
>>>>
>>>> On 1/1/25 18:47, Derek J. Clark wrote:
>>>>> Adds support for the Lenovo "Gaming Series" of laptop hardware that =
use
>>>>> WMI interfaces that control various power settings. There are multip=
le WMI
>>>>> interfaces that work in concert to provide getting and setting value=
s as
>>>>> well as validation of input. Currently only the "GameZone", "Other
>>>>> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, b=
ut
>>>>> I attempted to structure the driver so that adding the "Custom Mode"=
,
>>>>> "Lighting", and other data block interfaces would be trivial in a la=
ter
>>>>> patches.
>>>>>
>>>>> This driver is distinct from, but should be considered a replacement=
 for
>>>>> this patch:
>>>>> https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/
>>>>>
>>>>> This driver attempts to standardize the exposed sysfs by mirroring t=
he
>>>>> asus-armoury driver currently under review. As such, a lot of
>>>>> inspiration has been drawn from that driver.
>>>>> https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/
>>>>>
>>>>> The drivers have been tested by me on the Lenovo Legion Go.
>>>>>
>>>>> v2:
>>>>> - Broke up initial patch into a 4 patch series.
>>>>> - Removed all references to "Legion" in documentation, Kconfig,
>>>>>      driver structs, functions, etc. Everything now refers either to=
 the
>>>>>      interface being used or the Lenovo "Gaming Series" of laptop ha=
rdware.
>>>>> - Fixed all Acked changes requested by Mario and Armin.
>>>>> - Capability Data is now cached before kset creation for each attrib=
ute.
>>>>>      If the lenovo-wmi-capdata01 interface is not present, fails to =
grab
>>>>>      valid data, doesn't include the requested attribute id page, or=
 the
>>>>>      data block indicates the attribute is not supported, the attrib=
ute will
>>>>>      not be created in sysfs.
>>>>> - The sysfs path for the firmware-attributes class was moved from
>>>>>      lenovo-legion-wmi to lenovo-wmi-other.
>>>>>
>>>>> - The Other Mode WMI interface no longer relies on gamezone as
>>>>>      discussed. However; this creates a problem that should be discu=
ssed
>>>>>      here. The current_value attribute is now only accurate when the
>>>>>      "custom" profile is set on the device. Previously it would repo=
rt the
>>>>>      value from the Capability Data 01 instance related to the curre=
ntly
>>>>>      selected profile, which reported an accurate accounting of the =
current
>>>>>      system state in all cases. I submitted this as-is since we disc=
ussed
>>>>>      removing that dependency, but I am not a fan of the current_val=
ue
>>>>>      attribute being incorrect for 3 of the 4 available profiles, es=
pecially
>>>>>      when the data is available. There is also no way to -ENOTSUPP o=
r
>>>>>      similar when not in custom mode as that would also require us t=
o know
>>>>>      the state of the gamezone interface. What I would prefer to do =
would be
>>>>>      to make the gamezone interface optional by treating custom as t=
he
>>>>>      default mode in the current_value functions, then only update t=
he mode
>>>>>      if a callback to get the current fan profile is a success. That=
 way the
>>>>>      logic will work with or without the GameZone interface, but it =
will be
>>>>>      greatly improved if it is present.
>>>>>
>>>> I agree there needs to be /some/ sort of dependency.
>>>> One thing I was thinking you could do is use:
>>>>
>>>> wmi_has_guid() to tell whether or not the "GZ" interface is even pres=
ent
>>>> from the "Other" driver.  Move the GUID for the GZ interface into a
>>>> common header both drivers include.
>>>>
>>>> However that only helps in the case of a system that supports custom =
but
>>>> not GZ.  I think you still will need some sort of symbol to either ge=
t a
>>>> pointer to the platform profile class or tell if the profile for the
>>>> driver is set to custom.
>>>>
>>>> I personally don't see a problem with a simple symbol like this:
>>>>
>>>> bool lenovo_wmi_gamezone_is_custom(void);
>>>>
>>>> You could then have your logic in all the store and show call a helpe=
r
>>>> something like this:
>>>>
>>>> static bool lenovo_wmi_custom_mode() {
>>>>           if (!wmi_has_guid(GZ_GUID)
>>>>                   return true;
>>>>
>>>>           if (!IS_REACHABLE(CONFIG_LENOVO_WMI_GAMEZONE))
>>>>                   return true;
>>>>
>>>>           return lenovo_wmi_gamezone_is_custom();
>>>> }
>>> I agree with checking wmi_has_guid() before calling anything across
>>> interfaces.
>> Please do not use wmi_has_guid() for this as WMI devices can disappear
>> at any time.
>>
>>> As far as using a bool to determine if we are in custom,
>>> that seems to me like that would be a half measure. Since we would be
>>> calling across interfaces anyway there is a benefit to getting the
>>> full scope, where knowing only if we are in custom or not would just
>>> add the ability to exit early. What I would prefer is knowing the
>>> specific state of the hardware as it will allow me to call the
>>> specific method ID as related to the current profile. I'll elaborate a
>>> bit on what I mean.
>>>
>>> Each attribute ID corresponds to a specific fan profile mode for a
>>> specific attribute. It is used as both the data block ID in
>>> LENOVO_CAPABILITY_DATA_01, and as the first argument when using
>>> GetFeatureValue/SetFeatureValue on the Other Mode interface. I map
>>> these with the lenovo_wmi_attr_id struct. The fan mode value provided
>>> by the gamezone interface corresponds directly to the mode value in
>>> the ID. For example, ID 0x01010100 would provide the capability data
>>> for the CPU device (0x01), SPPT (0x01), in Quiet mode (0x01). There is
>>> no type ID for these attributes (0x00) like there are on some
>>> unimplemented attributes. Balanced mode is 0x02, Performance is 0x03,
>>> Extreme mode (Which the Go doesn't use and there is no analogue for in
>>> the kernel atm) is 0xE0, and custom mode is 0xFF. When the
>>> GetSmartFanMode method ID is called on the gamezone interface it
>>> returns one of these values, corresponding to the current state of the
>>> hardware. This allows us to call GetFeatureValue for the current
>>> profile. Currently we are always calling the custom mode method ID
>>> (0x0101FF00) in GetFeatureValue.
>>>
>>> If we want to avoid an additional wmi call in GZ, then grabbing it
>>> from the platform profile and translating it back would maybe suffice.
>>> In that case I would need to implement the
>>> LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT GUID
>>> "D320289E-8FEA-41E0-86F9-611D83151B5F" to ensure that the profile is
>>> updated properly when the hardware is switched profiles using the
>>> physical buttons. This is probably a good idea anyway, but some
>>> guidance on implementing that would be nice as I think it would be an
>>> additional driver and then we have more cross referencing.
>> I attached a prototype WMI driver for another device which had a simila=
r problem.
>> The solution was to provide a notifier so other event consumers can be =
notified
>> when an WMI event was received.
>>
>> Example event consumer callback code:
>>
>>          static int uniwill_wmi_notify_call(struct notifier_block *nb, =
unsigned long action, void *data)
>>          {
>>                  if (action !=3D UNIWILL_OSD_PERF_MODE_CHANGED)
>>                          return NOTIFY_DONE;
>>
>>                  platform_profile_cycle();
>>
>>                  return NOTIFY_OK;
>>          }
>>
>> I would also suggest that you use a notifier for communicating with the=
 gamezone
>> interface. Then you just have to submit commands (as action values) in =
the form of events
>> which will then be processed by the available gamezone drivers (the res=
ult can be stored in *data).
>>
>> Those gamezone drivers can then return NOTIFY_STOP which will ensure th=
at only a single gamezone
>> driver can successfully process a given command.
>>
>> All in all the patch series seems to progress nicely. I am confident th=
at we will solve the remaining issues.
>>
>> Thanks,
>> Armin Wolf
>>
> That's a novel approach. There are some EVENT GUID's for the gamezone
> interface I'll need to incorporate to keep everything in sync. These
> devices have physical buttons (Fn+Q on laptops, Legion +Y button on
> handhelds) to cycle the profiles. I didn't add this previously because
> we were always updating it when called. I presume that each GUID will
> need a separate driver for this. Any advice or examples on how to use
> this to update the pprof in GameZone would be appreciated as I've
> never used .notify before.

The WMI driver inside the attachment should be a suitable starting point.
You can also reuse the same driver for many different GUIDs and do the fol=
lowing:

- use the context inside the wmi_device_id to find out which GUID is being=
 probed.
You can use drivers/platform/x86/xiaomi-wmi.c as an example.

- inside the .notify callback parse the event data and the call the notifi=
er.
You can use the action parameter to signal which kind of WMI event was rec=
eived (SMART_FAN_MODE_EVENT, ...)
and the data parameter to pass the event data.

With this you only need to provide a single WMI driver.

The lenovo-wmi-gamezone driver can then register with this notifier and li=
sten for
platform profile changes:

	static int lenovo_gz_notify_call(struct notifier_block *nb, unsigned long=
 action, void *data)
         {
                 if (action !=3D SMART_FAN_MODE_EVENT)	// Filter events
                         return NOTIFY_DONE;

		<check *data if necessary>

                 platform_profile_cycle();	// Cycle platform profile if ne=
cessary

                 return NOTIFY_OK;
         }

>
> My expected information flow will be these paths:
> Physical Button press -> WMI event GUID notifier driver -> Gamezone
> driver update & notify_call -> Other Mode save data to priv for lookup
> when current_value is checked and return STOP .
> or
> platform-profile class write from sysfs -> Gamezone driver update &
> notify_call ->Other Mode save data to priv for lookup when
> current_value is checked and return STOP .
>
> Thanks,
> Derek

Your approach would have a problem: how to communicate the initial platfor=
m profile state
when lenovo-wmi-other probes?

I suggest that lenovo-wmi-gamezone stores the current platform profile. Th=
is value can then
be retrieved by lenovo-wmi-other by using the special gamezone notifier. T=
his would also allow
lenovo-wmi-other to detect when lenovo-wmi-gamezone is not ready and can t=
hus not provide
platform profile data.

Thanks,
Armin Wolf

>
>>> The simplest solution IMO would be to do something closer to what I
>>> was doing in v1 just for current_value_show, where we instantiate the
>>> mode variable as SMARTFAN_MODE_CUSTOM (0xFF) then check if the gz
>>> interface is present. If it is, pass the mode variable as a pointer to
>>> GZ where it can call GetSmartFanMode and update the value. Otherwise,
>>> bypass that block and treat it as custom. This does add an additional
>>> WMI call, but only when reading the current_value.
>>>
>>>>> - I did extensive testing of this firmware-attributes interface and =
its
>>>>>      ability to retain the value set by the user. The SPL, SPPT, FPP=
T, and
>>>>>      platform profile all retain the users last setting when resumin=
g from
>>>>>      suspend, a full reboot, and a full shutdown. The only time the =
values
>>>>>      are not preserved is when the user manually selects a new platf=
orm
>>>>>      profile using either the pprof interface or the manual selectio=
n
>>>>>      button on the device, in which case you would not expect them t=
o be
>>>>>      retained as they were intentionally changed. Based on the previ=
ous
>>>>>      discussion it may be the case that older BIOS' will preserve th=
e
>>>>>      settings even after changing profiles, though I haven't confirm=
ed
>>>>>      this.
>>>> This is good to hear considering the concerns raised by some others.
>>>>
>>>> But FWIW we have nothing in the firmware attributes API documentation
>>>> that mandates what the firmware does for storage of settings across a
>>>> power cycle so this is currently up to the platform to decide.
>>>>> v1:
>>>>> https://lore.kernel.org/platform-driver-x86/CAFqHKTna+kJpHLo5s4Fm1Tm=
HcSSqSTr96JHDm0DJ0dxsZMkixA@mail.gmail.com/T/#t
>>>>>
>>>>> Suggested-by: Mario Limonciello <superm1@kernel.org>
>>>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>>>
>>>>> Derek J. Clark (4):
>>>>>      platform/x86: Add lenovo-wmi drivers Documentation
>>>>>      platform/x86: Add Lenovo GameZone WMI Driver
>>>>>      platform/x86: Add Lenovo Capability Data 01 WMI Driver
>>>>>      platform/x86: Add Lenovo Other Mode WMI Driver
>>>>>
>>>>>     Documentation/wmi/devices/lenovo-wmi.rst    | 104 ++++++
>>>>>     MAINTAINERS                                 |   9 +
>>>>>     drivers/platform/x86/Kconfig                |  34 ++
>>>>>     drivers/platform/x86/Makefile               |   3 +
>>>>>     drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++
>>>>>     drivers/platform/x86/lenovo-wmi-gamezone.c  | 203 +++++++++++
>>>>>     drivers/platform/x86/lenovo-wmi-other.c     | 385 ++++++++++++++=
++++++
>>>>>     drivers/platform/x86/lenovo-wmi.h           | 241 ++++++++++++
>>>>>     8 files changed, 1110 insertions(+)
>>>>>     create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
>>>>>     create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>>>>>     create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>>>>>     create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>>>>>     create mode 100644 drivers/platform/x86/lenovo-wmi.h
>>>>>
