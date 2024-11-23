Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217FE139D1B
	for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2024 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732400372; cv=none; b=rTXinSmWjhDZzffNAKLZsAA1DTSUSg91teT5q/u3urvgjXnZbklzM4aqEuHQDfVmJNItGxZ0IH/wkUFAELwABzpFZ858X0yWOVTG2ViWky6E3sJuCxVwCfY+YHdrCj55dsw/0GX5wgROzCsa2YDWHIe8NwwzPl8zkjN/i5vy4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732400372; c=relaxed/simple;
	bh=ZfQkJjm3UOB4kQBt3V3ue7WiJgWuyDSo6s/BihjnJ+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETNo4tqbmqFSsyf0xTswNEQ3iJ2elcI9v2GgCh+jnxo1UR7svnuAICsax9w9JeyxlSCLsN486IjQfRx5tJFeilIG8u347qb/K/Lf2BFh37iuGdgAKDahoXlgxagKZDgdWDV8VWJsuNfGXGqohXsSP7dquvEAQUOg2I+Jpk4+Fbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LcrCvxbm; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LcrCvxbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732400350; x=1733005150; i=w_armin@gmx.de;
	bh=ZfQkJjm3UOB4kQBt3V3ue7WiJgWuyDSo6s/BihjnJ+0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LcrCvxbmFbBfH71PRTMiI/MgTwaB94CuWCQXeRVNQHtqLbLY4VdHbLi0VR5R1YiV
	 rt3ds5XgqnkcoKTwpykXT0sWsKl8j4YLSiiNUaBQ97tubMjfNoEKJzN45z29mT1TC
	 8QY4eFgyP+hYlnqz88KSj3GEAemBl3MKAlAvyTKvHsHDIye583sDJ4dBZkgBVLEi9
	 nr6+TlrymuO5l2I7pBNbZYbWTeRmG1B9AaOfLavG+9AopSPbzQDvSNxC4eQBhBYqa
	 d1S9bFI/s+9S84apGck+rCcz0y7TZyPUK/UD0Ka5zgyLum+8nDXYcrhwo9g5teyDK
	 axHD56TUQ0wzk7r3Dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1ts8y42Wjy-00oDKH; Sat, 23
 Nov 2024 23:19:10 +0100
Message-ID: <e46b4d6d-16f0-47d9-a680-c1ac90c52a97@gmx.de>
Date: Sat, 23 Nov 2024 23:19:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Joshua Grisham <josh@joshuagrisham.com>, Kurt Borja <kuurtb@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de>
 <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
 <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
 <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YhX+SMFByXvuv0LsSwIVZISvdqONx9ghjuoYuLEbYu3tZA9qoFq
 C/VRG3F71J0YRQ6DvjMI5J6HLgZwxv7Vu3eq5BKvMSPlZsXVKJ8k4wgNj65/dIxVVpQ8n8t
 BP/gSnkbslyhsNL23OZCNidzekjhvstvvdxjRoWeDvj9oT+ibe+NH5j+aKbeeJm0m01oGJj
 oFSzEQNeTVTnX810A6ErQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qL0gXve80zA=;TapVvbCLWxnxfIbUWxFpvnVQLcu
 3jKXNJSxv7yAQeerXEUMHzpRIeF4AXUnL6hbSc3GLoyH0iI0Z5i/WkVW4t9kVbBXfAZSBSVyS
 /YfnHyg3qCAiVHy1fD4EUH1vu/5wUFAcmDVGluCshDHSLpTNKOnri/l2/t57qtbVfMP9dvzP3
 1fZNdC84w7Q+pdasHmm1McDtPOYw/GSwFRwQrG4PzviGJO5ApO4qMsbFxnl7L4rscVtLVk5p9
 zqkAtM/mONkw72unCXbLl+R7Tn5y/3Bz3Dp9oZEAdBZ5sJVpQD+hoKBXE3a9eXCpdzmUVu46T
 2LnRRupbfowbB8j3xNsxKJFYEsB+MiklywMu4n1qh08LUu9CvUZ55cirbR18rA6i0wpSeCHjn
 NtX5DXTu9GiPWBawRQeEAd6Aix2ijOx8kfLvYPraPY0gtkZex3HeZi41NudhEuaxdipLXx9Ko
 lBG10GdFvu5NJWmMpOcmPwrYydOGWwm7vz6hiNTomn2glVon5qohwLolEFqgc+okUMvnfkh/t
 72bBJKLLUM4VfLq7/IxWwKZwytZbW8FYGiIpFj76dabCORPxkWAGzBV+yaWQyt038kJy1Ronn
 JrM9S5FH3hpyx0wmzInROtv+tQDseOk6DjDpuoy9oxmhPkgqsGC8yZupwRpiWFqc/Cyegf7xJ
 QaNnQhyWhSz8J910yyW2A1+zknkiw7pVw23nI/Hw11+3wS5D/h8Wsvm3x6/Z2L4h2BAXvNdbr
 VOCj7tXVhJMM3v5dRCsJ13AoSYoyLWxZNa/fHV8QuBwBXDMPI5P1gCcbTGrJBNttIVk5efEin
 IASot7K71J7mCwvKj9jejzI7CAM/+lvKVoJfyoLnpmTbSf9JpnLCZ8TeB7gn4Yn/EBhvCvuD/
 xHAzR7Nd7f1KMZQbj1UujI4sE7Aslz+SkQPv3GTGZXc/T+y9AtC6emght

Am 23.11.24 um 18:58 schrieb Joshua Grisham:

> Den fre 22 nov. 2024 kl 21:25 skrev Kurt Borja <kuurtb@gmail.com>:
>> If there is a suitable platform device, your platform driver already has
>> an acpi_match_table, thus you can get your acpi_device with
>> ACPI_COMPANION or your handler with ACPI_HANDLER. Check [1] for an
>> example.
> Thank you Kurt! I looked into this and I think it makes more sense to
> me now. Also it seems the existing driver ideapad-laptop is also quite
> similar to this pattern and potentially a good reference, as well.
>
> One thing more that I have found while looking at it from this
> perspective now: in addition to the acpi_driver stuff, the driver is
> also creating and registering a totally new platform_device and that
> is currently the "interface" I have created (via sysfs) to control
> some of the settings (e.g. "start_on_lid_open" etc). After an initial
> local draft of the changes, it became apparent to me that even this
> extra platform_device is not needed, and everything can work from the
> existing ACPI device ID-based platform device (SAM0429:00, etc).
>
> The downside to this is that users with these devices will not have a
> fixed name for controlling some of these ACPI settings via sysfs
> attributes on the device (depending on which model, they will have a
> different platform device name). For example, like this (using
> existing platform_device):
>
> cat /sys/devices/platform/SAM0429\:00/start_on_lid_open
>
> Instead of this (creating new platform_device like currently exists in
> the code):
>
> cat /sys/devices/platform/samsung-galaxybook/start_on_lid_open
>
> I guess to me having this be based on ACPI Device ID and differing per
> device feels "less nice" compared to having a nice "user friendly"
> path that feels a bit more obvious. Is it preferred to just use the
> existing platform_device based on the ACPI device ID instead of
> creating a new "virtual" platform_device with a nicer name for
> purposes like settings sysfs attributes be more "user friendly" like
> this?
>
> Another alternative is that I could move these kind of sysfs
> attributes to driver attributes instead; then if I am guessing
> correctly then it would be like this:
>
> cat /sys/bus/platform/drivers/samsung-galaxybook/start_on_lid_open
>
> But then I do not know if having this kind of sysfs attribute (which
> actually will query and write values to the device itself using ACPI
> methods) feel correct as "driver" attributes ? Maybe it does not
> matter and I am just over thinking it :)
>
> Any preference on these two questions? Again, to recap:
> 1) Yes or no to create new platform_device even though one already
> exists with the ACPI device ID as it's name?

I advise against this, because if the driver somehow binds to multiple devices in the future
then creating a second platform device will fail (same name). So No.

> 2) If using existing platform_device, should these kind of sysfs
> attributes be under the dynamic device ID-based platform_device or is
> it ok / make sense to move them to driver attributes?

Driver attributes get created then the driver is registered, so this could lead to
various lifetime problems, so please use device attributes.

I suggest that you update the documentation of the driver to tell people that:

1. They should use udev for device discovery

and/or

2. They can find the attributes under /sys/bus/platform/drivers/<driver name>/<device name>/<attribute>

Thank,
Armin Wolf

>> [...]
