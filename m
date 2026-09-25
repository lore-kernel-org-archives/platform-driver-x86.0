Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E20477E4D;
	Fri, 25 Sep 2026 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790380368; cv=none; b=GFH+FL/IpD9mIISzCCQ0JsSaWbBUZqXvRaMk6V5tOIsa0cLC1Gy1OxUuMaZWpuZmaJw8yETuI0Isl7Tltdy8Zsa9YYsD/P/YwZsXBvK0IBAKCT747JCw0FpX1yRynlG55M33G9rrv++OYpxw9uOCiiPkr8r/hauLd1jhdl5D2C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790380368; c=relaxed/simple;
	bh=DVu8Pn/EJ2S3VIDwiqotYTfiDWS107UbqX9KP4vl7dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXtQcGcravalym0+Ke3tAxucDedzvF/mGt9m/0ChqN4UsiABmYrbu4y97ZuVIX/NygHKhc8pkogKwR29ZShwimjuzpVnj3/LMOzwaE1QHLYygsJQR1Dtf/oNA1qbaazIz3cms36+3m2//n4fV3RuRg4Ybx5gXQCMxRCx3Nz+PDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=F/fATDHv; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="F/fATDHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790380364; x=1790985164; i=w_armin@gmx.de;
	bh=nzzVQW29H8NjJ1ZklH5hO0blMgsP+u6SryHub/053fE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=F/fATDHvIInKxafIOHouhQK/b21H914bQMZKOwgJ0iGqRI5Od8plM5FO1myyr03z
	 0w0Mk0Fb18wFXj6HmJTAVtVxt4Od1GKGmp1Kl13Veal9pZjWwcVOl25725PyN6AUE
	 /csu5JdQeChlL6zVJRrlbFGMbmlYDkjlVhHRhYJD4THGmlNJT7pN84/iSrTyUjvl4
	 oImv4dNjWBXgLGA8eoKxWXa5oYUAktTkYlz6GECxt1t+jb1jkreImelUHBv/TXjM4
	 oVHAkG3yBl8ch8l9Xg9sNKdXDnP8giKwb+x1BbgX502d4wXX7VHui5xeLaZEfz8DZ
	 VOZM9fJ4VzmVjKYUAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhQC-1wMwwx3ZTw-00l1lV; Sat, 26
 Sep 2026 01:52:44 +0200
Message-ID: <94e5619d-02eb-4b55-bfcb-67964ee1def3@gmx.de>
Date: Sat, 26 Sep 2026 01:52:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: uniwill-laptop: Map the screen rotation
 key
To: Mohamed Jouini <amad3v@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>
References: <20260925211635.1422516-1-amad3v@gmail.com>
 <20260925211635.1422516-4-amad3v@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260925211635.1422516-4-amad3v@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2XWxRa99bLHc1xl1WmnMb3+9Koc1HSJr5UTFNv0CVeBOAVPyzeW
 Bk+fW7Z/FW2V+nKKAW4kS0I/N79Iq5cHtJNQlEbFvxdMj1kR6DWDtkoMliRCviWmQE7B0Ta
 xlkgcrN0/wY1cp1Pd7KztrKzIk807DnzVFYXA4WXW9ZOsZsXo1XfEdvs2KOWtPoeFevO3AD
 QwR1wFghSVxdarGh0nuTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B3nnZrnO3vk=;J+lwiQ0hRWBwblRREgO6Nup0WRa
 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
 uA+8rmpVBZi9DSNOv2nK3V9DAA==

Am 25.09.26 um 23:16 schrieb Mohamed Jouini:

> The PCSpecialist Recoil 16 AMD / TUXEDO Stellaris 16 Gen7 chassis has an
> "Sc" key next to F12, meant to rotate the lay-flat screen by 180 degrees=
.
> It reports WMI event 0xD0, which is currently reported as KEY_UNKNOWN.
> Map it to KEY_ROTATE_DISPLAY.

Unless Tuxedo know more about this event code:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
>   drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 0932e5937..f99c5e9ac 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -519,6 +519,9 @@ static const struct key_entry uniwill_keymap[] =3D {
>   	/* Reported when the user wants to toggle the webcam */
>   	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN=
 }},
>  =20
> +	/* Reported when the user wants to rotate the (lay-flat) screen by 180=
 degrees */
> +	{ KE_KEY,       UNIWILL_OSD_ROTATE_SCREEN,              { KEY_ROTATE_D=
ISPLAY }},
> +
>   	{ KE_END }
>   };
>  =20
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platfo=
rm/x86/uniwill/uniwill-wmi.h
> index b25b2f312..1b6f650c4 100644
> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
> @@ -117,6 +117,9 @@
>  =20
>   #define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
>  =20
> +/* "Sc" key next to F12 on the PCSpecialist Recoil 16 / Stellaris 16 Ge=
n7 */
> +#define UNIWILL_OSD_ROTATE_SCREEN		0xD0
> +
>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
>  =20
>   struct device;
