Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D37206964
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 16:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429075; cv=none; b=JRqjZpJbbNVie9pUtT9oeC+D8cu/Umfwotdk1fcIPUkIufeGaRfq0xiBDCK+BSkYRVKBpi1UQjGNPs8iq/IfULGLBmTb4xYYKyscgVJSVsyddKBzsNNnly0Q/qKKKxx8Hum76yIuJC3IJtdW6wOMs0of3GorF/DVfJWXAe/TMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429075; c=relaxed/simple;
	bh=h9iVTNJlelKy0flUDMrS1Sp3bSDNWNRQ3B4nGnWYqZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lCLFjOx1RdI2lh2M0DEV1AG4J/xJ3TTCprnHEchdCkOYs3LYejwpF4EPGECSNLVB1uNC5kdmvBQyBeHVKXPj8fSIwtBufH74Dkpwv8Ty20PGnrWcyx9aVvURADs3okHWQh7EZZuh/CtzhMBrhKIHy0BvYsXLZo6XEHPov1jynoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=iRADIIBi; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="iRADIIBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731429069; x=1732033869; i=w_armin@gmx.de;
	bh=Il+OzBTWkxtb3PsJDBXWL/wKveFvCLRVvJ222RqovQA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iRADIIBi2vALMhaELbx5D8E2/YtFalgW8i+VncuXwA7x7NJN9aVSmc9o4L9E617U
	 7d2DLkvqykxSA3eyvWk9lXq8ZOFjPAz/fvbeH7LlWAUHTsOvy18PdnyP6kw3an4jr
	 k5Jj0yyuPY3g7ZB7k14CLfbKGnp7c2DxjrnNzY2H62TYJkny9NJmqmUcS7SypAtC+
	 KVo+ohQ4UUgIduYrxDOgSXv4VJFKwzWtRXjmrjSYSc57RXbW5FML51/wVk14Ovmg3
	 /o3+PjxlvLlS6NidwBeTKBGNBXmJ7tPutOrWxn1oSwEsnO5Hr6Lm1GDrHGuJNTUjD
	 EiQqbGwfzph3IOCCow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9T7-1t1rO01eld-004WTN; Tue, 12
 Nov 2024 17:31:09 +0100
Message-ID: <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
Date: Tue, 12 Nov 2024 17:31:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
 <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
 <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aCC6kbjD5CZ9PpCfLxs8+3dP9frbTIuJ+T1oz1pV9yqmvwFhnZw
 ByMnrQumXK5PBM5MkPxC2FLLDbC/DQUENxjS3KBzbaexbWA89LJndhISAchqgVmDRk1e+8f
 KovrPpzKcgFehVsz+w3vWol1ke093DiZy7Gv3gTfaunK3irJPIKoi2F9pBFI8coeoV4NxWV
 x5W0927VK1NWatr8eBSqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:thReX2fzN1U=;nz13/UCAFxK6B6ornXeO8lM3M23
 M8YaF/7FzkZlDA++vzpbFg5Unx3YbaFC7eZwnBtkRnEYUkn7ewoJcjW4ZtAc8wq8Tx63Ax3V3
 t1PkcaWzw9BwHXSZz0DNfdTPw99l5A1dzuGKNL65H9hSdI2SQKAR0QgDKdYyUPZhujDxjBfwS
 EZrsBYXwXKpBwFoscfDRL0PtpW9D9aQnqujN+jOFhQbsFHqwQVQUJ1NTDNcsCsBX6WkSSFgXd
 gJ0rWB8qNM6OylKlxgDK7T6F6CIyrkFpzUbRwKJAKNq+0UDSVGxQbYqI5CA+KFvDNok5jWNsS
 xOCXkJttMTP2bQ2JdxqPmE5sVlemYdN7f6ubfgx6x2Ma5OXToGIo4mztmEy7+YPClLJ6K4Y3R
 yN/xezduGxaFgzKhcjwp/j+QgguxYfmUS14AHk88BOLlyv8+Q3MMFadVjRAChvMQ0WdW/sTUC
 xfgZ4wrUnBqGosmvIF5/0rvRokcDmv5Gw4OT3VuljT3XZA6n1mSXQsLYVgGurMtRAU6KPm/tF
 aYSNAuuHwDJ8KPXrj1dB+iFbTUsP3M49gOvICAdGO9C4kQU4DeWrD6iQ6ANCnWBg3PZ++dfH6
 f07qiLJc3BCVNt2YYQWHthS5nd1yMCuWNntwHY4DieAEbDs8PoQ58DaAwTSinJqoWrfLYz7b6
 jR1bPpvG9VeosGXEpmHh63o3BoFcQ5g5wZ+6HX683GwCNJb50ExS5yAkNt8J2NHHPLZedzd+a
 j/zVhUQ8rl5kNyX9QFwRodE8lXEPfC3dhkIFnaEzZ/ryDirEbFLlkSkIAZRcccEiKc4mHfAIm
 SbuXJxMDUD4RbVob7a9BPkFQ==

Am 12.11.24 um 16:10 schrieb Werner Sembach:

>
> Am 12.11.24 um 13:51 schrieb Armin Wolf:
>> Am 12.11.24 um 13:42 schrieb Werner Sembach:
>>
>>> Hi,
>>>
>>> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>>>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>>>
>>>>> Hi,
>>>>>
>>>>> quick learning question: Why is wmi_bus_type not exported unlike, fo=
r
>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>
>>>>> Wanted to use bus_find_device_by_name in an acpi driver that might
>>>>> need additional infos from a wmi interface that might or might not b=
e
>>>>> present.
>>>>>
>>>>> Kind regards,
>>>>>
>>>>> Werner Sembach
>>>>>
>>>>>
>>>> What kind of information do you have in mind? wmi_bus_type is not
>>>> being exported for historic reasons, i can change that if necessary.
>>>
>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 which has
>>> a slow wmi and a quick acpi interface, however the quick acpi
>>> interface can not get the max rpm of the cooling fans, but the wmi
>>> interface can.
>>>
>>> Thing is for the acpi driver we might plan an earlier upstream date
>>> and it might get multi-odm support, while the wmi interface is and
>>> stays odm specific. So my idea was to only couple both drivers in a
>>> dynamic way using bus_find_device_by_name.
>>>
>> Interesting, how is the ACPI interface not ODM specific? Can you
>> elaborate a bit on how the ACPI and the WMI interfaces work?
>
> We have an ODM that was willing to include ACPI code by us in their
> BIOS blob and we hope that in the future we can carry that API over to
> other ODMs for future TUXEDO devices.
>
> In pseudocode that API looks like this:
>
> v1:
>
> void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka
> via the commands below) controlled fans
> bool GMOD(): Get current SMOD setting
> int GCNT(): Get number of fans
> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
> void SSPD(int index, int value): Set fan speed target as a fraction of
> max speed
> int GSPD(int index): Get current fan speed target as a fraction of max
> speed
>
> v2 same as v1 but with added:
>
> int GRPM(int index): Get current actual fan speed in revolutions per
> minute
> int GTMP(int index): Get temperature of thing fan with respective
> index is pointed at (CPU or GPU die, see GTYP)
>
> Like I said, what is missing is a "Get Max RPM" function even in v2,
> which we might add a future iteration, but, well this bios is now out
> in the wild. However these released devices have a "get info" function
> in the wmi code which returns the v2 infos and the max rpm.
>
> I want to write the code in a way that it probes the acpi interface
> for function existence and wherever something is missing tries to fall
> back to infos gathered from the wmi interface, but that one is
> implemented in a stand alone module (the tuxedo_nb04_* stuff in
> tuxedo-drivers) and I would like to keep it that way in honor of KISS.
>
> My plan is that the first time max rpm is pulled the acpi driver uses
> bus_find_device_* to get the wmi device, if present, and pulls max rpm
> from the driver data there and copies it over to it's own driver data.
> If not possible it returns a dummy value or falls back to another
> method. Maybe a hard coded list of max rpm values, currently only 2
> devices have the new interface, so it wouldn't be a long list.
> Directly going to the hard coded list is our current fallback plan,
> but it is not an elegant solution as the info is actually there, if
> you know what i mean?
>
> Kind regards,
>
> Werner
>
I see, we once had a similar case with the dell-wmi driver, see commit f97=
e058cfe80 ("platform/x86: wmi: Don't allow drivers to get each other's GUI=
Ds"):

	The only driver using this was dell-wmi, and it really was a hack.
     	The driver was getting a data attribute from another driver and this
     	type of action should not be encouraged.

     	Rather drivers that need to interact with one another should pass
     	data back and forth via exported functions.

I would be quite unhappy with drivers interacting with WMI devices without=
 a proper WMI driver, but i can see your point here.

Maybe we can keep the retrieval of the fanX_max values out of the kernel? =
I propose the following:

- have a driver for your generic ACPI interface
- have a driver for the WMI interface (with fanX_max hwmon attributes)

The driver for the generic ACPI interface exposes the fan speed controls a=
s pwmX attributes if the interface does not support
the "Get Max RPM" function. The userspace application in this case searche=
s for the hwmon chip exposed by the WMI driver and
reads the fanX_max attributes there. Then the application can convert the =
target fan speed into values for the pwmX attributes
itself.
If the ACPI interface however supports the "Get Max RPM" function, then it=
 exposes fanX_max and fanX_target hwmon attributes
themself and the userspace application uses them directly.

This would keep the kernel drivers simple.

I suppose you provide some sort of OEM application for fan control? In thi=
s case having the fanX_max handling here also gives
you full control and allows you to stay independent from the kernel develo=
pment in that regard. For example you might decide
independently to hardcode the max. RPM values on some machines (like the t=
wo new machines) or use a different hwmon chip on
some other machine.

Aside from that, i really like your approach with having a generic ACPI in=
terface, it can potentially save you a lot of work
once you have the initial driver.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>> Kind regards,
>>>
>>> Werner
>>>
>>>
