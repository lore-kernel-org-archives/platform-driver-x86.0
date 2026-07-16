Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72620381AE4;
	Thu, 16 Jul 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218853; cv=none; b=pbIo7osfL47l1k6J81tUd6LfJ8pVVeMuKWUUUw/SbghK65PkIjzKwSR3neCWwG2dgrX+TTeNhXw/DSx40+ewA8UvoRLK1r2/sb4X4IaHr8Prj1Et4tqnS1ggpRkTFYBcJpDigSGd7sUQNuDQPOv/WxKq/KJK2Qv86dyCu/aP5Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218853; c=relaxed/simple;
	bh=stV9IF4MG6e6tGgQsNtuNsHzwo+lRqXNmEtWYdnHHgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWoHnbt19eBY2whI2coakVOMdwlx61Sxr8ztDFeO0T6NRcwfqngLIpTz7iLIE6gMMXqajbMmHjiDrDs3MBUQAAcBwwkMbKqmjBpUPYdC+DNajV7n8UafbbA/5d1Vd2fuv6NPJK5xp1XghUjGagKlQpyGyD1sT1pmNRzlyLAMFyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=m5gFnScd; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="m5gFnScd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784218843; x=1784823643; i=w_armin@gmx.de;
	bh=stV9IF4MG6e6tGgQsNtuNsHzwo+lRqXNmEtWYdnHHgM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=m5gFnScdgZOOS0XEFAjxyN97bXJ/jBxrr0vPPc7j7dX6y0/2vjxLXyi1b/DxU4yZ
	 N1ZJ6tNtA5yOiTgfoZvFXD6XAzz2CR9b3MgyFXMYQcHJGRjwDZUCqxxeC4QnPuQ+i
	 UKIiNM1EWsazvCF2RitSh7DTVD9QaZk9lp6SUxua6E/CFGd90Yi6wAdJO1oc1u05i
	 bxUtQ60yk3j5rTOD8tw9EMlwf09fho+CnTgV07Y60Hn1MmniuW6tUWSb75AkyYTdk
	 DWmflxqrFZ6ekiSg+GZqmoCzggEXjp4Wrw3zi2FYZCRRAHjcsybEv6dfsvKtclFyD
	 KqDLfLMQerjMJKDKJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1po0-1wiCxv2LJg-0019K4; Thu, 16
 Jul 2026 18:20:43 +0200
Message-ID: <5b99f333-0eec-4a93-9d9e-536d4d95286f@gmx.de>
Date: Thu, 16 Jul 2026 18:20:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/x86: uniwill-laptop: Make
 KBD_LED_MAX_INTENSITY configurable
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710223544.49602-1-W_Armin@gmx.de>
 <20260710223544.49602-4-W_Armin@gmx.de>
 <5bb7d5c3-a6d3-458b-b536-ece19c972024@tuxedocomputers.com>
 <10f11233-af26-4984-b557-febaa381c193@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <10f11233-af26-4984-b557-febaa381c193@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sZpofiIIln0wY5MDx1LiPB71apPbYkQE4fmviI/REc6M+neJkMF
 8BW5kKWh25qIaBjKTW6CJw55k/vbOwfvIvG6xAUb4u3b0RRyxgwzVsRC1Br+9k6IW7VVf5Q
 z+PuFH/pxfeQ8kulWADqdhpeSRHBDLQqBA0luwM43XGq4qL62afQgQOzZUh+X8i0SZBqPAL
 DBwp6fQwY9UTsODfdJQ6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:euGOAasnaVA=;zB6MCxbjibsXK3Vik3rk/uS11c+
 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
 cLtd4a4L5bK1

Am 16.07.26 um 17:12 schrieb Werner Sembach:

>
> Am 15.07.26 um 17:19 schrieb Werner Sembach:
>>
>> Am 11.07.26 um 00:35 schrieb Armin Wolf:
>>> Some (yet to be enabled) Tuxedo devices have a maximum intensity of
>>> 200 instead of the default 50. Remove the hardcoded maximum intensity
>>> and use the device descriptor instead.
>
> sorry i gave missinformation, we actually convert down to the range=20
> 0-50 in td for all devices here:=20
> https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-=
/blob/0b2f8c6ab7ef709343ae74b3de51dcae45357641/src/uniwill_leds.h#L106
>
> so this patch can actually be dropped
>
Ok.

Thanks,
Armin Wolf

>>>
>>> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 13 +++++++++----
>>> =C2=A0 1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index 4591ee299a90..5b8e35bf9a51 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -351,7 +351,6 @@
>>> =C2=A0 #define LED_CHANNELS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
3
>>> =C2=A0 =C2=A0 #define KBD_LED_CHANNELS=C2=A0=C2=A0=C2=A0 3
>>> -#define KBD_LED_MAX_INTENSITY=C2=A0=C2=A0=C2=A0 50
>>> =C2=A0 =C2=A0 #define UNIWILL_FEATURE_FN_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>> =C2=A0 #define UNIWILL_FEATURE_SUPER_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>>> @@ -403,6 +402,7 @@ struct uniwill_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mc_subled led_mc_subled_info[LED=
_CHANNELS];
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool kbd_led_single_color;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_brightness;
>>> +=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_intensity;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int last_kbd_status;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>> @@ -429,6 +429,7 @@ struct uniwill_device_descriptor {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool kbd_led_single_color;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_brightness;
>>> +=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_intensity;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 lightbar_max_brightness;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Executed during driver probing */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*probe)(struct uniwill_data *data)=
;
>>> @@ -1780,8 +1781,8 @@ static int uniwill_rgb_kbd_led_init(struct=20
>>> uniwill_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Make su=
re that the initial intensity value is not=20
>>> greater than
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the max=
imum intensity.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval > KBD_LED_MAX_I=
NTENSITY) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
gval =3D KBD_LED_MAX_INTENSITY;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval > data->kbd_led=
_max_intensity) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
gval =3D data->kbd_led_max_intensity;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ret =3D regmap_write(data->regmap,=20
>>> uniwill_kbd_led_channel_to_reg[i], regval);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (ret < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> @@ -1793,7 +1794,7 @@ static int uniwill_rgb_kbd_led_init(struct=20
>>> uniwill_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 intensity_all_zeros =3D false;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kb=
d_led_mc_subled_info[i].intensity =3D regval;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_in=
fo[i].max_intensity =3D=20
>>> KBD_LED_MAX_INTENSITY;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled_in=
fo[i].max_intensity =3D=20
>>> data->kbd_led_max_intensity;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_m=
c_subled_info[i].channel =3D i;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 @@ -2338,6 +2339,7 @@ static int uniwill_probe(struct=20
>>> platform_device *pdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->features =3D device_descriptor.fe=
atures;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_single_color =3D=20
>>> device_descriptor.kbd_led_single_color;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_max_brightness =3D=20
>>> device_descriptor.kbd_led_max_brightness;
>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_max_intensity =3D=20
>>> device_descriptor.kbd_led_max_intensity;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->lightbar_max_brightness =3D=20
>>> device_descriptor.lightbar_max_brightness;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> @@ -2675,6 +2677,7 @@ static struct uniwill_device_descriptor=20
>>> machenike_l16p_descriptor __initdata =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_USB_POWERSHARE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .kbd_led_single_color =3D false,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .kbd_led_max_brightness =3D 4,
>>> +=C2=A0=C2=A0=C2=A0 .kbd_led_max_intensity =3D 50,
>>> =C2=A0 };
>>> =C2=A0 =C2=A0 static struct uniwill_device_descriptor=20
>>> lapqc71a_lapqc71b_descriptor __initdata =3D {
>>> @@ -2858,6 +2861,7 @@ static struct uniwill_device_descriptor=20
>>> x4sp4nal_descriptor __initdata =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_USB_POWERSHARE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .kbd_led_single_color =3D true,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .kbd_led_max_brightness =3D 2,
>>> +=C2=A0=C2=A0=C2=A0 .kbd_led_max_intensity =3D 50,
>>> =C2=A0 };
>>> =C2=A0 =C2=A0 static const struct dmi_system_id uniwill_dmi_table[]=20
>>> __initconst =3D {
>>> @@ -3355,6 +3359,7 @@ static int __init uniwill_init(void)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descript=
or.kbd_led_single_color =3D false;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Some models =
only support 3 brightness levels */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descript=
or.kbd_led_max_brightness =3D 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.kbd_led_=
max_intensity =3D 50;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Some models =
only support 36 brightness levels per color=20
>>> component */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descript=
or.lightbar_max_brightness =3D 200;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Enabli=
ng potentially unsupported features\n");
>>
>> lgtm
>>
>> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
>>
>
