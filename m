Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8504F3EB0F3;
	Wed, 26 Aug 2026 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779460; cv=none; b=uWSCb1H9Pg82NIX5aUnhx+dS/ZKrrRBudAtB1eSoOcEc2fLxjtM4szryDKauMupCzFZezRYlbPD+QbXhmXFhk5g2IjkoaPMO1iCvumVsmJ8Kmd2WEnBInkkbP2OGDcRbQtln7Qvv7x+AA/n4926nDOXTLbslFvwep8Wo7pmoPkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779460; c=relaxed/simple;
	bh=d+2MfQIhaHjGvE7+xF67wqgsqXAg4VKYk1HJNnPdIjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H91Tvqr+k0wJ+jYVHxVvbW1gi2k/hQ1bCNvmDs8gKasIKcOaRPbVwQOAsapVEeDKLz1vkkS01caMnGdF/p/z88caHpR8MoyOwtbKq6ntkIniDStLFjqUyz0BbRZLmf+exmbn8TnA5Z+IWjAFOIlJHN6pZXIZi7OGrIaIMrDhiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MZzNTRh5; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MZzNTRh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787779448; x=1788384248; i=w_armin@gmx.de;
	bh=d+2MfQIhaHjGvE7+xF67wqgsqXAg4VKYk1HJNnPdIjI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MZzNTRh58s+RpMSTCar2k7xKf0VDuwy0TVW35Vf1BO/+H9942I3xnxXe0MlEmwkn
	 7i9Zk4PNVdQWN7HL1qxyC8uvrr121PDwxuRO0ps52AwvA6yU5naiZufvhMioCv1R9
	 aFW4UV30xgXx9ZgB0UuqMy79o4kBX4MIRLJ+g//f7DhCa+B9KIzvXwBzEq4WvAVMH
	 LrVc7f64myf2qizy2qrO2dWj3Fc+IO8IjbnI0ewnMEWu5PcnW+G6FtzNWeu7I+Mf4
	 rhsKYNsLjGmJh6twW8Rj4ianQktP+8wKedaMKMBniTwoYMTE0v3o7ft0hkn9FHGLB
	 5Ats4ppYY+Sn6ag/+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYc0-1wVGGk23Re-00n6MD; Wed, 26
 Aug 2026 23:24:08 +0200
Message-ID: <8e8168cd-4f6b-41e0-81c5-5d7b07b1df13@gmx.de>
Date: Wed, 26 Aug 2026 23:24:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Placement of ASUS Aura and platform/x86 ASUS files relocation
To: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Liang Haowen <nbg2974@gmail.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
References: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev>
 <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
 <c26da468-9a5a-46c1-8dbd-1784b69b3c73@linux.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <c26da468-9a5a-46c1-8dbd-1784b69b3c73@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xITy+yLHHnY8pkWdL13jTzZZXCn4Pz65YeSWgafq5B4z2nt+rj7
 6LmIkclSXheLdUdxQX95RMrlLq6fDnk+tZ0TP0ZHjAnOXjBprDSXJ05fqMJQ5Fb0czJAhef
 e1HOt2elvJpzWvbqG3Tbmu3ZMKzfqEIFojbpDt4HgIXgsEjVo9+HC9kJvZL2hNd4Zq7dsrJ
 wKw/6pkBW0UACyqL9NSKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EhBsn6nKR70=;g5pQHXV02WEFJahcINmhx2PZY+D
 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

Am 05.08.26 um 14:20 schrieb Denis Benato:

> On 8/4/26 20:22, Armin Wolf wrote:
>> Am 04.08.26 um 19:46 schrieb Denis Benato:
>>
>>> Hi all,
>>>
>>> I write this mail to ask a few questions related to the various ASUS devices in the kernel both present and futures and how to organize that work.
>>>
>>> To understand this mail one needs to know that AURA is the name of the lighting ASUS gave to its
>>> products: each device is divided in one or more zones and each zone supports setting an effect like
>>> static (1 color), strobe (2 colors and speed), rainbow (0 colors), rain (0 colors and speed), laser (1 color and direction) and these, to be represented in such a way features are not being lost requires a ned interface
>>> that Derek said he wanted to develop as many other hardware would benefit from it: I will therefore need
>>> to specialize it for ASUS things: where is it better to put any .c/.h file related to this interface? Is platform-x86 OK?
>>>
>>> The Aura interface has components (all or only certain aspects) working via: scsi, (hid) usb + i2c and wmi.
>>>
>>> 1. Liang Haowen has an ASUS nvme enclosure that supports the AURA protocol as scsi commands:
>>> we want those to be in the kernel, but we don't know where to put the aura userspace interface (see above).
>> Hi,
>>
>> it depends on the userspace interface. If you use the LED sysfs API (with some extensions for the effects), then i suggest
>> that you place the driver in drivers/leds, because the NVME enclosure is not a platform device.
>>
> Yeah we will have to bind the LED interface once to the nvme enclosure, up to 8 different interface to the keyboard (one per zone so we can set the physical keyboard in rain and the rear logo in static for example)
> and also TUFs manage power states via asus-wmi so one interface spawned by i2c will need to be bound
> to asus-wmi too.
>
> The userspace interface will need to be used by different drivers, in different instances and even more than
> one driver on the same instance.
>> I assume you refer to the ROG Arion? If the SCSI commands are used to issue i2c/smbus requests, then you should also
>> place the i2c controller driver under /drivers/i2c/busses.
>>
> It is indeed a ROG Arion.
>>> 2. ASUS has product called "RTX Spark" coming that are arm and will support acpi: I have no idea if the asus-wmi
>>> interface would be reused, but if they decide to do so (and the kernel can be made to boot lol) would platform/x86 still be the best place for ASUS drivers?
>> In such a case, moving the affected drivers to drivers/platform/asus/ would be a good idea. There is currently a patch series pending
>> for enabling ACPI-WMI on arm, so _theoretically_ the asus-wmi driver should work.
>>
> Splendid news!
>>> 3. During the upstreaming of asus-armoury Hans de Goede asked if it's preferred to have an asus directory containing asus drivers, but the discussion died there. Now that I see there is a patchest that will also move asus files
>>> would it be a good time to spawn this discussion?
>> IMHO having a separate asus directory for all asus-related platform drivers would indeed be very nice. You could reuse the drivers/platform/asus directory
>> for that, and leave the older asus-related drivers inside drivers/platform/x86 for the time being.
>>
>> Alternatively, you could move all the affected drivers to drivers/platform/x86/asus, and after that move this directory to drivers/platform.
>>
> This looks cleaner to me if ASUS will produce ARM products that actually use that interface,
> but will wait to hear what others think.
>
> If I do that will platform/x86 still be the correct place to send patches? I don't want to "move" the driver away from platform/x86 mailing list just because the directory changed.

Sorry for the delay.

AFAIK as long as the driver is still heavily connected to the x86 platform, you can continue to use this mailing list.
That is what i am doing with the core ACPI-WMI driver.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
> Best regards,
> Denis Benato
>>> Thank you all for your time.
>>>
>>> Best regards,
>>> Denis Benato
>>>
>>>
