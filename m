Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F8A155345;
	Mon, 30 Dec 2024 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545108; cv=none; b=M96eaYkanp6sh+N/HUJ62AAtggspCtKdOq97qbFpdGZzkuOYnhfflXBeOtqW0RFMX2nxi5KDBbmuX8kLXHCMV2RkvUy7UM65hsSj/FXRQC5FRDZjYLD2/qkocIbqGzFHHadfV0j5fsNkGeY7T/rPdcCS2NXyT+0UfUOJkIrOZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545108; c=relaxed/simple;
	bh=oFBX6C0t+1ghMjOWC4l1/Od42htN+6OC/Pvdmy1n+Lo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kS45DB7MC6NeZH8NCPYNPxrvs1oLCIYarwcOcOu0ZfjwQmBYPEac6jW6g/gIYBtrJNa2s1LaPH6moT9YtsQnC4KKJGnct8lorpEE5EZ6MnzfQDl+0NPazEKKmulB1G7PX3D6k6jUuunfLYp+YNOUfaRHhJn0cKgseBJHQTnUmFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUfcU0BS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUfcU0BS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so74843795ad.0;
        Sun, 29 Dec 2024 23:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735545106; x=1736149906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvVWykoCf3mq2nsCViUePrJpuy0DSXUe5Glv+zdLt54=;
        b=ZUfcU0BSjmJJ2grIQ1qEp1ZXf/w7/zG8szJCTKsHXj4m6RUN0BObSNu2W1RsZbitIw
         3BVnMI/RD6dcPgKuLrsbX9jkw7pfizlxwxSTXb0dLbLCxZgxIq5q9nLCAyv+MmqUpwH/
         cRXdhqlWHQxE+fbz0M9Gu4xgdil4bLnQ2tc3nlCPmR9RltWC6scwXQT1oaywf03KIakD
         AZYmbfrTi3FMpWs6mzOq0Hdo2oErqM92XC+Oti5Zp5hIQdSmRtAkQww0ghXMTOfxbWnC
         fU2IeAUWNvjeuU3ZaH5N2CBNTT0QiloqJ0NpLSMnbULPShVXQoR8lvUEcqOUXgAUtLmn
         fPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735545106; x=1736149906;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvVWykoCf3mq2nsCViUePrJpuy0DSXUe5Glv+zdLt54=;
        b=PzuOQ1BLZF7IxnSo2oasWc9UEOJJiR69RLH8lSJ0G0XekMcWyZo1DVymTUxVJFXmg9
         I81RbGazEJGbgvEzXllEZzh/2M9KNw0TZUA4xd5wODCIH82VOIhMDdQiPHWI0HDKCvhl
         4UOMoZWMec5y3NlhXFk2qQRCPjIE/qOvgihMTW7Ei+/d7pjKsCyAF5BVoLfmjPmYQJ3n
         mvhZyK99G6mrFSsQSAmW5Bt1+sZlssWhtbMWQAZvIWNrSQDxDMvi0+n33DVj6+ex3Sn2
         DpJ/7nnpp3rtl0/ACOG+mvzHcEgxe1EEdoAjziH5T+5uA/Z7QqXjy0SPIQCI7hI16xV8
         K20Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEHu2aPbDL7qp6DKDNWFiWi1rFR5cg/i8dtvh5DqdCiYaEFHKauha/lRE+1HlLqnbpH2R4Kk6cdRuTR+nw@vger.kernel.org, AJvYcCWjiGPxCS/MTPevu3XrSV0pnhso7n8OPP925HYlRRZZnGgOXVmi1shyZ+2UVzggXPbIH5ZSzIGfejU=@vger.kernel.org, AJvYcCXFmRkvEd8BqlFYWpABBq9Nc2aBYOrutxfGXq/AjKBvOC9kIGPc2ADwIQRv2VLAHnyJ2enkn4S6mQ39YmTHmYomRcUZWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWcLrCfZFh82YSY2eFmdk4FlakVhFg/b9WcfWmTj6+fMj3nwYs
	in/cF4Q07jdyl39JBbI5Pux05SEhg+getOlLJqKBzmTe+0pxc42F
X-Gm-Gg: ASbGncvUH8LitlxOI9GO+pM62jWEyL4OtSiUcLLrya+iiewlas3cTGx5U1h1b93TiZA
	vAy8JDct5faPMqZ/SeZnVKv65uF4NbnDcNO4bJhiwVfZw5W9NE8JekvGBYk/Yu45C+BjO0X7sDt
	FQUAe/nvftrxxi5m7N94FzKQWeXmJXEoIsG3kuz1qZC1SLpityMZLQqNg5MKQ1v+p/1EEt9FPT1
	o7slFkapT/5uaAzrvsjm0T6n+0za8RgjpAU3Dbcn8L3nAfTelhk7+l66A==
X-Google-Smtp-Source: AGHT+IFmMXD+T1jUPyc6PMfaO+b+Q5jEQeMDBO2oA1RnrElRBxX7LapohJAg0ij9/slvDOmYDlO7Ig==
X-Received: by 2002:a05:6a00:3286:b0:725:b201:2353 with SMTP id d2e1a72fcca58-72abdec8856mr53565633b3a.13.1735545106275;
        Sun, 29 Dec 2024 23:51:46 -0800 (PST)
Received: from [192.168.1.91] ([116.206.160.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb45sm18625694b3a.88.2024.12.29.23.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 23:51:45 -0800 (PST)
Message-ID: <1493dfaf-cfe9-4f02-ae24-5cc4da38078c@gmail.com>
Date: Mon, 30 Dec 2024 20:51:35 +1300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Cody T.-H. Chiu" <codyit@gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, ike.pan@canonical.com
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 John Martens <johnfanv2@gmail.com>
References: <20241217230645.15027-1-derekjohn.clark@gmail.com>
 <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <7b1d0298-4cdd-4af7-83e6-9e6287387477@gmail.com>
 <99246696-4854-4EEB-B782-FD8C13D9D723@gmail.com>
Content-Language: en-US
In-Reply-To: <99246696-4854-4EEB-B782-FD8C13D9D723@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/25/24 9:34 PM, Derek J. Clark wrote:
> On December 24, 2024 9:25:19 PM PST, "Cody T.-H. Chiu"<codyit@gmail.com> wrote:
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
> Hi Cody,
>
> Doing a quick search of that GUID on the Lenovo Legion WMI spec there are no matches. Perhaps someone at Lenovo can shed some light here, but the IdeaPad driver grabbing that GUID shouldn't interfere with the GUID's we're working on here.
>
>> Per my observation majority of users have no idea this is the case because of the misnomer, adding another set of drivers with Legion in the name explicitly, that don't support those features would double the dissonance.
> It appears the feature sets are quite different. This seems to enable use of special function/media keys on some (one?) Legion laptops,

I refrained from responding since John or Legion team have more 
canonical answers, but seeing it's holiday season you might not get one 
soon, here's more info in case you're still working on V2 during this time.

I only have two concrete datapoints, the original commit's (3ae86d2d4704 
) Legion 5 R700P and my Legion Slim 5 16AHP9, a 2024 model I recently 
bought. It's running solely on ideapad-laptop since no LLL support yet. 
Which I do see:

/sys/bus/wmi/devices/8FC0DE0C-B4E4-43FD-B0F3-8871711C1294

Seeing how LLL doesn't implement any function key support, I think a 
better educated guess is that it is universal to all the stated 
supported models there (happy users) and likely all Legion laptops.

Relatedly perhaps all Legions are technically under ideapad family?

SKU Number: LENOVO_MT_83DH_BU_idea_FM_Legion Slim 5 16AHP9

> and it also tries to register an ACPI based platform profile. While the driver does load on my legion go, only the amd_pmf and lenovo-legion-wmi-gamezone drivers have platform profiles registered under the new class at /sys/class/platform-profile/ so that isn't a conflict. I think that the ACPI method may only work on the yoga laptops that are supported by this driver? Again, maybe one of the Lenovo reps can comment on that, but it appears to predate the Custom and Other mode WMI GUID's.

Not only yoga laptops. It's a bit nuanced, I'm not sure if it's a bug 
but it's a potential point of conflict.  On my dmesg it shows the info 
from ideapad-laptop.c:2182:

[   14.348395] ideapad_acpi VPC2004:00: DYTC interface is not available

And:

$ find /sys -iname platform-profile -o -iname platform_profile
./kernel/btf/platform_profile
./kernel/debug/printk/index/platform_profile
./module/platform_profile

However when I press Fn+Q my power led cycles through Blue (low power), 
White (balanced), Red (performance) - with noticeable fan noise 
difference (so I haven't looked into actual changes).

Looks like ideapad-laptop.c:1382 platform_profile_cycle() does get 
called and succeed regardless?

Now I don't have enough domain expertise to say for sure but using two 
interfaces (EC / WMI) to modify the same underlying attribute smells 
like it could introduce inconsistent state or race condition?

The ideapad-laptop.c:2305 "VPC2004" EC (sub?) device ID for the "Virtual 
Power Controller" also appears to be universal across ideapad and 
friends which seems to mean all Legion laptops (same reason as above, 
happy users). My 2024 model also supports a large subset of the of the 
ACPI methods there so it's nearly fully functional.

$ cat /sys/kernel/debug/ideapad/cfg
_CFG: 0xfc050010

Capabilities: bluetooth wifi
OSD support: num-lock caps-lock mic-mute touchpad camera
Graphics:

$ cat /sys/kernel/debug/ideapad/status
Backlight max:  11
Backlight now:  0
BL power value: on (1)
=====================
Radio status: on (1)
Wifi status:  on (1)
BT status:    off (0)
3G status:    off (0)
=====================
Touchpad status: on (1)
Camera status:   off (0)
=====================
GBMD: 0x00820822
HALS: 0x0000c2c0

>> I wonder if reconciling this is in your planned scope? If not IMO at least this should be called out in documentation / Kconfig.
> Reconciliation wouldn't be in-line with the WMI driver requirements outlined in the kernel docs as each unique GUID needs to have its own driver in the current spec. It is possible we might need to add a quirk table in the future if we want to add function keys support for the Custom Method or Other Method function keys in the future. Since the Go has no keyboard I can't confirm if the IdeaPad driver is functional on more legion laptops, but considering the DMI quirks that are used in conjunction I would assume support needs to be added explicitly.
>
> If someone wants to add documentation on the IdeaPad driver and what it provides that would be good. I'm not familiar enough with it to really do it myself.

We have very different definition on the term reconciliation if you 
think it's not in-line with any requirements. I was referring to driver 
structures / namespace more accurately reflect actual hardware topology 
as an established desirable state, I never suggested all of them going 
into one driver.

Initially I was only pointing it out working backwards from the 
potential steady state from a user's perspective. Suppose you stop 
development after only this set of drivers (which is more than 
reasonable since none of us have infinite bandwidth). Users then build 
their kernel or troubleshoot, they see some modules named *legion* and 
the ideapad-laptop which even kernel driver dev have no idea is related 
to their hardware, that would cause confusion. A potential mitigation is 
to have ideapad-laptop stating Legions belong to this family, plus 
Legion driver stating it's incomplete without the others. Anyway I'm 
glad to see you'd rename it after discussions later in this thread.

While this set of drivers are now tighter scoped I hope it's still 
beneficial to have an more accurate holistic view. When I develop in 
other domains it does help me better name / structure things and design 
interfaces that could be time consuming to change later.


Happy holidays

- Cody

>> PS: I'm a developer myself but at lower level kernel domain I'm just a user so hopefully I'm not just adding noise here.
>>
>> - Cody
>>        products
> - Derek
