Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DD315AAC1
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535501; cv=none; b=EJs7+kNR6STk0nClAHgrhd22UgHkNy+X2kY/lrnB2c7mlSLA9Mb2yWt9hLT//m/hxwB62zeEyQUKqIM4magjq52iLEvBAxSuwRdoQ8sRarEexUFZ4zNj6x/kPjsH1O2yxdvzN7cD9zWNVyZhpW75B6HZrmFSa//6QGycmqavNoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535501; c=relaxed/simple;
	bh=FULSjakjzQU6pXSjI9gSb1MP/aS5CrIAL86y4IMvzAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpGPhpzezUZeGcyxyMzQXgTQvkes/AAgRWK/7bRgJKuN5b1vxbEMcvhkDjAYrDlLvJwmmipq39xAAsGSLJDxwhKFRFalqZ66tv+1Uvha4JQRE3htBvhHyVbQC0/dakfvcuytqAaJDUABAvJO0yaJXQ0DlP+sODP+MWD59gHNbVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bR7Z8JEL; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bR7Z8JEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731535493; x=1732140293; i=w_armin@gmx.de;
	bh=aNE+1MT+vJAx+Pth078JVzgrz+s2SavEMEaS2qQ2sXw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bR7Z8JELGXTXpYcKB9lwurU791IRK9S9jutPqxVUvY45wRHbuQYgn994iwI+TATZ
	 PbUrL5uB1SWXLMD6/v9wcc4ewsd0yuVyMXVOkfMUJVsHvy8uSSDN7Uz1v4ODXtPLm
	 bBMsBRimMjLyi/7pI6j0NGYsBprFMOTQPBUcbilMZFSOcJLKVmqJRpPSTslMtDw16
	 lQPbTjDqWgAgpLCxEtSVdNeakSPg10D8u2Yd2ANV3MRsmnHBi6PlDqyaOAHtgEXjA
	 R7U5BjEAEVDoa9koT5xJ7yIB+oujPPqaYXgAAfSGM39/d2HpO9vyF6DULjQgvShDh
	 nwhIfjbkuqRYfuj2iA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1toJIA01jD-014jxq; Wed, 13
 Nov 2024 23:04:53 +0100
Message-ID: <84f89dd6-65b6-40fb-8e67-9daa4ed98e38@gmx.de>
Date: Wed, 13 Nov 2024 23:04:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Hans de Goede <hdegoede@redhat.com>,
 Werner Sembach <wse@tuxedocomputers.com>, platform-driver-x86@vger.kernel.org
Cc: Christoffer Sandberg <cs@tuxedo.de>
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
 <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
 <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
 <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
 <39c094d1-ddd5-4b3c-b6f1-9ea92d8d5e2e@redhat.com>
 <6ae74151-c7b9-4754-bc3c-7a6d5fe5d628@tuxedocomputers.com>
 <3cdfaf44-c546-4034-91e8-a5e62ca6c7ca@redhat.com>
 <69172d66-1f6b-4650-92da-7ebd23649759@tuxedocomputers.com>
 <14a67d7a-3d4e-4a90-93c6-6a30d89434e3@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <14a67d7a-3d4e-4a90-93c6-6a30d89434e3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A1vifJNlwRdlobQQgnDN9EFH2/a4OKhtMxkOD+IfaUyYnViBrQs
 IZ3kfwMByJ6sOwkj/LM//EXntQpO53hrApqneWyLVKCVZ4/AieA9cGnGfQJqynYJIcQcn+O
 cHoZWz7sjq4VpMDCQWVbspIoA4/UjCatAcejAsNcGGWPR8abKAawqFI76h73G9op4x/vz/R
 iZtFJWQEhlT3k1akKCgpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jPM103Ts8kM=;2Es7LvPH/w8Qw3kVjGFtWgC0sqO
 gbjlKSyvC46tmf0YsBn9BawphTQZjqgx261jQMM8aGWhs913PjCqOQlsFcc4vfTzMfnTCyV5i
 d1ET2UvbbIrRt57xxE6yUrwO6lX/EuPbyY/VljHrFUD4VX4ZkhUj4NivQw3w7sIw1miWShlNt
 v/p7qlR89gQUNkZIVmTp3ghNXoKZ1mR5+sLebnlGbzyWqOBPW4gZi6vwUVk2gTu7YVmp1aeft
 9ppLrSJ+N9JVdheqFwSe2vC+L1I3vBOSOTQ9+Ss0uzz2+IdfA53Y9Xwld1J+ethRrfNz7r23+
 xt/1UDgqLys66oSPfKbRsJFtSgFdlrjQA7brvxWefQrNCxvpuMuVlOxmBuufZngEyEppXtiai
 MxmaEcUBjstgObQk+toEuyMS/ckfMRwywAnbH7NNjceK7q41UFfgIG9sdrVDRrdAmxfZWptIb
 iF8CA/+mNblwjBVYZOszO6Qi5Gmqd/I9srQTVrpXzBAY8p4yut2WT1n85uBRGiQKWpXi7PW3D
 qV0hlxPrdJOlBZVLH2gdSyE9WuIrYnDXM0IMWpwegGcvcJsJosFxOUSeQbB5ZLPopXKSTRJUZ
 oFuO9vaGscRo6wEMxC1dlxasD/1OIGJ/vL7cpk4SOZTRqbUZ9H0lulvGJDRcWDEgejyZoV/X5
 +JUm05vEHRunU2QZCPAczbYVpXtl/lz4Ig45q79DCoVPi8JNvBLI9q4pKUFcG5R/7+txfD0lO
 lf7ad6TIk7eNQPjLkINdctohDJm4UBynJeewJJ3EuaVwC7gtdfoUEzkMMO8bmdgnrDxwaQdXB
 cJCKlblpPS0x2ZceeywDElmZAVWWYpgX1xktwvSRURseadmMD3z66+zptdssVpSLQhKjL1QlV
 0an3MeP+CW1oLDpBAR01zw5nK1kO1HnXRWFLcQ+lkz19tcQmaE3rdXgOs

Am 13.11.24 um 13:12 schrieb Hans de Goede:

> Hi,
>
> On 13-Nov-24 12:47 PM, Werner Sembach wrote:
>> Am 13.11.24 um 12:19 schrieb Hans de Goede:
>>> Hi,
>>>
>>> On 13-Nov-24 12:11 PM, Werner Sembach wrote:
>>>> Am 13.11.24 um 12:05 schrieb Hans de Goede:
>>>>> Hi All,
>>>>>
>>>>> On 12-Nov-24 5:31 PM, Armin Wolf wrote:
>>>>>> Am 12.11.24 um 16:10 schrieb Werner Sembach:
>>>>>>
>>>>>>> Am 12.11.24 um 13:51 schrieb Armin Wolf:
>>>>>>>> Am 12.11.24 um 13:42 schrieb Werner Sembach:
>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>>>>>>>>>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>>>>>>>>>
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> quick learning question: Why is wmi_bus_type not exported unli=
ke, for
>>>>>>>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>>>>>>>
>>>>>>>>>>> Wanted to use bus_find_device_by_name in an acpi driver that m=
ight
>>>>>>>>>>> need additional infos from a wmi interface that might or might=
 not be
>>>>>>>>>>> present.
>>>>>>>>>>>
>>>>>>>>>>> Kind regards,
>>>>>>>>>>>
>>>>>>>>>>> Werner Sembach
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>> What kind of information do you have in mind? wmi_bus_type is n=
ot
>>>>>>>>>> being exported for historic reasons, i can change that if neces=
sary.
>>>>>>>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 whi=
ch has
>>>>>>>>> a slow wmi and a quick acpi interface, however the quick acpi
>>>>>>>>> interface can not get the max rpm of the cooling fans, but the w=
mi
>>>>>>>>> interface can.
>>>>>>>>>
>>>>>>>>> Thing is for the acpi driver we might plan an earlier upstream d=
ate
>>>>>>>>> and it might get multi-odm support, while the wmi interface is a=
nd
>>>>>>>>> stays odm specific. So my idea was to only couple both drivers i=
n a
>>>>>>>>> dynamic way using bus_find_device_by_name.
>>>>>>>>>
>>>>>>>> Interesting, how is the ACPI interface not ODM specific? Can you
>>>>>>>> elaborate a bit on how the ACPI and the WMI interfaces work?
>>>>>>> We have an ODM that was willing to include ACPI code by us in thei=
r
>>>>>>> BIOS blob and we hope that in the future we can carry that API ove=
r to
>>>>>>> other ODMs for future TUXEDO devices.
>>>>>>>
>>>>>>> In pseudocode that API looks like this:
>>>>>>>
>>>>>>> v1:
>>>>>>>
>>>>>>> void SMOD(bool mode): Toggle firmware controlled fans vs manually =
(aka
>>>>>>> via the commands below) controlled fans
>>>>>>> bool GMOD(): Get current SMOD setting
>>>>>>> int GCNT(): Get number of fans
>>>>>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>>>>>> void SSPD(int index, int value): Set fan speed target as a fractio=
n of
>>>>>>> max speed
>>>>>>> int GSPD(int index): Get current fan speed target as a fraction of=
 max
>>>>>>> speed
>>>>>>>
>>>>>>> v2 same as v1 but with added:
>>>>>>>
>>>>>>> int GRPM(int index): Get current actual fan speed in revolutions p=
er
>>>>>>> minute
>>>>>>> int GTMP(int index): Get temperature of thing fan with respective
>>>>>>> index is pointed at (CPU or GPU die, see GTYP)
>>>>>>>
>>>>>>> Like I said, what is missing is a "Get Max RPM" function even in v=
2,
>>>>>>> which we might add a future iteration, but, well this bios is now =
out
>>>>>>> in the wild. However these released devices have a "get info" func=
tion
>>>>>>> in the wmi code which returns the v2 infos and the max rpm.
>>>>>>>
>>>>>>> I want to write the code in a way that it probes the acpi interfac=
e
>>>>>>> for function existence and wherever something is missing tries to =
fall
>>>>>>> back to infos gathered from the wmi interface, but that one is
>>>>>>> implemented in a stand alone module (the tuxedo_nb04_* stuff in
>>>>>>> tuxedo-drivers) and I would like to keep it that way in honor of K=
ISS.
>>>>>>>
>>>>>>> My plan is that the first time max rpm is pulled the acpi driver u=
ses
>>>>>>> bus_find_device_* to get the wmi device, if present, and pulls max=
 rpm
>>>>>>> from the driver data there and copies it over to it's own driver d=
ata.
>>>>>>> If not possible it returns a dummy value or falls back to another
>>>>>>> method. Maybe a hard coded list of max rpm values, currently only =
2
>>>>>>> devices have the new interface, so it wouldn't be a long list.
>>>>>>> Directly going to the hard coded list is our current fallback plan=
,
>>>>>>> but it is not an elegant solution as the info is actually there, i=
f
>>>>>>> you know what i mean?
>>>>>>>
>>>>>>> Kind regards,
>>>>>>>
>>>>>>> Werner
>>>>>>>
>>>>>> I see, we once had a similar case with the dell-wmi driver, see com=
mit f97e058cfe80 ("platform/x86: wmi: Don't allow drivers to get each othe=
r's GUIDs"):
>>>>>>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0The only driver using this was=
 dell-wmi, and it really was a hack.
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The driver =
was getting a data attribute from another driver and this
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type of act=
ion should not be encouraged.
>>>>>>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Rather driv=
ers that need to interact with one another should pass
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data back a=
nd forth via exported functions.
>>>>>>
>>>>>> I would be quite unhappy with drivers interacting with WMI devices =
without a proper WMI driver, but i can see your point here.
>>>>> Agreed on that 1 driver should not be poking the [wmi_]dev of anothe=
r
>>>>> driver. This usually works until it doesn't for some reason so it
>>>>> should just be avoided.
>>>>>
>>>>>> Maybe we can keep the retrieval of the fanX_max values out of the k=
ernel? I propose the following:
>>>>>>
>>>>>> - have a driver for your generic ACPI interface
>>>>>> - have a driver for the WMI interface (with fanX_max hwmon attribut=
es)
>>>>>>
>>>>>> The driver for the generic ACPI interface exposes the fan speed con=
trols as pwmX attributes if the interface does not support
>>>>>> the "Get Max RPM" function. The userspace application in this case =
searches for the hwmon chip exposed by the WMI driver and
>>>>>> reads the fanX_max attributes there. Then the application can conve=
rt the target fan speed into values for the pwmX attributes
>>>>>> itself.
>>>>>> If the ACPI interface however supports the "Get Max RPM" function, =
then it exposes fanX_max and fanX_target hwmon attributes
>>>>>> themself and the userspace application uses them directly.
>>>>>>
>>>>>> This would keep the kernel drivers simple.
>>>>> That would indeed keep the kernel drivers simple, but at the cost of
>>>>> providing a non standard hwmon interface.
>>>>>
>>>>> Whatever implementation is written it really MUST follow the standar=
d
>>>>> hwmon API so that any hwmon tools like the lm_sensors fancontrol scr=
ipt
>>>>> will work properly.
>>>>>
>>>>> So NACK from me for exposing fanX_max on a separate hwmon device.

I think there is a misunderstanding here: the hwmon device exported by the=
 WMI interface
will also contain temperature and fan speed sensors (provided by the WMI i=
nterface), so
this would be a standard hwmon device.

The only difference between this hwmon device and the hwmon device exposed=
 by the ACPI interface
would be that:

- the hwmon interface exposed by the ACPI interface also allows for manual=
 fan control
- the hwmon interface exposed by the ACPI interface does not support the f=
anx_max attribute

So i think there should be no problem with having two hwmon devices on som=
e models, since both are
usable independently from each other.

Thanks,
Armin Wolf

>>>>>
>>>>> What I think works best in cases like this is to have the wmi-driver
>>>>> expose a function to retrieve the fan max value.
>>>>>
>>>>> This function can use a static global array of fan max values +
>>>>> a global fan_max_values_initialized bool and it can return -EPROBE_D=
EFER
>>>>> when the bool is not set yet.
>>>>>
>>>>> This will also require the ACPI driver to have a Kconfig "depends on=
"
>>>>> the WMI driver but that should be fine.
>>>>>
>>>>> And then the ACPI driver can simply call the exported helper functio=
n
>>>>> to get the max fan values.
>>>>>
>>>>> This sort of cross driver function calling is not ideal, but it is
>>>>> better then poking at a struct device owned by another driver.
>>>> Problem is that when we really bring over the ACPI interface to other
>>>> ODMs the WMI driver will no longer be there, that's why I wanted to
>>>> avoid a static dependency on the=C2=A0WMI module to be able to reuse
>>>> the code.
>>> I see. But won't we still need the WMI module for older models then ?
>> But it wouldn't need to be loaded, with the dependency it will always n=
eed to be loaded.
> Presumably it will be auto-loaded based on the WMI GUID, so even if
> it has special code in probe() to exit the probe() with -ENODEV on
> systems where it is not necessary due to the ACPI interface being
> there, it will still get loaded.
>
> To avoid auto-loading the WMI interface would need to be removed
> from the ACPI tablets.
>
> And probe() could still store the max fan speeds in a global +
> set the boolean to indicate the max fan speeds are set before
> exiting with -ENODEV in that case.
>
> So I think you could still go this route, but simply hardcoding
> for the 2 models this is necessary for seems more KISS, so IMHO
> that is probably the way to go for now.
>
> Regards,
>
> Hans
>
