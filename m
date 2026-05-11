Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AD63793A6;
	Mon, 11 May 2026 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530248; cv=pass; b=nwv5+1iRalblcx88oDZI01Jj0ir4ryXlibcqN8+Gu6USLo4sDzkfDsxMyWpOvkmh9dn8WqH/mmSe3490A5lvoS866d0YvZFBakriSzJnxDtMQQLyXGEeR/TuB2E3J0+aVgbmXLEbB+wzcxD2njXjS/Ag3fIfRQ2Z0PrLYn8ZFu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530248; c=relaxed/simple;
	bh=rgRrBB+FwSReB+eSMk4psDsamMNvjLuTEuCI6RtB8tA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Tm7dq5OjYXKCKHm4pC7igG1NY5Zdyzan+XPlsU+39sKWzZTLghWtEBlXm6LR4onDnqdybl62aS22mfo2bj7NGkyEy0HTT0yL0oasojGzFr9n3Zszm++QO/sna87Xa5ienTb4fAhvJ1x4stXoW6biCphQEFhHcKAZCpThJ1WHyhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WBVJspwX; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WBVJspwX"
ARC-Seal: i=1; a=rsa-sha256; t=1778530236; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZjMREP9go1BboJzZc4PdetBQ0xDa76gC8hZWSQNwAeqh1IfeDRsnsE9SELKGgMm8ZAphos6EiMMBiMlAw1E2V54Nxvw7HUtu7g60pfeKlOhpHUedWZtv2L0GYFpdJN24Rgo0mD9Louoi/EOh273r4hfalz0zSZsu3gJkIYyJ/3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778530236; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rgRrBB+FwSReB+eSMk4psDsamMNvjLuTEuCI6RtB8tA=; 
	b=lsTRUf0T8HYCOyUhaFEdAmOACDV8nUAX5l5cvR44GcwHOC1DBndvpUcXuGDVflAD2fHVeTbB8otce0dICXw/E8IM5LtK+VXJA3fxHziZuMOahgW3C2ifOv4g8XajmYgip3xX6WBRqZg8Ef8vgcQg4vzze01JZvVZQBb0NeZM6nk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778530236;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=rgRrBB+FwSReB+eSMk4psDsamMNvjLuTEuCI6RtB8tA=;
	b=WBVJspwXvuI6oNII93ozhPSHdQPUlLgfDAHT02A9TxpyCQ05lPfVYMPNQH84Frgv
	XBa9k35Ph+jm0mfEolY3y46P/cvGgh8JHOK3UqxMzMopGYj2RBaxVWxjN33E6V1b7Lg
	UvLse06d2JwBd30KcIjsXw6mSzZZa6TpmsteCoFZ1U4BzN3C28U2kZZ4WYK1M7tru8L
	+9zBMffBO+dBrD65OzCm0yAkpH3AjFOFN2OiOYuUTkQ7GHxxMGiYDAf9FWRvzZkqNew
	tW9xCzO4KwuZrFxfwEPsicChAySo+zq5MIL+xaV1/AlNJp8MlTdcQlqz15vDGLPn7wq
	3Xh819vzbw==
Received: by mx.zohomail.com with SMTPS id 177853023463768.79137195678265;
	Mon, 11 May 2026 13:10:34 -0700 (PDT)
Date: Tue, 12 May 2026 04:10:27 +0800
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_14/16=5D_platform/x86=3A_lenovo-?=
 =?US-ASCII?Q?wmi-other=3A_Add_WMI_battery_charge_limiting?=
User-Agent: Thunderbird for Android
In-Reply-To: <41D66996-DE34-4162-B91D-66CE326EF927@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com> <20260411162334.25682-15-derekjohn.clark@gmail.com> <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com> <5389eb37-61db-4c9a-b8cc-7d605ac7a4f4@kernel.org> <41D66996-DE34-4162-B91D-66CE326EF927@gmail.com>
Message-ID: <749F4D48-9B56-4273-AC0B-FBE99E984D5A@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Derek,

=E4=BA=8E 2026=E5=B9=B45=E6=9C=8812=E6=97=A5 GMT+08:00 03:48:01=EF=BC=8C"D=
erek J=2E Clark" <derekjohn=2Eclark@gmail=2Ecom> =E5=86=99=E9=81=93=EF=BC=
=9A
>On May 11, 2026 11:48:44 AM PDT, Hans de Goede <hansg@kernel=2Eorg> wrote=
:
>>Hi Nicolas,
>>
>>On 24-Apr-26 14:50, N=C3=ADcolas F=2E R=2E A=2E Prado wrote:
>>> On Sat, 2026-04-11 at 16:23 +0000, Derek J=2E Clark wrote:
>>>> Add charge-type power supply extension for devices that support WMI
>>>> based
>>>> charge enable/disable=2E
>>>>
>>>> Lenovo Legion devices that implement WMI function and capdata ID
>>>> 0x03010001 in their BIOS are able to enable or disable charging at
>>>> 80%
>>>> through the lenovo-wmi-other interface=2E Add a charge_type power
>>>> supply
>>>> extension to expose this capability to the sysfs=2E
>>>=20
>>> Hi,
>>>=20
>>> this is not the right uAPI to expose this capability=2E
>>>=20
>>> If you check the ABI description for
>>> /sys/class/power_supply/<supply_name>/charge_type [1], it mentions
>>> "rate" and if you check the corresponding enum definition [2] it
>>> mentions "speed", so the charge_type uAPI is very clearly meant to
>>> expose the the charge rate/speed/current currently configured, with
>>> Long Life specifically meaning a reduced charge rate, rather than
>>> reduced charge capacity=2E
>>
>>As discussed here:
>>
>>https://lore=2Ekernel=2Eorg/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2d=
b@redhat=2Ecom/
>>https://lore=2Ekernel=2Eorg/platform-driver-x86/20241209204051=2E8786-1-=
hdegoede@redhat=2Ecom/
>>
>>and also here:
>>
>>https://vdwaa=2Enl/charge-types-api-upower=2Ehtml
>>
>>The use of charge_type[s] for this is intentional and is exactly
>>the right uAPI to use in this case (especially see the first link)=2E
>>
>>> The uAPI you're looking for here is
>>> /sys/class/power_supply/<supply_name>/charge_control_end_threshold [3]=
,
>>> which very explicitly exposes the charge threshold in percentage=2E Yo=
u
>>> can then accept only 100 or 80 as valid values and configure your
>>> hardware accordingly=2E Unfortunately there's currently no way for
>>> userspace to know that these are the only valid values (which is
>>> something that I want to look into implementing soon), it can only rea=
d
>>> back to see if what it wrote was accepted, but it's still the best uAP=
I
>>> for this=2E
>>
>>charge_control_end_threshold only makes sense when the firmware API
>>actually allows controlling the % of charge at which point the charger
>>will stop charging the battery=2E
>>
>>In many cases there only is an option to prolong battery longevity
>>aka "long life" by not charging to 100% but the exact % of charge
>>at which to stop charging is not configurable=2E This is exactly
>>the case for which we've decided to use a charge_type of "long life"
>>and upower has also implemented support for this=2E
>>
>
>Hi Hans,
>
>This is good information=2E Since there was understandable confusion from=
 the way the documentation reads, I think taking another look at it to clar=
ify this would help avoid churn back and forth in the future=2E Specificall=
y, for charge_types:
>
>>Long Life: The charger reduces its charging rate in order to prolong the=
 battery health=2E
>
>Should probably read something more like:
>
>> Long Life: The charger firmware reduces its charging rate and/or maximu=
m charging percentage to a hardware specified fixed limit in order to prolo=
ng the battery health=2E
>
>And for charge_control_end_threshold:
>
>> Represents a battery percentage level, above which charging will stop=
=2E Not all hardware is capable of setting this to an arbitrary percentage=
=2E Drivers will round written values to the nearest supported value=2E Rea=
ding back the value will show the actual threshold set by the driver=2E
>
>Should probably read more like:
>
>> Represents a battery percentage level, above which charging will stop=
=2E Not all hardware is capable of setting this to any arbitrary value, ins=
tead providing different minimum, maximum, or step values=2E Drivers will r=
ound written values to the nearest supported value=2E Reading back the valu=
e will show the actual threshold set by the driver=2E For hardware that onl=
y supports a single fixed value, use charge_types instead=2E
>
>Ilpo,
>
>If you want to drop v12 from fixes I can submit a v13 fairly quickly to a=
ddress this=2E I'll also address Rong's latest questions/comments when I do=
 that=2E

I don't have any questions or comments on the merged part, so for me the m=
erged part doesn't need to be updated and you can resubmit v13 based on rev=
iew-ilpo-fixes (ofc it's ultimately up to Ilpo)=2E I guess no new change ta=
rgets fixes, right?

>If you'd rather we go another route then please let me know soon=2E I thi=
nk we'd all like to put this series to bed=2E

Yeah, I will dream about it soon (just joking, I am going to sleep now any=
way :-P)=2E

Thanks,
Rong

>
>Thanks,
>Derek
>
>>> I see that there have been 2 commits merged last year that make the
>>> exact same misuse of the uAPI, which probably contributed to the
>>> confusion here, but the ship has sailed for those=2E=20
>>
>>Those commits are working as designed and a 3th one is actually
>>in the making doing the same thing:
>>
>>https://lore=2Ekernel=2Eorg/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2d=
b@redhat=2Ecom/
>>
>>Regards,
>>
>>Hans
>>
>>
>
