Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2059F1E9B16;
	Wed,  8 Jan 2025 23:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377784; cv=none; b=iTx4Y0HoKBWjnXnGfCGw6V7zDFbPXRbkzezAH03GeHcPs8QI9WPeMjdmmBSBpCqjLusLPaVAX9IzMWZmAdb4I/YYCOHhST5jTgXDEJ2yTa9xdGqZTpVKag4gw+0FT9HUYq/veiFEoOxKS2XDxIeE9ei5JIfg8qger7YcKVbXqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377784; c=relaxed/simple;
	bh=NOsBI3O+HXnGdC7DLBAcSaKs4qUvJwUqrFzzxMsIkEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wn7CYQjomBc3i+PNChqEftXCaA0LVd/ORk1ZJ9PAGVdW8SiPqB7V2Q1sFMjhHo9Y/H/mAj31XFVxiT3CrQf2zZ56fVdPdqWIeX2VwOPAcrU7obCPFPurGIqce+WiiuKKMzYVAzwD0J7PxJe39glDXX+0uHQZNOrR5uDLEU9uBVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tmpMp8bU; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tmpMp8bU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736377772; x=1736982572; i=w_armin@gmx.de;
	bh=Mn7gheQkcpzJOfE8xqSYTq1mOdfcFNhrLcysDB/2uWE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tmpMp8bU+0wNjjfnc7FCHlQjYfJDg9CBGrb6AivUSh+r3pHSer1bbINd1D3DN78M
	 BDIe91TL8V+KUNKhYPzfch7Kk0tnMQxz1DZ8ZtOAXLXskV0SneamH7efMXZsrzhkn
	 caMNuICDWjv3PTRmyEteR8imqkyqDIwlFuOLYtu+6gu54F60j0MrwAGeRLiE6okDZ
	 xWdKen9Ee64SgA9lX9UfCMH6Yy9DCl26/cqdSmzOkFgidALAkBxD6PNpnl2hzv2dL
	 jNUHAdIIZwN9kMHAXQMjTDAK9FLicvrDdNZv0C3uVs5CMi/Oq4bWkpWfJ1Cj2JcPW
	 yqkMsGEsX1/NkThXAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVHe-1tBwSx3mAq-00Xl3r; Thu, 09
 Jan 2025 00:09:32 +0100
Message-ID: <2b0b4873-978d-4e1d-915c-e41615780d8f@gmx.de>
Date: Thu, 9 Jan 2025 00:09:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] platform/x86: Add Lenovo Gaming Series WMI Drivers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250102004854.14874-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:zN1k2H0TMfx9lYtVa69KRKS/EREqHuPyqgyXDgeHhnpDsrcPxrm
 q1LyotO50p7Am92q4CeiA7ttO0P5322pt/33kAjyZG6WnNzGgcDxVfR+YaE399ONEq48uV0
 s2nxgBBFxe08rg6OQj2iUZu1neWbFH/COy8OJLag5aYog7foZ2uGG6jHccJ2tSxHyEDuqzC
 Fj8G9YpwYUg8dk2rz15jg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LLISGIUkUWs=;3IJA+ap4iQxwX4uPTmU7U8a/Wua
 IYtUy4RX1lEec3GkCCArY1s0nOKoA0cJDkYxDWcHfDh3+bSiNKR9oXwrDKXVvf/ceq7JR6EBm
 6m0k3gZhWsUhnqbWYBMRQWr13BHf/RqF8mUAOePFXo/P2Lh1bGnRmEm5zXjF7Mgc9R7rWbrqw
 VcDqEttBWEiC7PGTtel5VMcVmWqxnynzi7EmU5ow19j+3nKQgX/UlZ7xKWSfg9+6Lp+B37sEN
 pTIAVuvdXsdSEcvdVow8qNnTeTy1uDwk4R0Hzigb2rxefRF9ss5MMw0EdiNMUzwjmhesbNy3C
 Cxzz5RhYW5ikb9XnApdiCtLYQQDoGwzxe/995qrt9I06PfSWG7V3NGs1zXLBxXc7zbPivYdMf
 bxG+EmgWPKjIcpKXZ/RDsdv3SC/gQsZfVwnzaLwJ5byQytV6AX8qU831xV1mppRJo+1OoWdbZ
 6FslmPb1hpdtfqomQN7lTfj9T8o4uCQjzp8+QM181aHx8ihDRs0Z7bX2MrA8TNdIqDnRZg+WT
 BUQf+ZurpG3yJRT/X/kexQWRRs4euiulwU364ks4ZYm0NHhwR8E/nQEDXnkq3p60I6bp6vNA7
 se7faByJNZlJSspy/ojLZe25fLPBBdrOWMZdQc4TkFWOsv/53emU/8UhNlYHr+m8+/9ribF4I
 rIUPCp5/6+SNN3+45v1H5E+XhlpcXmjw0LCSlDfVw+GxgqjCHorh5clgi8+Xd2nmReF/td58U
 vMoF2DyidSLmDzrUTpjAC8S0JGjtgdgOf3hY0p+JwiAtEEbgR3BkqcltciM8yhTLvcijwIfR5
 C8nLLhn5WQeLvYB6MEtNXGWKTTPfYhVkPfeYWiv03yUT2UZb1Iux5hlMY4XReBnXXFr1ctR2Y
 trrf1O+ZSrmWqDD8AEpUZYBEU0LGiUWIG3hCfLAIYRQ0iCR4COYiOFLvzNOugxEwRw6wi+geV
 bNfX9xsIRkb5VG0Qt3WMS2IUC3fdSv95xGv4+wv03KP6B9Gj0/gJhknWf/0n71RxKE9s+TYLf
 2URsO3gI9ucvcMjiL2gsAu6PB4Jj9xornQgxwBlznqnQu5UmER5cIvfzncx+dx3yBiX0xBTHv
 Wj/MUx1xFVntAUYwgCWD0nLbKFxyll

Am 02.01.25 um 01:47 schrieb Derek J. Clark:

> Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> WMI interfaces that control various power settings. There are multiple WMI
> interfaces that work in concert to provide getting and setting values as
> well as validation of input. Currently only the "GameZone", "Other
> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> I attempted to structure the driver so that adding the "Custom Mode",
> "Lighting", and other data block interfaces would be trivial in a later
> patches.
>
> This driver is distinct from, but should be considered a replacement for
> this patch:
> https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/
>
> This driver attempts to standardize the exposed sysfs by mirroring the
> asus-armoury driver currently under review. As such, a lot of
> inspiration has been drawn from that driver.
> https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/
>
> The drivers have been tested by me on the Lenovo Legion Go.

Sorry for taking a bit long to respond, i am currently a bit busy.

I will try to review this series till the next weekend.

Thanks,
Armin Wolf

> v2:
> - Broke up initial patch into a 4 patch series.
> - Removed all references to "Legion" in documentation, Kconfig,
>    driver structs, functions, etc. Everything now refers either to the
>    interface being used or the Lenovo "Gaming Series" of laptop hardware.
> - Fixed all Acked changes requested by Mario and Armin.
> - Capability Data is now cached before kset creation for each attribute.
>    If the lenovo-wmi-capdata01 interface is not present, fails to grab
>    valid data, doesn't include the requested attribute id page, or the
>    data block indicates the attribute is not supported, the attribute will
>    not be created in sysfs.
> - The sysfs path for the firmware-attributes class was moved from
>    lenovo-legion-wmi to lenovo-wmi-other.
>
> - The Other Mode WMI interface no longer relies on gamezone as
>    discussed. However; this creates a problem that should be discussed
>    here. The current_value attribute is now only accurate when the
>    "custom" profile is set on the device. Previously it would report the
>    value from the Capability Data 01 instance related to the currently
>    selected profile, which reported an accurate accounting of the current
>    system state in all cases. I submitted this as-is since we discussed
>    removing that dependency, but I am not a fan of the current_value
>    attribute being incorrect for 3 of the 4 available profiles, especially
>    when the data is available. There is also no way to -ENOTSUPP or
>    similar when not in custom mode as that would also require us to know
>    the state of the gamezone interface. What I would prefer to do would be
>    to make the gamezone interface optional by treating custom as the
>    default mode in the current_value functions, then only update the mode
>    if a callback to get the current fan profile is a success. That way the
>    logic will work with or without the GameZone interface, but it will be
>    greatly improved if it is present.
>
> - I did extensive testing of this firmware-attributes interface and its
>    ability to retain the value set by the user. The SPL, SPPT, FPPT, and
>    platform profile all retain the users last setting when resuming from
>    suspend, a full reboot, and a full shutdown. The only time the values
>    are not preserved is when the user manually selects a new platform
>    profile using either the pprof interface or the manual selection
>    button on the device, in which case you would not expect them to be
>    retained as they were intentionally changed. Based on the previous
>    discussion it may be the case that older BIOS' will preserve the
>    settings even after changing profiles, though I haven't confirmed
>    this.
>
> v1:
> https://lore.kernel.org/platform-driver-x86/CAFqHKTna+kJpHLo5s4Fm1TmHcSSqSTr96JHDm0DJ0dxsZMkixA@mail.gmail.com/T/#t
>
> Suggested-by: Mario Limonciello <superm1@kernel.org>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>
> Derek J. Clark (4):
>    platform/x86: Add lenovo-wmi drivers Documentation
>    platform/x86: Add Lenovo GameZone WMI Driver
>    platform/x86: Add Lenovo Capability Data 01 WMI Driver
>    platform/x86: Add Lenovo Other Mode WMI Driver
>
>   Documentation/wmi/devices/lenovo-wmi.rst    | 104 ++++++
>   MAINTAINERS                                 |   9 +
>   drivers/platform/x86/Kconfig                |  34 ++
>   drivers/platform/x86/Makefile               |   3 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.c  | 203 +++++++++++
>   drivers/platform/x86/lenovo-wmi-other.c     | 385 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi.h           | 241 ++++++++++++
>   8 files changed, 1110 insertions(+)
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi.h
>
