Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853C62594A6;
	Sun, 29 Dec 2024 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735505173; cv=none; b=Y9+4i0BfYa5TvDKBSaraCy2AjMFlcKjI0t9WcRxUhr75PQzYm3cSFGfGSWxPYeMZVEoMuW9s5BNVz31OHCv/XUDxejro2G07+p+Wd+N7rDMTZJ+985liBvTGW/JhJyJv/AGgTgliLHNpznGxTmaNKxDMfI0q5Nj7ZPzDblA8/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735505173; c=relaxed/simple;
	bh=lNVsELNJaS4AA9G4z2N9N/WgLt5qL/6/VmoyZ1Nj5B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKIrIPVoQOppF6i07BifYfCxGCB4BxX/OnBmIum2/VYK7t0722VAi24OVPHM6WihkKXJ9oaMoaD5jhfnb+lEe8d1sFFetXypDKNp/R9OYpjTn/WW49nl5nbclbU1jfyqwv3j8lu5cTZaTsxTmr0T97GZ/CiB26K5dAJpz0wRii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VoDsvHmU; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VoDsvHmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735505143; x=1736109943; i=w_armin@gmx.de;
	bh=n9HIfxahsMMjkAx4szIjgTvkDGt3ClxOXh/5u2Qu1Ms=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VoDsvHmUJByWsRcMMSsxbiIp9qnIhqxxFJI2snLRECWIlpIOj1gOVlPcJddlLrIL
	 /1YfqL48gbqSmJgDZM9EF4y/ji6+S1hAax0dQC6tf9JX6JmuHk9aP0Z86UGnMfU28
	 /Ob8kBXFsbpnQ23XbKQcRAEi8PFccaRhDKDXKcwslR9EkM0CUlLiKzko6HE02Epfx
	 rxS9EdGZ+mVvDxSFV0zgDRAw3vyBQ9Ock25DPGzfGiinlSjFxY2w1Q2CjgRufYHzw
	 gkiQGB4FZJTeVJi13pKU/Qm4AyM4s7Yyb68YwC9exnnicPDNWz58izIzPgagpR+5M
	 0tDvAmx5M7Xpwotjiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQkE-1tf78J2q0G-010Ea4; Sun, 29
 Dec 2024 21:45:43 +0100
Message-ID: <b7089d69-4d7b-42fb-90b3-bd13a27fcf1e@gmx.de>
Date: Sun, 29 Dec 2024 21:45:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>
Cc: corbet@lwn.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, luke@ljones.dev,
 mpearson-lenovo@squebb.ca, nijs1@lenovo.com, pgriffais@valvesoftware.com,
 platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org,
 zhangzx36@lenovo.com, johnfanv2@gmail.com, codyit@gmail.com
References: <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <20241227184825.415286-1-lkml@antheas.dev>
 <CAFqHKT=Y66KNo-e+o+n76tmPEcqL4EBSUQNDXJcoP8B9NXguew@mail.gmail.com>
 <CAGwozwGpEWVQwEAFfWWkTx4G90uhqdfbF85E4F_2w6c6G6P2Sg@mail.gmail.com>
 <CAFqHKTnOA5N-uADQLbdA-b+k-TOMdjZtCPsFsCo9jarMiNioLg@mail.gmail.com>
 <CAGwozwF79xYrWkCSKpBaLSiXNEZz-5tmayWMbkw-of4zB=LPUQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGwozwF79xYrWkCSKpBaLSiXNEZz-5tmayWMbkw-of4zB=LPUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LipJCHyDf0nDf7mBf6xEVTH/YvMC1SJuo6jnxmAa9RZrK2KJ7Za
 vMGc4BGnGe7a15aqXWx2/przNcZw4g58kMaWFTs4ukRhUtb0IWdpD8yMc4SOo862CQnd7GH
 slJZPDvLxFDkWrxlOYXzgTwrGBelurebCzGftKHONMJG3GMOnP6PuDafL4SH7pEcsedTMTp
 2A93xCabAirUZypw57nzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4crVK/3e1D4=;8VKabZG1LbP6Ro8O4MGiG40EvZ0
 wkSu1CKkIchsbL+IqMe8ayXWS/DSO3z2/4//+gMnlfaptOQ9xHnljrX+s0jlZSUpBTvIV/RIr
 /Eb3aVnNEnrbPCWcx5b3jEeTAPbI1wURhkR/JyBeXYGme+nitsvsC1l9d5pcnE1RCTXGVfzwX
 Ok8NgDxtTjkcr2TSg892K8Cc0cuhbiB/qaqaNu1kS2GiHhzOlYPnHev+M/Fk6q4KzxHeJn2li
 M3o4GJAjDEJ9JYy3LAtaejHqJtTVUIeVl+1uN7eXm87JiU66SXO+KhhtOccb2xoxXEqeERJ6o
 pCKEBD+1AZBJL5BzY5G/CulO2YYD9FVri3zWtlqSOWwadg83oEuc5OptpuYAAVFdaQg7/Ngry
 zesngylXN8IM1ihCidAeEMLFSSxRVlLd6RrqeMOeEKW5x4j2cCKqkDdgbveqVcGY3knuKuUfp
 Z4ijzLJLbRl+JCtJ5gc+rA4XqU2Jbq+NHxk/k+lq9MbYZzKOOnXYo1+V+Sq8BzTchLa5YXm2G
 3Gtxb51Fudpxlq2FYfndhk0UR/UoooynowPYTzpzEqZlLcSIZY8Ttr6GV6QVJ18Xh0ujFzteQ
 jJ5KscZ8AmuCe2YibHT7LFUHQxWMh8dZfMEZVEWS8dcU6gcq+ic18fOnfltD2o2xm4OiQhQgF
 rAxOO+HGdMClS2QpVXwu6VcjvIxxAZ5KAnvVvEFcpkvilouyXMSZB2wM69DZwTD7lzsLsfaCm
 uSJW0uMmy/fZsfsjFsF3OzqCALGQKxmdiaszKtvezbktVLjdnHodn0mGJQHvLtwmDLj11/XVB
 eNI84KrnzjCJulZMxM8AQKfznVVtjWUXG5Cw0PUvCEXHqlh1RJ1INS5VxxNL0mvqmD/rJUQNW
 H3EjviLPFPHP701uNZHdtbnMamVsjZNDLerTtNkMe2feT71QXEmShtsO9dRtWU2itvJLhcGOm
 DAwnHjhP/OadHrNY9StQcS+09r40InZ9HBdFxGoblGavLwhVKI5lYcDqEKaBygbdGSdQrhcaA
 vCKVln4BGzIQcsENqwU0df+NPH1FTicYzYbv4BOpIa85KVCRjT0CL+oxqvObWHujM8WrDZ0Qa
 SvCiGmJIvRyz7XSVvfqo1S5SoUFz7ZEc7nXE2XdJreIR4r3TTHJIzo/V+UMMELtP8ItBa4q3g
 =

Am 28.12.24 um 12:50 schrieb Antheas Kapenekakis:

>> I'll let them weigh in on this again if they want to, but I think it
>> was clear from those threads that this is a new way to use the class.
>> Armin's comment was related to the fan curve setting John was
>> discussing, which is specifically covered by the hwmon subsystem.
>> Hwmon does not cover platform profiles or PPT.
> I quote the following from Armin:
>
>> The firmware-attribute class interface is only intended for attributes which are persistent
>> and cannot be exposed over other subsystem interfaces.
> The former part is not met here.

If Ilpo and Hans agree to extend the scope of the firmware-attribute class to also cover non-persistent
firmware settings then i will not resist.

>
>>> To rephrase, your ABI style is not intuitive, because it contains
>>> implementation details such as "gamezone", "capdata01", and "Other
>>> Method", in addition to the ABI being hardcoded to the WMI structure
>>> lenovo uses. The documentation uses those keywords as well.
>> Yeah, it's a driver for those interfaces... If you want an agnostic
>> BMOF driver then make one. This isn't that.
> It's a driver for Legion Go and Legion laptops. _Not_ those
> interfaces. Which only exist in gen 7+ if I recall from John's driver.
> That was my comment.
>
> Establishing an ABI that works with older laptops and laptops that
> supersede those interfaces would be beneficial I'd say.

Excuse me for asking a stupid question here, but what WMI interfaces exactly are we currently arguing about?

>>> If I understand correctly your last sentence, Armin suggested much of
>>> the same (ie combine and merge).
>> You don't seem to, no. The suggestion was to use the component  driver
>> API to aggregate the Other Method driver with the capability data
>> driver so that the firmware-attributes class is only loaded when both
>> are present. That is decidedly different from breaking the kernel's
>> WMI driver requirements and merging two GUID's into one driver.
>>
>>> GUID tables loading != drivers loading also, I would not pin that on
>>> the kernel.
>> What exactly do you think the following does?
>>
>>   +MODULE_DEVICE_TABLE(wmi, gamezone_wmi_id_table);
> Call the probe function that can -ENODEV
>
>>> I do not understand what "I hard code the page to custom" means.
>>> If you mean the capability data does not change you are right, they
>>> are hardcoded in the decompiled ACPI I am pretty sure (it has been
>>> close to a year now so I might be forgetting).
>> The capability data interface has a data block instance for every
>> attribute in every fan mode. SPL has one for quiet, balanced,
>> performance, and custom. The method for getting that data block (page)
>> is the same as calling get/set in Other Method (0x01030100 -
>> 0x0103FF00). Every page produces different values for each attribute,
>> but I am only ever retrieving the instance for custom (0x0103FF00) as
>> that's the only one where setting that method ID in Other Method
>> changes the values on the Legion Go. It is the only relevant data for
>> userspace. Other Gaming Series laptops might treat this differently,
>> where every fan mode has an applicable range. I'll need to do more
>> testing on other hardware to confirm that. In any case, this isn't
>> relevant as I'm dropping the gamezone check (as I've stated multiple
>> times in this discussion) and always setting/getting the custom method
>> ID for a given attribute.
> Hm, for some reason I missed the capability block when doing my RE
> [1]. Feel free to reference when making the driver.
>
> You should also provision for the fact some legion laptops have an
> extreme mode which is stubbed on the Legion Go
>
> Ok,
> let's wrap up this discussion and put a bow on it.
>
> I currently have two issues that block me from committing to your
> driver: novel use of kernel APIs/design and performance
> degradation/instability from unnecessary calls and checks, as those
> are (i) slower (ii) could error out (iii) could have incorrect data.
>
> The former can leave me with tech debt if your proposed ABI is vetoed
> and the latter would result in a degraded experience for my users; I
> would be putting in work to go backwards. I do not mention missing
> features, as that is something I could have also worked on if I
> committed to your driver.
>
> Therefore, I'm left in a situation where I have to wait for buy-in
> from kernel maintainers and for your V2, hoping it fixes the latter
> issue which you said it will only do partly.

Regarding the firmware-attributes: if Ilpo and Hans give their OK, then i see no problems in using the firmware-attribute class for
non-persistent firmware settings. I for my part would be OK with such a change.

Regarding the enforcement of firmware limits: i believe that caching those limits during probing would solve the performance problem.
If users want to override those limits when we can add a module param (marked as unsafe to taint the kernel if used) later which tells
the driver to ignore those limits when writing firmware settings.

Any important points which i missed?

Thanks,
Armin Wolf

> Best,
> Antheas
>
> [1] https://github.com/hhd-dev/hwinfo/tree/master/devices/legion_go#get-feature-command
