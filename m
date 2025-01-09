Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C921FDE18;
	Thu,  9 Jan 2025 21:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458611; cv=none; b=VVPo6ZXZb0GV3tzZmoIpjbjeQgec33Ckc38OdyM9SQwKjJusUUw4TQ0DqJkls1YkpaZarOfOeX5OPc1WNUL6wsjLDBlTPipw1635BZ6Avv1KXGFmxNwGrNFnvVshdI8KB+qCpltFkAOUarzrFOoEWKf+ag8Vgzv7U8DHCxOyj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458611; c=relaxed/simple;
	bh=l0RB3I6i0T0OuPbfF0kh733DwnxZ6N585tNMBOTxZOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHBIOVVlooXyD1LFlM45YJst4X+Hm/qOAgkA2/XFt3G3n5bFT4hdTkMw420kd62G5E+dS0uaepq2CGe3TMCNH8U9dOOhmiN6j3dV7O5Umy5WHac/PnalK3vY6T50lvuRUduSYXBDH91O+2N/6LDDYIUjX7MWosBGiU43W6pvfnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Iw0dxFzN; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Iw0dxFzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736458603; x=1737063403; i=w_armin@gmx.de;
	bh=YCCSeRUB1/hYEH3xu7zZfCUwidZ1F3t39g2toAPUydE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Iw0dxFzN1ULStl5OLdcyDAUKY5SlkuKHjwyrlkqgse0UAEYIxoWTMAJ24pcpyNCe
	 voejhVjJA3MlneJ3KgtRe6UZzK2M3NF5WSQrlOhYTj+BN3ROkz4ra4jitEFIqy9r+
	 AfCJajDbXkpqfWUijQxkvrGacIwl/qmBZ6KTUZj+FJObbHRTs+6S1vfijG3kQLni7
	 34aqmqfbbOX/lPs3P0DyaeDy50GvP2LqypDfQxT1Moil6QvJSCaONq+uiGnffJuVT
	 a8vbKlYUhM9bi/MKifN8AKujIdVeEmnrChM6J+Kqu5/IUEwR3/J1I67ypE+RS6VIE
	 +niLu4ClR7xBJooYUg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1tfO7l0Vhy-004a3z; Thu, 09
 Jan 2025 22:36:43 +0100
Message-ID: <a568a6b7-64d0-4ac1-86ed-19fd96887241@gmx.de>
Date: Thu, 9 Jan 2025 22:36:38 +0100
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
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-2-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250102004854.14874-2-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:aYz5rokSvJejkIBe64J58f6Hfo78eO1R0+gscn6vp0tJhlyl35U
 bbQBS1hyzIf39BO+DoN4kejE3mL+5CpdF1hIZaJBa0hlagIAVNIfYeBbuhRjSGI8scWlxd9
 Wo5ZlKyFgZf1Tko+J4qRfRgoO1trY/w6+7r1h2XCZIXn3plP47iBIUTVcaiRMp9t5KDgozS
 HBLv07/LSYGBamzX7ZHkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9WGyMRjH/DU=;GVQ58EwSwUC6VZVu4Qs0q74M4QL
 fe5/KzD5XZ449LVNR30bco4/1U5qfdpcrolkwN8aPcodE7vgJgcIPqVsaTgSTsFLHq3gaUHpc
 vAEuGgB9Z/8iD+hbE91Nlv95PA1OnmvC4DFVhb5EFdIJYDkrEaheDz5x42Y0We+vkBvJ54sg5
 5bpjNrA6dm7FBsOKMNcRVbbsFsDSttMmxeirr42QfH5kM2v7Xq8d+Q33iPyGNqhtA3rRjk3kG
 nfHUqEh6dr5AcEOdi7LXcwb5/t9QnJovfQ46NvCLHA+CYxcsftUz5mdlpVNmChGyIVXaRfDeG
 l9pEN+Md2PPbu3+kJYiB9YW5sgtC+4J280xiTl1c28+nCNrX/rZdKZrlwaHLONKhBBzuvdcLA
 Iauu8EZ55dJNzTdoTc0hhSoeI/7+cNzz6ek8SirhikzoCYxxZWBetoltx92Pp/9i/m3AtWXJ+
 WWVTJjYJzOxGVCj3YH2ijx9aUPh1TUXwgwYNVj+6eLEOtoB0hANgRtTM8kqi4DyShXEdVrR5j
 mZrmjFohPS6rSe72SdcgEk1ODXNdWXqgXC5UAt7EtHPYfvMmqu7GiZdjWbm7QEf/okTK0Cp2b
 JGVgp0mh+QftlW+llEjMquP6f2EHMPDfRZ0OWONR7Ap1K32zZi7ytzhK9kqezUVhIo2tKaQvB
 aUTn5MYo9d/54H5WrObin20O9WsCqzxTFWfHuglACIJ05IxXuF2ZzQGyJWzGl/1VWrQAZtasH
 Y10PT6imeJj16Sq597OehVwIEa6WJRhFCoKyDjqR2NS9aoEHZoKXhW+1de/VYDCGPBgDpw42F
 e7CTUQEPy2BocgZhwObjztzEGnB4hnPF5ZgQrns7UTS2cztUcAIcKAc1p+W6kWlYEQvgxqy7r
 25/+p0cAB8f9BsNAUN9HfK+bfj7U6yNfBw/Ei7t6/y6+lTrGIgLjiQrRTHXZ48INVtQj3dhAz
 cNIYH2h33t9QqPrZrwWbdOygW0EgGRlVGyQRD3y7Uc4ZM6jOFSskZVfWkWHS0MZTIXFm11F7w
 czEHf00FpDFu0POlmumdaUpKopmBOKFuDnmjikbRm+owwHKtNqZDEKEJpcnFPZ/1idznErLL/
 H6c8r1pMBY2trov81BwpD5tDtdqF5p

Am 02.01.25 um 01:47 schrieb Derek J. Clark:

> Adds documentation for all lenovo-wmi* drivers.

Hi,

while i would prefer separate documentation files for each driver, grouping them together for now
is also fine. We can split them later should the combined file become to big.

>
> v2:
> - Update description of Custom Profile to include the need to manually
>    set it.
> - Remove all references to Legion hardware.
> - Add section for lemovo-wmi-camera.c driver as it follows the same
>    naming convention.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
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

Since we are talking about multiple drivers, i suggest you change this line to:

	Lenovo WMI Interface Drivers (lenovo-wmi-*)

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

Please add the MOF of the WMI class here so that future developers know which methods, etc
the WMI interface supports.

> +
> +The GameZone WMI interface provides platform-profile and fan curve settings
> +for devices that fall under the "Gaming Series" of Lenovo devices.
> +
> +The following platform profiles are supported:
> + - quiet
> + - balanced
> + - performance
> + - custom

Please add some technical documentation about the WMI methods used by those functions. You can take a look at
Documentation/wmi/devices/msi-wmi-platform.rst for inspiration.

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

Same as above.

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

I get the following error when trying to build the documentation:

	Sphinx parallel build error:
	docutils.utils.SystemMessage: /home/wolf/Dokumente/Kernel/platform-drivers-x86/Documentation/wmi/devices/lenovo-wmi.rst:99: (SEVERE/4) Unexpected section title.

Please fix this.

Also please add some technical details here to. However in this case this is optional since this patch series focuses
on the Gaming Series drivers.

Thanks,
Armin Wolf

> + WMI GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
> +
> + The Camera driver provides WMI event notifications for camera button
> + toggling.
> +
