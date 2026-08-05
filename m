Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487A945D5FF
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932427; cv=none; b=W1z532/IODpRl0bxtDWIWBoeALqnLkD9bX8F2+3/W+hvZ9GrkRwBYpMt+K8okfYbdhnf2KNGR4HWFYZb/3YRGpnX5HZMpiEmExKJ3GnG72NMAlIJUIxU5YNwZXf0U2vVBaEPiE1qnz9ukmzhG47LT8xSzaVT+osthod0YmB2+hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932427; c=relaxed/simple;
	bh=Mg2Ni4BBuBQvyEz2RvH2DPgBYlrkZ2HbMMvSXP9ifUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rHsfRf4DIGhuQ1Mf9qTDPYLAOOb/4kMItY7TD2ccxBcyQUPyD0ef2xrF+c6ra8VUf382AbhpdNPdSycuFD1gjjxzs3a6apiOb1C3y4PigfeYxf3uMkzAlFWrZ0YL1Ehh7uE4yeueykNERcWvOWyaMHu++4YWUIcKIXv6cXAkl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g8fdMUd0; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g8fdMUd0"
Message-ID: <c26da468-9a5a-46c1-8dbd-1784b69b3c73@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785932413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mg2Ni4BBuBQvyEz2RvH2DPgBYlrkZ2HbMMvSXP9ifUA=;
	b=g8fdMUd0HMTaFecjIgaW73ruGWY5woYokRb99jhA+cIapCK2c3jIrB5orjaedXQoEMindW
	hNMklFw+1u9E6QIHHsmS5YIDVyda/gkkV92CcpfE9dqGsKilNLk3uz61/uMIsMwJ/0oBP5
	rbYEPaJvpNIvLo9q1rivRRG5G1I/IxI=
Date: Wed, 5 Aug 2026 14:20:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Placement of ASUS Aura and platform/x86 ASUS files relocation
To: Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Liang Haowen <nbg2974@gmail.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
References: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev>
 <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 8/4/26 20:22, Armin Wolf wrote:
> Am 04.08.26 um 19:46 schrieb Denis Benato:
>
>> Hi all,
>>
>> I write this mail to ask a few questions related to the various ASUS devices in the kernel both present and futures and how to organize that work.
>>
>> To understand this mail one needs to know that AURA is the name of the lighting ASUS gave to its
>> products: each device is divided in one or more zones and each zone supports setting an effect like
>> static (1 color), strobe (2 colors and speed), rainbow (0 colors), rain (0 colors and speed), laser (1 color and direction) and these, to be represented in such a way features are not being lost requires a ned interface
>> that Derek said he wanted to develop as many other hardware would benefit from it: I will therefore need
>> to specialize it for ASUS things: where is it better to put any .c/.h file related to this interface? Is platform-x86 OK?
>>
>> The Aura interface has components (all or only certain aspects) working via: scsi, (hid) usb + i2c and wmi.
>>
>> 1. Liang Haowen has an ASUS nvme enclosure that supports the AURA protocol as scsi commands:
>> we want those to be in the kernel, but we don't know where to put the aura userspace interface (see above).
>
> Hi,
>
> it depends on the userspace interface. If you use the LED sysfs API (with some extensions for the effects), then i suggest
> that you place the driver in drivers/leds, because the NVME enclosure is not a platform device. 
>
Yeah we will have to bind the LED interface once to the nvme enclosure, up to 8 different interface to the keyboard (one per zone so we can set the physical keyboard in rain and the rear logo in static for example)
and also TUFs manage power states via asus-wmi so one interface spawned by i2c will need to be bound
to asus-wmi too.

The userspace interface will need to be used by different drivers, in different instances and even more than
one driver on the same instance.
> I assume you refer to the ROG Arion? If the SCSI commands are used to issue i2c/smbus requests, then you should also
> place the i2c controller driver under /drivers/i2c/busses. 
>
It is indeed a ROG Arion.
>>
>> 2. ASUS has product called "RTX Spark" coming that are arm and will support acpi: I have no idea if the asus-wmi
>> interface would be reused, but if they decide to do so (and the kernel can be made to boot lol) would platform/x86 still be the best place for ASUS drivers?
>
> In such a case, moving the affected drivers to drivers/platform/asus/ would be a good idea. There is currently a patch series pending
> for enabling ACPI-WMI on arm, so _theoretically_ the asus-wmi driver should work. 
>
Splendid news!
>> 3. During the upstreaming of asus-armoury Hans de Goede asked if it's preferred to have an asus directory containing asus drivers, but the discussion died there. Now that I see there is a patchest that will also move asus files
>> would it be a good time to spawn this discussion?
>
> IMHO having a separate asus directory for all asus-related platform drivers would indeed be very nice. You could reuse the drivers/platform/asus directory
> for that, and leave the older asus-related drivers inside drivers/platform/x86 for the time being.
>
> Alternatively, you could move all the affected drivers to drivers/platform/x86/asus, and after that move this directory to drivers/platform. 
>
This looks cleaner to me if ASUS will produce ARM products that actually use that interface,
but will wait to hear what others think.

If I do that will platform/x86 still be the correct place to send patches? I don't want to "move" the driver away from platform/x86 mailing list just because the directory changed.
> Thanks,
> Armin Wolf 
>
Best regards,
Denis Benato
>> Thank you all for your time.
>>
>> Best regards,
>> Denis Benato
>>
>>
