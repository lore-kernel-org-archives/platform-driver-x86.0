Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9121ADB7;
	Fri, 10 Apr 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775857640; cv=none; b=IzcEATsyWkZ5SPvrW1kp7ECdx0j86Coy48NO64JxPsewAXYrYxb036r3nnx8FjUgHywtQvrhaHVOe5lGELcEZb/O/e8u06xGLvn4IaWPamRT64LWii1CHAIyZPph/HSQodIsm+ybQVNZHsaro3XPNIfCKsntDSvHlAzXabdnHHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775857640; c=relaxed/simple;
	bh=sZHRoUEGrSnuQpMo3KzOQVXx8a4BE/CH/3u8zu8O75A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTUBQi20IErevUFsXLeIy8biN7+2t2PFRi8HhA1ij8SVvMPA+ab2Sb2cEvkmRAkZrx57eUjaR8E1zEBwE/dvOzzEyJ9KNApPpzUTyHLVAiFK42LKgjsWRLQJZ2P+tkx+AYQJENE03Mcx4Hbnymxojv6mP4UTrHgWbPEw9OazE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ufFiTgL/; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ufFiTgL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775857629; x=1776462429; i=w_armin@gmx.de;
	bh=sZHRoUEGrSnuQpMo3KzOQVXx8a4BE/CH/3u8zu8O75A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ufFiTgL/UubmeHfNDISmOOo7ms8FhiBkRsUeB9weiSPhu/S3SDas233hIu4Ovv2V
	 a+N4grpE3b6/OKHTZtbqcx633CTxXCUNhU+SLj819HrKHlr+nTPLeDiP1kxJL5ig9
	 Wko1ouin2K46fbATCccqdSUNQUDvutXzf15Pm1AO1BQMcmclER0LBMfJ9UaoCsRlg
	 ve/Pq+YjlcjYJM4Y6ujYd3gkqqWAugUZ8bYWXxMTARTm6CHUe2ucGz5H8Ww3GpBBn
	 +GaIAbiC4LONSDjpjLxLZkjT9LcUjcvyyvtL2WOvHOxcqZhpaX08cUn6NfOce2dRK
	 8NglTEU1uwTayFH6oA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTAFh-1w1ZZr3izH-00RkCW; Fri, 10
 Apr 2026 23:47:08 +0200
Message-ID: <6247044d-f6e0-4173-b69b-82bd6abfafd9@gmx.de>
Date: Fri, 10 Apr 2026 23:47:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] platform/x86: uniwill-laptop: Add support for battery
 charge modes
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-7-W_Armin@gmx.de>
 <520b2905-1120-4375-9333-05f0eb82fe19@tuxedocomputers.com>
 <96d39ecd-5204-4b5a-96d6-0160f1910d71@gmx.de>
 <a097f57a-e412-4a00-8095-c2feeb096173@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <a097f57a-e412-4a00-8095-c2feeb096173@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XL49ayJcYWmXVZUKf+z/y9pKZiDUTxyk7ixEPW/KxrFU1EvKh/c
 v0NWTgSZf2tAQ6mxoNKwgTqyDLqLTiWR6MshXKIZyIHNkdF+sL3fJ3gJ/EFt0liclZv5pDJ
 4g5wUO0HH2y9FGG9wFMxtfaVkHGB768gKlq5DnSMsg7FWYMptxJS6ixKuejXHSK0SoaG88T
 7jwNlEPtk0vGF35O76paQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qi5AL0okbXY=;PmKdauBvOg5+3G3aVGX72HGY6rM
 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
 qxWq6laqKGYclNxvm3doA66+sOVhGNie4AHc=

Am 10.04.26 um 22:24 schrieb Werner Sembach:

>
> Am 10.04.26 um 19:53 schrieb Armin Wolf:
>> Am 10.04.26 um 18:53 schrieb Werner Sembach:
>>
>>> Hi Armin,
>>>
>>> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>>>> Many Uniwill-based devices do not supports the already existing
>>>> charge limit functionality, but instead support an alternative
>>>> interface for controlling the battery charge algorithm.
>>>>
>>>> Add support for this interface and update the documentation.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>> =C2=A0 .../admin-guide/laptops/uniwill-laptop.rst=C2=A0=C2=A0=C2=A0 |=
=C2=A0 25 +-
>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c=C2=A0=C2=A0 | 244=
=20
>>>> ++++++++++++++----
>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
>>>> =C2=A0 3 files changed, 226 insertions(+), 48 deletions(-)
>>>>
>>>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst=20
>>>> b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>>> index 561334865feb..24b41dbab886 100644
>>>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>>>> @@ -43,9 +43,23 @@ Support for changing the platform performance=20
>>>> mode is currently not implemented.
>>>> =C2=A0 Battery Charging Control
>>>> =C2=A0 ------------------------
>>>> =C2=A0 -The ``uniwill-laptop`` driver supports controlling the batter=
y=20
>>>> charge limit. This happens over
>>>> -the standard ``charge_control_end_threshold`` power supply sysfs=20
>>>> attribute. All values
>>>> -between 1 and 100 percent are supported.
>>>> +.. warning:: Some devices do not properly implement the charging=20
>>>> threshold interface. Forcing
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 the driver to enable access to said interface on such=20
>>>> devices might damage the
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 battery [1]_. Because of this the driver will not=20
>>>> enable said feature even when
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 using the ``force`` module parameter. The charging=20
>>>> profile interface will be
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 available instead.
>>>> +
>>>> +The ``uniwill-laptop`` driver supports controlling the battery=20
>>>> charge limit. This either happens
>>>> +over the standard ``charge_control_end_threshold`` or=20
>>>> ``charge_types`` power supply sysfs attribute,
>>>> +depending on the device. When using the=20
>>>> ``charge_control_end_threshold`` sysfs attribute, all values
>>>> +between 1 and 100 percent are supported. When using the=20
>>>> ``charge_types`` sysfs attribute, the driver
>>>> +supports switching between the ``Standard``, ``Trickle`` and=20
>>>> ``Long Life`` profiles.
>>>> +
>>>> +Keep in mind that when using the ``charge_types`` sysfs attribute,=
=20
>>>> the EC firmware will hide the
>>>> +true charging status of the battery from the operating system,=20
>>>> potentially misleading users into
>>>> +thinking that the charging profile does not work. Checking the=20
>>>> ``current_now`` sysfs attribute
>>>> +tells you the true charging status of the battery even when using=20
>>>> the ``charge_types`` sysfs
>>>> +attribute (0 means that the battery is currently not charging).
>>>> =C2=A0 =C2=A0 Additionally the driver signals the presence of battery=
=20
>>>> charging issues through the standard
>>>> =C2=A0 ``health`` power supply sysfs attribute.
>>>> @@ -70,3 +84,8 @@ The ``uniwill-laptop`` driver allows to set the=20
>>>> configurable TGP for devices wit
>>>> =C2=A0 allow it.
>>>> =C2=A0 =C2=A0 See Documentation/ABI/testing/sysfs-driver-uniwill-lapt=
op for=20
>>>> details.
>>>> +
>>>> +References
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +.. [1]=20
>>>> https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidden_=
function_discovered_on/
>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> index a116e2ec6453..fbf2e101a074 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> @@ -254,6 +254,10 @@
>>>> =C2=A0 =C2=A0 #define EC_ADDR_OEM_4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x07A6
>>>> =C2=A0 #define OVERBOOST_DYN_TEMP_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>>>> +#define CHARGING_PROFILE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 GENMASK(5, 4)
>>>> +#define CHARGING_PROFILE_HIGH_CAPACITY=C2=A0=C2=A0=C2=A0 0x00
>>>> +#define CHARGING_PROFILE_BALANCED=C2=A0=C2=A0=C2=A0 0x01
>>>> +#define CHARGING_PROFILE_STATIONARY=C2=A0=C2=A0=C2=A0 0x02
>>>> =C2=A0 #define TOUCHPAD_TOGGLE_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(6)
>>>> =C2=A0 =C2=A0 #define EC_ADDR_CHARGE_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x07B9
>>>> @@ -320,13 +324,15 @@
>>>> =C2=A0 #define UNIWILL_FEATURE_SUPER_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(1)
>>>> =C2=A0 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>>>> =C2=A0 #define UNIWILL_FEATURE_LIGHTBAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(3)
>>>> -#define UNIWILL_FEATURE_BATTERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>>>> -#define UNIWILL_FEATURE_CPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(5)
>>>> -#define UNIWILL_FEATURE_GPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(6)
>>>> -#define UNIWILL_FEATURE_PRIMARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(7)
>>>> -#define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(8)
>>>> -#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 BIT(9)
>>>> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(1=
0)
>>>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT=C2=A0=C2=A0=C2=A0 BIT(4=
)
>>>> +/* Mutually exclusive with the charge limit feature */
>>>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_MODES=C2=A0=C2=A0=C2=A0 BIT(5=
)
>>>> +#define UNIWILL_FEATURE_CPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(6)
>>>> +#define UNIWILL_FEATURE_GPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(7)
>>>> +#define UNIWILL_FEATURE_PRIMARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(8)
>>>> +#define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(9)
>>>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 BIT(10=
)
>>>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(1=
1)
>>>> =C2=A0 =C2=A0 enum usb_c_power_priority_options {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_CHARGING =3D 0,
>>>> @@ -339,8 +345,15 @@ struct uniwill_data {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>>>> -=C2=A0=C2=A0=C2=A0 unsigned int last_charge_ctrl;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex battery_lock;=C2=A0=C2=A0=
=C2=A0 /* Protects the list of=20
>>>> currently registered batteries */
>>>> +=C2=A0=C2=A0=C2=A0 union {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
* Protects writes to last_charge_type */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
truct mutex charge_type_lock;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
num power_supply_charge_type last_charge_type;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int last_charge_=
ctrl;
>>>> +=C2=A0=C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool last_fn_lock_state;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool last_super_key_enable_state;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool last_touchpad_toggle_enable_state=
;
>>>> @@ -447,6 +460,12 @@ static inline bool=20
>>>> uniwill_device_supports(const struct uniwill_data *data,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (data->features & features) =3D=
=3D features;
>>>> =C2=A0 }
>>>> =C2=A0 +static inline bool uniwill_device_supports_any(const struct=
=20
>>>> uniwill_data *data,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int features)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 return data->features & features;
>>>> +}
>>>> +
>>> Maybe add a "!=3D 0" to make the return a clear 1 or 0
>>
>> This function already returns a boolean, so the compiler will already=
=20
>> do this for us.
> ack
>>
>>>> =C2=A0 static int uniwill_ec_reg_write(void *context, unsigned int re=
g,=20
>>>> unsigned int val)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union acpi_object params[2] =3D {
>>>> @@ -1421,6 +1440,30 @@ static int uniwill_led_init(struct=20
>>>> uniwill_data *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &init_data);
>>>> =C2=A0 }
>>>> =C2=A0 +static int uniwill_read_charge_type(struct uniwill_data *data=
,=20
>>>> enum power_supply_charge_type *type)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, =
&value);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 switch (FIELD_GET(CHARGING_PROFILE_MASK, value)) =
{
>>>> +=C2=A0=C2=A0=C2=A0 case CHARGING_PROFILE_HIGH_CAPACITY:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D POWER_SUPPLY_CH=
ARGE_TYPE_STANDARD;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +=C2=A0=C2=A0=C2=A0 case CHARGING_PROFILE_BALANCED:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D POWER_SUPPLY_CH=
ARGE_TYPE_LONGLIFE;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +=C2=A0=C2=A0=C2=A0 case CHARGING_PROFILE_STATIONARY:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D POWER_SUPPLY_CH=
ARGE_TYPE_TRICKLE;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPROTO;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>> Like I wrote here:=20
>>> https://github.com/Wer-Wolf/uniwill-laptop/issues/6#issuecomment-39871=
00594=20
>>> I think it would be less confusing to use
>>>
>>> POWER_SUPPLY_CHARGE_TYPE_TRICKLE -> CHARGING_PROFILE_STATIONARY
>>>
>>> POWER_SUPPLY_CHARGE_TYPE_STANDARD -> CHARGING_PROFILE_BALANCED
>>>
>>> POWER_SUPPLY_CHARGE_TYPE_FAST -> CHARGING_PROFILE_HIGH_CAPACITY
>>>
>>> because then the charge speed is at least clearly communicated
>>>
>>> POWER_SUPPLY_CHARGE_TYPE_FAST would then be the default
>>>
>> I think that this will confuse userspace applications.=20
>> POWER_SUPPLY_CHARGE_TYPE_FAST is meant to stand for
>> above-average/non-default charging speed, while=20
>> POWER_SUPPLY_CHARGE_TYPE_STANDARD is meant to stand for
>> the default/recommended setting.
>>
>> In this case CHARGING_PROFILE_HIGH_CAPACITY is the default charging=20
>> setting with the default charging speed,
>> and CHARGING_PROFILE_BALANCED is the "Long Life" option with reduced=20
>> charging speed. CHARGING_PROFILE_STATIONARY
>> on the other hand could as well be called "Primary AC", so=20
>> POWER_SUPPLY_CHARGE_TYPE_TRICKLE fits best for it.
>>
>> On a separate note, UPower prefers to select "Standard" over "Fast"=20
>> when disabling the charging threshold.
>> Mapping CHARGING_PROFILE_HIGH_CAPACITY to=20
>> POWER_SUPPLY_CHARGE_TYPE_FAST would thus confuse users, because
>> disabling the battery charging threshold thru upower will limit them=20
>> CHARGING_PROFILE_BALANCED. Basically
>> they cannot reach CHARGING_PROFILE_HIGH_CAPACITY again thru UPower=20
>> when the charging threshold has been
>> enabled.
> ok didn't know about the upower behaviour
>>
>>>> +
>>>> =C2=A0 static int uniwill_get_property(struct power_supply *psy, cons=
t=20
>>>> struct power_supply_ext *ext,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *drvdata, enum power_supply_propert=
y psp,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union power_supply_propval *val)
>>>> @@ -1431,6 +1474,16 @@ static int uniwill_get_property(struct=20
>>>> power_supply *psy, const struct power_sup
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (psp) {
>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We need to use th=
e cached value here because the=20
>>>> charging mode
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * reported by the E=
C might temporarily change when a=20
>>>> external power
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * source has been c=
onnected.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&data->charge_=
type_lock);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D data->las=
t_charge_type;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&data->charg=
e_type_lock);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_HEALTH:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_=
supply_get_property_direct(psy,=20
>>>> POWER_SUPPLY_PROP_PRESENT, &prop);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> @@ -1479,13 +1532,52 @@ static int uniwill_get_property(struct=20
>>>> power_supply *psy, const struct power_sup
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 }
>>>> =C2=A0 +static int uniwill_write_charge_type(struct uniwill_data *dat=
a,=20
>>>> enum power_supply_charge_type type)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 switch (type) {
>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FIELD_PREP(CHAR=
GING_PROFILE_MASK,=20
>>>> CHARGING_PROFILE_STATIONARY);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FIELD_PREP(CHAR=
GING_PROFILE_MASK,=20
>>>> CHARGING_PROFILE_HIGH_CAPACITY);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FIELD_PREP(CHAR=
GING_PROFILE_MASK,=20
>>>> CHARGING_PROFILE_BALANCED);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap, EC_ADDR_O=
EM_4,=20
>>>> CHARGING_PROFILE_MASK, value);
>>>> +}
>>>> +
>>>> +static int uniwill_restore_charge_type(struct uniwill_data *data)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->charge_type_lock);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return uniwill_write_charge_type(data, data->last=
_charge_type);
>>>> +}
>>>> +
>>>> =C2=A0 static int uniwill_set_property(struct power_supply *psy, cons=
t=20
>>>> struct power_supply_ext *ext,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *drvdata, enum power_supply_propert=
y psp,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const union power_supply_propval *val)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D drvdata;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (psp) {
>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&data->charge_=
type_lock);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_write_cha=
rge_type(data, val->intval);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret >=3D 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
ata->last_charge_type =3D val->intval;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&data->charg=
e_type_lock);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_CONTROL_=
END_THRESHOLD:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val->intva=
l < 0 || val->intval > 100)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EINVAL;
>>>> @@ -1501,21 +1593,41 @@ static int=20
>>>> uniwill_property_is_writeable(struct power_supply *psy,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const stru=
ct power_supply_ext *ext, void=20
>>>> *drvdata,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum power=
_supply_property psp)
>>>> =C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0 if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_E=
ND_THRESHOLD)
>>>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHO=
LD:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 return false;
>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 }
>>> Could be mistaken, but does this work without producing a compiler=20
>>> warning or error not having a return on the top level?
>>
>> All exits from the switch statement end with a return statement, so=20
>> we will always leave this function once we
>> enter the switch statement.
> ack
>>
>>>> =C2=A0 -static const enum power_supply_property uniwill_properties[] =
=3D {
>>>> +static const enum power_supply_property=20
>>>> uniwill_charge_limit_properties[] =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_HEALTH,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_CHARGE_CONTROL_END_T=
HRESHOLD,
>>>> =C2=A0 };
>>>> =C2=A0 -static const struct power_supply_ext uniwill_extension =3D {
>>>> +static const struct power_supply_ext=20
>>>> uniwill_charge_limit_extension =3D {
>>>> +=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>>>> +=C2=A0=C2=A0=C2=A0 .properties =3D uniwill_charge_limit_properties,
>>>> +=C2=A0=C2=A0=C2=A0 .num_properties =3D ARRAY_SIZE(uniwill_charge_lim=
it_properties),
>>>> +=C2=A0=C2=A0=C2=A0 .get_property =3D uniwill_get_property,
>>>> +=C2=A0=C2=A0=C2=A0 .set_property =3D uniwill_set_property,
>>>> +=C2=A0=C2=A0=C2=A0 .property_is_writeable =3D uniwill_property_is_wr=
iteable,
>>>> +};
>>>> +
>>>> +static const enum power_supply_property=20
>>>> uniwill_charge_modes_properties[] =3D {
>>>> +=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_CHARGE_TYPES,
>>>> +=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_HEALTH,
>>>> +};
>>>> +
>>>> +static const struct power_supply_ext=20
>>>> uniwill_charge_modes_extension =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>>>> -=C2=A0=C2=A0=C2=A0 .properties =3D uniwill_properties,
>>>> -=C2=A0=C2=A0=C2=A0 .num_properties =3D ARRAY_SIZE(uniwill_properties=
),
>>>> +=C2=A0=C2=A0=C2=A0 .charge_types =3D BIT(POWER_SUPPLY_CHARGE_TYPE_TR=
ICKLE) |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B=
IT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B=
IT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
>>>> +=C2=A0=C2=A0=C2=A0 .properties =3D uniwill_charge_modes_properties,
>>>> +=C2=A0=C2=A0=C2=A0 .num_properties =3D ARRAY_SIZE(uniwill_charge_mod=
es_properties),
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .get_property =3D uniwill_get_property=
,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set_property =3D uniwill_set_property=
,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .property_is_writeable =3D uniwill_pro=
perty_is_writeable,
>>>> @@ -1531,7 +1643,13 @@ static int uniwill_add_battery(struct=20
>>>> power_supply *battery, struct acpi_battery
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!entry)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM=
;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D power_supply_register_extension(ba=
ttery,=20
>>>> &uniwill_extension, data->dev, data);
>>>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_supply_regi=
ster_extension(battery,=20
>>>> &uniwill_charge_limit_extension,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->dev, data);
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_supply_regi=
ster_extension(battery,=20
>>>> &uniwill_charge_modes_extension,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->dev, data);
>>>> +
>>> Currently there is now way to specify just the health parameter, but=
=20
>>> i have to check if that is even required
>>
>> AFAIK the OEM software always bundles this feature with the charging=20
>> limit or the charging modes.
>> We can separate this in the future should the need arise.
> ack
>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(entry);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> @@ -1560,7 +1678,10 @@ static int uniwill_remove_battery(struct=20
>>>> power_supply *battery, struct acpi_batt
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 power_supply_unregister_extension(battery,=
 &uniwill_extension);
>>>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_unregister_e=
xtension(battery,=20
>>>> &uniwill_charge_limit_extension);
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_unregister_e=
xtension(battery,=20
>>>> &uniwill_charge_modes_extension);
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 }
>>>> @@ -1570,25 +1691,35 @@ static int uniwill_battery_init(struct=20
>>>> uniwill_data *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value, threshold;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL=
_FEATURE_BATTERY))
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data-=
>regmap, EC_ADDR_CHARGE_CTRL, &value);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_=
CHARGE_CTRL, &value);
>>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The charge contro=
l threshold might be initialized with=20
>>>> 0 by
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the EC to signal =
that said threshold is uninitialized.=20
>>>> We thus
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * need to replace t=
his value with 100 to signal that we=20
>>>> want to
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * take control of b=
attery charging. For the sake of=20
>>>> completeness
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we also set the c=
harging threshold to 100 if the=20
>>>> EC-provided
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * value is invalid.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threshold =3D FIELD_GET(C=
HARGE_CTRL_MASK, value);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (threshold =3D=3D 0 ||=
 threshold > 100) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F=
IELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
et =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL,=20
>>>> value);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn 0;
>>> Would use an "else if (uniwill_device_supports(data,=20
>>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES))" and put the return 0 at the=20
>>> end of the function.
>>
>> This would not work, because we must not register the battery=20
>> extension when both features are not supported.
>
> ah sorry overlooked that, but what about:
>
> =C2=A0 =C2=A0 } else if (uniwill_device_supports(data,=20
> UNIWILL_FEATURE_BATTERY_CHARGE_MODES)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_mutex_init(data->dev, &data->ch=
arge_type_lock);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret < 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D uniwill_read_charge_type(data, &data=
->last_charge_type);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret < 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
> =C2=A0 =C2=A0 } else {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> =C2=A0 =C2=A0 }
>
> It's the same number of lines and same indentation level but more=20
> readable imho
>
Alright, i will check if checkpatch agrees with using "else if". If that i=
s fine then
i will restructure the code.

Thanks,
Armin Wolf

>>
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /*
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * The charge control threshold might be ini=
tialized with 0 by
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * the EC to signal that said threshold is u=
ninitialized. We thus
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * need to replace this value with 100 to si=
gnal that we want to
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * take control of battery charging. For the=
 sake of completeness
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * we also set the charging threshold to 100=
 if the EC-provided
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * value is invalid.
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0 threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
>>>> -=C2=A0=C2=A0=C2=A0 if (threshold =3D=3D 0 || threshold > 100) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_MODIFY(CHARGE_CTRL_=
MASK, &value, 100);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data=
->regmap, EC_ADDR_CHARGE_CTRL, value);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(d=
ata->dev, &data->charge_type_lock);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_read_char=
ge_type(data,=20
>>>> &data->last_charge_type);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> @@ -1609,10 +1740,13 @@ static int uniwill_notifier_call(struct=20
>>>> notifier_block *nb, unsigned long action
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D containe=
r_of(nb, struct=20
>>>> uniwill_data, nb);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_battery_entry *entry;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (action) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_BATTERY_ALERT:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data, UNIWILL_FEATURE_BATTERY))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts_any(data,
>>>> + UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>>> + UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return NOTIFY_DONE;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_l=
ock(&data->battery_lock);
>>>> @@ -1623,10 +1757,24 @@ static int uniwill_notifier_call(struct=20
>>>> notifier_block *nb, unsigned long action
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return =
NOTIFY_OK;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts(data,=20
>>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppo=
rts_any(data,
>>>> + UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>>>> + UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return NOTIFY_DONE;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>>>> notifier_from_errno(usb_c_power_priority_restore(data));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_suppor=
ts(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
et =3D uniwill_restore_charge_type(data);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errno(ret);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_suppor=
ts(data,=20
>>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
et =3D usb_c_power_priority_restore(data);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errno(ret);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_FN_LOCK:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_d=
evice_supports(data, UNIWILL_FEATURE_FN_LOCK))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return NOTIFY_DONE;
>>>> @@ -1810,7 +1958,7 @@ static int=20
>>>> uniwill_suspend_touchpad_toggle(struct uniwill_data *data)
>>>> =C2=A0 =C2=A0 static int uniwill_suspend_battery(struct uniwill_data =
*data)
>>>> =C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL_FEATUR=
E_BATTERY))
>>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> @@ -1887,7 +2035,15 @@ static int=20
>>>> uniwill_resume_touchpad_toggle(struct uniwill_data *data)
>>>> =C2=A0 =C2=A0 static int uniwill_resume_battery(struct uniwill_data *=
data)
>>>> =C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL_FEATUR=
E_BATTERY))
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_restore_c=
harge_type(data);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data-=
>regmap,=20
>>>> EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
>>>> @@ -1970,7 +2126,7 @@ static struct platform_driver uniwill_driver =
=3D {
>>>> =C2=A0 =C2=A0 static struct uniwill_device_descriptor=20
>>>> lapqc71a_lapqc71b_descriptor __initdata =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_SUPER_KE=
Y |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=
NIWILL_FEATURE_BATTERY |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=
NIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_CPU_TEMP |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>>>> @@ -1981,7 +2137,7 @@ static struct uniwill_device_descriptor=20
>>>> lapac71h_descriptor __initdata =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_FN_LOCK =
|
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_SUPER_KEY |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=
NIWILL_FEATURE_BATTERY |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=
NIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_CPU_TEMP |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>>>> @@ -1993,7 +2149,7 @@ static struct uniwill_device_descriptor=20
>>>> lapkc71f_descriptor __initdata =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_SUPER_KEY |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_LIGHTBAR |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=
NIWILL_FEATURE_BATTERY |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=
NIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_CPU_TEMP |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>>> Maybe we should put in some assertion to ensure that=20
>>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT and=20
>>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES are not set at the same time,=20
>>> or it that being to wary?
>>
>> I do not think that we really need that. Those device descriptors are=
=20
>> mostly static and have a fairly trivial structure,
>> so we should easily spot such a mistake.
> ok
>>
>>>> @@ -2578,8 +2734,8 @@ static int __init uniwill_init(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (force) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the device=
 supports all features */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.feature=
s =3D UINT_MAX;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the device=
 supports all features except the=20
>>>> charge limit */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.feature=
s =3D UINT_MAX &=20
>>>> ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Enabl=
ing potentially unsupported features\n");
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c=20
>>>> b/drivers/platform/x86/uniwill/uniwill-wmi.c
>>>> index 31d9c39f14ab..f1b89bc63df6 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
>>>> @@ -48,6 +48,7 @@ int devm_uniwill_wmi_register_notifier(struct=20
>>>> device *dev, struct notifier_block
>>>> =C2=A0 static void uniwill_wmi_notify(struct wmi_device *wdev, union=
=20
>>>> acpi_object *obj)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 value;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_IN=
TEGER)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> @@ -56,7 +57,9 @@ static void uniwill_wmi_notify(struct wmi_device=20
>>>> *wdev, union acpi_object *obj)
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&wdev->dev, "Received W=
MI event %u\n", value);
>>>> =C2=A0 - blocking_notifier_call_chain(&uniwill_wmi_chain_head, value,=
=20
>>>> NULL);
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D blocking_notifier_call_chain(&uniwill_wmi=
_chain_head,=20
>>>> value, NULL);
>>>> +=C2=A0=C2=A0=C2=A0 if (notifier_to_errno(ret) < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev, "Fail=
ed to handle event %u\n", value);
>>>> =C2=A0 }
>>>> =C2=A0 =C2=A0 /*
>>> Is this something specific for this patch or just general cleanup=20
>>> that sneaked into here?
>>>
>>> Best regards,
>>>
>>> Werner
>>
>> It is necessary because handling of UNIWILL_OSD_DC_ADAPTER_CHANGED=20
>> can now fail with an error code.
>> I decided to place the "error handling" code inside=20
>> uniwill_wmi_notify() so that the resulting error
>> codes are not silently swallowed.
> ok
>>
>> Thanks,
>> Armin Wolf
>>
>
