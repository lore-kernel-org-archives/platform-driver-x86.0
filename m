Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A12F49FD;
	Thu,  9 Jul 2026 05:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576212; cv=none; b=VbauJERa8mRE2VJUCmyTfeivme18waOJxlSMUcZXlC8WxfTICsB50DHSdGM07454AaVWKwYlRsQEGd7JYERlkgHeUAvJu3MNcFKOspSKZzt8rmv9FQHNRDZ46F7aY+VcEBXndRXdWMjxpJcY7taUJTTroh58blRnCfcOOhbT8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576212; c=relaxed/simple;
	bh=18cfuOqnpCYPVr4fvnLThniblSbA8URUhoW5FKjE0/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0ykg7dXT59v2GI8Voz88HcRdWwvQJtp5gxlYKeIwADj+c2hwvYSau1MIDcLJUmDMQRCvVIrb7HUOblr0myepxr6bME2rh0Rd9bEdEaUeb1jKKxXEoi5ksEpbrn9u/ZpK6qCutGEc1Qzv4GEPObzLDV+iDeBJlSDgiCn0PwRfQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ecM0DfPl; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ecM0DfPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783576187; x=1784180987; i=w_armin@gmx.de;
	bh=18cfuOqnpCYPVr4fvnLThniblSbA8URUhoW5FKjE0/8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ecM0DfPlOFZx3NNBWA5HzfnOsitmWaAgrLpomoGT2jt8WM6yuLSyQWar6Bn+8Kez
	 1zXZb2DRntyxwDnaH7vBITBl7uFzTKjXinUkkv4TqriuZrA37zlxzHUYd1WtOxnaX
	 H9MKSJ704mEH+XjdoRwyUpVod9QNh/9MYRyDT67rzw85okofgJNsiyZDkcUmOc1jo
	 Enz+v4We+rSFd6SN9m19PzKOoiOAAkAhYYojm5QzjT8uj0fhfJiW93Wg2W20tKwDa
	 E9yyGKiGThoaJ56DaLX72tyctI6ShtW/AqSJGzoI72HiDeSPKgLmQE9qKNMlYZgRB
	 DWpBC76yIV7H+MsCOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KYb-1xABs33jp3-0130Ow; Thu, 09
 Jul 2026 07:49:46 +0200
Message-ID: <a681b59d-1719-4a8e-9b75-e8317c899b27@gmx.de>
Date: Thu, 9 Jul 2026 07:49:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86: uniwill-laptop: Add keyboard backlight
 support
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260530170813.10166-1-W_Armin@gmx.de>
 <20260530170813.10166-2-W_Armin@gmx.de>
 <10e25d5c-7c50-45fd-a5a9-c06b087a89dd@tuxedocomputers.com>
 <aa39d060-5555-42bb-a4bb-d23e79f64d26@gmx.de>
 <1a91a9ff-8c81-4176-a6f2-fd2a6bc49820@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <1a91a9ff-8c81-4176-a6f2-fd2a6bc49820@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0o2FYelFlc8I6taKWnB+Dv76lcWZiplhR7ldeInAKmXBgYVVWA4
 /U6XKjHyAst7YnI7I6XZOTwOrQRAvCsJzHfkxN7SQlBW4CUqD5UUaSifZ9kKtvNyFsILvSG
 tpBZFnCkQHR081igym+csWylzKbxb0pBVOqHuWZ1bb71eEQLsmx9nubzd4+OAYLMchoZ6CJ
 Sx8Fws/KPMBDTaHzVZJGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rrmFkXn4m5g=;2JMLpI3lwQ0Q4w3Rq8+QTWdGHc0
 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
 fozKV6V3cstQYYwb6TIYBsdYeh3596

Am 08.07.26 um 22:15 schrieb Werner Sembach:

>
> Am 08.07.26 um 22:08 schrieb Armin Wolf:
>> Am 08.07.26 um 21:11 schrieb Werner Sembach:
>>
>>> Hi,
>>>
>>> Am 30.05.26 um 19:08 schrieb Armin Wolf:
>>>> Many Uniwill-based devices support either a white-only or fully
>>>> features RGB keyboard backlight. Add support for this feature
>>>> and handle the associated WMI events.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>> =C2=A0 .../admin-guide/laptops/uniwill-laptop.rst=C2=A0=C2=A0=C2=A0 |=
=C2=A0 13 +
>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c=C2=A0=C2=A0 | 392=
=20
>>>> +++++++++++++++++-
>>>> =C2=A0 2 files changed, 397 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst=20
>>>> b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>>> index 24b41dbab886..2b1e5da703a5 100644
>>>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>>> @@ -77,6 +77,19 @@ LED class device. The default name of this LED=20
>>>> class device is ``uniwill:multico
>>>> =C2=A0 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for=
=20
>>>> details on how to control the various
>>>> =C2=A0 animation modes of the lightbar.
>>>> =C2=A0 +Keyboard Backlight
>>>> +------------------
>>>> +
>>>> +The ``uniwill-laptop`` driver supports controlling the keyboard=20
>>>> backlight using the standard
>>>> +LED class interface. The default name of this LED class device is=20
>>>> ``uniwill:white:kbd_backlight``
>>>> +when the keyboard backlight supports only a single color, or=20
>>>> ``uniwill:multicolor:kbd_backlight``
>>>> +when the keyboard backlight supports RGB colors. The maximum=20
>>>> intensity for each color channel
>>>> +in RGB mode is 50.
>>>> +
>>>> +Keep in mind that due to hardware design choices, the driver does=20
>>>> not support the RGB value
>>>> +``0x000000`` (black), instead it will fall back to ``0x010101``=20
>>>> (faint white). In order to
>>>> +disable the keyboard backlight, the standard LED brightness=20
>>>> setting has to be used instead.
>>>> +
>>>> =C2=A0 Configurable TGP
>>>> =C2=A0 ----------------
>>>> =C2=A0 diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> index ab063ead45b9..fd040197b189 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> @@ -110,8 +110,31 @@
>>>> =C2=A0 #define EC_ADDR_BAT_CYCLE_COUNT_2=C2=A0=C2=A0=C2=A0 0x04A7
>>>> =C2=A0 =C2=A0 #define EC_ADDR_PROJECT_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x0740
>>>> +#define PROJECT_ID_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x00
>>>> +#define PROJECT_ID_GI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x01
>>>> +#define PROJECT_ID_GJ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x02
>>>> +#define PROJECT_ID_GK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x03
>>>> +#define PROJECT_ID_GICN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x04
>>>> +#define PROJECT_ID_GJCN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x05
>>>> +#define PROJECT_ID_GK5CN_X=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x06
>>>> +#define PROJECT_ID_GK7CN_S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x07
>>>> +#define PROJECT_ID_GK7CPCS_GK5CQ7Z=C2=A0=C2=A0=C2=A0 0x08
>>>> +#define PROJECT_ID_PF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x09
>>>> +#define PROJECT_ID_GK5CP_4X_5X_6X=C2=A0=C2=A0=C2=A0 0x0A
>>>> +#define PROJECT_ID_IDP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x0B
>>>> +#define PROJECT_ID_IDY_6Y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0C
>>>> +#define PROJECT_ID_IDY_7Y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0D
>>>> +#define PROJECT_ID_PF4MU_PF4MN_PF5MU=C2=A0=C2=A0=C2=A0 0x0E
>>>> +#define PROJECT_ID_CML_GAMING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0F
>>>> +#define PROJECT_ID_GK7NXXR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x10
>>>> +#define PROJECT_ID_GM5MU1Y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x11
>>>> =C2=A0 #define PROJECT_ID_PH4TRX1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x12
>>>> +#define PROJECT_ID_PH4TUX1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x13
>>>> +#define PROJECT_ID_PH4TQX1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x14
>>>> =C2=A0 #define PROJECT_ID_PH6TRX1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x15
>>>> +#define PROJECT_ID_PH6TQXX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x16
>>>> +#define PROJECT_ID_PHXAXXX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x17
>>>> +#define PROJECT_ID_PHXPXXX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x18
>>>> =C2=A0 =C2=A0 #define EC_ADDR_AP_OEM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0741
>>>> =C2=A0 #define=C2=A0=C2=A0=C2=A0 ENABLE_MANUAL_CTRL=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>> @@ -214,6 +237,7 @@
>>>> =C2=A0 #define FAN_TABLE_OFFICE_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(2)
>>>> =C2=A0 #define FAN_V3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3)
>>>> =C2=A0 #define DEFAULT_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>>>> +#define ENABLE_CHINA_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(6)
>>>> =C2=A0 =C2=A0 #define EC_ADDR_PL1_SETTING=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x0783
>>>> =C2=A0 @@ -225,11 +249,11 @@
>>>> =C2=A0 #define FAN_CURVE_LENGTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 5
>>>> =C2=A0 =C2=A0 #define EC_ADDR_KBD_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x078C
>>>> -#define KBD_WHITE_ONLY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(0)=C2=A0=C2=A0=C2=A0 // ~single color
>>>> -#define KBD_SINGLE_COLOR_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(1)
>>>> +#define KBD_WHITE_ONLY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>> +#define KBD_POWER_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>>>> =C2=A0 #define KBD_TURBO_LEVEL_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GENMASK(3, 2)
>>>> =C2=A0 #define KBD_APPLY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>>>> -#define KBD_BRIGHTNESS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 GENMASK(7, 5)
>>>> +#define KBD_BRIGHTNESS_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 GENMASK(7, 5)
>>>> =C2=A0 =C2=A0 #define EC_ADDR_FAN_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x078E
>>>> =C2=A0 #define FAN3P5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>>>> @@ -320,6 +344,9 @@
>>>> =C2=A0 #define LED_CHANNELS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 3
>>>> =C2=A0 #define LED_MAX_BRIGHTNESS=C2=A0=C2=A0=C2=A0 200
>>>> =C2=A0 +#define KBD_LED_CHANNELS=C2=A0=C2=A0=C2=A0 3
>>>> +#define KBD_LED_MAX_INTENSITY=C2=A0=C2=A0=C2=A0 50
>>>> +
>>>> =C2=A0 #define UNIWILL_FEATURE_FN_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>> =C2=A0 #define UNIWILL_FEATURE_SUPER_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(1)
>>>> =C2=A0 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>>>> @@ -333,6 +360,7 @@
>>>> =C2=A0 #define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(9)
>>>> =C2=A0 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 =
BIT(10)
>>>> =C2=A0 #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0=
 BIT(11)
>>>> +#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT=C2=A0=C2=A0=C2=A0 BIT(12)
>>>> =C2=A0 =C2=A0 enum usb_c_power_priority_options {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_CHARGING =3D 0,
>>>> @@ -344,6 +372,7 @@ struct uniwill_data {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_handle handle;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>>>> +=C2=A0=C2=A0=C2=A0 u8 project_id;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex battery_lock;=C2=A0=C2=A0=
=C2=A0 /* Protects the list of=20
>>>> currently registered batteries */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>>>> @@ -362,6 +391,18 @@ struct uniwill_data {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex led_lock;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Protects writes to the=20
>>>> lightbar registers */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_classdev_mc led_mc_cdev;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mc_subled led_mc_subled_info[LE=
D_CHANNELS];
>>>> +=C2=A0=C2=A0=C2=A0 bool single_color_kbd;
>>>> +=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_brightness;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int last_kbd_status;
>>>> +=C2=A0=C2=A0=C2=A0 union {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
* Protects writes to the RGB keyboard backlight=20
>>>> registers */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
truct mutex kbd_rgb_led_lock;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
truct led_classdev_mc kbd_led_mc_cdev;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
truct mc_subled=20
>>>> kbd_led_mc_subled_info[KBD_LED_CHANNELS];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_classdev kbd_l=
ed_cdev;
>>>> +=C2=A0=C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex input_lock;=C2=A0=C2=A0=
=C2=A0 /* Protects input sequence during=20
>>>> notify */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct input_dev *input_device;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct notifier_block nb;
>>>> @@ -376,6 +417,7 @@ struct uniwill_battery_entry {
>>>> =C2=A0 =C2=A0 struct uniwill_device_descriptor {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>>>> +=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_brightness;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Executed during driver probing */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*probe)(struct uniwill_data *data=
);
>>>> =C2=A0 };
>>>> @@ -427,6 +469,9 @@ static const struct key_entry uniwill_keymap[] =
=3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_KBDILLUMDOWN, { KEY_KBDILLUMDOWN }},
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_KBDILLUMUP, { KEY_KBDILLUMUP }},
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the EC changed the keyboa=
rd backlight=20
>>>> brightness */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BACKLI=
GHT_LEVEL_CHANGE, {=20
>>>> KEY_UNKNOWN }},
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to tog=
gle the microphone mute=20
>>>> status */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>> =C2=A0 @@ -435,11 +480,6 @@ static const struct key_entry=20
>>>> uniwill_keymap[] =3D {
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants=
 to toggle the brightness of=20
>>>> the keyboard */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_KBDILLUMTOGGLE, {=20
>>>> KEY_KBDILLUMTOGGLE }},
>>>> -=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KB_LED_LEVEL0, {=20
>>>> KEY_KBDILLUMTOGGLE }},
>>>> -=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KB_LED_LEVEL1, {=20
>>>> KEY_KBDILLUMTOGGLE }},
>>>> -=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KB_LED_LEVEL2, {=20
>>>> KEY_KBDILLUMTOGGLE }},
>>>> -=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KB_LED_LEVEL3, {=20
>>>> KEY_KBDILLUMTOGGLE }},
>>>> -=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KB_LED_LEVEL4, {=20
>>>> KEY_KBDILLUMTOGGLE }},
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: find out the exact me=
aning of those events */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL=
_OSD_BAT_CHARGE_FULL_24_H, {=20
>>>> KEY_UNKNOWN }},
>>>> @@ -547,6 +587,11 @@ static bool uniwill_writeable_reg(struct=20
>>>> device *dev, unsigned int reg)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_BLUE:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_BIOS_OEM:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_RGB_RED:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_RGB_GREEN:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_RGB_BLUE:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_BIOS_OEM_2:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_KBD_STATUS:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_OEM_4:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_CTRL:
>>>> @@ -583,8 +628,14 @@ static bool uniwill_readable_reg(struct device=
=20
>>>> *dev, unsigned int reg)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_BIOS_OEM:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_1:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_2:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SUPPORT_2:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_SWITCH_STATUS:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_RGB_RED:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_RGB_GREEN:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_RGB_BLUE:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_BIOS_OEM_2:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_KBD_STATUS:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_OEM_4:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_CTRL:
>>>> @@ -616,8 +667,10 @@ static bool uniwill_volatile_reg(struct device=
=20
>>>> *dev, unsigned int reg)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_BIOS_OEM:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_1:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_2:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SUPPORT_2:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_SWITCH_STATUS:
>>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_KBD_STATUS:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_OEM_4:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_USB_C_POWER_PRIORITY:
>>>> @@ -1441,6 +1494,246 @@ static int uniwill_led_init(struct=20
>>>> uniwill_data *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &init_data);
>>>> =C2=A0 }
>>>> =C2=A0 +static int uniwill_notify_kbd_led(struct uniwill_data *data, =
int=20
>>>> brightness)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev *led_cdev;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev =3D &data->kbd_l=
ed_cdev;
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev =3D &data->kbd_l=
ed_mc_cdev.led_cdev;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&led_cdev->led_access);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Sync the LED brightness with the actual hardwa=
re state */
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D led_update_brightness(led_cdev);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 led_classdev_notify_brightness_hw_changed(led_cde=
v, brightness);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +#define KBD_LED_MASK=C2=A0=C2=A0=C2=A0 (KBD_BRIGHTNESS_MASK | KBD_AP=
PLY |=20
>>>> KBD_POWER_OFF)
>>>> +
>>>> +static int uniwill_kbd_led_write_brightness(struct uniwill_data=20
>>>> *data, int brightness)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 /* KBD_POWER_OFF is always implicitly cleared */
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int regval =3D FIELD_PREP(KBD_BRIGHTNESS=
_MASK,=20
>>>> brightness) | KBD_APPLY;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* We must ensure that the "apply" bit is always =
written */
>>>> +=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->regmap, EC_ADDR_KB=
D_STATUS,=20
>>>> KBD_LED_MASK, regval);
>>>> +}
>>>> +
>>>> +static int uniwill_kbd_led_read_brightness(struct uniwill_data *data=
)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int regval;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STA=
TUS, &regval);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return min(FIELD_GET(KBD_BRIGHTNESS_MASK, regval)=
,=20
>>>> data->kbd_led_max_brightness);
>>>> +}
>>>> +
>>>> +static int uniwill_kbd_led_brightness_set(struct led_classdev=20
>>>> *led_cdev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum led_brig=
htness brightness)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(led_cd=
ev, struct=20
>>>> uniwill_data, kbd_led_cdev);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return uniwill_kbd_led_write_brightness(data, bri=
ghtness);
>>>> +}
>>>> +
>>>> +static enum led_brightness uniwill_kbd_led_brightness_get(struct=20
>>>> led_classdev *led_cdev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(led_cd=
ev, struct=20
>>>> uniwill_data, kbd_led_cdev);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return uniwill_kbd_led_read_brightness(data);
>>>> +}
>>>> +
>>>> +static const unsigned int=20
>>>> uniwill_kbd_led_channel_to_reg[KBD_LED_CHANNELS] =3D {
>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_RGB_RED,
>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_RGB_GREEN,
>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_RGB_BLUE,
>>>> +};
>>>> +
>>>> +static int uniwill_kbd_led_mc_brightness_set(struct led_classdev=20
>>>> *led_cdev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 enum led_brightness brightness)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *led_mc_cdev =3D lcdev_to_=
mccdev(led_cdev);
>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(led_mc=
_cdev, struct=20
>>>> uniwill_data, kbd_led_mc_cdev);
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int min_intensity =3D 0;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int regval;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->kbd_rgb_led_lock);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The EC interprets a RGB value of 0x000000=
 as a command to=20
>>>> restore
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the device-specfic default RGB value. Wor=
k around this by=20
>>>> writing
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * a RGB value of 0x010101 (faint white) ins=
tead.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 if (data->kbd_led_mc_subled_info[0].intensity =3D=
=3D 0 &&
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_i=
nfo[1].intensity =3D=3D 0 &&
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_i=
nfo[2].intensity =3D=3D 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min_intensity =3D 1;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < KBD_LED_CHANNELS; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regval =3D max(data->kbd_=
led_mc_subled_info[i].intensity,=20
>>>> min_intensity);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data=
->regmap,=20
>>>> uniwill_kbd_led_channel_to_reg[i], regval);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write_bits(data->regmap, EC_ADDR_T=
RIGGER,=20
>>>> RGB_APPLY_COLOR, RGB_APPLY_COLOR);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return uniwill_kbd_led_write_brightness(data, bri=
ghtness);
>>>> +}
>>>> +
>>>> +static enum led_brightness=20
>>>> uniwill_kbd_led_mc_brightness_get(struct led_classdev *led_cdev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *led_mc_cdev =3D lcdev_to_=
mccdev(led_cdev);
>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(led_mc=
_cdev, struct=20
>>>> uniwill_data, kbd_led_mc_cdev);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return uniwill_kbd_led_read_brightness(data);
>>>> +}
>>>> +
>>>> +static int uniwill_kbd_led_init(struct uniwill_data *data)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int color_indices[KBD_LED_CHANNELS] =3D =
{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_RED,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_GREEN,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_BLUE,
>>>> +=C2=A0=C2=A0=C2=A0 };
>>>> +=C2=A0=C2=A0=C2=A0 struct led_init_data init_data =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devicename =3D DRIVER_NA=
ME,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devname_mandatory =3D tr=
ue,
>>>> +=C2=A0=C2=A0=C2=A0 };
>>>> +=C2=A0=C2=A0=C2=A0 bool intensity_all_zeros =3D true;
>>>> +=C2=A0=C2=A0=C2=A0 bool needs_trigger =3D false;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int regval;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT=
_2, &regval);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!(regval & CHINA_MODE)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_set_bits(d=
ata->regmap, EC_ADDR_BIOS_OEM_2,=20
>>>> ENABLE_CHINA_MODE);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STA=
TUS, &regval);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 regval |=3D KBD_APPLY;
>>>> +=C2=A0=C2=A0=C2=A0 regval &=3D ~KBD_POWER_OFF;
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_KBD_ST=
ATUS, regval);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 switch (data->project_id) {
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF4MU_PF4MN_PF5MU:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TRX1:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TUX1:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TQX1:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TRX1:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TQXX:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXAXXX:
>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXPXXX:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =
=3D true;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =
=3D regval & KBD_WHITE_ONLY;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init_data.default_label =
=3D "white:"=20
>>>> LED_FUNCTION_KBD_BACKLIGHT;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.max_br=
ightness =3D=20
>>>> data->kbd_led_max_brightness;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.color =
=3D LED_COLOR_ID_WHITE;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.flags =
=3D LED_BRIGHT_HW_CHANGED |=20
>>>> LED_REJECT_NAME_CONFLICT;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.bright=
ness_set_blocking =3D=20
>>>> uniwill_kbd_led_brightness_set;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.bright=
ness_get =3D=20
>>>> uniwill_kbd_led_brightness_get;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return devm_led_classdev_=
register_ext(data->dev,=20
>>>> &data->kbd_led_cdev, &init_data);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < KBD_LED_CHANNELS; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_i=
nfo[i].color_index =3D=20
>>>> color_indices[i];
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data-=
>regmap,=20
>>>> uniwill_kbd_led_channel_to_reg[i], &regval);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Make sure that th=
e initial intensity value is not=20
>>>> greater than
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the maximum inten=
sity.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval > KBD_LED_MAX_=
INTENSITY) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
egval =3D KBD_LED_MAX_INTENSITY;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
et =3D regmap_write(data->regmap,=20
>>>> uniwill_kbd_led_channel_to_reg[i], regval);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n=
eeds_trigger =3D true;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
ntensity_all_zeros =3D false;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_i=
nfo[i].intensity =3D regval;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_i=
nfo[i].max_intensity =3D=20
>>>> KBD_LED_MAX_INTENSITY;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_i=
nfo[i].channel =3D i;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* See uniwill_kbd_led_mc_brightness_set() for an=
=20
>>>> explaination. */
>>>> +=C2=A0=C2=A0=C2=A0 if (intensity_all_zeros) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < KBD=
_LED_CHANNELS; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
ata->kbd_led_mc_subled_info[i].intensity =3D 1;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
et =3D regmap_write(data->regmap,=20
>>>> uniwill_kbd_led_channel_to_reg[i], 1);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needs_trigger =3D true;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (needs_trigger) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write_bits=
(data->regmap, EC_ADDR_TRIGGER,=20
>>>> RGB_APPLY_COLOR,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RGB_APPLY_COLOR);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(data->dev, &data->kbd_rgb=
_led_lock);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 init_data.default_label =3D "multicolor:"=20
>>>> LED_FUNCTION_KBD_BACKLIGHT;
>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.max_brightness =3D=
=20
>>>> data->kbd_led_max_brightness;
>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.color =3D LED_COLO=
R_ID_MULTI;
>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.flags =3D LED_BRIG=
HT_HW_CHANGED |=20
>>>> LED_REJECT_NAME_CONFLICT;
>>>> + data->kbd_led_mc_cdev.led_cdev.brightness_set_blocking =3D=20
>>>> uniwill_kbd_led_mc_brightness_set;
>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.brightness_get =3D=
=20
>>>> uniwill_kbd_led_mc_brightness_get;
>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.subled_info =3D data->kbd_l=
ed_mc_subled_info;
>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.num_colors =3D KBD_LED_CHAN=
NELS;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return devm_led_classdev_multicolor_register_ext(=
data->dev,=20
>>>> &data->kbd_led_mc_cdev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &init_data);
>>>> +}
>>>> +
>>>
>>> Sorry I know I'm way to late with my comment, but I'm not at all a=20
>>> fan of how complex this whole function is:
>>>
>>> - When we have to set max brightness on a per device basis anyway,=20
>>> we can also set rgb or white only there and can skip this whole=20
>>> detection mechanism with the supported bits that are unreliable anyway
>>>
>>> - we have a 2nd "supported devices/features list" inside this=20
>>> function which is abstracting away from the actual supported feature=
=20
>>> list
>>>
>>> Should i try to spin up something much simpler, but that requires=20
>>> explicit setting in the device descriptor?
>>>
>>> Best regards
>>>
>>> Werner
>>>
>> Good point, but in this case i think having this small device list is=
=20
>> OK, because the original control center
>> does something similar.
> yeah the original cc and tuxedo-drivers has these small lists all over=
=20
> the place ... also don't like it there
>> If we encounter a device that does not work with this strategy then=20
>> we can indeed
>> move the code into the device descriptor.
>
> later we might not be able to get the information anymore which=20
> devices are rgb and which are white only when the supported devices=20
> lists grows, then we are stuck to reading the feature bits.
>
> best regards,
>
> Werner
>
Good point, in this case using the device descriptor for this feature dete=
ction
might indeed be better in the long term.

Do you want to send the patches or should i do it?

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>>> =C2=A0 static unsigned int uniwill_sanitize_battery_threshold(unsigne=
d=20
>>>> int value)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 0 means "charging threshold not act=
ive" */
>>>> @@ -1789,6 +2082,31 @@ static int uniwill_notifier_call(struct=20
>>>> notifier_block *nb, unsigned long action
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysfs_notify(&=
data->dev->kobj, NULL, "fn_lock");
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return =
NOTIFY_OK;
>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_KB_LED_LEVEL0:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn NOTIFY_DONE;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errn=
o(uniwill_notify_kbd_led(data, 0));
>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_KB_LED_LEVEL1:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn NOTIFY_DONE;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errn=
o(uniwill_notify_kbd_led(data, 1));
>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_KB_LED_LEVEL2:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn NOTIFY_DONE;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errn=
o(uniwill_notify_kbd_led(data, 2));
>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_KB_LED_LEVEL3:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn NOTIFY_DONE;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errn=
o(uniwill_notify_kbd_led(data, 3));
>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_KB_LED_LEVEL4:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn NOTIFY_DONE;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errn=
o(uniwill_notify_kbd_led(data, 4));
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&da=
ta->input_lock);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sparse_keymap_=
report_event(data->input_device, action, 1,=20
>>>> true);
>>>> @@ -1842,6 +2160,7 @@ static int uniwill_ec_init(struct=20
>>>> uniwill_data *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 data->project_id =3D value;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(data->dev, "Project ID: %u\n",=
 value);
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_set_bits(data->r=
egmap, EC_ADDR_AP_OEM,=20
>>>> ENABLE_MANUAL_CTRL);
>>>> @@ -1885,6 +2204,7 @@ static int uniwill_probe(struct=20
>>>> platform_device *pdev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->features =3D device_descr=
iptor.features;
>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_max_brightness =3D=20
>>>> device_descriptor.kbd_led_max_brightness;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Some devices might need to per=
form some device-specific=20
>>>> initialization steps
>>>> @@ -1905,6 +2225,10 @@ static int uniwill_probe(struct=20
>>>> platform_device *pdev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_kbd_led_init(data);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_hwmon_init(data);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> @@ -1976,6 +2300,31 @@ static int uniwill_suspend_battery(struct=20
>>>> uniwill_data *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_AD=
DR_CHARGE_CTRL,=20
>>>> &data->last_charge_ctrl);
>>>> =C2=A0 }
>>>> =C2=A0 +static int uniwill_suspend_kbd_led(struct uniwill_data *data)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int regval;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STA=
TUS, &regval);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Save the current keyboard backlight setti=
ngs in order to=20
>>>> restore them
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * during resume. We cannot use the regmap c=
ode for that since=20
>>>> this register
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * needs to be declared as volatile because =
the brightness can=20
>>>> be changed
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * by the EC.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 data->last_kbd_status =3D regval;
>>>> +=C2=A0=C2=A0=C2=A0 FIELD_MODIFY(KBD_BRIGHTNESS_MASK, &regval, 0);
>>>> +=C2=A0=C2=A0=C2=A0 regval |=3D KBD_APPLY | KBD_POWER_OFF;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return regmap_write(data->regmap, EC_ADDR_KBD_STA=
TUS, regval);
>>>> +}
>>>> +
>>>> =C2=A0 static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *da=
ta)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>>>> @@ -2006,6 +2355,10 @@ static int uniwill_suspend(struct device *dev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_kbd_led(data);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_nvidia_ctgp(da=
ta);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> @@ -2052,6 +2405,23 @@ static int uniwill_resume_battery(struct=20
>>>> uniwill_data *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 }
>>>> =C2=A0 +static int uniwill_resume_kbd_led(struct uniwill_data *data)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_KBD_ST=
ATUS,=20
>>>> data->last_kbd_status | KBD_APPLY);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->regmap, EC_ADDR_TR=
IGGER,=20
>>>> RGB_APPLY_COLOR, RGB_APPLY_COLOR);
>>>> +}
>>>> +
>>>> =C2=A0 static int uniwill_resume_nvidia_ctgp(struct uniwill_data *dat=
a)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>>>> @@ -2096,6 +2466,10 @@ static int uniwill_resume(struct device *dev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_resume_kbd_led(data);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_resume_nvidia_ctgp(dat=
a);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> @@ -2745,6 +3119,8 @@ static int __init uniwill_init(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (force) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that=
 the device supports all features except=20
>>>> the charge limit */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descrip=
tor.features =3D UINT_MAX &=20
>>>> ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Some models only suppo=
rt 3 brightness levels */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.kbd_led=
_max_brightness =3D 4;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Enabl=
ing potentially unsupported features\n");
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>
