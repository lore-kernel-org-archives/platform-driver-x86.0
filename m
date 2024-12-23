Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF8680038;
	Mon, 23 Dec 2024 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734972649; cv=none; b=B8t7PfuyAXfuk83V4tTRWg2Cl4eNCyfojOXHPqXrNWfIG5qvcPiAPdgWIauAeizL2e/7ob0RLu4bZlJBwM9uuroMPMybnAvVfZUllkm78bH8tOlzGnZNtHgnZzYuOPWdQYLX+Mh2RfwtIrfUcgXljDhbRdCl9ZpWBNt92C3VMwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734972649; c=relaxed/simple;
	bh=YmAhq5oWN3Iwo604ifBnPRyqXSwcLt3i6kaNXB429Vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XF48uSsp1ukJjjWZ0RPjmf/nTJWAL2+KT/uh7F+KRmftd/uIaVIm01AMZXHs3bEZpb+IFi49piyzBIuquhfKLsdhbb/fEIcXoZkNwVDgIAaEKHGv8CHXRB8lljciPW0x7CCjgBwK1RrxnXpmpAEyeoCnxcd0kWhK7+0JMJvbkMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GNgUZcub; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GNgUZcub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734972623; x=1735577423; i=w_armin@gmx.de;
	bh=goWkbWfCTLQ14bNOAEM2xjH8Cd0+KKeJ7cKndr71Ki0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GNgUZcubwpFAp1RKFEo0ebNPFtTth/gHwWkNaah44kM/OLhtmDvLUdSbAXlGrGvr
	 nuPsvou8l1jiq724MuwgTfnZbvtlNZnfCaCK7suvIBEb69oztG/0JqjLTaAMlrIo5
	 gahpOksA4k1gGxiwRWPLhxKE7zA1XzsmXTN/liMCLwEtsas2+NMJzv+1Qv5ANGuc0
	 U7A5zQfo95G+0DSCuZdJsVCsx28NYaZplomdQ1HiJS4dR4t7QgNj4tCxoLnnp/TnT
	 xeMcsipL0DQhkLcr9uR+/L8CNfWQaSburEx12/aXdzVao9n7CrPeWc/IkMnL/0QNx
	 kjvnsRPuRSMVAzCxDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUUw-1ttLhS3R9w-00qgFN; Mon, 23
 Dec 2024 17:50:23 +0100
Message-ID: <87bbe4cb-60f1-4067-9cf7-9d921bdfec74@gmx.de>
Date: Mon, 23 Dec 2024 17:50:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <48320f65-8230-4e49-91c0-eeeca47ed2d2@kernel.org>
 <20241218035227.26707-1-derekjohn.clark@gmail.com>
 <0b389962-bb42-45c4-bbd5-942fac4bc9b7@gmx.de>
 <CAFqHKTm_=Hdmnr84OVCk4UVy9SkmbhWmXt9YZ1ZWyj=mYOwjTw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKTm_=Hdmnr84OVCk4UVy9SkmbhWmXt9YZ1ZWyj=mYOwjTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ij0xKSRCGLoaEIYtFBPwqIlfYlRu9dssw4XbC/uVelBTayT8L3Z
 /7uDyCv2Apq88FAyaH5kNqJjRsWeAB3LHPPHGW/5RB2dLSbuWrQJoHtv3SMzp35GecT2eYs
 yCYcO4nPSEyAzaNyUaeJnmk3hGgMKLTi4qKWOcxgz2M/mCBbdQ7kMQk31Fedp9W7uT/sz03
 6qGT22NSOF24uC1VYwJ2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KVhBmb82vf0=;1MxoKCVI3mXgrxrsEhvHWwuwzqo
 3Vy22YgPxlJRKaf7F+5FSfvNxNrI4aarAHweFz9LQllDKVBSDIkoFb5U+pYk5EVtuOFDzrf7G
 G/6gACR/BBl5spl/sXjImwF22PWUH902GHPnvIdl24GB+wZWgwFQfQZPDlEu4QLw2/JOSRk/c
 JMowItBBkzbMvy2M315TmrF7uvFiZeXd9GsKm26pDvxcz+MuBM74kWFO2PrFJAu6z8v0wk6p/
 s8lYqMn3Gz+t1TEhUeiLt5BEv1yyLbAMG70mqHvfJZN5M9X8NReKUv+LQeqxQwtwx4LO9nk6L
 Talmu3i5L945QD5fAwtcUPCyOaS+xOtJzf7rKdOIk+kZwPcJOuFCxRpNCJLU+w2nNCaAgZTLV
 bHRmjEztvYfRLmKe1EGfwAzkhbb15g1RgY5d3SNLL8qdh+KjXHJuCl+U3yrM0obZet2Tpcc+G
 bSPROtIpFN75fAbbhgq6l1NYogpPLVDTXVoEO0qsc50cYijokEO3SnfUMIDTW3wWvmwcBob6z
 SSWtsKoffsItzGO3RHbjEFu2N3QjRmhnPLav6dR42GuO4e3pg7+zBp+2cwdGmW7UgFEDIH8Ug
 RFd/mBqVKGe5gSNLcnxOXKgEzLdX/d/1aVtW69CKF1Y6/drgCKv00HjeCfxrgvosu56ftT/Ch
 udUtBSdcVbxr7gAL4jFVEEQMpO1fegrizIDRvdKeWW1nsT/4Rlzn7h2bHU4ymg6Xz2iN+2ctT
 WiSkChcEv3BsyxPc/Ike+udGFQEYxxBSU+urCLrfKVaFbDiglb1l1dgEGkEKbK+2RSYUFgxc0
 lcgL3JwoN5SSqp7NQX/7GY10pe5qtAfO6H4eci5GbnaANyDaTsBSDfQEZtw+fM9aq7smdjnJd
 naOaUA6tTeYScwxJv7WRHWoEEsf9isDTnhkmGjqfZY0qTyFydgYPp6TAnuowMdoJIc6SYsF0v
 JoZLJgRiIzvdmPfM7FC96nRUNbzdraU/cPjGs7hfWsrkIxKrbv9hTXj6/AAvjE7q/HHOHZxkM
 rFzP3VJMB5Had3vRdhRexGq+28FbrZ3vL5JExl7IKsfZDMak+cD8upF3l2NLi5V3PqiwQrv4I
 WndAnMEWoC5sPJs5Q6hMXFhiTsAtLz

Am 23.12.24 um 16:47 schrieb Derek John Clark:

>>> Can do. It might still make sense to have capdata01 with the other_met=
hod
>>> driver, it has no functionality on its own and is a dependency of othe=
r_method.
>>> It isn't a problem to have capdata01 as an earlier patch than other_me=
thod
>>> though if preferred. I'm not sure how I would break up the drivers fur=
ther
>>> than that, except the relevant header portions per c file.
>> I think the gamezone driver should  be totally independent of the other=
 driver.
>>
>> For the capdata01 and the other-guid driver i think the component frame=
work could be handy,
>> see https://docs.kernel.org/driver-api/component.html for details. Basi=
cally you will have
>> a driver for capdata01 and another driver for other-guid which will bot=
h register a component.
>> The firmware-attributes part will only get loaded if both components ar=
e present.
> This is really cool and just what I need. I'll look into it, thanks.
>
>> Please keep in mind that new WMI drivers need to be instantiated multip=
le times, see
>> https://docs.kernel.org/wmi/driver-development-guide.html for details.
> I must have missed that. I'll incorporate it into v2, thanks.
>
>>> It does as a BIOS feature, acked for fix.
>> So in order to use the "Other GUID" settings, custom mode has to be sel=
ected first, right?
>>
>> Is it really necessary to do this inside the other-guid driver, or can =
this be done in userspace?
>> The reason for this is that i want to avoid having to couple the other-=
guid driver with the
>> gamezone guid driver.
>>
> The only major issue is there is (currently) no way to actually set cust=
om mode
> from userspace. As designed, "custom" is not selectable through the
> platform_profile sysfs file descriptor even when enabled as any attempt =
to write
> "custom" to it returns "Invalid argument". This will need to be changed =
if
> we're going to move forward with the interfaces decoupled, unless
> there is another
> way to handle this I'm not aware of.

The new platform-profile class interface allows you to select "custom". On=
ly the legacy global sysfs
interface does not allow you to do that.

>
> Another, not very severe issue, is the OM interface will always permit
> a write to any
> page even if the gamezone interface isn't set to custom mode. I did some=
 testing
> and there doesn't seem to be any effect on the hardware when this happen=
s, but
> having no effect when writing to the attribute endpoints could lead to e=
rroneous
> bug reports from uninformed users. I suppose that is better than bug
> reports from
> null pointer reference if something goes wrong with the gamezone interfa=
ce.

Yes, i suggest that we document this when documenting the firmware attribu=
te interface.

>
> I did consider trying to grab a pointer to platform_profile to watch
> the state instead
> of gamezone, but that isn't reliable either as it will report "custom"
> any time two
> providers disagree. Since amd-pmf uses "low-power" and Lenovo uses "quie=
t" as
> their respective lowest settings, platform_profile will report
> "custom" any time the
> hardware is on the lowest profile. The obvious answer there might be to =
enable
> the low-power enum instead of quiet on the gamezone interface, but that =
also
> assumes no other provider will ever register with another value. Do
> you think this
> is worth pursuing?
>
I do not think this is a reliable approach. IMHO documenting this extra re=
quirement for the
tuning values to have an effect should be enough since users needs to read=
 the documentation
anyway to properly use the tuning settings.

Also people will probably write a userspace utility for that, so the speci=
al handling can happen there.

>>> Other Method is the name Lenovo gave the interface. I'm open to sugges=
tions,
>>> but Custom Method is the name of the older Legion WMI interface so I'd=
 like to
>>> reserve that in case Lenovo wants to add it later.
>> What is the intended purpose of this "Other Method" interface? If its p=
rimary purpose
>> is to provide tuning settings to the system, then you can call it somet=
hing like:
>>
>> - LENOVO_WMI_TUNING_SETTINGS
>>
>> - LENOVO_WMI_TUNING
>>
>> - ...
> I think we're of a similar mind here as I changed it to LENOVO_WMI_TUNAB=
LES in
> my working branch already. I like LENOVO_WMI_TUNING more though.

I am OK with both names, you can pick the one which sounds best to you.

>> In general passing WMI devices between different drivers will likely re=
sult in device lifetime issues.
>>
>> I suggest that you decouple both drivers as much as possible and rely o=
n userspace for selecting
>> custom mode before changing any tuning settings.
>>
>> See my above comment for more details.
>>
>> Thanks,
>> Armin Wolf
> Thanks for taking a look Armin. I will be away for the next few days wit=
h only
> my mobile phone which seems to be having issues sending plain text. I mi=
ght not
> be able to respond again until the end of the week.
>
> Derek

That is totally fine, i wish you happy holidays :).

Thanks,
Armin Wolf

>
> On Sun, Dec 22, 2024 at 2:55=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 18.12.24 um 04:36 schrieb Derek J. Clark:
>>
>>> Hi Mario,
>>>
>>> Thank you for taking a look at it so quickly.
>>>
>>>>> Adds lenovo-legion-wmi.h which provides templates and some method
>>>>> implementations used by the lenovo-legion-wmi driver series.
>>>>>
>>>>> Adds lenovo-legion-wmi-gamezone.c which provides a driver for the Le=
novo
>>>>> GameZone WMI interface that comes on Lenovo "Gaming Series" hardware=
.
>>>>> Provides ACPI platform profiles over WMI.
>>>>>
>>>>> Adds lenovo-legion-wmi-other.c which provides a driver for the Lenov=
o
>>>>> "Other Method" WMI interface that comes on some Lenovo hardware.
>>>>> Provides a firmware-attributes class which enables the use of tunabl=
e
>>>>> knobs for SPL, SPPT, and FPPT.
>>>>>
>>>>> Adds lenovo-legion-wmi-capdata01.c which provides a driver for the
>>>>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Method=
"
>>>>> enabled hardware. Provides an interface for querying if a given
>>>>> attribute is supported by the hardware, as well as its default_value=
,
>>>>> max_value, min_value, and step increment.
>>>>>
>>> z>> Adds lenovo-legion-wmi.rst describing the available drivers and th=
eir
>>>>> function.
>>>>>
>>>>> Updates Kconfig, Makefile, and MAINTAINERS to include the new driver=
s.
>>>>>
>>>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>> Hi Derek,
>>>>
>>>> As a high level first comment; "larger" patches are much harder to re=
view.
>>>>
>>>> It seems that the drivers are logically split as described in your
>>>> commit message already.  For the next version could you split at leas=
t
>>>> each driver to it's own patch?
>>>>
>>>> It might also make sense to split up the individual drivers along
>>>> "features".
>>> Can do. It might still make sense to have capdata01 with the other_met=
hod
>>> driver, it has no functionality on its own and is a dependency of othe=
r_method.
>>> It isn't a problem to have capdata01 as an earlier patch than other_me=
thod
>>> though if preferred. I'm not sure how I would break up the drivers fur=
ther
>>> than that, except the relevant header portions per c file.
>> I think the gamezone driver should  be totally independent of the other=
 driver.
>>
>> For the capdata01 and the other-guid driver i think the component frame=
work could be handy,
>> see https://docs.kernel.org/driver-api/component.html for details. Basi=
cally you will have
>> a driver for capdata01 and another driver for other-guid which will bot=
h register a component.
>> The firmware-attributes part will only get loaded if both components ar=
e present.
>>
>> Please keep in mind that new WMI drivers need to be instantiated multip=
le times, see
>> https://docs.kernel.org/wmi/driver-development-guide.html for details.
>>
>>>> This is my own personal opinion and not a requirement but I personall=
y
>>>> like to see documentation for something new like this as it's own pat=
ch
>>>> at the beginning of the series so we can make sure everyone understan=
ds
>>>> and agrees on the design as they review the series and then can make
>>>> sure that the implementation matches the design as the other patches =
are
>>>> reviewed.
>>> Acked, will add Documentation as its own 1/ patch.
>>>
>>>> I've got various other comments sprinkled throughout the patch, pleas=
e
>>>> see them.  I'm not 100% sure on the mutex use yet, we should review t=
hat
>>>> after you've got all the cleanups needed done.
>>>>
>>>>> ---
>>>>>     .../wmi/devices/lenovo-legion-wmi.rst         |  79 ++++
>>>>>     MAINTAINERS                                   |   9 +
>>>>>     drivers/platform/x86/Kconfig                  |  35 ++
>>>>>     drivers/platform/x86/Makefile                 |  21 +-
>>>>>     .../x86/lenovo-legion-wmi-capdata01.c         | 103 +++++
>>>>>     .../platform/x86/lenovo-legion-wmi-gamezone.c | 233 +++++++++++
>>>>>     .../platform/x86/lenovo-legion-wmi-other.c    | 377 ++++++++++++=
++++++
>>>>>     drivers/platform/x86/lenovo-legion-wmi.h      | 271 ++++++++++++=
+
>>>>>     8 files changed, 1119 insertions(+), 9 deletions(-)
>>>>>     create mode 100644 Documentation/wmi/devices/lenovo-legion-wmi.r=
st
>>>>>     create mode 100644 drivers/platform/x86/lenovo-legion-wmi-capdat=
a01.c
>>>>>     create mode 100644 drivers/platform/x86/lenovo-legion-wmi-gamezo=
ne.c
>>>>>     create mode 100644 drivers/platform/x86/lenovo-legion-wmi-other.=
c
>>>>>     create mode 100644 drivers/platform/x86/lenovo-legion-wmi.h
>>>>>
>>>>> diff --git a/Documentation/wmi/devices/lenovo-legion-wmi.rst b/Docum=
entation/wmi/devices/lenovo-legion-wmi.rst
>>>>> new file mode 100644
>>>>> index 000000000000..37b09c82c980
>>>>> --- /dev/null
>>>>> +++ b/Documentation/wmi/devices/lenovo-legion-wmi.rst
>>>>> @@ -0,0 +1,79 @@
>>>>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +Lenovo Legion WMI Interface Driver (lenovo-legion-wmi)
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +
>>>>> +Introduction
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +The Lenovo Legion WMI interface is broken up into multiple GUID int=
erfaces that
>>>>> +require cross-references between GUID's for some functionality. The=
 "Custom
>>>>> +Mode" interface is a legacy interface for managing and displaying C=
PU & GPU
>>>>> +power and hwmon settings and readings. The "Other Mode" interface i=
s a modern
>>>>> +interface that replaces "Custom Mode" interface methods. The "GameZ=
one"
>>>>> +interface adds advanced features such as fan profiles and overclock=
ing. The
>>>>> +"Lighting" interface adds control of various status lights related =
to different
>>>>> +hardware components.
>>>>> +
>>>>> +Each of these interfaces has a different data structure associated =
with it that
>>>>> +provide detailed information about each attribute provided by the i=
nterface.
>>>>> +These data structs are retrieved from an additional WMI device data=
 block GUID:
>>>>> + - The "Custom Mode" interface uses LENOVO_CAPABILITY_DATA_00
>>>>> + - The "Other Mode" interface uses LENOVO_CAPABILITY_DATA_01
>>>>> + - The "Lighting" interface uses LENOVO_CAPABILITY_DATA_02
>>>>> +
>>>>> +.. note::
>>>>> +   Currently only the "Gamezone", "Other Mode", and LENOVO_CAPABILI=
TY_DATA_01
>>>>> +   interfaces are implemented by this driver.
>>>> So this is to say that lighting interface is not implemented right no=
w,
>>>> right?
>>> Custom Mode, Lighting, LENOVO_CAPABILITY_DATA_00, and LENOVO_CAPABILIT=
Y_DATA_02
>>> are not implemented yet. For now Lenovo are okay with that but may wan=
t more
>>> later.
>>>>> +
>>>>> +
>>>>> +GameZone
>>>>> +--------
>>>>> +The GameZone WMI interface provides ACPI platform profile and fan c=
urve
>>>>> +settings for devices that fall under the "Gaming Series" of Lenovo =
Legion
>>>>> +devices.
>>>>> +
>>>>> +The following platform profiles are supported:
>>>>> + - quiet
>>>>> + - balanced
>>>>> + - performance
>>>>> + - custom
>>>>> +
>>>>> +Custom Profile
>>>>> +~~~~~~~~~~~~~~
>>>>> +The custom profile is enabled but is not user selectable. This sett=
ing
>>>>> +represents a hardware mode on Lenovo Legion devices that enables us=
er
>>>>> +modifications to Package Power Tracking settings. When an attribute=
 exposed
>>>>> +by the "Other Mode" WMI Interface is modified, the GameZone driver =
will switch
>>>>> +to this profile automatically.
>>>> I think you should explicitly mention that it's undone if the user
>>>> selects a fixed platform mode too.  (It does, right?)
>>> It does as a BIOS feature, acked for fix.
>> So in order to use the "Other GUID" settings, custom mode has to be sel=
ected first, right?
>>
>> Is it really necessary to do this inside the other-guid driver, or can =
this be done in userspace?
>> The reason for this is that i want to avoid having to couple the other-=
guid driver with the
>> gamezone guid driver.
>>
>>>>> +
>>>>> +
>>>>> +Other Mode
>>>>> +----------
>>>>> +The Other Mode WMI interface uses the fw_attributes class to expose=
 various
>>>>> +WMI functions provided by the interface in the sysfs. This enables =
CPU and GPU
>>>>> +power limit tuning as well as various other attributes for devices =
that fall
>>>>> +under the "Gaming Series" of Lenovo Legion devices. Each attribute =
exposed by
>>>>> +the "Other Method" interface has corresponding LENOVO_CAPABILITY_DA=
TA_01 pages
>>>>> +that allow the driver to probe details about the attribute. Each at=
tibute has
>>>>> +multiple pages, one for each of the platform profiles managed by th=
e "GameZone"
>>>>> +interface, so it must be probed prior to returning the current_valu=
e. For
>>>>> +read-only properties, only the "Custom" profile values are reported=
 to ensure
>>>>> +any userspace applications reading them have accurate tunable value=
 ranges.
>>>>> +Attributes are exposed in sysfs under the following path:
>>>>> +/sys/class/firmware-attributes/lenovo-legion-wmi/attributes
>>>>> +
>>>>> +Supported Attibutes
>>>>> +~~~~~~~~~~~~~~~~~~~
>>>>> +The following attributes are supported:
>>>>> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>>>>> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Track=
ing
>>>>> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Track=
ing
>>>>> +
>>>>> +Each attribute has the following properties:
>>>>> + - current_value
>>>>> + - default_value
>>>>> + - display_name
>>>>> + - max_value
>>>>> + - min_value
>>>>> + - scalar_increment
>>>>> + - type
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index baf0eeb9a355..67f7b588aa36 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -13034,6 +13034,15 @@ S: Maintained
>>>>>     W:       http://legousb.sourceforge.net/
>>>>>     F:       drivers/usb/misc/legousbtower.c
>>>>>
>>>>> +LENOVO LEGION WMI driver
>>>>> +M: Derek J. Clark <derekjohn.clark@gmail.com>
>>>>> +L: platform-driver-x86@vger.kernel.org
>>>>> +S: Maintained
>>>>> +F: drivers/platform/x86/lenovo-legion-wmi-capdata01.c
>>>>> +F: drivers/platform/x86/lenovo-legion-wmi-gamezone.c
>>>>> +F: drivers/platform/x86/lenovo-legion-wmi-other.c
>>>>> +F: drivers/platform/x86/lenovo-legion-wmi.h
>>>>> +
>>>>>     LETSKETCH HID TABLET DRIVER
>>>>>     M:       Hans de Goede <hdegoede@redhat.com>
>>>>>     L:       linux-input@vger.kernel.org
>>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kco=
nfig
>>>>> index 0258dd879d64..a51a1a2fe7ba 100644
>>>>> --- a/drivers/platform/x86/Kconfig
>>>>> +++ b/drivers/platform/x86/Kconfig
>>>>> @@ -459,6 +459,41 @@ config IBM_RTL
>>>>>       state =3D 0 (BIOS SMIs on)
>>>>>       state =3D 1 (BIOS SMIs off)
>>>>>
>>>>> +config LEGION_GAMEZONE_WMI
>>>>> +   tristate "Lenovo Legion GameZone WMI Driver"
>>>>> +   depends on ACPI_WMI
>>>>> +   select ACPI_PLATFORM_PROFILE
>>>>> +   help
>>>>> +     Say Y here if you have a WMI aware Lenovo Legion device and wo=
uld like to use the
>>>>> +     platform-profile firmware interface.
>>>>> +
>>>>> +     To compile this driver as a module, choose M here: the module =
will
>>>>> +     be called lenovo_legion_wmi_gamezone.
>>>>> +
>>>>> +config LEGION_DATA_01_WMI
>>>>> +   tristate "Lenovo Legion WMI capability Data 01 Driver"
>>>>> +   depends on ACPI_WMI
>>>>> +   help
>>>>> +     Say Y here if you have a WMI aware Lenovo Legion device in the=
 "Gaming Series"
>>>>> +     line of hardware. This interface is a dependency for exposing =
tunable power
>>>>> +     settings.
>>>>> +
>>>>> +     To compile this driver as a module, choose M here: the module =
will
>>>>> +     be called lenovo_legion_wmi_capdata01.
>>>>> +
>>>>> +config LEGION_OTHER_WMI
>>>>> +   tristate "Lenovo Legion Other Method WMI Driver"
>>>> As a new user coming here, how are they going to know what "other"
>>>> means?  I'm sort of thinking it's better to calls this "CUSTOM_WMI"? =
 Or
>>>> maybe "CUSTOM_POWER_MODES_WMI"?  Maybe Armin or others have some inpu=
t
>>>> here too.
>>> Other Method is the name Lenovo gave the interface. I'm open to sugges=
tions,
>>> but Custom Method is the name of the older Legion WMI interface so I'd=
 like to
>>> reserve that in case Lenovo wants to add it later.
>> What is the intended purpose of this "Other Method" interface? If its p=
rimary purpose
>> is to provide tuning settings to the system, then you can call it somet=
hing like:
>>
>> - LENOVO_WMI_TUNING_SETTINGS
>>
>> - LENOVO_WMI_TUNING
>>
>> - ...
>>
>>>>> +   depends on LEGION_GAMEZONE_WMI
>>>>> +   depends on LEGION_DATA_01_WMI
>>>>> +   select FW_ATTR_CLASS
>>>>> +   help
>>>>> +     Say Y here if you have a WMI aware Lenovo Legion device and wo=
uld like to use the
>>>>> +     firmware_attributes API to control various tunable settings ty=
pically exposed by
>>>>> +     Lenovo software in Windows.
>>>>> +
>>>>> +     To compile this driver as a module, choose M here: the module =
will
>>>>> +     be called lenovo_legion_wmi_other.
>>>>> +
>>>>>     config IDEAPAD_LAPTOP
>>>>>      tristate "Lenovo IdeaPad Laptop Extras"
>>>>>      depends on ACPI
>>>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Ma=
kefile
>>>>> index e1b142947067..838ee568c3f9 100644
>>>>> --- a/drivers/platform/x86/Makefile
>>>>> +++ b/drivers/platform/x86/Makefile
>>>>> @@ -59,15 +59,18 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)   +=3D hp/
>>>>>     obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
>>>>>
>>>>>     # IBM Thinkpad and Lenovo
>>>>> -obj-$(CONFIG_IBM_RTL)              +=3D ibm_rtl.o
>>>>> -obj-$(CONFIG_IDEAPAD_LAPTOP)       +=3D ideapad-laptop.o
>>>>> -obj-$(CONFIG_LENOVO_YMC)   +=3D lenovo-ymc.o
>>>>> -obj-$(CONFIG_SENSORS_HDAPS)        +=3D hdaps.o
>>>>> -obj-$(CONFIG_THINKPAD_ACPI)        +=3D thinkpad_acpi.o
>>>>> -obj-$(CONFIG_THINKPAD_LMI) +=3D think-lmi.o
>>>>> -obj-$(CONFIG_YOGABOOK)             +=3D lenovo-yogabook.o
>>>>> -obj-$(CONFIG_YT2_1380)             +=3D lenovo-yoga-tab2-pro-1380-f=
astcharger.o
>>>>> -obj-$(CONFIG_LENOVO_WMI_CAMERA)    +=3D lenovo-wmi-camera.o
>>>>> +obj-$(CONFIG_IBM_RTL)                      +=3D ibm_rtl.o
>>>>> +obj-$(CONFIG_IDEAPAD_LAPTOP)               +=3D ideapad-laptop.o
>>>>> +obj-$(CONFIG_LENOVO_YMC)           +=3D lenovo-ymc.o
>>>>> +obj-$(CONFIG_SENSORS_HDAPS)                +=3D hdaps.o
>>>>> +obj-$(CONFIG_THINKPAD_ACPI)                +=3D thinkpad_acpi.o
>>>>> +obj-$(CONFIG_THINKPAD_LMI)         +=3D think-lmi.o
>>>>> +obj-$(CONFIG_YOGABOOK)                     +=3D lenovo-yogabook.o
>>>>> +obj-$(CONFIG_YT2_1380)                     +=3D lenovo-yoga-tab2-pr=
o-1380-fastcharger.o
>>>>> +obj-$(CONFIG_LENOVO_WMI_CAMERA)            +=3D lenovo-wmi-camera.o
>>>>> +obj-$(CONFIG_LEGION_GAMEZONE_WMI)  +=3D lenovo-legion-wmi-gamezone.=
o
>>>>> +obj-$(CONFIG_LEGION_DATA_01_WMI)   +=3D lenovo-legion-wmi-capdata01=
.o
>>>>> +obj-$(CONFIG_LEGION_OTHER_WMI)             +=3D lenovo-legion-wmi-o=
ther.o
>>>> Don't change the whitespace of everything else; especially not in one
>>>> patch.  If the whitespace is wrong, do a patch that fixes it and then
>>>> another patch that introduces a driver.
>>> Only done because the length of the new entries messes up the whitespa=
ce of the
>>> rest of the block. I can do as two patches if needed, but the whitespa=
ce would
>>> need to be after as it is fine without them.
>>>
>>>>>     # Intel
>>>>>     obj-y                            +=3D intel/
>>>>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-capdata01.c b/dr=
ivers/platform/x86/lenovo-legion-wmi-capdata01.c
>>>>> new file mode 100644
>>>>> index 000000000000..99f4f35b7176
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/x86/lenovo-legion-wmi-capdata01.c
>>>>> @@ -0,0 +1,103 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface =
provides
>>>>> + * information on tunable attributes used by the "Other Method" WMI=
 interface,
>>>>> + * including if it is supported by the hardware, the default_value,=
 max_value,
>>>>> + * min_value, and step increment.
>>>>> + *
>>>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>>>> + *
>>>> I don't think you need a newline at the end here.
>>> Acked for fix all newline comments. Thanks.
>>>
>>>>> + */
>>>>> +
>>>>> +#include "lenovo-legion-wmi.h"
>>>>> +
>>>>> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B=
3BE018154"
>>>>> +
>>>>> +static const struct wmi_device_id capdata_01_wmi_id_table[] =3D {
>>>>> +   { LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>>>>> +   {}
>>>>> +};
>>>>> +
>>>>> +static struct capdata_wmi cd01_wmi =3D {
>>>>> +   .mutex =3D __MUTEX_INITIALIZER(cd01_wmi.mutex)
>>>>> +};
>>>>> +
>>>>> +int capdata_01_wmi_get(struct om_attribute_id attr_id,
>>>>> +                  struct capability_data_01 *cap_data)
>>>>> +{
>>>>> +   union acpi_object *ret_obj;
>>>>> +   int count;
>>>>> +   int instance_id;
>>>>> +   u32 attribute_id =3D *(int *)&attr_id;
>>>> Can please do reverse xmas tree.
>>>>
>>> Acked for fix all ordering comments. Thanks.
>>>
>>>>> +
>>>>> +   mutex_lock(&cd01_wmi.mutex);
>>>>> +   count =3D wmidev_instance_count(drvdata.cd01_wmi->wdev);
>>>>> +   mutex_unlock(&cd01_wmi.mutex);
>>>> For new mutex use I'd suggest using guard(mutex) instead so you can h=
ave
>>>> less lock/unlock/cleanup cases to worry about.
>>>>
>>> Good idea, I wasn't aware of this. Will fix up for v2.
>>>
>>>>> +   for (instance_id =3D 0; instance_id < count; instance_id++) {
>>>>> +           mutex_lock(&cd01_wmi.mutex);
>>>>> +           ret_obj =3D
>>>>> +                   wmidev_block_query(drvdata.cd01_wmi->wdev, insta=
nce_id);
>>>>> +           mutex_unlock(&cd01_wmi.mutex);
>>>>> +           if (!ret_obj) {
>>>>> +                   pr_err("lenovo_legion_wmi_capdata_01: block quer=
y failed\n");
>>>> With all the error messages you should use #define pr_fmt() at the to=
p
>>>> of the file and then you don't need to do prefixes at all like this.
>>>>
>>> Same as above, thanks.
>>>
>>>>> +                   continue;
>>>>> +           }
>>>>> +
>>>>> +           if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
>>>>> +                   pr_err("lenovo_legion_wmi_capdata_01: block quer=
y returned type: %u\n",
>>>>> +                          ret_obj->type);
>>>>> +                   kfree(ret_obj);
>>>>> +                   continue;
>>>>> +           }
>>>>> +
>>>>> +           if (ret_obj->buffer.length !=3D sizeof(*cap_data)) {
>>>>> +                   pr_err("lenovo_legion_wmi_capdata_01: bad buffer=
 length, %d\n",
>>>>> +                          ret_obj->buffer.length);
>>>>> +                   kfree(ret_obj);
>>>>> +                   continue;
>>>>> +           }
>>>>> +
>>>>> +           memcpy(cap_data, ret_obj->buffer.pointer,
>>>>> +                  ret_obj->buffer.length);
>>>>> +           kfree(ret_obj);
>>>>> +
>>>>> +           if (cap_data->id !=3D attribute_id)
>>>>> +                   continue;
>>>>> +           break;
>>>>> +   }
>>>>> +   if (cap_data->id =3D=3D 0) {
>>>>> +           pr_err("lenovo_legion_wmi_capdata_01: Failed to get capa=
bility data.\n");
>>>>> +           return -EINVAL;
>>>>> +   }
>>>>> +   return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_NS_GPL(capdata_01_wmi_get, "CAPDATA_WMI");
>>>>> +
>>>>> +/* Driver Setup */
>>>>> +static int capdata_01_wmi_probe(struct wmi_device *wdev, const void=
 *context)
>>>>> +{
>>>>> +   cd01_wmi.wdev =3D wdev;
>>>>> +   drvdata.cd01_wmi =3D &cd01_wmi;
>>>>> +   pr_info("lenovo_legion_wmi_capdata_01: Added Lenovo Capability D=
ata 01 WMI interface.\n");
>>>>> +
>>>> Pretty noisy; no?  I think you probably should lose this message.
>>>>
>>> Acked for fix all pr_info comments.
>>>
>>>>> +   return 0;
>>>>> +}
>>>>> +
>>>>> +static void capdata_01_wmi_remove(struct wmi_device *wdev)
>>>>> +{
>>>>> +   pr_info("lenovo_legion_wmi_capdata_01: Removed Lenovo Capability=
 Data 01 WMI interface.\n");
>>>> Pretty noisy; no?  I think you probably should lose this message.
>>>>
>>>>> +}
>>>>> +
>>>>> +static struct wmi_driver capdata_01_wmi_driver =3D {
>>>>> +   .driver =3D { .name =3D "capdata_01_wmi" },
>>>>> +   .id_table =3D capdata_01_wmi_id_table,
>>>>> +   .probe =3D capdata_01_wmi_probe,
>>>>> +   .remove =3D capdata_01_wmi_remove,
>>>>> +};
>>>>> +
>>>>> +module_wmi_driver(capdata_01_wmi_driver);
>>>>> +
>>>>> +MODULE_DEVICE_TABLE(wmi, capdata_01_wmi_id_table);
>>>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>>>> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
>>>>> +MODULE_LICENSE("GPL");
>>>>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-gamezone.c b/dri=
vers/platform/x86/lenovo-legion-wmi-gamezone.c
>>>>> new file mode 100644
>>>>> index 000000000000..2f976dc0e367
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/x86/lenovo-legion-wmi-gamezone.c
>>>>> @@ -0,0 +1,233 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface=
 provides
>>>>> + * platform profile and fan curve settings for devices that fall un=
der the
>>>>> + * "Gaming Series" of Lenovo Legion devices.
>>>>> + *
>>>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>>>> + *
>>>> Drop newline here
>>>>> + */
>>>>> +
>>>>> +#include "lenovo-legion-wmi.h"
>>>>> +
>>>>> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>>>>> +
>>>>> +/* Method IDs */
>>>>> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
>>>>> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
>>>>> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
>>>>> +
>>>>> +static const struct wmi_device_id gamezone_wmi_id_table[] =3D {
>>>>> +   { LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
>>>>> +   {}
>>>>> +};
>>>>> +
>>>>> +static struct gamezone_wmi gz_wmi =3D {
>>>>> +   .mutex =3D __MUTEX_INITIALIZER(gz_wmi.mutex)
>>>>> +};
>>>>> +
>>>>> +/* Platform Profile Methods */
>>>>> +static int
>>>>> +gamezone_wmi_platform_profile_supported(struct platform_profile_han=
dler *pprof,
>>>>> +                                   int *supported)
>>>>> +{
>>>>> +   int ret;
>>>>> +
>>>>> +   mutex_lock(&gz_wmi.mutex);
>>>> I'd use guard(mutex) instead.  By doing that your function becomes a =
lot
>>>> simpler too.
>>>>
>>>> guard(mutex)(&gz_wmi.mutex);
>>>>
>>>> return lenovo_legion_evaluate_method_1();
>>>>
>>>>> +   ret =3D lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x=
0,
>>>>> +                                         WMI_METHOD_ID_SMARTFAN_SUP=
P, 0,
>>>>> +                                         supported);
>>>>> +   mutex_unlock(&gz_wmi.mutex);
>>>>> +   return ret;
>>>>> +}
>>>>> +
>>>>> +int gamezone_wmi_fan_profile_get(struct platform_profile_handler *p=
prof,
>>>>> +                            int *sel_prof)
>>>>> +{
>>>>> +   int ret;
>>>>> +   int supported;
>>>>> +
>>>>> +   gamezone_wmi_platform_profile_supported(&drvdata.gz_wmi->pprof,
>>>>> +                                           &supported);
>>>>> +   if (!supported) {
>>>>> +           pr_err("lenovo_legion_wmi_gamezone: Platform profiles ar=
e not supported by this device.\n");
>>>> Is this error flow real?  I sort of expect that you can avoid
>>>> registering if not supporting it.
>>>>
>>> This method is an exported symbol in GZ_WMI. I'm not aware of any hard=
ware
>>> without the GameZone interface that does implement the Other Method in=
terface,
>>> but if it does exist I was concerned about calling on an interface tha=
t isn't
>>> registered. Perhaps a null pointer check on gz_wmi or gz_wmi.pprof->su=
pported
>>> check in the other method calls to this would be better? I didn't want=
 to rely
>>> on pprof exising for the check. I do now realize that this would call =
on a WMI
>>> interface that doesn't exist if it was the case this hardware exists.
>> In general passing WMI devices between different drivers will likely re=
sult in device lifetime issues.
>>
>> I suggest that you decouple both drivers as much as possible and rely o=
n userspace for selecting
>> custom mode before changing any tuning settings.
>>
>> See my above comment for more details.
>>
>> Thanks,
>> Armin Wolf
>>
>>>>> +           return -EOPNOTSUPP;
>>>>> +   }
>>>>> +   mutex_lock(&gz_wmi.mutex);
>>>> guard(mutex) here too.
>>>>
>>>>> +   ret =3D lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x=
0,
>>>>> +                                         WMI_METHOD_ID_SMARTFAN_GET=
, 0,
>>>>> +                                         sel_prof);
>>>>> +   mutex_unlock(&gz_wmi.mutex);
>>>>> +   return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL_NS_GPL(gamezone_wmi_fan_profile_get, "GZ_WMI");
>>>>> +
>>>>> +static int
>>>>> +gamezone_wmi_platform_profile_get(struct platform_profile_handler *=
pprof,
>>>>> +                             enum platform_profile_option *profile)
>>>>> +{
>>>>> +   int sel_prof;
>>>>> +   int err;
>>>>> +
>>>>> +   err =3D gamezone_wmi_fan_profile_get(pprof, &sel_prof);
>>>>> +   if (err)
>>>>> +           return err;
>>>>> +
>>>>> +   switch (sel_prof) {
>>>>> +   case SMARTFAN_MODE_QUIET:
>>>>> +           *profile =3D PLATFORM_PROFILE_QUIET;
>>>>> +           break;
>>>>> +   case SMARTFAN_MODE_BALANCED:
>>>>> +           *profile =3D PLATFORM_PROFILE_BALANCED;
>>>>> +           break;
>>>>> +   case SMARTFAN_MODE_PERFORMANCE:
>>>>> +           *profile =3D PLATFORM_PROFILE_PERFORMANCE;
>>>>> +           break;
>>>>> +   case SMARTFAN_MODE_CUSTOM:
>>>>> +           *profile =3D PLATFORM_PROFILE_CUSTOM;
>>>>> +           break;
>>>>> +
>>>> Spurious newline.
>>>>
>>>>> +   default:
>>>>> +           return -EINVAL;
>>>>> +   }
>>>>> +   drvdata.gz_wmi->current_profile =3D *profile;
>>>>> +
>>>>> +   return 0;
>>>>> +}
>>>>> +
>>>>> +int gamezone_wmi_platform_profile_set(struct platform_profile_handl=
er *pprof,
>>>>> +                                 enum platform_profile_option profi=
le)
>>>>> +{
>>>>> +   int ret;
>>>>> +   int sel_prof;
>>>>> +   int supported;
>>>>> +
>>>>> +   gamezone_wmi_platform_profile_supported(&drvdata.gz_wmi->pprof,
>>>>> +                                           &supported);
>>>>> +   if (!supported) {
>>>>> +           pr_err("lenovo_legion_wmi_gamezone: Platform profiles ar=
e not supported by this device.\n");
>>>>> +           return -EOPNOTSUPP;
>>>>> +   }
>>>> Same question; is this a real error flow?
>>>>
>>> Also an exported symbol in GZ_WMI. Will find another way to do these c=
hecks in
>>> Other Method.
>>>
>>>>> +
>>>>> +   switch (profile) {
>>>>> +   case PLATFORM_PROFILE_QUIET:
>>>>> +           sel_prof =3D SMARTFAN_MODE_QUIET;
>>>>> +           break;
>>>>> +   case PLATFORM_PROFILE_BALANCED:
>>>>> +           sel_prof =3D SMARTFAN_MODE_BALANCED;
>>>>> +           break;
>>>>> +   case PLATFORM_PROFILE_PERFORMANCE:
>>>>> +           sel_prof =3D SMARTFAN_MODE_PERFORMANCE;
>>>>> +           break;
>>>>> +   case PLATFORM_PROFILE_CUSTOM:
>>>>> +           sel_prof =3D SMARTFAN_MODE_CUSTOM;
>>>>> +           break;
>>>>> +   default:
>>>>> +           return -EOPNOTSUPP;
>>>>> +   }
>>>>> +
>>>>> +   mutex_lock(&gz_wmi.mutex);
>>>> guard(mutex) here.
>>>>> +   ret =3D lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x=
0,
>>>>> +                                         WMI_METHOD_ID_SMARTFAN_SET=
,
>>>>> +                                         sel_prof, NULL);
>>>>> +   mutex_unlock(&gz_wmi.mutex);
>>>>> +
>>>>> +   if (ret) {
>>>>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to set platfo=
rm profile.\n");
>>>>> +           return ret;
>>>>> +   }
>>>>> +
>>>>> +   drvdata.gz_wmi->current_profile =3D profile;
>>>>> +   return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_NS_GPL(gamezone_wmi_platform_profile_set, "GZ_WMI");
>>>>> +
>>>>> +/* Driver Setup */
>>>>> +static int platform_profile_setup(struct gamezone_wmi *gz_wmi)
>>>>> +{
>>>>> +   int err;
>>>>> +   int supported;
>>>>> +
>>>>> +   gamezone_wmi_platform_profile_supported(&gz_wmi->pprof, &support=
ed);
>>>>> +
>>>>> +   gz_wmi->platform_profile_support =3D supported;
>>>>> +
>>>>> +   if (!supported) {
>>>>> +           pr_warn("lenovo_legion_wmi_gamezone: Platform profiles a=
re not supported by this device.\n");
>>>>> +           return -EOPNOTSUPP;
>>>>> +   }
>>>> Yeah because of this you don't need that other flow I was mentioning =
above.
>>>>
>>>> IMO I don't think the pr_warn() is really needed, you'll only really
>>>> have one way that you exit -EOPNOTSUPP.
>>>>
>>> Will remove warn, thanks.
>>>
>>>>> +
>>>>> +   gz_wmi->pprof.profile_get =3D gamezone_wmi_platform_profile_get;
>>>>> +   gz_wmi->pprof.profile_set =3D gamezone_wmi_platform_profile_set;
>>>>> +
>>>>> +   set_bit(PLATFORM_PROFILE_QUIET, gz_wmi->pprof.choices);
>>>>> +   set_bit(PLATFORM_PROFILE_BALANCED, gz_wmi->pprof.choices);
>>>>> +   set_bit(PLATFORM_PROFILE_PERFORMANCE, gz_wmi->pprof.choices);
>>>>> +   set_bit(PLATFORM_PROFILE_CUSTOM, gz_wmi->pprof.choices);
>>>>> +
>>>>> +   err =3D gamezone_wmi_platform_profile_get(&gz_wmi->pprof,
>>>>> +                                           &gz_wmi->current_profile=
);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to get curren=
t platform profile: %d\n",
>>>>> +                  err);
>>>> Drop prefix on the error and use pr_fmt().
>>>>
>>>>> +           return err;
>>>>> +   }
>>>>> +
>>>>> +   err =3D platform_profile_register(&gz_wmi->pprof);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to register p=
latform profile support: %d\n",
>>>>> +                  err);
>>>> Drop prefix on the error and use pr_fmt().
>>>>
>>>>> +           return err;
>>>>> +   }
>>>>> +
>>>>> +   return 0;
>>>>> +}
>>>>> +
>>>>> +static int gamezone_wmi_probe(struct wmi_device *wdev, const void *=
context)
>>>>> +{
>>>>> +   int err;
>>>>> +
>>>>> +   gz_wmi.wdev =3D wdev;
>>>>> +   drvdata.gz_wmi =3D &gz_wmi;
>>>>> +
>>>>> +   err =3D platform_profile_setup(&gz_wmi);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to add platfo=
rm profile: %d\n",
>>>>> +                  err);
>>>>> +           kfree(&gz_wmi);
>>>> Is this free correct?  It's a global isn't it?  I don't think you sho=
uld
>>>> be freeing here.
>>>>
>>> I'll just return the error.
>>>
>>>>> +           return err;
>>>>> +   }
>>>>> +
>>>>> +   pr_info("lenovo_legion_wmi_gamezone: Added platform profile supp=
ort.\n");
>>>> Too noisy.
>>>>
>>>>> +   return 0;
>>>>> +}
>>>>> +
>>>>> +static void gamezone_wmi_remove(struct wmi_device *wdev)
>>>>> +{
>>>>> +   int err;
>>>>> +
>>>>> +   mutex_lock(&gz_wmi.mutex);
>>>>> +   err =3D platform_profile_remove(&drvdata.gz_wmi->pprof);
>>>>> +   mutex_unlock(&gz_wmi.mutex);
>>>>> +
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_gamezone: Failed to remove pla=
tform profile: %d\n",
>>>>> +                  err);
>>>>> +   } else {
>>>>> +           pr_info("lenovo_legion_wmi_gamezone: Removed platform pr=
ofile support.\n");
>>>>> +   }
>>>> Considering that platform_profile_remove() doesn't really have a fail=
ure
>>>> path (it always returns 0). I'd just lose both of these messages and
>>>> make this simple.
>>>>
>>>> guard(mutex)();
>>>> platform_profile_remove();
>>>>
>>> Acked for fix.
>>>
>>>>> +}
>>>>> +
>>>>> +static struct wmi_driver gamezone_wmi_driver =3D {
>>>>> +   .driver =3D { .name =3D "gamezone_wmi" },
>>>>> +   .id_table =3D gamezone_wmi_id_table,
>>>>> +   .probe =3D gamezone_wmi_probe,
>>>>> +   .remove =3D gamezone_wmi_remove,
>>>>> +};
>>>>> +
>>>>> +module_wmi_driver(gamezone_wmi_driver);
>>>>> +
>>>>> +MODULE_DEVICE_TABLE(wmi, gamezone_wmi_id_table);
>>>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>>>> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
>>>>> +MODULE_LICENSE("GPL");
>>>>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-other.c b/driver=
s/platform/x86/lenovo-legion-wmi-other.c
>>>>> new file mode 100644
>>>>> index 000000000000..c09c1848eda7
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/x86/lenovo-legion-wmi-other.c
>>>>> @@ -0,0 +1,377 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + * Lenovo Legion Other Method driver. This driver uses the fw_attri=
butes
>>>>> + * class to expose the various WMI functions provided by the "Other=
 Method" WMI
>>>>> + * interface. This enables CPU and GPU power limit as well as vario=
us other
>>>>> + * attributes for devices that fall under the "Gaming Series" of Le=
novo Legion
>>>>> + * devices. Each attribute exposed by the "Other Method"" interface=
 has a
>>>>> + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the d=
river to
>>>>> + * probe details about the attribute such as set/get support, step,=
 min, max,
>>>>> + * and default value. Each attibute has multiple pages, one for eac=
h of the
>>>>> + * fan profiles managed by the GameZone interface, so it must be pr=
obed prior
>>>>> + * to returning the current_value.
>>>>> + *
>>>>> + * These attributes typically don't fit anywhere else in the sysfs =
and are set
>>>>> + * in Windows using one of Lenovo's multiple user applications.
>>>>> + *
>>>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>>>> + *
>>>> Remove the new line here.
>>>>> + */
>>>>> +
>>>>> +#include "lenovo-legion-wmi.h"
>>>>> +#include "firmware_attributes_class.h"
>>>>> +
>>>>> +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089C=
D3B"
>>>>> +
>>>>> +/* Device IDs */
>>>>> +#define WMI_DEVICE_ID_CPU 0x01
>>>>> +
>>>>> +/* WMI_DEVICE_ID_CPU feature IDs */
>>>>> +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
>>>>> +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
>>>>> +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
>>>>> +
>>>>> +/* Method IDs */
>>>>> +#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
>>>>> +#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
>>>>> +
>>>>> +static const struct wmi_device_id other_method_wmi_id_table[] =3D {
>>>>> +   { LENOVO_OTHER_METHOD_GUID, NULL },
>>>>> +   {}
>>>>> +};
>>>>> +
>>>>> +/* Tunable Attributes */
>>>>> +struct ll_tunables {
>>>>> +   u32 ppt_pl1_spl;
>>>>> +   u32 ppt_pl2_sppt;
>>>>> +   u32 ppt_pl3_fppt;
>>>>> +};
>>>>> +
>>>>> +static const struct class *fw_attr_class;
>>>>> +
>>>>> +static struct other_method_wmi om_wmi =3D {
>>>>> +   .mutex =3D __MUTEX_INITIALIZER(om_wmi.mutex)
>>>>> +};
>>>>> +
>>>>> +struct capdata_01_attr_group {
>>>>> +   const struct attribute_group *attr_group;
>>>>> +};
>>>>> +
>>>>> +/* Simple attribute creation */
>>>>> +
>>>>> +/*
>>>>> + * att_current_value_store() - Set the current value of the given a=
ttribute
>>>>> + * @kobj: Pointer to the driver object.
>>>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>>>> + * @buf: The buffer to read from, this is parsed to `int` type.
>>>>> + * @count: Required by sysfs attribute macros, pass in from the cal=
lee attr.
>>>>> + * @store_value: Pointer to where the parsed value should be stored=
.
>>>>> + * @device_id: The WMI function Device ID to use.
>>>>> + * @feature_id: The WMI function Feature ID to use.
>>>>> + *
>>>>> + * This function is intended to be generic so it can be called from=
 any
>>>>> + * attribute's "current_value_store" which works only with integers=
. The
>>>>> + * integer to be sent to the WMI method is range checked and an err=
or returned
>>>>> + * if out of range.
>>>>> + *
>>>>> + * If the value is valid and WMI is success, then the sysfs attribu=
te is
>>>>> + * notified.
>>>>> + *
>>>>> + * Returns: Either count, or an error.
>>>>> + */
>>>>> +ssize_t attr_current_value_store(struct kobject *kobj,
>>>>> +                            struct kobj_attribute *attr, const char=
 *buf,
>>>>> +                            size_t count, u32 *store_value, u8 devi=
ce_id,
>>>>> +                            u8 feature_id)
>>>>> +{
>>>>> +   struct capability_data_01 cap_data;
>>>>> +   enum platform_profile_option cust_prof;
>>>>> +   int err;
>>>>> +   int sel_prof;
>>>>> +   u32 value;
>>>>> +   struct wmi_device *wdev =3D drvdata.om_wmi->wdev;
>>>>> +
>>>>> +   err =3D gamezone_wmi_fan_profile_get(&drvdata.gz_wmi->pprof, &se=
l_prof);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Error getting gamezone =
fan profile.\n");
>>>> Use pr_fmt() for teh file instead of prefix here.
>>>>
>>>>> +           return -EIO;
>>>>> +   }
>>>>> +
>>>>> +   /* Switch to custom profile if not currently on it. */
>>>>> +   if (sel_prof !=3D SMARTFAN_MODE_CUSTOM) {
>>>>> +           pr_warn("lenovo_legion_wmi_other: Device must be in CUST=
OM profile to set tunables.");
>>>> As you do this "for" them, I'd lose the warning.
>>>>
>>> Acked for fix. Leftover from an earlier version that didn't set the pr=
ofile.
>>>
>>>>> +           cust_prof =3D PLATFORM_PROFILE_CUSTOM;
>>>>> +           sel_prof =3D SMARTFAN_MODE_CUSTOM;
>>>>> +           err =3D gamezone_wmi_platform_profile_set(&drvdata.gz_wm=
i->pprof,
>>>>> +                                                   cust_prof);
>>>>> +           if (err) {
>>>>> +                   pr_err("lenovo_legion_wmi_other: Error setting g=
amezone fan profile.\n");
>>>>> +                   return -EIO;
>>>>> +           }
>>>>> +   }
>>>>> +
>>>>> +   err =3D kstrtouint(buf, 10, &value);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Error converting value =
to int.\n");
>>>>> +           return -EIO;
>>>>> +   }
>>>>> +
>>>>> +   /* Construct the attribute id */
>>>>> +   struct om_attribute_id attr_id =3D { sel_prof << 8, feature_id,
>>>>> +                                      device_id };
>>>>> +
>>>>> +   /* Get min/max from LENOVO_CAPABILITY_DATA_01 */
>>>>> +   err =3D capdata_01_wmi_get(attr_id, &cap_data);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Failed to get capabilit=
y data.\n");
>>>>> +           return -EIO;
>>>>> +   }
>>>>> +   if (cap_data.capability < 1) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Capability not supporte=
d.\n");
>>>>> +           return -EPERM;
>>>>> +   }
>>>>> +
>>>>> +   if (value < cap_data.min_value || value > cap_data.max_value) {
>>>>> +           pr_warn("lenovo_legion_wmi_other: Value %d is not betwee=
n %d and %d.\n",
>>>>> +                   value, cap_data.min_value, cap_data.max_value);
>>>>> +           return -EINVAL;
>>>>> +   }
>>>>> +
>>>>> +   mutex_lock(&om_wmi.mutex);
>>>>> +   err =3D lenovo_legion_evaluate_method_2(wdev, 0x0,
>>>>> +                                         WMI_METHOD_ID_VALUE_SET,
>>>>> +                                         *(int *)&attr_id, value, N=
ULL);
>>>>> +   mutex_unlock(&om_wmi.mutex);
>>>>> +
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Error setting attribute=
");
>>>>> +           return err;
>>>>> +   }
>>>>> +
>>>>> +   if (store_value)
>>>>> +           *store_value =3D value;
>>>>> +
>>>>> +   sysfs_notify(kobj, NULL, attr->attr.name);
>>>>> +   return count;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * attr_current_value_show() - Get the current value of the given a=
ttribute
>>>>> + * @kobj: Pointer to the driver object.
>>>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>>>> + * @buf: The buffer to write to.
>>>>> + * @retval: Pointer to returned data.
>>>>> + * @device_id: The WMI function Device ID to use.
>>>>> + * @feature_id: The WMI function Feature ID to use.
>>>>> + *
>>>>> + * This function is intended to be generic so it can be called from=
 any "_show"
>>>>> + * attribute which works only with integers.
>>>>> + *
>>>>> + * If the WMI is success, then the sysfs attribute is notified.
>>>>> + *
>>>>> + * Returns: Either count, or an error.
>>>>> + */
>>>>> +ssize_t attr_current_value_show(struct kobject *kobj,
>>>>> +                           struct kobj_attribute *attr, char *buf,
>>>>> +                           u8 device_id, u8 feature_id)
>>>>> +{
>>>>> +   int sel_prof; /* Current fan profile mode */
>>>>> +   int err;
>>>>> +   int retval;
>>>>> +   struct wmi_device *wdev =3D drvdata.om_wmi->wdev;
>>>>> +
>>>>> +   err =3D gamezone_wmi_fan_profile_get(&drvdata.gz_wmi->pprof, &se=
l_prof);
>>>>> +
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Error getting gamezone =
fan profile.\n");
>>>>> +           return err;
>>>>> +   }
>>>>> +
>>>>> +   // Construct the WMI attribute id from the given args.
>>>>> +   struct om_attribute_id attribute_id =3D { sel_prof << 8, feature=
_id,
>>>>> +                                           device_id };
>>>>> +
>>>>> +   mutex_lock(&om_wmi.mutex);
>>>>> +   err =3D lenovo_legion_evaluate_method_1(wdev, 0x0,
>>>>> +                                         WMI_METHOD_ID_VALUE_GET,
>>>>> +                                         *(int *)&attribute_id, &re=
tval);
>>>>> +   mutex_unlock(&om_wmi.mutex);
>>>>> +
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Error getting attribute=
");
>>>>> +           return err;
>>>>> +   }
>>>>> +
>>>>> +   return sysfs_emit(buf, "%u\n", retval);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * attr_capdata_01_show() - Get the value of the specified attribut=
e property
>>>>> + * from LENOVO_CAPABILITY_DATA_01.
>>>>> + * @kobj: Pointer to the driver object.
>>>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>>>> + * @buf: The buffer to write to.
>>>>> + * @retval: Pointer to returned data.
>>>>> + * @device_id: The WMI functions Device ID to use.
>>>>> + * @feature_id: The WMI functions Feature ID to use.
>>>>> + * @prop: The property of this attribute to be read.
>>>>> + *
>>>>> + * This function is intended to be generic so it can be called from=
 any "_show"
>>>>> + * attribute which works only with integers.
>>>>> + *
>>>>> + * If the WMI is success, then the sysfs attribute is notified.
>>>>> + *
>>>>> + * Returns: Either count, or an error.
>>>>> + */
>>>>> +ssize_t attr_capdata_01_show(struct kobject *kobj, struct kobj_attr=
ibute *attr,
>>>>> +                        char *buf, u8 device_id, u8 feature_id,
>>>>> +                        enum attribute_property prop)
>>>>> +{
>>>>> +   struct capability_data_01 cap_data;
>>>>> +   int err;
>>>>> +   int retval;
>>>>> +   int sel_prof =3D SMARTFAN_MODE_CUSTOM; /* Only show CUSTOM mode =
values */
>>>>> +
>>>>> +   // Construct the WMI attribute id from the given args.
>>>>> +   struct om_attribute_id attribute_id =3D { sel_prof << 8, feature=
_id,
>>>>> +                                           device_id };
>>>>> +
>>>>> +   err =3D capdata_01_wmi_get(attribute_id, &cap_data);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Failed to get capabilit=
y data.\n");
>>>>> +           return -EIO;
>>>>> +   }
>>>>> +
>>>>> +   switch (prop) {
>>>>> +   case DEFAULT_VAL:
>>>>> +           retval =3D cap_data.default_value;
>>>>> +           break;
>>>>> +   case MAX_VAL:
>>>>> +           retval =3D cap_data.max_value;
>>>>> +           break;
>>>>> +   case MIN_VAL:
>>>>> +           retval =3D cap_data.min_value;
>>>>> +           break;
>>>>> +   case STEP_VAL:
>>>>> +           retval =3D cap_data.step;
>>>>> +           break;
>>>>> +   default:
>>>>> +           return -EINVAL;
>>>>> +   }
>>>>> +   return sysfs_emit(buf, "%u\n", retval);
>>>>> +}
>>>>> +
>>>>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl", WMI_DEVICE_=
ID_CPU,
>>>>> +                       WMI_FEATURE_ID_CPU_SPL,
>>>>> +                       "Set the CPU sustained power limit");
>>>>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt", WMI_DEVIC=
E_ID_CPU,
>>>>> +                       WMI_FEATURE_ID_CPU_SPPT,
>>>>> +                       "Set the CPU slow package power tracking lim=
it");
>>>>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt", WMI_DEVIC=
E_ID_CPU,
>>>>> +                       WMI_FEATURE_ID_CPU_FPPT,
>>>>> +                       "Set the CPU fast package power tracking lim=
it");
>>>>> +
>>>>> +static const struct capdata_01_attr_group capdata_01_attr_groups[] =
=3D {
>>>>> +   { &ppt_pl1_spl_attr_group },
>>>>> +   { &ppt_pl2_sppt_attr_group },
>>>>> +   { &ppt_pl3_fppt_attr_group },
>>>>> +   {},
>>>>> +};
>>>>> +
>>>>> +static int other_method_fw_attr_add(void)
>>>>> +{
>>>>> +   int err, i;
>>>>> +
>>>>> +   err =3D fw_attributes_class_get(&fw_attr_class);
>>>>> +   if (err) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Failed to get firmware_=
attributes_class.\n");
>>>>> +           return err;
>>>>> +   }
>>>>> +
>>>>> +   om_wmi.fw_attr_dev =3D device_create(fw_attr_class, NULL, MKDEV(=
0, 0),
>>>>> +                                      NULL, "%s", DRIVER_NAME);
>>>>> +   if (IS_ERR(om_wmi.fw_attr_dev)) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Failed to create firmwa=
re_attributes_class device.\n");
>>>>> +           err =3D PTR_ERR(om_wmi.fw_attr_dev);
>>>>> +           goto fail_class_get;
>>>>> +   }
>>>>> +
>>>>> +   om_wmi.fw_attr_kset =3D kset_create_and_add("attributes", NULL,
>>>>> +                                             &om_wmi.fw_attr_dev->k=
obj);
>>>>> +   if (!om_wmi.fw_attr_kset) {
>>>>> +           pr_err("lenovo_legion_wmi_other: Failed to create firmwa=
re_attributes_class kset.\n");
>>>>> +           err =3D -ENOMEM;
>>>>> +           goto err_destroy_classdev;
>>>>> +   }
>>>>> +
>>>>> +   for (i =3D 0; i < ARRAY_SIZE(capdata_01_attr_groups) - 1; i++) {
>>>>> +           err =3D sysfs_create_group(&om_wmi.fw_attr_kset->kobj,
>>>>> +                                    capdata_01_attr_groups[i].attr_=
group);
>>>>> +           if (err) {
>>>>> +                   pr_err("lenovo_legion_wmi_other: Failed to creat=
e sysfs-group for %s\n",
>>>>> +                          capdata_01_attr_groups[i].attr_group->nam=
e);
>>>>> +                   goto err_remove_groups;
>>>>> +           }
>>>>> +   }
>>>>> +
>>>>> +   return 0;
>>>>> +
>>>>> +err_remove_groups:
>>>>> +   while (--i >=3D 0) {
>>>>> +           sysfs_remove_group(&om_wmi.fw_attr_kset->kobj,
>>>>> +                              capdata_01_attr_groups[i].attr_group)=
;
>>>>> +   }
>>>>> +err_destroy_classdev:
>>>>> +   device_destroy(fw_attr_class, MKDEV(0, 0));
>>>>> +fail_class_get:
>>>>> +   fw_attributes_class_put();
>>>>> +   return err;
>>>>> +}
>>>>> +
>>>>> +/* Driver Setup */
>>>>> +static int other_method_wmi_probe(struct wmi_device *wdev, const vo=
id *context)
>>>>> +{
>>>>> +   int err;
>>>>> +
>>>>> +   om_wmi.wdev =3D wdev;
>>>>> +   drvdata.om_wmi =3D &om_wmi;
>>>>> +   om_wmi.ll_tunables =3D kzalloc(sizeof(*om_wmi.ll_tunables), GFP_=
KERNEL);
>>>>> +   if (!om_wmi.ll_tunables)
>>>>> +           return -ENOMEM;
>>>>> +
>>>>> +   err =3D other_method_fw_attr_add();
>>>>> +   if (err)
>>>>> +           return err;
>>>>> +   pr_info("lenovo_legion_wmi_other: Firmware attributes added.\n")=
;
>>>> too noisy
>>>>
>>>>> +
>>>>> +   return 0;
>>>>> +}
>>>>> +
>>>>> +static void other_method_wmi_remove(struct wmi_device *wdev)
>>>>> +{
>>>>> +   mutex_lock(&om_wmi.mutex);
>>>>> +
>>>>> +   kset_unregister(om_wmi.fw_attr_kset);
>>>>> +   device_destroy(fw_attr_class, MKDEV(0, 0));
>>>>> +   fw_attributes_class_put();
>>>>> +
>>>>> +   mutex_unlock(&om_wmi.mutex);
>>>>> +
>>>>> +   pr_info("lenovo_legion_wmi_other: Firmware attributes removed.\n=
");
>>>> too noisy.
>>>>
>>>>> +}
>>>>> +
>>>>> +static struct wmi_driver other_method_wmi_driver =3D {
>>>>> +   .driver =3D { .name =3D "other_method_wmi" },
>>>>> +   .id_table =3D other_method_wmi_id_table,
>>>>> +   .probe =3D other_method_wmi_probe,
>>>>> +   .remove =3D other_method_wmi_remove,
>>>>> +};
>>>>> +
>>>>> +module_wmi_driver(other_method_wmi_driver);
>>>>> +
>>>>> +MODULE_IMPORT_NS("GZ_WMI");
>>>>> +MODULE_IMPORT_NS("CAPDATA_WMI");
>>>>> +MODULE_DEVICE_TABLE(wmi, other_method_wmi_id_table);
>>>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>>>> +MODULE_DESCRIPTION("Lenovo Legion Other Method Driver");
>>>>> +MODULE_LICENSE("GPL");
>>>>> diff --git a/drivers/platform/x86/lenovo-legion-wmi.h b/drivers/plat=
form/x86/lenovo-legion-wmi.h
>>>>> new file mode 100644
>>>>> index 000000000000..65baa728f29e
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/x86/lenovo-legion-wmi.h
>>>>> @@ -0,0 +1,271 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later
>>>>> + *
>>>>> + * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interf=
ace is
>>>>> + * broken up into multiple GUID interfaces that require cross-refer=
ences
>>>>> + * between GUID's for some functionality. The "Custom Mode" interfa=
ce is a
>>>>> + * legacy interface for managing and displaying CPU & GPU power and=
 hwmon
>>>>> + * settings and readings. The "Other Mode" interface is a modern in=
terface
>>>>> + * that replaces or extends the "Custom Mode" interface methods. Th=
e "GameZone"
>>>>> + * interface adds advanced features such as fan profiles and overcl=
ocking.
>>>>> + * The "Lighting" interface adds control of various status lights r=
elated to
>>>>> + * different hardware components. "Custom Mode" uses LENOVO_CAPABIL=
ITY_DATA_00
>>>>> + * struct for capability information, "Other Mode" uses
>>>>> + * LENOVO_CAPABILITY_DATA_01 struct for capability information, and=
 "Lighting"
>>>>> + * uses LENOVO_CAPABILITY_DATA_02 struct for capability information=
.
>>>>> + *
>>>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>>>> + *
>>>> Lose the newline
>>>>
>>>>> + */
>>>>> +
>>>>> +#ifndef _LENOVO_LEGION_WMI_H_
>>>>> +#define _LENOVO_LEGION_WMI_H_
>>>>> +
>>>>> +#include <linux/mutex.h>
>>>>> +#include <linux/platform_profile.h>
>>>>> +#include <linux/types.h>
>>>>> +#include <linux/wmi.h>
>>>>> +
>>>>> +#define DRIVER_NAME "lenovo-legion-wmi"
>>>> This is only used in one of the drivers, I'd move it there to make it
>>>> clearer.
>>>>
>>> Acked for fix.
>>>
>>>>> +
>>>>> +/* Platform Profile Modes */
>>>>> +#define SMARTFAN_MODE_QUIET 0x01
>>>>> +#define SMARTFAN_MODE_BALANCED 0x02
>>>>> +#define SMARTFAN_MODE_PERFORMANCE 0x03
>>>>> +#define SMARTFAN_MODE_CUSTOM 0xFF
>>>>> +
>>>>> +struct gamezone_wmi {
>>>>> +   struct wmi_device *wdev;
>>>>> +   enum platform_profile_option current_profile;
>>>>> +   struct platform_profile_handler pprof;
>>>>> +   bool platform_profile_support;
>>>>> +   struct mutex mutex; /* Ensure single operation on WMI device */
>>>>> +};
>>>>> +
>>>>> +struct other_method_wmi {
>>>>> +   struct wmi_device *wdev;
>>>>> +   struct device *fw_attr_dev;
>>>>> +   struct kset *fw_attr_kset;
>>>>> +   struct ll_tunables *ll_tunables;
>>>>> +   struct mutex mutex; /* Ensure single operation on WMI device */
>>>>> +};
>>>>> +
>>>>> +struct capdata_wmi {
>>>>> +   struct wmi_device *wdev;
>>>>> +   struct mutex mutex; /* Ensure single operation on WMI device */
>>>>> +};
>>>>> +
>>>>> +struct ll_drvdata {
>>>>> +   struct other_method_wmi *om_wmi; /* Other method GUID device */
>>>>> +   struct gamezone_wmi *gz_wmi; /* Gamezone GUID device */
>>>>> +   struct capdata_wmi *cd01_wmi; /* Capability Data 01 GUID device =
*/
>>>>> +} drvdata;
>>>>> +
>>>>> +struct wmi_method_args {
>>>>> +   u32 arg0;
>>>>> +   u32 arg1;
>>>>> +};
>>>>> +
>>>>> +struct om_attribute_id {
>>>>> +   u32 mode_id : 16; /* Fan profile */
>>>>> +   u32 feature_id : 8; /* Attribute (SPL/SPPT/...) */
>>>>> +   u32 device_id : 8; /* CPU/GPU */
>>>>> +} __packed;
>>>>> +
>>>>> +enum attribute_property {
>>>>> +   DEFAULT_VAL =3D 0,
>>>>> +   MAX_VAL,
>>>>> +   MIN_VAL,
>>>>> +   STEP_VAL,
>>>>> +   SUPPORTED,
>>>>> +};
>>>>> +
>>>>> +struct capability_data_01 {
>>>>> +   u32 id;
>>>>> +   u32 capability;
>>>>> +   u32 default_value;
>>>>> +   u32 step;
>>>>> +   u32 min_value;
>>>>> +   u32 max_value;
>>>>> +};
>>>>> +
>>>>> +static int lenovo_legion_evaluate_method(struct wmi_device *wdev, u=
8 instance,
>>>>> +                                    u32 method_id, struct acpi_buff=
er *in,
>>>>> +                                    struct acpi_buffer *out)
>>>>> +{
>>>>> +   acpi_status status;
>>>>> +
>>>>> +   status =3D wmidev_evaluate_method(wdev, instance, method_id, in,=
 out);
>>>>> +
>>>>> +   if (ACPI_FAILURE(status)) {
>>>>> +           pr_err("lenovo_legion_wmi: wmidev_evaluate_method failed=
 for method_id %u instance %u.\n",
>>>>> +                  method_id, instance);
>>>>> +           return -EIO;
>>>>> +   }
>>>>> +
>>>>> +   return 0;
>>>>> +}
>>>>> +
>>>>> +int lenovo_legion_evaluate_method_2(struct wmi_device *wdev, u8 ins=
tance,
>>>>> +                               u32 method_id, u32 arg0, u32 arg1,
>>>>> +                               u32 *retval);
>>>>> +
>>>>> +int lenovo_legion_evaluate_method_2(struct wmi_device *wdev, u8 ins=
tance,
>>>>> +                               u32 method_id, u32 arg0, u32 arg1,
>>>>> +                               u32 *retval)
>>>>> +{
>>>>> +   int ret;
>>>>> +   u32 temp_val;
>>>>> +   struct wmi_method_args args =3D { arg0, arg1 };
>>>>> +   struct acpi_buffer input =3D { (acpi_size)sizeof(args), &args };
>>>>> +   struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>>>>> +   union acpi_object *ret_obj =3D NULL;
>>>> Reverse xmas tree please.
>>>>
>>>>> +
>>>>> +   ret =3D lenovo_legion_evaluate_method(wdev, instance, method_id,=
 &input,
>>>>> +                                       &output);
>>>>> +
>>>>> +   if (ret) {
>>>>> +           pr_err("lenovo_legion_wmi: Attempt to get method_id %u v=
alue failed with error: %u\n",
>>>>> +                  method_id, ret);
>>>>> +           return ret;
>>>>> +   }
>>>>> +
>>>>> +   if (retval) {
>>>>> +           ret_obj =3D (union acpi_object *)output.pointer;
>>>>> +           if (ret_obj && ret_obj->type =3D=3D ACPI_TYPE_INTEGER)
>>>>> +                   temp_val =3D (u32)ret_obj->integer.value;
>>>> This is a pretty bad failure if it's not the case, no?  Should you se=
t a
>>>> return value here instead perhaps?
>>>>
>>>>> +
>>>>> +           *retval =3D temp_val
>>>> If that above error I mentioned happens then you'll be assigning garb=
age
>>>> data out.
>>>>
>>>> ;
>>> True, good catch. Someone built with clang+lto and it warned about thi=
s section
>>> as well as temp val is not initialized. Will fix both.
>>>
>>>>> +   }
>>>>> +
>>>>> +   kfree(ret_obj);
>>>>> +
>>>>> +   return 0;
>>>>> +}
>>>>> +
>>>>> +int lenovo_legion_evaluate_method_1(struct wmi_device *wdev, u8 ins=
tance,
>>>>> +                               u32 method_id, u32 arg0, u32 *retval=
);
>>>>> +
>>>>> +int lenovo_legion_evaluate_method_1(struct wmi_device *wdev, u8 ins=
tance,
>>>>> +                               u32 method_id, u32 arg0, u32 *retval=
)
>>>>> +{
>>>>> +   return lenovo_legion_evaluate_method_2(wdev, instance, method_id=
, arg0,
>>>>> +                                          0, retval);
>>>>> +}
>>>>> +
>>>>> +int capdata_01_wmi_get(struct om_attribute_id attr_id,
>>>>> +                  struct capability_data_01 *cap_data);
>>>>> +
>>>>> +int gamezone_wmi_platform_profile_set(struct platform_profile_handl=
er *pprof,
>>>>> +                                 enum platform_profile_option sel_p=
rof);
>>>>> +
>>>>> +int gamezone_wmi_fan_profile_get(struct platform_profile_handler *p=
prof,
>>>>> +                            int *sel_prof);
>>>>> +
>>>>> +/* current_value */
>>>>> +ssize_t attr_current_value_store(struct kobject *kobj,
>>>>> +                            struct kobj_attribute *attr, const char=
 *buf,
>>>>> +                            size_t count, u32 *store_value, u8 devi=
ce_id,
>>>>> +                            u8 feature_id);
>>>>> +
>>>>> +ssize_t attr_current_value_show(struct kobject *kobj,
>>>>> +                           struct kobj_attribute *attr, char *buf,
>>>>> +                           u8 device_id, u8 feature_id);
>>>>> +
>>>>> +/* LENOVO_CAPABILITY_DATA_01 */
>>>>> +ssize_t attr_capdata_01_show(struct kobject *kobj, struct kobj_attr=
ibute *attr,
>>>>> +                        char *buf, u8 device_id, u8 feature_id,
>>>>> +                        enum attribute_property prop);
>>>>> +
>>>>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *=
attr,
>>>>> +                 char *buf);
>>>>> +
>>>>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *=
attr,
>>>>> +                 char *buf)
>>>>> +{
>>>>> +   return sysfs_emit(buf, "integer\n");
>>>>> +}
>>>>> +
>>>>> +#define __LL_ATTR_RO(_func, _name)                                 =
   \
>>>>> +   {                                                             \
>>>>> +           .attr =3D { .name =3D __stringify(_name), .mode =3D 0444=
 }, \
>>>>> +           .show =3D _func##_##_name##_show,                       =
\
>>>>> +   }
>>>>> +
>>>>> +#define __LL_ATTR_RO_AS(_name, _show)                              =
   \
>>>>> +   {                                                             \
>>>>> +           .attr =3D { .name =3D __stringify(_name), .mode =3D 0444=
 }, \
>>>>> +           .show =3D _show,                                        =
\
>>>>> +   }
>>>>> +
>>>>> +#define __LL_ATTR_RW(_func, _name) \
>>>>> +   __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_st=
ore)
>>>>> +
>>>>> +/* Shows a formatted static variable */
>>>>> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)              =
           \
>>>>> +   static ssize_t _attrname##_##_prop##_show(                      =
      \
>>>>> +           struct kobject *kobj, struct kobj_attribute *attr, char =
*buf) \
>>>>> +   {                                                               =
      \
>>>>> +           return sysfs_emit(buf, _fmt, _val);                     =
      \
>>>>> +   }                                                               =
      \
>>>>> +   static struct kobj_attribute attr_##_attrname##_##_prop =3D     =
        \
>>>>> +           __LL_ATTR_RO(_attrname, _prop)
>>>>> +
>>>>> +/* Attribute current_value show/store */
>>>>> +#define __LL_TUNABLE_RW_CAP01(_attrname, _dev_id, _feat_id)        =
           \
>>>>> +   static ssize_t _attrname##_current_value_store(                 =
      \
>>>>> +           struct kobject *kobj, struct kobj_attribute *attr,      =
      \
>>>>> +           const char *buf, size_t count)                          =
      \
>>>>> +   {                                                               =
      \
>>>>> +           return attr_current_value_store(                        =
      \
>>>>> +                   kobj, attr, buf, count,                         =
      \
>>>>> +                   &om_wmi.ll_tunables->_attrname, _dev_id, _feat_i=
d);   \
>>>>> +   }                                                               =
      \
>>>>> +   static ssize_t _attrname##_current_value_show(                  =
      \
>>>>> +           struct kobject *kobj, struct kobj_attribute *attr, char =
*buf) \
>>>>> +   {                                                               =
      \
>>>>> +           return attr_current_value_show(kobj, attr, buf, _dev_id,=
      \
>>>>> +                                          _feat_id);               =
      \
>>>>> +   }                                                               =
      \
>>>>> +   static struct kobj_attribute attr_##_attrname##_current_value =
=3D       \
>>>>> +           __LL_ATTR_RW(_attrname, current_value)
>>>>> +
>>>>> +/* Attribute property show only */
>>>>> +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _dev_id, _feat_id, =
_prop_type) \
>>>>> +   static ssize_t _attrname##_##_prop##_show(                      =
       \
>>>>> +           struct kobject *kobj, struct kobj_attribute *attr, char =
*buf)  \
>>>>> +   {                                                               =
       \
>>>>> +           return attr_capdata_01_show(kobj, attr, buf, _dev_id,   =
       \
>>>>> +                                       _feat_id, _prop_type);      =
       \
>>>>> +   }                                                               =
       \
>>>>> +   static struct kobj_attribute attr_##_attrname##_##_prop =3D     =
         \
>>>>> +           __LL_ATTR_RO(_attrname, _prop)
>>>>> +
>>>>> +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dev_id, _f=
eat_id,    \
>>>>> +                               _dispname)                          =
      \
>>>>> +   __LL_TUNABLE_RW_CAP01(_attrname, _dev_id, _feat_id);            =
      \
>>>>> +   __LL_TUNABLE_RO_CAP01(default_value, _attrname, _dev_id, _feat_i=
d,    \
>>>>> +                         DEFAULT_VAL);                             =
      \
>>>>> +   __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    =
      \
>>>>> +   __LL_TUNABLE_RO_CAP01(max_value, _attrname, _dev_id, _feat_id,  =
      \
>>>>> +                         MAX_VAL);                                 =
      \
>>>>> +   __LL_TUNABLE_RO_CAP01(min_value, _attrname, _dev_id, _feat_id,  =
      \
>>>>> +                         MIN_VAL);                                 =
      \
>>>>> +   __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, _dev_id, _fea=
t_id, \
>>>>> +                         STEP_VAL);                                =
      \
>>>>> +   static struct kobj_attribute attr_##_attrname##_type =3D        =
        \
>>>>> +           __LL_ATTR_RO_AS(type, int_type_show);                   =
      \
>>>>> +   static struct attribute *_attrname##_attrs[] =3D {              =
        \
>>>>> +           &attr_##_attrname##_current_value.attr,                 =
      \
>>>>> +           &attr_##_attrname##_default_value.attr,                 =
      \
>>>>> +           &attr_##_attrname##_display_name.attr,                  =
      \
>>>>> +           &attr_##_attrname##_max_value.attr,                     =
      \
>>>>> +           &attr_##_attrname##_min_value.attr,                     =
      \
>>>>> +           &attr_##_attrname##_scalar_increment.attr,              =
      \
>>>>> +           &attr_##_attrname##_type.attr,                          =
      \
>>>>> +           NULL,                                                   =
      \
>>>>> +   };                                                              =
      \
>>>>> +   static const struct attribute_group _attrname##_attr_group =3D {=
        \
>>>>> +           .name =3D _fsname, .attrs =3D _attrname##_attrs         =
          \
>>>>> +   }
>>>>> +
>>>>> +#endif /* !_LENOVO_LEGION_WMI_H_ */
