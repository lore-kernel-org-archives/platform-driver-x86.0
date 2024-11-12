Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21FA206951
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429843; cv=none; b=c0PNOYJOqTsEAqwnO4TYSDgAc3TmjGT8F4HronzTFT0VynLWRlvl+DLfl5IBcr74A3S5/jTv0Aj4WhJwA5SI8ebyp0Qn6w3QJGkIhS25zrCrd0yPu0ECxEY9h3Y/00xgXHpe+OKmFFwlC7rB0R5becMlRp0A9RgMxTO7LsMkDTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429843; c=relaxed/simple;
	bh=1gia6nK8eqGhMiydW2ka/J9gv6zg/z4fTn4RMqZ+16U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=oK1sP3FxGUyEXCFtgo/0HutlF0ypo4NT+ilzY+EOWo5aMbNDAoBmHdsRHiKOcOPorn4+itqvji6VyfOQd//d1+ge1nUpix+QLYACPZEN4ja3ltHjS8A5cyBR7mmbG3WflNhzBWZHaATxr778g/ilmk86mj4LMGpr/IHT18B+OSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=q2fwY0As; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="q2fwY0As"
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 7D1322FC0050;
	Tue, 12 Nov 2024 17:43:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1731429836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiEZ5CmcIpKxX6QgYf6xyKnErxpwOEXpqaV4Ko8aeRo=;
	b=q2fwY0AsZuL34PD8PayduJpxGqFPP9tXoenESmr+Tmt7rLUNbjdY5LKaBzxLCjMlB+YFSe
	yHzHoyLATxd5om7R01ddFC7luVDrHJ1pAKL3gwV8y/o5uOLCG0UrHn/9L2H7/b1Jsbvmj6
	H/g9XhC/LOBCiYfwQLNNL4QnjKwmMbk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <663b2c15-d03e-4ff3-b0f3-54ae8403c133@tuxedocomputers.com>
Date: Tue, 12 Nov 2024 17:43:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
 <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
 <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
 <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
Content-Language: en-US
Cc: Christoffer Sandberg <cs@tuxedo.de>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.11.24 um 17:31 schrieb Armin Wolf:
> Am 12.11.24 um 16:10 schrieb Werner Sembach:
>
>>
>> Am 12.11.24 um 13:51 schrieb Armin Wolf:
>>> Am 12.11.24 um 13:42 schrieb Werner Sembach:
>>>
>>>> Hi,
>>>>
>>>> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>>>>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> quick learning question: Why is wmi_bus_type not exported unlike, for
>>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>>
>>>>>> Wanted to use bus_find_device_by_name in an acpi driver that might
>>>>>> need additional infos from a wmi interface that might or might not be
>>>>>> present.
>>>>>>
>>>>>> Kind regards,
>>>>>>
>>>>>> Werner Sembach
>>>>>>
>>>>>>
>>>>> What kind of information do you have in mind? wmi_bus_type is not
>>>>> being exported for historic reasons, i can change that if necessary.
>>>>
>>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 which has
>>>> a slow wmi and a quick acpi interface, however the quick acpi
>>>> interface can not get the max rpm of the cooling fans, but the wmi
>>>> interface can.
>>>>
>>>> Thing is for the acpi driver we might plan an earlier upstream date
>>>> and it might get multi-odm support, while the wmi interface is and
>>>> stays odm specific. So my idea was to only couple both drivers in a
>>>> dynamic way using bus_find_device_by_name.
>>>>
>>> Interesting, how is the ACPI interface not ODM specific? Can you
>>> elaborate a bit on how the ACPI and the WMI interfaces work?
>>
>> We have an ODM that was willing to include ACPI code by us in their
>> BIOS blob and we hope that in the future we can carry that API over to
>> other ODMs for future TUXEDO devices.
>>
>> In pseudocode that API looks like this:
>>
>> v1:
>>
>> void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka
>> via the commands below) controlled fans
>> bool GMOD(): Get current SMOD setting
>> int GCNT(): Get number of fans
>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>> void SSPD(int index, int value): Set fan speed target as a fraction of
>> max speed
>> int GSPD(int index): Get current fan speed target as a fraction of max
>> speed
>>
>> v2 same as v1 but with added:
>>
>> int GRPM(int index): Get current actual fan speed in revolutions per
>> minute
>> int GTMP(int index): Get temperature of thing fan with respective
>> index is pointed at (CPU or GPU die, see GTYP)
>>
>> Like I said, what is missing is a "Get Max RPM" function even in v2,
>> which we might add a future iteration, but, well this bios is now out
>> in the wild. However these released devices have a "get info" function
>> in the wmi code which returns the v2 infos and the max rpm.
>>
>> I want to write the code in a way that it probes the acpi interface
>> for function existence and wherever something is missing tries to fall
>> back to infos gathered from the wmi interface, but that one is
>> implemented in a stand alone module (the tuxedo_nb04_* stuff in
>> tuxedo-drivers) and I would like to keep it that way in honor of KISS.
>>
>> My plan is that the first time max rpm is pulled the acpi driver uses
>> bus_find_device_* to get the wmi device, if present, and pulls max rpm
>> from the driver data there and copies it over to it's own driver data.
>> If not possible it returns a dummy value or falls back to another
>> method. Maybe a hard coded list of max rpm values, currently only 2
>> devices have the new interface, so it wouldn't be a long list.
>> Directly going to the hard coded list is our current fallback plan,
>> but it is not an elegant solution as the info is actually there, if
>> you know what i mean?
>>
>> Kind regards,
>>
>> Werner
>>
> I see, we once had a similar case with the dell-wmi driver, see commit 
> f97e058cfe80 ("platform/x86: wmi: Don't allow drivers to get each other's 
> GUIDs"):
>
>     The only driver using this was dell-wmi, and it really was a hack.
>         The driver was getting a data attribute from another driver and this
>         type of action should not be encouraged.
>
>         Rather drivers that need to interact with one another should pass
>         data back and forth via exported functions.
>
> I would be quite unhappy with drivers interacting with WMI devices without a 
> proper WMI driver, but i can see your point here.
>
> Maybe we can keep the retrieval of the fanX_max values out of the kernel? I 
> propose the following:
>
> - have a driver for your generic ACPI interface
> - have a driver for the WMI interface (with fanX_max hwmon attributes)
>
> The driver for the generic ACPI interface exposes the fan speed controls as 
> pwmX attributes if the interface does not support
> the "Get Max RPM" function. The userspace application in this case searches 
> for the hwmon chip exposed by the WMI driver and
> reads the fanX_max attributes there. Then the application can convert the 
> target fan speed into values for the pwmX attributes
> itself.
> If the ACPI interface however supports the "Get Max RPM" function, then it 
> exposes fanX_max and fanX_target hwmon attributes
> themself and the userspace application uses them directly.
>
> This would keep the kernel drivers simple.
>
> I suppose you provide some sort of OEM application for fan control?

Yes we do.

It would be a little bit harder for 3rd parties wanting to implement the hwmon 
interface then and i'm also thinking of implementing it in the thermal subsystem 
(albeit i did not do a proper readup on that system yet so maybe it wont work).

> In this case having the fanX_max handling here also gives
> you full control and allows you to stay independent from the kernel 
> development in that regard. For example you might decide
> independently to hardcode the max. RPM values on some machines (like the two 
> new machines) or use a different hwmon chip on
> some other machine.
>
> Aside from that, i really like your approach with having a generic ACPI 
> interface, it can potentially save you a lot of work
> once you have the initial driver.
Knock on wood that the generic acpi interface works out ^^.
>
> Thanks,
> Armin Wolf
>
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>>>
>>>> Kind regards,
>>>>
>>>> Werner
>>>>
>>>>
