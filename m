Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B3A7F9;
	Thu,  2 Jan 2025 04:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735790488; cv=none; b=PayVA6DaAV8VoUg5Gt5Fhn+Cg3vvv98w/ccF2oQOieOfWX422NuKTCOrhpbqMXsCPXMqje11A+gnWKotqcPc31wYy4RKUhZa907/QP3gkXTA4pkBTXpqC5VvuDxKgZFmYt+d86uY3lk48ql22KcHMW1n7ggB0K8FkGi9cEnwSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735790488; c=relaxed/simple;
	bh=y7e8InLJruc+nW0Imex7SJeeBrIu/GaRV9Cb1nZBs14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZFNuuz5cd6afMEXgpLtoYbPKYPbd+ynAuTDjmXlgjQATn3Xgjz1FZB7CfhofJP9h6XRrJWF+x6TA0pbqECRD9o9J1s2w04/FXABeY8Zdr9RsZBNBtkiyopxALRGq8NWxAP4X2c0rn0eHrhrDJB4hbIr2xcFgFm/O9zqIhG0R7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnr1XvXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnr1XvXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8D1C4CED0;
	Thu,  2 Jan 2025 04:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735790485;
	bh=y7e8InLJruc+nW0Imex7SJeeBrIu/GaRV9Cb1nZBs14=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hnr1XvXiG2J2k1TJU4IkQDVecg6mZzd87a2JSm3DPHR7g2H8PnO/VojujHUIonji6
	 vDh94AeVAw0NCJU+Tx5Sm6hT1m1Mw8GW1kHd6T/5tbU0tzuEjxN1WfIemB//c9FheS
	 YXp0DlhcXI+M7n9X79AIJQwtLVR89bd8ps4Dzt88RB/M4KvGPhrq1YtivQ07rFyzsH
	 0gtzqSKTDbwaZ+BcCJGkN54DTBtyrmQJyXY8GqJJCzSbJGnNPVyMgcdLvs+6WYWvFi
	 EgMx2YwaH6wXc4H/Q9S8nx74JiMDXomndQYNrymdEHLb3qsJVc38bQTABc5Iy3Nmet
	 hCv0fbehuTDLQ==
Message-ID: <dc5375fb-1e2e-42b9-9174-3f4a70d914e7@kernel.org>
Date: Wed, 1 Jan 2025 22:01:22 -0600
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
Cc: Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250102004854.14874-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/1/25 18:47, Derek J. Clark wrote:
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
> 
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

I agree there needs to be /some/ sort of dependency.
One thing I was thinking you could do is use:

wmi_has_guid() to tell whether or not the "GZ" interface is even present 
from the "Other" driver.  Move the GUID for the GZ interface into a 
common header both drivers include.

However that only helps in the case of a system that supports custom but 
not GZ.  I think you still will need some sort of symbol to either get a 
pointer to the platform profile class or tell if the profile for the 
driver is set to custom.

I personally don't see a problem with a simple symbol like this:

bool lenovo_wmi_gamezone_is_custom(void);

You could then have your logic in all the store and show call a helper 
something like this:

static bool lenovo_wmi_custom_mode() {
	if (!wmi_has_guid(GZ_GUID)
		return true;

	if (!IS_REACHABLE(CONFIG_LENOVO_WMI_GAMEZONE))
		return true;

	return lenovo_wmi_gamezone_is_custom();
}

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

This is good to hear considering the concerns raised by some others.

But FWIW we have nothing in the firmware attributes API documentation 
that mandates what the firmware does for storage of settings across a 
power cycle so this is currently up to the platform to decide.

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

