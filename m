Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384203A83B1;
	Thu,  6 Aug 2026 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032024; cv=none; b=Xj4Db6wNhi6ombhXrT+p8aYvv2t3u/CvHMD5H9UALCQedf3/xPuZ6DBkaUoyhhxUaR/N8nEG2dnrOpK+XrSZMyWqdnlaJLxyH7RVgFZcAnHNUxuJ2fv4iurJVjF5SvWhrgLwj3Y0iUlZrQzRndV1uwZaIaSIFhU3ckglvsGRtHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032024; c=relaxed/simple;
	bh=U9RBljhzoCjwTJScmyfzCLOkrEzl5BNtVCaOICDBQuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ub/SUJDKAhH7ud9IGlGJ4IItS1WYyB5sluMrEIGjfNaWzUZUk/PFId20f596X0TQ6AkHGPmINNYKqIbFZOz2YO4j1v8/uqqbQxwiL+QOO6clSDB3AkUHfQbLzk5WHnJpQhX8GGLo3NA/1rk9IGtKolnlncsXtrxQdXqNq+YdE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=t5MEttYz; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="t5MEttYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786032020; x=1786636820; i=w_armin@gmx.de;
	bh=NrBafkIiuxoOolOK7Grv2P4IPL8XBIJYIPmLsPTzCSc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=t5MEttYzPOu0/j59ZP38TZ7I3lHsVXUThl2biYWK94nwXD+Hqm7lF4+qqecWS0PR
	 is7vaXkgGCy4PQXresF5ZJtWzIrFA/+hyUxAfv1oY8WEgvjRh/hbLazBK3dL1kHG2
	 vXCJzLF3b2b4ZoEHIp7nrAHMy2kEVMTecHZ4d+V90d30iTmoFXlDDotNjvlreQeRF
	 PGEvLZE8t4Jvo5tSE51Kp6NawcylAZ0OS0XYXO+nq/ovjrNfCGW74MwFyjKBLc5vr
	 seFrONGyRdXnMAiv8zn6DZTiWg4nBdCVLYMZbdrLrLyG9IONGbhFaTlIBkzQjHpTi
	 PLygQznW4ha/Fccg1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0FxV-1x4s8B16iV-00uLoq; Thu, 06
 Aug 2026 18:00:20 +0200
Message-ID: <84c68920-838a-4153-a3b0-f3094d629a23@gmx.de>
Date: Thu, 6 Aug 2026 18:00:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: uniwill-laptop: Fix brightness
 notify for 3 level keyboards
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805230538.464753-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260805230538.464753-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Obj25WflLb5tnAOFuXTSaNW32TIv7PQbkjLEK5NJSjjZQkwK327
 jLYndrEU1ElfpojCYQlCFXG+XIHHXAwWgE9pAN3kZ/BClq7Cna4ortdPW+eAnNNxdqIr7ig
 gBEh/LAFKApFK9I0htfzT+CYFsBlzSFm4WUIv+VbnveGk+f03LeOQK/QV4eeq3iAVOqP2a0
 VRdu9HOpQIKKwJTrsryJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BUWEQHvr7zo=;NgS2/aASzHr39x55bt0HOgc0C53
 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

Am 06.08.26 um 01:04 schrieb Werner Sembach:

> The devices with 3 brightness level keyboards send
> UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
> UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
> UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2.
>
> This patch maps the events correctly to brightness levels 0, 1, and 2.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> V1->V2: Use the events as source of truth for brightness_hw_changed valu=
e
>          again to avoid a race condition as Armin had pointed out.
>
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec4c961..5c5bb6d104494 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1631,6 +1631,18 @@ static int uniwill_notify_kbd_led(struct uniwill_=
data *data, int brightness)
>   	struct led_classdev *led_cdev;
>   	int ret;
>  =20
> +	/*
> +	 * The devices with 3 brightness level keyboards send
> +	 * UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
> +	 * UNIWILL_OSD_KB_LED_LEVEL4 which need to be mapped to 0, 1, and 2.
> +	 */
> +	if (data->kbd_led_max_brightness =3D=3D 2) {
> +		if (brightness =3D=3D 2)
> +			brightness =3D 1;
> +		else if (brightness =3D=3D 4)
> +			brightness =3D 2;

Please return -EINVAL should brightness be 1 or 3 (by using a switch state=
ment). With this being addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +	}
> +
>   	if (data->kbd_led_single_color)
>   		led_cdev =3D &data->kbd_led_cdev;
>   	else
>
> base-commit: 1b04f556e8428a3865a95627ab7a0acb5d9b93a5
