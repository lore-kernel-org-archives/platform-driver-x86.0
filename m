Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208698;
	b=27a01ko0fJfBjhpOIqCySuXicT5ZUaFwwRbX7czyN5yM8jkCs//BMHfBSpR4Z31Hfv1X
	 +2ZDXHpLIBlbv96VXXRDT1esV2RvcLae7xMtmRGNSSbBV8yYh3R+XdiKyAwN8v9VxpsXw
	 bTu8wn6WFUXmBfGS97ewVpBMUY1DnL2OIbbx4caInDu5n/grCCJdUkwUy2UEsxGDJcwU4
	 9FqiI8JX8Div/90l+J+L29ShLwES2vziyARwkCl9oaiAGBJ5W0lqrC4iyD54RQiXiYfMb
	 zTuGobp4uziVv2TYBwHZ8qdSaQTcv14gh+65GW5YHfbhg5fVLJ9XXh/QtP0M2Xa+UKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208698;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=iMCwT266mrw6kqHJMlTTso12BdmYOfcyBnDGi74NFBA=;
	b=wFWfTk02WbsIOee9JEy0J8DQkxmI+qz0TAecwuoIkRwnOrQMTy8MP9aAMavxOsRph5jZ
	 7oPkvZdEfSv6CSaMfg72gSF5Tg8b5vKbh+KbLzdOw8klCcU+lKpQOV4xFLlGZLlZCKig1
	 VqeK3f0pfoWijiBtCgXaN1ulhFNHSPZV3KB23cF0rxXDLQ49q2WYJ2tCoYfL2uAvpdxTd
	 bh8TmYXGkTFGad4hqHka2hgYWxntGiRIPiRfMFxyW2D767/jw5wcZzAoivrdmMrOKeYHV
	 V+n9nXlfBIAu0MmcbXIjl36YnN32mro6aIpIoFO7pbKZ95GqGrIz35/JLOEgDjG/6HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=AiBo1NLJ;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3954606A6B5
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 21:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3954606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=AiBo1NLJ
DKIM2-Signature:  i=1; m=1; t=1795208692;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:rKuokP9OEIcrGATZMNIZwprUSYEi
   l5cF1X5dfYQ8G0fTZbXSq4VW53DhCLaOcCeVtgEDCV4zXAhlyUUxsIA0BoAOcjntEQky+pKbyoj
   LYnQm7t6zs+IrmgRvS2XPdx4k3zTdP1EZaMNMqrtOKtMs3vetiHm5JmQ3Or29cQ+4MkBdFRStCi
   MzdplyIq9u3rXx6B4Yo5RygF3AJuL5Q9PVHm4y6Ce3kmGMZli+8Y0FTbj44/EkVDiWX6AHqZGbP
   sIhtP6jT8IR1oCKbBXoPRLTDdDBcWcAdk+TSQwhWQ0cRT5zWgxVOz0rSYX0mzc3V8UI3PrYH+ok
   1BpAf2qPGkjSbg==;
Message-Instance:  m=1;
 h=sha256:
   6o3+qHarnCWTS04lWdZN4TOTJtqfjW/kJRY5pO3DWzU=:
   iMCwT266mrw6kqHJMlTTso12BdmYOfcyBnDGi74NFBA=,
  sha512:
   peEKiR86zEKuEEfjhCSkt8+xnNtVmbX0c6tTsdBa5yjfQ1PW6479Dynjas1QYk+xDcIZ5WY4KWvpL3yHjiaSyw==:
   hi55MUojJaMtnWPHxbFq0O6WY5kBUZw1bQcNQvWv4W/lL6O803KizKUg4djhZO5jFiZGpGjGbQgQa5EJC12Teg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795208676; x=1795813476; i=w_armin@gmx.de;
	bh=iMCwT266mrw6kqHJMlTTso12BdmYOfcyBnDGi74NFBA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AiBo1NLJQQKMvTImXNy9OEwUzJIQ//YVAGcFxlD7Dy+co1BX82r2jCGUj0jK/Fmg
	 4UCHrTX1QSubHBO/mlM+lreYYzN43in7Zed5thsTUFXrzgDjIXiiLHu6JMMWGQFMQ
	 c44PexrHE5Zm5reF059pAgzcKuj/fxSdL2oanEXdPioXmwzenSZ6yr3KDNPojfbGf
	 g9HFJscRsOYV3gQ/ZGaynCe6OPSN4l5CIpWH/8NQPWV8EPgoo092cYWMqHJvrBYKI
	 Qr58w3VaiYwlIreBfylTW8NLxrNqBXlUE2JZ+XQdGh74bDWYJIoIvaMZThJMgxedC
	 XVAdeMybG0c1FHaPBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQvCv-1xsU1T2ndn-00KuMc; Fri, 20
 Nov 2026 22:04:36 +0100
Message-ID: <af509fc1-33c8-45a8-a787-c7a9ef91a580@gmx.de>
Date: Fri, 20 Nov 2026 22:04:35 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Remove cTGP control from
 unsupported devices
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113144749.59958-1-wse@tuxedocomputers.com>
 <6ac5ca43-25db-4843-8317-dee4cd55c627@gmx.de>
 <da9b330c-a04e-4029-9abf-59fc4356da99@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <da9b330c-a04e-4029-9abf-59fc4356da99@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c9UNEU/KiU/0Pvtey4EGsvXKcGcoeBN6PlMNijPSiPzqPzrsY/s
 gc1Y17DJQFQgMkQNeS3qJkLpuz1n/ssRZXNiAlS2HwDxeMMGpTTo1cYB6yj3hnKh2Fs8EHa
 qDsPeqfbkhIIDVO/UOhsSUGLhHbAhnI4gg4syir8h/DLo+5bmIQOnQC8eDF19H5DN2eBc4O
 YzSxE/DgQS8bZ+7+daSRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nxRB9EJmcu0=;CBCd3clwOhn9+ByciwsMi5w5G0t
 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

Am 17.11.26 um 11:29 schrieb Werner Sembach:

> Am 13.11.26 um 21:42 schrieb Armin Wolf:
>> Am 13.11.26 um 15:47 schrieb Werner Sembach:
>>> Some devices like the InfinityBook Pro series have Dynamic Boost=20
>>> support,
>>> but the cTGP setting is actually ignored.
>>>
>>> This commit adds the ability to still initialize DB, but hide the=20
>>> noop cTGP
>>> sysfs attribute and applies this to the respective devices.
>>
>> IMHO the cTGP setting only works with the official NVidia driver and=20
>> nvidia-powerd running in the background.
> Yes I know, but so does DB and that one works, so the setup is correct.
>> Also there currently is a tiny
>> issue with cTGP support, do you have a acpidump from one of the=20
>> affected machines?
> Can generate one, I will send in a separate email because I will just=20
> sent the binary files, and want to make sure that this message doesn't=
=20
> get blocked by spam filters.

Thanks, got it.

As far as i can tell the cTGP suport is correctly wired up inside the ACPI=
 firmware,
so it _should_ work.

Maybe it has to do something with https://github.com/NVIDIA/open-gpu-kerne=
l-modules/discussions/1447,
can you check if changing the cTGP limit triggers ACPI events? You should =
be able to observe such
events using acpi_listen.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> ---
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 26=20
>>> ++++++++++++++-------
>>> =C2=A0 1 file changed, 17 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index e2a6a704e942e..c0a75bc6e66db 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -366,10 +366,12 @@
>>> =C2=A0 #define UNIWILL_FEATURE_PRIMARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(8)
>>> =C2=A0 #define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(9)
>>> =C2=A0 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 B=
IT(10)
>>> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(11=
)
>>> -#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT=C2=A0=C2=A0=C2=A0 BIT(12)
>>> -#define UNIWILL_FEATURE_AC_AUTO_BOOT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(13)
>>> -#define UNIWILL_FEATURE_USB_POWERSHARE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(14)
>>> +/* Mutually exclusive with the cTGP control feature */
>>> +#define UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY=C2=A0=C2=A0=C2=A0 BIT(=
11)
>>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(12=
)
>>> +#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT=C2=A0=C2=A0=C2=A0 BIT(13)
>>> +#define UNIWILL_FEATURE_AC_AUTO_BOOT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(14)
>>> +#define UNIWILL_FEATURE_USB_POWERSHARE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(15)
>>> =C2=A0 =C2=A0 enum usb_c_power_priority_options {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_CHARGING =3D 0,
>>> @@ -1004,7 +1006,9 @@ static int uniwill_nvidia_ctgp_init(struct=20
>>> uniwill_data *data)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports_any(data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA=
_CTGP_CONTROL |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA=
_DB_SUPPORT_ONLY))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regma=
p,=20
>>> EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
>>> @@ -2577,7 +2581,9 @@ static int=20
>>> uniwill_suspend_usb_powershare(struct uniwill_data *data)
>>> =C2=A0 =C2=A0 static int uniwill_suspend_nvidia_ctgp(struct uniwill_da=
ta *data)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports_any(data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA=
_CTGP_CONTROL |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA=
_DB_SUPPORT_ONLY))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return regmap_clear_bits(data->r=
egmap, EC_ADDR_CTGP_DB_CTRL,
>>> @@ -2686,7 +2692,9 @@ static int=20
>>> uniwill_resume_usb_powershare(struct uniwill_data *data)
>>> =C2=A0 =C2=A0 static int uniwill_resume_nvidia_ctgp(struct uniwill_dat=
a *data)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports_any(data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA=
_CTGP_CONTROL |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA=
_DB_SUPPORT_ONLY))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return regmap_set_bits(data->reg=
map, EC_ADDR_CTGP_DB_CTRL,
>>> @@ -2910,7 +2918,7 @@ static struct uniwill_device_descriptor=20
>>> phxtqxx_phxagxx_phxaqxx_phxpgxx_descript
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_SECONDARY_FAN |
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .kbd_led_single_color =3D true,
>>> @@ -3106,7 +3114,7 @@ static int phxarxx_phxaqxx_probe(struct=20
>>> uniwill_data *data)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (value & HAS_GPU)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->features =
|=3D UNIWILL_FEATURE_GPU_TEMP |
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 };
>>
>
