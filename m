Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92B29A2;
	Thu,  2 Jan 2025 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735789571; cv=none; b=rypJALs5gL1Z/oWAMUydVidyaOiU1BewBcu4+d2YVkidCQOYClUsyu5n2LRxEyIynIjE5I+Hs+pDZhVIc5owCDH4iutIoRqL1lqyJTsYhepd7JWgq0AnOunUfz5H3U7/mrpqPdT8+e1fnkGOnnM9oVFvT2jdscCYX1TA0A8JOhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735789571; c=relaxed/simple;
	bh=+Rcy50iewJvYqGAzvWQQO23niLUs+XDnjYO4phK2mZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twxYw0VuB3pxyDtqyqM2KbrHRWOb60BTfmpF/yheLz1y9gWKtUWzLKU0vIbd9jt37tKoHcJazmEL/DfBvXTTHueml70xSj98mU6rSi5OJ+3yJ9uuylTJgu/yzp8saPsPWs22ftjF9kQbEz1mp7Q7MQhR9WK0pTEqIOkdw2DycLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVlgS8zc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVlgS8zc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D9BC4CED0;
	Thu,  2 Jan 2025 03:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735789571;
	bh=+Rcy50iewJvYqGAzvWQQO23niLUs+XDnjYO4phK2mZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OVlgS8zcgfqQ7HZTiRRn77lZUbyRDQ9s211ydGMtyJS0CvVFKfCMHgSzl6nq3n3iO
	 uMZ6r7JjyMzmKsaCzbxIew7tBEyVnfLRf3oL9UicOFZzdhYA5kfTs3/QAV0Oa4Jp35
	 82n5ueVITbjtcSFWUXt7oeHRbEhPQALotcao9UfeWCIOVjSPJ8pQZ8IcynLS4XY0Rj
	 Zm++VivWMLFC9sG6IV6MNsbaEUnGeKZHoJwrrz5hV4TBJIiocV8KjwMrQWbjgJDmNc
	 XstOifuSpQTpOF2ISIFAlHs355DNxyI1QF/XCdFvA+zn0IdBdeRwn8btSCAYTz9ARf
	 cWBv8eJGXFjTA==
Message-ID: <235a507a-2b60-4ca9-babe-a2f6ef085321@kernel.org>
Date: Wed, 1 Jan 2025 21:46:09 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] platform/x86: Add lenovo-wmi drivers Documentation
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
 <20250102004854.14874-2-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250102004854.14874-2-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/1/25 18:47, Derek J. Clark wrote:
> Adds documentation for all lenovo-wmi* drivers.
> 
> v2:
> - Update description of Custom Profile to include the need to manually
>    set it.
> - Remove all references to Legion hardware.
> - Add section for lemovo-wmi-camera.c driver as it follows the same
>    naming convention.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Reviewed-by: Mario Limonciello <superm1@kernel.org>

> ---
>   Documentation/wmi/devices/lenovo-wmi.rst | 104 +++++++++++++++++++++++
>   1 file changed, 104 insertions(+)
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi.rst b/Documentation/wmi/devices/lenovo-wmi.rst
> new file mode 100644
> index 000000000000..62c2ec9505bd
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi.rst
> @@ -0,0 +1,104 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +======================================================
> +Lenovo WMI Interface Drivers (lenovo-wmi)
> +======================================================
> +
> +Introduction
> +============
> +Lenovo WMI interfaces are broken up into multiple GUIDs, some of which
> +require cross-references between GUIDs for some functionality. The "Custom
> +Mode" interface is a legacy interface for managing and displaying CPU & GPU
> +power and hwmon settings and readings. The "Other Method" interface is a
> +modern interface that replaces most "Custom Mode" interface methods. The
> +"GameZone" interface adds advanced features such as fan profiles and
> +overclocking. The "Lighting" interface adds control of various status
> +lights related to different hardware components.
> +
> +Each interface has a different data structure associated with it that
> +provides detailed information about each attribute provided by the
> +interface. These data structs are retrieved from additional WMI device
> +data block GUIDs:
> + - "Custom Mode" uses LENOVO_FAN_TABLE_DATA, LENOVO_FAN_TEST_DATA,
> +   LENOVO_CPU_OVERCLOCKING_DATA, LENOVO_DISCRETE_DATA, and
> +   LENOVO_GPU_OVERCLOCKING_DATA depending on the feature.
> + - "Other Method" uses LENOVO_CAPABILITY_DATA_00,
> +   LENOVO_CAPABILITY_DATA_01, and LENOVO_CAPABILITY_DATA_02 depending on
> +   the feature.
> + - "GameZone" uses LENOVO_GAMEZONE_CPU_OC_DATA and
> +   LENOVO_GAMEZONE_GPU_OC_DATA depending on the feature.
> + - The "Lighting" interface uses LENOVO_LIGHTING_DATA.
> +
> +.. note::
> +   Currently only the "GameZone", "Other Method", and
> +   LENOVO_CAPABILITY_DATA_01 interfaces are implemented by these drivers.
> +
> +GameZone
> +--------
> +WMI GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> +
> +The GameZone WMI interface provides platform-profile and fan curve settings
> +for devices that fall under the "Gaming Series" of Lenovo devices.
> +
> +The following platform profiles are supported:
> + - quiet
> + - balanced
> + - performance
> + - custom
> +
> +Custom Profile
> +~~~~~~~~~~~~~~
> +The custom profile represents a hardware mode on Lenovo devices that enables
> +user modifications to Package Power Tracking (PPT) settings. When an
> +attribute exposed by the "Other Method" WMI interface is to be modified,
> +the GameZone driver must first be switched to the "custom" profile manually
> +or the setting will have no effect. If another profile is set from the list
> +of supported profiles, the BIOS will override any user PPT settings when
> +switching to that profile.
> +
> +
> +Other Method
> +----------
> +WMI GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> +
> +The Other Method WMI interface uses the fw_attributes class to expose
> +various WMI attributes provided by the interface in the sysfs. This enables
> +CPU and GPU power limit tuning as well as various other attributes for
> +devices that fall under the "Gaming Series" of Lenovo devices. Each
> +attribute exposed by the Other Method interface has corresponding
> +capability data blocks which allow the driver to probe details about the
> +attribute. Each attibute has multiple pages, one for each of the platform
> +profiles managed by the "GameZone" interface. For all properties only the
> +"Custom" profile values are reported by this driver to ensure any userspace
> +applications reading them have accurate tunable value ranges. Attributes
> +are exposed in sysfs under the following path:
> +/sys/class/firmware-attributes/lenovo-wmi-other/attributes
> +
> +LENOVO_CAPABILITY_DATA_01
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +WMI GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> +
> +The LENOVO_CAPABILITY_DATA_01 interface provides information on various
> +power limits of integrated CPU and GPU components.
> +
> +The following attributes are supported:
> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> +
> +Each attribute has the following properties:
> + - current_value
> + - default_value
> + - display_name
> + - max_value
> + - min_value
> + - scalar_increment
> + - type
> +
> +
> + Camera
> + ______
> + WMI GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
> +
> + The Camera driver provides WMI event notifications for camera button
> + toggling.
> +

