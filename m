Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2734B19A;
	Fri, 12 Jun 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286854; cv=none; b=mCTMtlFx50XP6rVUiIe4uF+80nJDd84ifqY92YBLcgC60SC6NI9kCDpDRAAjlCw3G3stm/rtru/9Ncd/dQdDULcGc618FUpx2y7y9azMQrNxu9KDdXi0WtFLPw3jWFhjPYZDCHKPuJbweg4p5fpuaKmgK8Ywtcb8pdO9GSGl+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286854; c=relaxed/simple;
	bh=faHWTksN/SPlPHYMwhG7g6diocvZ/gVpW87te24cMQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4sV7f/e3VsJClmBadOn8PV24ofSzegcTksJNRNDPxOqCifEQsVcaWAqrHKfX4PoRrl6dmJq1PeNBuBuY+VoY9jy26MJwjYJxUDJ2LGNlfyWHDKkQvM7Pb+2/P/ew9dJBK0ja/EESjAr5Zrw17DDkmMe/EDxpYi9amcp0JQ0EIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=H3I24jV9; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="H3I24jV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781286847; x=1781891647; i=w_armin@gmx.de;
	bh=UpQPTMS2bXVoycgUj/eKPmBGrpeX9m2izkdTPGMuHbQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=H3I24jV93I/xQQ2S9op4KWieS40QwWWzo/u7li2hTC9bdIGQowqfEe397XWFY1FY
	 bjHoCC0SL9/GdIJvzQ78j2R3hEJ9Eff70YkI96sczudHPrUl6k7qXDQl+X8oTZSYl
	 yZbQADQ843/ibIHwKYFp23HNheBW7cvfqQQNf41/iGOlMf7MyheSNJF9fmfauXe6Q
	 zcL71R8PdLXUB0BXDtofjhYN0D54FCrHWWNlLNH45h+kchzNWsbTJLSXVGrrP0BJn
	 dc17HC34I8k4rw42QEEQ2FCpZBLa8QZEd7kXAmirFgwVSp3uTqb9eXQqLxtHoTQi8
	 JqRHU4EkX7PcbgUlbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17UW-1xEYNR0BmU-011IPl; Fri, 12
 Jun 2026 19:54:07 +0200
Message-ID: <30e344d9-014f-4bac-895e-52576d2a73f9@gmx.de>
Date: Fri, 12 Jun 2026 19:54:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: msi-wmi: Add MSI Claw M-Center keys
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
 <20260611223920.1679438-3-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260611223920.1679438-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vOSpnoR+xVjOQwxea9U7BowGe+5uwu+4k0wrRMRG8HPs+UfYcm6
 sW1hb4OuijdJweISFZqd2P5cqK3uAlWxpITtFaZkrpqtjk9g8Qinj35opoNW4BuDYTk0006
 lwhwU4PIyEIWz2sCAFsLErE2eo8ge+r99hpF6lZ7ICKsZ8+6hs2P1VSMyTakCzFgTrGo+Cw
 yVdRvgGBthXnnaHk9Uphw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AvyZUfqsqsg=;uo6JskoS2ajsMRSywbd1z3M3a29
 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

Am 12.06.26 um 00:39 schrieb Derek J. Clark:

> MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID for
> some of their buttons. When pressed, these cause spam in the kernel. For
> the majority of devices these events can be safely ignored as they are
> duplicated by the AT Translated Set 2 Keyboard device exposed as an
> evdev. For the MSI Claw A8 BZ2EM model's M-Center Menu button (left of
> the screen) there is no associated keyboard event, so this event must be
> exposed. Map this button to the same scancode produced by the AT
> Keyboard device on other models. This does cause double F15 events on
> the A1M, 7 AI+ A2VM, and 8 AI+ A2VM, but it appears to be harmless in my
> testing.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>   drivers/platform/x86/msi-wmi.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-w=
mi.c
> index d00ced756581..73a4f0d2dc04 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -46,6 +46,12 @@ enum msi_scancodes {
>   	WIND_KEY_WLAN		=3D 0x5f,	/* Fn+F11 Wi-Fi toggle */
>   	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
>   	WIND_KEY_ECO		=3D 0x69,	/* Fn+F10 ECO mode toggle */
> +	/* MSI Claw keys */
> +	CLAW_KEY_VOLUMEDOWN	=3D 0x21,
> +	CLAW_KEY_CENTER		=3D 0x29,	/* MSI M-Center main menu */
> +	CLAW_KEY_QUICK_LONG	=3D 0x2a,	/* MSI M-Center quick access long hold *=
/
> +	CLAW_KEY_VOLUMEUP	=3D 0x32,
> +	CLAW_KEY_QUICK_SHORT	=3D 0x58,	/* MSI M-Center quick access short pres=
s */
>   };
>   static struct key_entry msi_wmi_keymap[] =3D {
>   	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
> @@ -69,6 +75,15 @@ static struct key_entry msi_wmi_keymap[] =3D {
>   	{ KE_KEY, WIND_KEY_TURBO,		{KEY_PROG1} },
>   	{ KE_KEY, WIND_KEY_ECO,			{KEY_PROG2} },
>  =20
> +	/* These are MSI Claw keys, used for MSI M-Center in Windows */
> +	{ KE_KEY, CLAW_KEY_CENTER,		{KEY_F15} },
> +
> +	/* These MSI Claw keys work without WMI. Ignore them to avoid double k=
eycodes */
> +	{ KE_IGNORE, CLAW_KEY_QUICK_SHORT },
> +	{ KE_IGNORE, CLAW_KEY_QUICK_LONG },
> +	{ KE_IGNORE, CLAW_KEY_VOLUMEUP },
> +	{ KE_IGNORE, CLAW_KEY_VOLUMEDOWN },
> +
>   	{ KE_END, 0 }
>   };
>  =20
> @@ -183,6 +198,13 @@ static void msi_wmi_notify(union acpi_object *obj, =
void *context)
>   		eventcode =3D obj->integer.value;
>   		pr_debug("Eventcode: 0x%x\n", eventcode);
>   		break;
> +	case ACPI_TYPE_BUFFER:
> +		if (!obj->buffer.length)
> +			return;
> +
> +		eventcode =3D obj->buffer.pointer[0];
> +		pr_debug("Eventcode: 0x%x\n", eventcode);

Can you share the BMOF associated with this event? I suspect that the buff=
er should
contain a u32.

Thanks,
Armin Wolf

> +		break;
>   	default:
>   		pr_info("Unknown event received\n");
>   		return;
