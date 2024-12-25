Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93F154C0F;
	Wed, 25 Dec 2024 21:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735161117; cv=none; b=i1m/MrCW7WsTNkX3BQMmcS4xbhWzvZB5D4gJQDPPN2agkrr9PbmyWaGmaFXToxJjkO4XzdTtQUkys1KcZtRQQfyPrNpHH+b3sDUXHIST7fSeULghknOwlaSdeUVlk+qbNwnO1AJzX8VUeT2Iyg0HqLXyY4Gn65PGhwj/ILlanqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735161117; c=relaxed/simple;
	bh=7LRSpR5DNRwibGAMNHTsd9VqlM0PqWYJFryy3YFDuHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ubtt64HQzpqz6hsdC+U0Gr6X18/0MvIuH/d7jB+alIC1a5SUSnv6vtpT+En+fhuDnS4NMwihHZuwtb+aGginDBozbUMmP/XSCdBgNCEr50yJkqvEfsqYC0vhGRi86MLRG9Lux3CiodmgQeyIcvPe6u/OWpPl0h5ru7DXi/lkx2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=g5QzQgJn; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="g5QzQgJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735161097; x=1735765897; i=w_armin@gmx.de;
	bh=Qqn8eBBvBt4eEBj1jGzkL3n6MqLAzi1EHeLQhKygmIA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=g5QzQgJnhTqu/+aCmXNZhOA3r/LSkUmkUCjPgXdie7HFEDu+lt9Ufk0uP5zomSoJ
	 LoKM6vZWNwZFjw/7ujslHimYjlWqshxksiQW0+wdsXJu9gqnxqRCw/D71iaJLDJ6R
	 PTz49/p3GH5nuxH5ZjLHQPgvUdfH8jRB/wukchWXxav+FOw+ik0l9cs7bEtZ1OdTP
	 0o7ixyCak/zAgUQ6HH5v/ztn1AUDajifJAPRuGOlfwD+8KVSEXoyy2gh/Q5ZC8cHL
	 SjXLtDWytuczNHRrXq6lcvXvyZV4W3dSWhGzOqvo5E7S+QWBsVZT+tC286rRIR1DL
	 CswquKzZZj3AzFsfVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1u0RiM3Bxa-00d0U4; Wed, 25
 Dec 2024 22:11:37 +0100
Message-ID: <a4b3f2ca-0c91-4079-bc69-d0a98000ce23@gmx.de>
Date: Wed, 25 Dec 2024 22:11:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 "Cody T.-H. Chiu" <codyit@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 ike.pan@canonical.com
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241217230645.15027-1-derekjohn.clark@gmail.com>
 <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <7b1d0298-4cdd-4af7-83e6-9e6287387477@gmail.com>
 <99246696-4854-4EEB-B782-FD8C13D9D723@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <99246696-4854-4EEB-B782-FD8C13D9D723@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:UnR8KcKv7h655TSC6sgHBi2YFHU9tehTgVuQsZ4S0xFoA9DngII
 GVORBpoC4kPvi0boFKXhDpzdh8jQtvmheOSvSw0ME+cm+Rn0qLmBSpT9HciuM6YjGuYtufN
 JzrbzibRQVg8qf+o3+m/MCjmVjxe90aaWxSxfzseurY0ZnpX92g7WGMJUUMQ6QtzWa/B9xw
 l7iUTbrsl1VlNILsWXnGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RlVmtjILU5I=;ObpZP31ji+7T4vmlIwRFE47sjvF
 VihmS38OgV8r1uP5Wbytq59kRK+3d1M/eSDbe+7gcAuImWPSV/xlcimOWgpDTLP9xz9WSVtBm
 uGwtCEMB3yWxw7enq/QeXmPg3KHOjXh8vYzKxVIId58zFCWwnsLCsQ84969dI0UMovie4ZfJS
 sJHdNv1V9Yl6z6b1RiUnI62DQ7BNpPmk841Slx6ZOmyaSyKh4ml9Wf2c95esyeEMvYWtcwk8Z
 Cea2CFf9AfMT/L44O9d82Riiax1kvNjrJUUHypOgIMsYo1fHfcisRvyfp3NaSsMun/kG3P1uN
 EnwO6lRH4/Ah9v1xl/EtUuOB6D4Yny2EXAwEga2NhkbaqmnGiHVEufSMzn+oNapodLOE0elq1
 hLgARLAc4eWMouiO3vi3iCkrPNKRC3SZWV61PVdVHXyx3NPA5aehbyQp3JQj3CXIHGsbR+ka+
 zbA+xVTyMt6+MYNyZduMO/vLVjm6JMSWnSeCUALJz3e7L6Pm2mQ5aFyxi+1NwI495NRWtTtkZ
 pC/did42Yq91oc6F6OW92TqFN1YszH+fRU+71ZKOev6NFU7QdN7r6n8T+deEt1u/Fm7E2yFFM
 /kXOEytFd7vy6e7Zb5fQ0VlKhb8ABDfR7mbDFSCsj6QEdt99KozYC0fTlX42q+vwHnrZULake
 GFVEoVUTLF8lvj4BRuFbYh1f91utfzDD8kBohanHrgSwG0i4UXPGXNQtrE0Eqi4T3YmH/AeYX
 nm3UYoJfR2OE9BiUppBBGXJKiSiQhxWeNmPzBLXJoUWVZy+MrDUsn+VZZ95ZZXBPD4WcISZVZ
 PLnO2sb6zvceJbHz6kEpFr9UjDQE5K7EuL38H1UpZ17wUWL5rUxKDHylz0o83OJFVxZvs5OKp
 XqQfbsaTJ4rkP5xnSgWop35wdQhSN/4bUK56F+07ie14JlfB+A1lyVOiAHuicZTYqGYcKJZbx
 ZbBvfZWETTmoxEdiMgHWKQrc8/vT5BFKbwJXuiAjvsC0tuMeXujnrimhfNVKryhlGZhTABTXS
 Up8L+Vt0g2e595DjABCa4aF9SJIuDJB/vC4PrsA34AO9+U/l/11Q4Oc5mb2uC9KA3pOucX+fC
 BbOsMnRykiw4OKCd3kJ2nHIaKBCvw1

Am 25.12.24 um 09:34 schrieb Derek J. Clark:

>
> On December 24, 2024 9:25:19 PM PST, "Cody T.-H. Chiu" <codyit@gmail.com> wrote:
>> On 12/17/2024 17:06, Derek J. Clark wrote:
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> ...
>>> +config LEGION_OTHER_WMI
>>> +	tristate "Lenovo Legion Other Method WMI Driver"
>>> +	depends on LEGION_GAMEZONE_WMI
>>> +	depends on LEGION_DATA_01_WMI
>>> +	select FW_ATTR_CLASS
>>> +	help
>>> +	  Say Y here if you have a WMI aware Lenovo Legion device and would
>> like to use the
>>> +	  firmware_attributes API to control various tunable settings
>> typically exposed by
>>> +	  Lenovo software in Windows.
>>> +
>>> +	  To compile this driver as a module, choose M here: the module will
>>> +	  be called lenovo_legion_wmi_other.
>>> +
>>>    config IDEAPAD_LAPTOP
>>>    	tristate "Lenovo IdeaPad Laptop Extras"
>>>    	depends on ACPI
>> Hi Derek,
>>
>> Thank you for the initiative, love to see we'll finally get a driver developed with the help of official specs.
>>
>> Perhaps it's common knowledge to the crowd here but I'd like to call out right now significant portion of the support on Legion ACPI / WMI came from ideapad-laptop which explicitly detects it:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/ideapad-laptop.c?h=v6.13-rc4#n2108
>
> Hi Cody,
>
> Doing a quick search of that GUID on the Lenovo Legion WMI spec there are no matches. Perhaps someone at Lenovo can shed some light here, but the IdeaPad driver grabbing that GUID shouldn't interfere with the GUID's we're working on here.
>
>> Per my observation majority of users have no idea this is the case because of the misnomer, adding another set of drivers with Legion in the name explicitly, that don't support those features would double the dissonance.
> It appears the feature sets are quite different. This seems to enable use of special function/media keys on some (one?) Legion laptops, and it also tries to register an ACPI based platform profile. While the driver does load on my legion go, only the amd_pmf and lenovo-legion-wmi-gamezone drivers have platform profiles registered under the new class at /sys/class/platform-profile/ so that isn't a conflict. I think that the ACPI method may only work on the yoga laptops that are supported by this driver? Again, maybe one of the Lenovo reps can comment on that, but it appears to predate the Custom and Other mode WMI GUID's.

Maybe we can remove the "legion" part from the driver name since this WMI device seems to be used on other machines too. Maybe you can instead use "lenovo" when naming the drivers?

Thanks,
Armin Wolf

>
>> I wonder if reconciling this is in your planned scope? If not IMO at least this should be called out in documentation / Kconfig.
> Reconciliation wouldn't be in-line with the WMI driver requirements outlined in the kernel docs as each unique GUID needs to have its own driver in the current spec. It is possible we might need to add a quirk table in the future if we want to add function keys support for the Custom Method or Other Method function keys in the future. Since the Go has no keyboard I can't confirm if the IdeaPad driver is functional on more legion laptops, but considering the DMI quirks that are used in conjunction I would assume support needs to be added explicitly.
>
> If someone wants to add documentation on the IdeaPad driver and what it provides that would be good. I'm not familiar enough with it to really do it myself.

As long as both drivers use different GUIDs we can assume that they do not conflict which each another. Anything else can be added later.

Thanks,
Armin Wolf

>
>> PS: I'm a developer myself but at lower level kernel domain I'm just a user so hopefully I'm not just adding noise here.
>>
>> - Cody
> - Derek
>
