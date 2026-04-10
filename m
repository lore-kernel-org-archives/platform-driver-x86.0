Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C133BADB4;
	Fri, 10 Apr 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843616; cv=none; b=bDcCNyEIBMv6O7si5vJy/PVdG/EsBjjXlkmK1YSSZaxmOCufO/DSwunG3ZfqvFI093bR2V/X+nVB7XzD/c3EJJcHTpWeT5V1QHarfwb5Zp/U2XdAOnuXzMiYjEr9uH+B/rWDuTErrGxnYUH9r0AeUNfgxbWU4SCJib9Nt3CBcCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843616; c=relaxed/simple;
	bh=ag3rPi4+R4u89a/Md5+0DsIi+fztk/md/otk6kylHiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwQxksfnvO7o9AfUMG4H0gJ0/d3QhddwBg0Unr1FW3wyoMKiSqO7MJC79Vyfdh90Y9MpRtsNQQ2KwONdmmrmqxBSlhbSd76jYNeviPzlqPfePgbEj7HIw9rSPa/IEW2krz9+oOK0lGzpPbe5E/jqshGNyDSCgMn4wtDgaJ7bLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TVPL1Fol; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TVPL1Fol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775843603; x=1776448403; i=w_armin@gmx.de;
	bh=ag3rPi4+R4u89a/Md5+0DsIi+fztk/md/otk6kylHiQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TVPL1FolVBLyV6v3tBGgQUB6+QXhTHsguW+6qfhahtmnHkYs4VL6Bo/Yn/J0BIGU
	 PsP80P/6iXlrATMjdnU5Dfw0tPTDAq5eLKf26/yzlUIEwGSj2g4ZSzuqVx4kd4KUN
	 hHbzSIfPRBWgFojbyY9rPBjdww8/3+WXglInc/ypIw3bN58yq8b2t4FcGZkk+LZFV
	 5MuKuYqq+FdinTmd13/8MjXD0nNSycUHg8lEhrxE4N5GpUCAJUKTgYX538QMT5L9l
	 InLozDZQGPLasv+9rmfjAJtg0aEf68vrW9uI7KBUaxU+23Re9q85E864p0nFWETfL
	 dtC17vWAITuzOmTZnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9Q6-1vLlx90d4m-00v0Nd; Fri, 10
 Apr 2026 19:53:23 +0200
Message-ID: <96d39ecd-5204-4b5a-96d6-0160f1910d71@gmx.de>
Date: Fri, 10 Apr 2026 19:53:22 +0200
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <520b2905-1120-4375-9333-05f0eb82fe19@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:avFgAuDjm2fGk8uit64itmtUZYob96Mz8++14Lhx6oFbzNqISaJ
 Rzpxlof0jglxpvHYq17atlokYm2Is7IEr1M4MthFDQ38+kRMj9p6lFRH9XLThtWJgoDzIsH
 m62poMcY0blSkMepVZX28DQqP2FAL/8jnuAKmsp8cnIjt8th29iRRDLyj8PrFRRQp5AL9SU
 9HcaZHJzS4DzShQz7GmSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:inll025+6PA=;D1egUkRkpp2NY4aA1BEZ0pa8vLo
 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

Am 10.04.26 um 18:53 schrieb Werner Sembach:

> Hi Armin,
>
> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>> Many Uniwill-based devices do not supports the already existing
>> charge limit functionality, but instead support an alternative
>> interface for controlling the battery charge algorithm.
>>
>> Add support for this interface and update the documentation.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 .../admin-guide/laptops/uniwill-laptop.rst=C2=A0=C2=A0=C2=A0 |=
=C2=A0 25 +-
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c=C2=A0=C2=A0 | 244 ++=
++++++++++++----
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
>> =C2=A0 3 files changed, 226 insertions(+), 48 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst=20
>> b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> index 561334865feb..24b41dbab886 100644
>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> @@ -43,9 +43,23 @@ Support for changing the platform performance mode=
=20
>> is currently not implemented.
>> =C2=A0 Battery Charging Control
>> =C2=A0 ------------------------
>> =C2=A0 -The ``uniwill-laptop`` driver supports controlling the battery=
=20
>> charge limit. This happens over
>> -the standard ``charge_control_end_threshold`` power supply sysfs=20
>> attribute. All values
>> -between 1 and 100 percent are supported.
>> +.. warning:: Some devices do not properly implement the charging=20
>> threshold interface. Forcing
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 the driver to enable access to said interface on such=20
>> devices might damage the
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 battery [1]_. Because of this the driver will not=20
>> enable said feature even when
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 using the ``force`` module parameter. The charging=20
>> profile interface will be
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 available instead.
>> +
>> +The ``uniwill-laptop`` driver supports controlling the battery=20
>> charge limit. This either happens
>> +over the standard ``charge_control_end_threshold`` or=20
>> ``charge_types`` power supply sysfs attribute,
>> +depending on the device. When using the=20
>> ``charge_control_end_threshold`` sysfs attribute, all values
>> +between 1 and 100 percent are supported. When using the=20
>> ``charge_types`` sysfs attribute, the driver
>> +supports switching between the ``Standard``, ``Trickle`` and ``Long=20
>> Life`` profiles.
>> +
>> +Keep in mind that when using the ``charge_types`` sysfs attribute,=20
>> the EC firmware will hide the
>> +true charging status of the battery from the operating system,=20
>> potentially misleading users into
>> +thinking that the charging profile does not work. Checking the=20
>> ``current_now`` sysfs attribute
>> +tells you the true charging status of the battery even when using=20
>> the ``charge_types`` sysfs
>> +attribute (0 means that the battery is currently not charging).
>> =C2=A0 =C2=A0 Additionally the driver signals the presence of battery c=
harging=20
>> issues through the standard
>> =C2=A0 ``health`` power supply sysfs attribute.
>> @@ -70,3 +84,8 @@ The ``uniwill-laptop`` driver allows to set the=20
>> configurable TGP for devices wit
>> =C2=A0 allow it.
>> =C2=A0 =C2=A0 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop=
 for=20
>> details.
>> +
>> +References
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. [1]=20
>> https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidden_fu=
nction_discovered_on/
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index a116e2ec6453..fbf2e101a074 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -254,6 +254,10 @@
>> =C2=A0 =C2=A0 #define EC_ADDR_OEM_4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x07A6
>> =C2=A0 #define OVERBOOST_DYN_TEMP_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(1)
>> +#define CHARGING_PROFILE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 GENMASK(5, 4)
>> +#define CHARGING_PROFILE_HIGH_CAPACITY=C2=A0=C2=A0=C2=A0 0x00
>> +#define CHARGING_PROFILE_BALANCED=C2=A0=C2=A0=C2=A0 0x01
>> +#define CHARGING_PROFILE_STATIONARY=C2=A0=C2=A0=C2=A0 0x02
>> =C2=A0 #define TOUCHPAD_TOGGLE_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(6)
>> =C2=A0 =C2=A0 #define EC_ADDR_CHARGE_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x07B9
>> @@ -320,13 +324,15 @@
>> =C2=A0 #define UNIWILL_FEATURE_SUPER_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>> =C2=A0 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(2)
>> =C2=A0 #define UNIWILL_FEATURE_LIGHTBAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(3)
>> -#define UNIWILL_FEATURE_BATTERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>> -#define UNIWILL_FEATURE_CPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(5)
>> -#define UNIWILL_FEATURE_GPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(6)
>> -#define UNIWILL_FEATURE_PRIMARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(7)
>> -#define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(8)
>> -#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 BIT(9)
>> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(10)
>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT=C2=A0=C2=A0=C2=A0 BIT(4)
>> +/* Mutually exclusive with the charge limit feature */
>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_MODES=C2=A0=C2=A0=C2=A0 BIT(5)
>> +#define UNIWILL_FEATURE_CPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(6)
>> +#define UNIWILL_FEATURE_GPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(7)
>> +#define UNIWILL_FEATURE_PRIMARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(8)
>> +#define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(9)
>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 BIT(10)
>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(11)
>> =C2=A0 =C2=A0 enum usb_c_power_priority_options {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_CHARGING =3D 0,
>> @@ -339,8 +345,15 @@ struct uniwill_data {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>> -=C2=A0=C2=A0=C2=A0 unsigned int last_charge_ctrl;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex battery_lock;=C2=A0=C2=A0=
=C2=A0 /* Protects the list of currently=20
>> registered batteries */
>> +=C2=A0=C2=A0=C2=A0 union {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Protects writes to last_charge_type */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=
uct mutex charge_type_lock;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enu=
m power_supply_charge_type last_charge_type;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int last_charge_ct=
rl;
>> +=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool last_fn_lock_state;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool last_super_key_enable_state;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool last_touchpad_toggle_enable_state;
>> @@ -447,6 +460,12 @@ static inline bool uniwill_device_supports(const=
=20
>> struct uniwill_data *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (data->features & features) =3D=
=3D features;
>> =C2=A0 }
>> =C2=A0 +static inline bool uniwill_device_supports_any(const struct=20
>> uniwill_data *data,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int features)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return data->features & features;
>> +}
>> +
> Maybe add a "!=3D 0" to make the return a clear 1 or 0

This function already returns a boolean, so the compiler will already do t=
his for us.

>> =C2=A0 static int uniwill_ec_reg_write(void *context, unsigned int reg,=
=20
>> unsigned int val)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union acpi_object params[2] =3D {
>> @@ -1421,6 +1440,30 @@ static int uniwill_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &init_data);
>> =C2=A0 }
>> =C2=A0 +static int uniwill_read_charge_type(struct uniwill_data *data,=
=20
>> enum power_supply_charge_type *type)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &v=
alue);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (FIELD_GET(CHARGING_PROFILE_MASK, value)) {
>> +=C2=A0=C2=A0=C2=A0 case CHARGING_PROFILE_HIGH_CAPACITY:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D POWER_SUPPLY_CHAR=
GE_TYPE_STANDARD;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 case CHARGING_PROFILE_BALANCED:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D POWER_SUPPLY_CHAR=
GE_TYPE_LONGLIFE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 case CHARGING_PROFILE_STATIONARY:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D POWER_SUPPLY_CHAR=
GE_TYPE_TRICKLE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPROTO;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
> Like I wrote here:=20
> https://github.com/Wer-Wolf/uniwill-laptop/issues/6#issuecomment-3987100=
594=20
> I think it would be less confusing to use
>
> POWER_SUPPLY_CHARGE_TYPE_TRICKLE -> CHARGING_PROFILE_STATIONARY
>
> POWER_SUPPLY_CHARGE_TYPE_STANDARD -> CHARGING_PROFILE_BALANCED
>
> POWER_SUPPLY_CHARGE_TYPE_FAST -> CHARGING_PROFILE_HIGH_CAPACITY
>
> because then the charge speed is at least clearly communicated
>
> POWER_SUPPLY_CHARGE_TYPE_FAST would then be the default
>
I think that this will confuse userspace applications. POWER_SUPPLY_CHARGE=
_TYPE_FAST is meant to stand for
above-average/non-default charging speed, while POWER_SUPPLY_CHARGE_TYPE_S=
TANDARD is meant to stand for
the default/recommended setting.

In this case CHARGING_PROFILE_HIGH_CAPACITY is the default charging settin=
g with the default charging speed,
and CHARGING_PROFILE_BALANCED is the "Long Life" option with reduced charg=
ing speed. CHARGING_PROFILE_STATIONARY
on the other hand could as well be called "Primary AC", so POWER_SUPPLY_CH=
ARGE_TYPE_TRICKLE fits best for it.

On a separate note, UPower prefers to select "Standard" over "Fast" when d=
isabling the charging threshold.
Mapping CHARGING_PROFILE_HIGH_CAPACITY to POWER_SUPPLY_CHARGE_TYPE_FAST wo=
uld thus confuse users, because
disabling the battery charging threshold thru upower will limit them CHARG=
ING_PROFILE_BALANCED. Basically
they cannot reach CHARGING_PROFILE_HIGH_CAPACITY again thru UPower when th=
e charging threshold has been
enabled.

>> +
>> =C2=A0 static int uniwill_get_property(struct power_supply *psy, const=
=20
>> struct power_supply_ext *ext,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *drvdata, enum power_supply_propert=
y psp,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union power_supply_propval *val)
>> @@ -1431,6 +1474,16 @@ static int uniwill_get_property(struct=20
>> power_supply *psy, const struct power_sup
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (psp) {
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We need to use the =
cached value here because the charging=20
>> mode
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * reported by the EC =
might temporarily change when a=20
>> external power
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * source has been con=
nected.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&data->charge_ty=
pe_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D data->last_=
charge_type;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&data->charge_=
type_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_HEALTH:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_su=
pply_get_property_direct(psy,=20
>> POWER_SUPPLY_PROP_PRESENT, &prop);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> @@ -1479,13 +1532,52 @@ static int uniwill_get_property(struct=20
>> power_supply *psy, const struct power_sup
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> =C2=A0 +static int uniwill_write_charge_type(struct uniwill_data *data,=
=20
>> enum power_supply_charge_type type)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (type) {
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FIELD_PREP(CHARGI=
NG_PROFILE_MASK,=20
>> CHARGING_PROFILE_STATIONARY);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FIELD_PREP(CHARGI=
NG_PROFILE_MASK,=20
>> CHARGING_PROFILE_HIGH_CAPACITY);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FIELD_PREP(CHARGI=
NG_PROFILE_MASK,=20
>> CHARGING_PROFILE_BALANCED);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap, EC_ADDR_OEM=
_4,=20
>> CHARGING_PROFILE_MASK, value);
>> +}
>> +
>> +static int uniwill_restore_charge_type(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->charge_type_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 return uniwill_write_charge_type(data, data->last_c=
harge_type);
>> +}
>> +
>> =C2=A0 static int uniwill_set_property(struct power_supply *psy, const=
=20
>> struct power_supply_ext *ext,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *drvdata, enum power_supply_propert=
y psp,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const union power_supply_propval *val)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D drvdata;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (psp) {
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&data->charge_ty=
pe_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_write_charg=
e_type(data, val->intval);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret >=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a->last_charge_type =3D val->intval;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&data->charge_=
type_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_CONTROL_EN=
D_THRESHOLD:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val->intval =
< 0 || val->intval > 100)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EINVAL;
>> @@ -1501,21 +1593,41 @@ static int=20
>> uniwill_property_is_writeable(struct power_supply *psy,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const stru=
ct power_supply_ext *ext, void=20
>> *drvdata,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum power=
_supply_property psp)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END=
_THRESHOLD)
>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD=
:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> -
>> -=C2=A0=C2=A0=C2=A0 return false;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
> Could be mistaken, but does this work without producing a compiler=20
> warning or error not having a return on the top level?

All exits from the switch statement end with a return statement, so we wil=
l always leave this function once we
enter the switch statement.

>> =C2=A0 -static const enum power_supply_property uniwill_properties[] =
=3D {
>> +static const enum power_supply_property=20
>> uniwill_charge_limit_properties[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_HEALTH,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THR=
ESHOLD,
>> =C2=A0 };
>> =C2=A0 -static const struct power_supply_ext uniwill_extension =3D {
>> +static const struct power_supply_ext uniwill_charge_limit_extension =
=3D {
>> +=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> +=C2=A0=C2=A0=C2=A0 .properties =3D uniwill_charge_limit_properties,
>> +=C2=A0=C2=A0=C2=A0 .num_properties =3D ARRAY_SIZE(uniwill_charge_limit=
_properties),
>> +=C2=A0=C2=A0=C2=A0 .get_property =3D uniwill_get_property,
>> +=C2=A0=C2=A0=C2=A0 .set_property =3D uniwill_set_property,
>> +=C2=A0=C2=A0=C2=A0 .property_is_writeable =3D uniwill_property_is_writ=
eable,
>> +};
>> +
>> +static const enum power_supply_property=20
>> uniwill_charge_modes_properties[] =3D {
>> +=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_CHARGE_TYPES,
>> +=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_HEALTH,
>> +};
>> +
>> +static const struct power_supply_ext uniwill_charge_modes_extension =
=3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> -=C2=A0=C2=A0=C2=A0 .properties =3D uniwill_properties,
>> -=C2=A0=C2=A0=C2=A0 .num_properties =3D ARRAY_SIZE(uniwill_properties),
>> +=C2=A0=C2=A0=C2=A0 .charge_types =3D BIT(POWER_SUPPLY_CHARGE_TYPE_TRIC=
KLE) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
>> +=C2=A0=C2=A0=C2=A0 .properties =3D uniwill_charge_modes_properties,
>> +=C2=A0=C2=A0=C2=A0 .num_properties =3D ARRAY_SIZE(uniwill_charge_modes=
_properties),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .get_property =3D uniwill_get_property,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set_property =3D uniwill_set_property,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .property_is_writeable =3D uniwill_prope=
rty_is_writeable,
>> @@ -1531,7 +1643,13 @@ static int uniwill_add_battery(struct=20
>> power_supply *battery, struct acpi_battery
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!entry)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D power_supply_register_extension(batt=
ery,=20
>> &uniwill_extension, data->dev, data);
>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_supply_regist=
er_extension(battery,=20
>> &uniwill_charge_limit_extension,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->dev, data);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_supply_regist=
er_extension(battery,=20
>> &uniwill_charge_modes_extension,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->dev, data);
>> +
> Currently there is now way to specify just the health parameter, but i=
=20
> have to check if that is even required

AFAIK the OEM software always bundles this feature with the charging limit=
 or the charging modes.
We can separate this in the future should the need arise.

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(entry);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> @@ -1560,7 +1678,10 @@ static int uniwill_remove_battery(struct=20
>> power_supply *battery, struct acpi_batt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 power_supply_unregister_extension(battery, &=
uniwill_extension);
>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_unregister_ext=
ension(battery,=20
>> &uniwill_charge_limit_extension);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_unregister_ext=
ension(battery,=20
>> &uniwill_charge_modes_extension);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> @@ -1570,25 +1691,35 @@ static int uniwill_battery_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value, threshold;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL_F=
EATURE_BATTERY))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->r=
egmap, EC_ADDR_CHARGE_CTRL, &value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_CH=
ARGE_CTRL, &value);
>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The charge control =
threshold might be initialized with 0 by
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the EC to signal th=
at said threshold is uninitialized. We=20
>> thus
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * need to replace thi=
s value with 100 to signal that we=20
>> want to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * take control of bat=
tery charging. For the sake of=20
>> completeness
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we also set the cha=
rging threshold to 100 if the EC-provided
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * value is invalid.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threshold =3D FIELD_GET(CHA=
RGE_CTRL_MASK, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (threshold =3D=3D 0 || t=
hreshold > 100) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIE=
LD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL,=20
>> value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_support=
s(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn 0;
> Would use an "else if (uniwill_device_supports(data,=20
> UNIWILL_FEATURE_BATTERY_CHARGE_MODES))" and put the return 0 at the=20
> end of the function.

This would not work, because we must not register the battery extension wh=
en both features are not supported.

>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * The charge control threshold might be initi=
alized with 0 by
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * the EC to signal that said threshold is uni=
nitialized. We thus
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * need to replace this value with 100 to sign=
al that we want to
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * take control of battery charging. For the s=
ake of completeness
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * we also set the charging threshold to 100 i=
f the EC-provided
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * value is invalid.
>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
>> -=C2=A0=C2=A0=C2=A0 if (threshold =3D=3D 0 || threshold > 100) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_MODIFY(CHARGE_CTRL_MA=
SK, &value, 100);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->=
regmap, EC_ADDR_CHARGE_CTRL, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(dat=
a->dev, &data->charge_type_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_read_charge=
_type(data, &data->last_charge_type);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> @@ -1609,10 +1740,13 @@ static int uniwill_notifier_call(struct=20
>> notifier_block *nb, unsigned long action
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_=
of(nb, struct=20
>> uniwill_data, nb);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_battery_entry *entry;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (action) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_BATTERY_ALERT:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_support=
s(data, UNIWILL_FEATURE_BATTERY))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_support=
s_any(data,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return NOTIFY_DONE;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_loc=
k(&data->battery_lock);
>> @@ -1623,10 +1757,24 @@ static int uniwill_notifier_call(struct=20
>> notifier_block *nb, unsigned long action
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NO=
TIFY_OK;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_support=
s(data,=20
>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_support=
s_any(data,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return NOTIFY_DONE;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>> notifier_from_errno(usb_c_power_priority_restore(data));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports=
(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D uniwill_restore_charge_type(data);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errno(ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports=
(data,=20
>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D usb_c_power_priority_restore(data);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return notifier_from_errno(ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_FN_LOCK:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_dev=
ice_supports(data, UNIWILL_FEATURE_FN_LOCK))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return NOTIFY_DONE;
>> @@ -1810,7 +1958,7 @@ static int=20
>> uniwill_suspend_touchpad_toggle(struct uniwill_data *data)
>> =C2=A0 =C2=A0 static int uniwill_suspend_battery(struct uniwill_data *d=
ata)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL_FEATURE_=
BATTERY))
>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> @@ -1887,7 +2035,15 @@ static int=20
>> uniwill_resume_touchpad_toggle(struct uniwill_data *data)
>> =C2=A0 =C2=A0 static int uniwill_resume_battery(struct uniwill_data *da=
ta)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL_FEATURE_=
BATTERY))
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_MODES)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_restore_cha=
rge_type(data);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->r=
egmap, EC_ADDR_CHARGE_CTRL,=20
>> CHARGE_CTRL_MASK,
>> @@ -1970,7 +2126,7 @@ static struct platform_driver uniwill_driver =3D =
{
>> =C2=A0 =C2=A0 static struct uniwill_device_descriptor=20
>> lapqc71a_lapqc71b_descriptor __initdata =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_SUPER_KEY =
|
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_BATTERY |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_BATTERY_CHARGE_LIMIT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_CPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>> @@ -1981,7 +2137,7 @@ static struct uniwill_device_descriptor=20
>> lapac71h_descriptor __initdata =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_FN_LOCK |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_SUPER_KEY |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_BATTERY |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_BATTERY_CHARGE_LIMIT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_CPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>> @@ -1993,7 +2149,7 @@ static struct uniwill_device_descriptor=20
>> lapkc71f_descriptor __initdata =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_SUPER_KEY |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_LIGHTBAR |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_BATTERY |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_BATTERY_CHARGE_LIMIT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_CPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
> Maybe we should put in some assertion to ensure that=20
> UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT and=20
> UNIWILL_FEATURE_BATTERY_CHARGE_MODES are not set at the same time, or=20
> it that being to wary?

I do not think that we really need that. Those device descriptors are most=
ly static and have a fairly trivial structure,
so we should easily spot such a mistake.

>> @@ -2578,8 +2734,8 @@ static int __init uniwill_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (force) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the device s=
upports all features */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.features =
=3D UINT_MAX;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the device s=
upports all features except the=20
>> charge limit */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.features =
=3D UINT_MAX &=20
>> ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Enablin=
g potentially unsupported features\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-wmi.c
>> index 31d9c39f14ab..f1b89bc63df6 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
>> @@ -48,6 +48,7 @@ int devm_uniwill_wmi_register_notifier(struct=20
>> device *dev, struct notifier_block
>> =C2=A0 static void uniwill_wmi_notify(struct wmi_device *wdev, union=20
>> acpi_object *obj)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_INTE=
GER)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> @@ -56,7 +57,9 @@ static void uniwill_wmi_notify(struct wmi_device=20
>> *wdev, union acpi_object *obj)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&wdev->dev, "Received WMI=
 event %u\n", value);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 blocking_notifier_call_chain(&uniwill_wmi_ch=
ain_head, value,=20
>> NULL);
>> +=C2=A0=C2=A0=C2=A0 ret =3D blocking_notifier_call_chain(&uniwill_wmi_c=
hain_head,=20
>> value, NULL);
>> +=C2=A0=C2=A0=C2=A0 if (notifier_to_errno(ret) < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev, "Failed=
 to handle event %u\n", value);
>> =C2=A0 }
>> =C2=A0 =C2=A0 /*
> Is this something specific for this patch or just general cleanup that=
=20
> sneaked into here?
>
> Best regards,
>
> Werner

It is necessary because handling of UNIWILL_OSD_DC_ADAPTER_CHANGED can now=
 fail with an error code.
I decided to place the "error handling" code inside uniwill_wmi_notify() s=
o that the resulting error
codes are not silently swallowed.

Thanks,
Armin Wolf

