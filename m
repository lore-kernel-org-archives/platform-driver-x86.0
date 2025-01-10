Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762AE24B24E;
	Fri, 10 Jan 2025 23:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736551306; cv=none; b=TWcMVKKsuYvUixbw5MeeDQMF0r+jL2T72HTf4BXyBPzcNwWQH6YS2PaV9xdMWxcY0SVy8JdBu7RM5N7r1ubggQmQFHh42buqwT32kDjxbwgvlHoR/NO+sKYk9WKzipdX0HR+Un5OvzMMGPvc0SENimsU4nzom1C2EDkBf4GRZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736551306; c=relaxed/simple;
	bh=0/unKLqTtWewtQF/AeZfplzS5f1Nzs1QBrrNDOH4rMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5P64o1N7aCz8sj+D0HHm0e/Wfxe8zKp/3v6vfgXOsbuUGtF2GUOQCf5wr1V4K5IaPrdHOgMwZ9F2CMPQVFaYq+uq7SG6+zsupP9Q/IR9xPClWSLsOGsVx7caRxwzhQ7tQNd5Q0haXnZDpoM6ASS6nGryIfvanx+OF7bOIHEXJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UXTNydzH; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UXTNydzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736551281; x=1737156081; i=w_armin@gmx.de;
	bh=b4sQXy294JsdICeQ97YgmRB9uX1flkcf3Cas+hXV8j8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UXTNydzHzCWPxPDwNu8Dzjj4YCndSxfjI1qpR6I2DoXjPupbRc28QJUOSLQBxL+M
	 Wpr3vNsjpIMjGdIinEPTRi+OJInCcf+h/We3hWF+u3PxXkG7JWJm0fq8FORlQ/DCW
	 yBtNrE8BJJ6T6UaGgB8MepAGl5leVl8J08TEjOMqiPDWGGdasR5NpC4D5ZW4n6+nz
	 /7CTKskTc0ajhuDcy19XLDr7XMZ4ng3G+cUWnSY9nwmBqPWi1NWTs0kDY5t+BXZ4j
	 bt6mfzV5Tr5sUVsKwrvEhyx6yHJmAoowJx7XRD8TpFXzYujPlxzrsZdDMt2mYwpYs
	 r/exM7EnyP5Y2biJrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1tiiuk2Jax-008jZs; Sat, 11
 Jan 2025 00:21:21 +0100
Message-ID: <d43c32e0-a415-4e81-8966-3233cd34b4e7@gmx.de>
Date: Sat, 11 Jan 2025 00:21:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] platform/x86: Add lenovo-wmi drivers Documentation
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, aichao@kylinos.cn
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-2-derekjohn.clark@gmail.com>
 <a568a6b7-64d0-4ac1-86ed-19fd96887241@gmx.de>
 <CAFqHKTkkchsFOq2oZuuLNNxDuy9i5L-kpcD0+0_9NCNUxLirSA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKTkkchsFOq2oZuuLNNxDuy9i5L-kpcD0+0_9NCNUxLirSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WfLY5+n7O62qZpKOQmuYFtrW/x7hP241SzsYAjUD4LglnytYhG/
 R98E4LLDaOb7hdACRepNrij0XBA4U19f/pbJAamc+o4niSKU70Wlg4WXfyyiU49xurpFQg5
 Upl57GOzFWDo6gTOIhVsVpqvMPuvXGejjGMDdDMRtlHjIGRBdU4JeiJ/zkpz4JEAXuLyQQP
 AsqKch/7uGpjGoovxp7gQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4BbOlXygsFE=;LoQBEr8v7Xp1zYo1kHX0NVHhZb7
 avorV6Mq6PCvwbHokBKZTLHGcjSftNtbS7HTj1uvNvQIIkE7yR29kCqLewtTk0w3j0Q83ptmf
 i+QwOFGvU2zN4mYSEtaV8Vo31MX9z4PgndZPbTWvZsvfLvR59uUuRpI6z+TajGpOsLY/2yP90
 Mt5lozTQkcxmL5+qC9QPIqEFM21PKyPPo01W5drsTRbTtqSnJJ8xx6gTnjH774GlZY4fyNGFu
 ywx69BVULGkJ8nboqueNHsg+WlHYShGfEm8SdI3CFvfIPHtUaMad3ZwhrHth/poUbghZrT+Q4
 0IYN6/M26sFkJbxaQ6bvmQRqxjk7Ei2CYtLBRU3tF8RT730lKA/Ac5j0ksUAY47I40AWqSRnN
 zAFOgHt3moIdjef10qhGsbncWD0dVUZi+nB59g+iHcohra25JRvZJA6AmMQ/o8pF4aWXghkWt
 2yElB88igpaNAy/v1NE/AraXLVArs8nWlEQRIkoa5zEhe5fMO0SIASrc7oozjUjJPMeyQXc49
 3AdfmZcnUOXAOiLPHHtUKRrJUChV0u8TghqPurzmC43katCdX/jOAAv+Rgf+WBnRoGxlyHOIU
 tqse1apF6AuVRrrm00ubMfB6Sm32AeajQ96L8933dODfekNRYoExzOyFrkzujuOL5s4gjlwWx
 Xp8afNH2FQ/dKgRqKgddI5bTSwy0g98xnR6R9UFvL8ePOYytagpute9vYy4uQ4QMcuECzljs2
 0g1OH70db68N3gIpoTqOj056NCJYRc8Za2m3SBMPtAQmtqmtb6KnxeYcnwuiShtGTaNnLJ9Cp
 h0n7CrLjj/giJDqgxvgXyXLnrCIv/IKQMaVsQBAK6O6ckMYb7uGB6DHFevHMsE8ngB7BVW7CY
 Zmco92GjrrkJNMjgFil3xY2fCLY1yIHrGT3uukX+Wn5tLBbYLlQ8AnOcHj1k0vZ9dY4ne/J63
 V1G9GCsPZW09H4Tb022chLfbISBAWDa1SIsD3kyrzW/7gA4/1mlOXHnG0FODFlMlSi3PZrlrZ
 jYWF1ClPtrHxbJOu2m6SWBDbs2zdSuhqsT+vxmP8HMilNCenfVEDiXNG5nE6n6kB+lDUxjvp2
 0ELOQmdle4qcMVzIY4iBD7HkBhnOSc

Am 10.01.25 um 23:41 schrieb Derek John Clark:

> On Thu, Jan 9, 2025 at 1:37=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>>
>>> Adds documentation for all lenovo-wmi* drivers.
>> Hi,
>>
>> while i would prefer separate documentation files for each driver, grou=
ping them together for now
>> is also fine. We can split them later should the combined file become t=
o big.
> I don't have an issue with separating them. Once I add the MOF info
> this file will become large.

OK.

>>> v2:
>>> - Update description of Custom Profile to include the need to manually
>>>     set it.
>>> - Remove all references to Legion hardware.
>>> - Add section for lemovo-wmi-camera.c driver as it follows the same
>>>     naming convention.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>    Documentation/wmi/devices/lenovo-wmi.rst | 104 ++++++++++++++++++++=
+++
>>>    1 file changed, 104 insertions(+)
>>>    create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
>>>
>>> diff --git a/Documentation/wmi/devices/lenovo-wmi.rst b/Documentation/=
wmi/devices/lenovo-wmi.rst
>>> new file mode 100644
>>> index 000000000000..62c2ec9505bd
>>> --- /dev/null
>>> +++ b/Documentation/wmi/devices/lenovo-wmi.rst
>>> @@ -0,0 +1,104 @@
>>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>> +Lenovo WMI Interface Drivers (lenovo-wmi)
>> Since we are talking about multiple drivers, i suggest you change this =
line to:
>>
>>          Lenovo WMI Interface Drivers (lenovo-wmi-*)
>>
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Introduction
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +Lenovo WMI interfaces are broken up into multiple GUIDs, some of whic=
h
>>> +require cross-references between GUIDs for some functionality. The "C=
ustom
>>> +Mode" interface is a legacy interface for managing and displaying CPU=
 & GPU
>>> +power and hwmon settings and readings. The "Other Method" interface i=
s a
>>> +modern interface that replaces most "Custom Mode" interface methods. =
The
>>> +"GameZone" interface adds advanced features such as fan profiles and
>>> +overclocking. The "Lighting" interface adds control of various status
>>> +lights related to different hardware components.
>>> +
>>> +Each interface has a different data structure associated with it that
>>> +provides detailed information about each attribute provided by the
>>> +interface. These data structs are retrieved from additional WMI devic=
e
>>> +data block GUIDs:
>>> + - "Custom Mode" uses LENOVO_FAN_TABLE_DATA, LENOVO_FAN_TEST_DATA,
>>> +   LENOVO_CPU_OVERCLOCKING_DATA, LENOVO_DISCRETE_DATA, and
>>> +   LENOVO_GPU_OVERCLOCKING_DATA depending on the feature.
>>> + - "Other Method" uses LENOVO_CAPABILITY_DATA_00,
>>> +   LENOVO_CAPABILITY_DATA_01, and LENOVO_CAPABILITY_DATA_02 depending=
 on
>>> +   the feature.
>>> + - "GameZone" uses LENOVO_GAMEZONE_CPU_OC_DATA and
>>> +   LENOVO_GAMEZONE_GPU_OC_DATA depending on the feature.
>>> + - The "Lighting" interface uses LENOVO_LIGHTING_DATA.
>>> +
>>> +.. note::
>>> +   Currently only the "GameZone", "Other Method", and
>>> +   LENOVO_CAPABILITY_DATA_01 interfaces are implemented by these driv=
ers.
>>> +
>>> +GameZone
>>> +--------
>>> +WMI GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>> Please add the MOF of the WMI class here so that future developers know=
 which methods, etc
>> the WMI interface supports.
>>
> Ack
>
>>> +
>>> +The GameZone WMI interface provides platform-profile and fan curve se=
ttings
>>> +for devices that fall under the "Gaming Series" of Lenovo devices.
>>> +
>>> +The following platform profiles are supported:
>>> + - quiet
>>> + - balanced
>>> + - performance
>>> + - custom
>> Please add some technical documentation about the WMI methods used by t=
hose functions. You can take a look at
>> Documentation/wmi/devices/msi-wmi-platform.rst for inspiration.
>>
> Ack
>
>>> +
>>> +Custom Profile
>>> +~~~~~~~~~~~~~~
>>> +The custom profile represents a hardware mode on Lenovo devices that =
enables
>>> +user modifications to Package Power Tracking (PPT) settings. When an
>>> +attribute exposed by the "Other Method" WMI interface is to be modifi=
ed,
>>> +the GameZone driver must first be switched to the "custom" profile ma=
nually
>>> +or the setting will have no effect. If another profile is set from th=
e list
>>> +of supported profiles, the BIOS will override any user PPT settings w=
hen
>>> +switching to that profile.
>>> +
>>> +
>>> +Other Method
>>> +----------
>>> +WMI GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>>> +
>>> +The Other Method WMI interface uses the fw_attributes class to expose
>>> +various WMI attributes provided by the interface in the sysfs. This e=
nables
>>> +CPU and GPU power limit tuning as well as various other attributes fo=
r
>>> +devices that fall under the "Gaming Series" of Lenovo devices. Each
>>> +attribute exposed by the Other Method interface has corresponding
>>> +capability data blocks which allow the driver to probe details about =
the
>>> +attribute. Each attibute has multiple pages, one for each of the plat=
form
>>> +profiles managed by the "GameZone" interface. For all properties only=
 the
>>> +"Custom" profile values are reported by this driver to ensure any use=
rspace
>>> +applications reading them have accurate tunable value ranges. Attribu=
tes
>>> +are exposed in sysfs under the following path:
>>> +/sys/class/firmware-attributes/lenovo-wmi-other/attributes
>> Same as above.
>>
> Ack
>
>>> +
>>> +LENOVO_CAPABILITY_DATA_01
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +WMI GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
>>> +
>>> +The LENOVO_CAPABILITY_DATA_01 interface provides information on vario=
us
>>> +power limits of integrated CPU and GPU components.
>>> +
>>> +The following attributes are supported:
>>> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>>> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Trackin=
g
>>> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Trackin=
g
>>> +
>>> +Each attribute has the following properties:
>>> + - current_value
>>> + - default_value
>>> + - display_name
>>> + - max_value
>>> + - min_value
>>> + - scalar_increment
>>> + - type
>>> +
>>> +
>>> + Camera
>>> + ______
>> I get the following error when trying to build the documentation:
>>
>>          Sphinx parallel build error:
>>          docutils.utils.SystemMessage: /home/wolf/Dokumente/Kernel/plat=
form-drivers-x86/Documentation/wmi/devices/lenovo-wmi.rst:99: (SEVERE/4) U=
nexpected section title.
>>
>> Please fix this.
>>
>> Also please add some technical details here to. However in this case th=
is is optional since this patch series focuses
>> on the Gaming Series drivers.
> Since I'm splitting the files I'll drop this one and let Ai Chao (+cc)
> take care of that as the module author. I don't have any of the
> technical documentation for that interface.
>
> Thanks Armin,
> Derek

That is fine.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> + WMI GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
>>> +
>>> + The Camera driver provides WMI event notifications for camera button
>>> + toggling.
>>> +
