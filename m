Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695673;
	b=SyNhdU3NyeZCZ+h9pkHjnM2RNeHOcFElohO0iJlTnY+ueiO2c3+r44GrvvG1UaZMssck
	 QwGGYu/S71UoXuWOVDJ4f86XWA8U27iQgBPuT6xOc6OHKVlcU/KzMnxysi9LpLDzjA7Bz
	 AxamGI71Ka0+veVoxQJSxQg8VWsXWeSb0cs7QKpCI+rM1jp68ZZsW4iC7wOxHJMo+3rgy
	 eMb/MtX1hdCFkuQwRq37BcRLdQGmzfsbeOIJR5UuH0y2siwDdvc6TjgnqgFqgyde6+bkt
	 nULZhHLdGrAmWgSZyRMu8cLtIrqX0OFTzZxyaC51pWTEr4Zdcr7kjTAY94ejWW+8tLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695673;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=CHEjAoC69VXdBks94HEYmeYGFOFSYDBxDKQhVtoGcY0=;
	b=xS92NdDKizUuOrjfU7IPn3mRDEk/JnQyxPD1OeUkF7r4kEP0KQ8FAyw2d/E7LGwA7NiG
	 rwFMkp0FMDQLj0iXegstPhi0sdhzDHuaXdEiG+v/dQddeBWChPHWH3c2gWCDBPhj/rQHe
	 TO39A9hzH7q3u+kQBL8lUqyG6RLKfp8SX7bq4Jf3PwaI5TIB0ndbMB6/c8NX6eWqMEOKE
	 HpOJUYuGqSYs95BOHAqaY55epigGQFCWfyOF0DE7/uc8t0qyanhLKqIA7+Ap8xgqzHgEa
	 ydczjReO28zf6i8Pii46qltPi9jBEK3xph2hKQTWqpmp6C2bTXhQYVSeNt2okkGUmdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=XDiWSuUF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7C3606A32C;
	Thu, 26 Nov 2026 12:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7C3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=XDiWSuUF
ARC-Seal: i=1; a=rsa-sha256; t=1795695659; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UvkEe01t571u2ruhHxbofncl4bOTjqG6jE7W1yQdueJfxehkbs8Y3YazR0Bc6DSuLLLpakU90eypnJ5rHccM7CAR9sBuK25mpv4x5clyhZiVNNcZgIq3QX9kQkliEJULKHABFn4p7eJ9npK1WpXzLHe/WtMl1mt5a7eJ6S6iJfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795695659; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CHEjAoC69VXdBks94HEYmeYGFOFSYDBxDKQhVtoGcY0=; 
	b=l8FQ8rhQ8dOtcynZ/oeAfoKl4ayq+eq199DrabVG6cF6A+FQmoXF8WdRHC32xBZzHM2oZOFXhpugDplmnIWrGrenj2fFi3Dv4IYqN7vQYmpteDkbW4hO9s3RdBd8TkchBxEJrdFsM8HNSCfbbjOpVS/9B4vZHfnvXBmzbzh/0UY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=XDiWSuUF06ArwXo5uo4DIBrzLGZN3QzglRGyJIKdbfvD1O2cHGiQv1k7nXagb1U7MCySDuFm/rqzj8L/9/NkfIZRyNLYOp/OmJ4Nptg4OzsJAinDjs0V02yqoL4xKQ14kuvQTq9K3OM1nB5LidBBJXvbDDtgTy5bHFm4kySPVSJMN1KZpPBJQu7IFHiqlI7s3uyoie46BkodAFly9/J2dqLOQOUHRHGOJ+yhgwsHt1svbD+Z87O35FlAmA8AIGtj+xEwBh/keCXkW5iPETj88RFhELZsarxyzYnfekAbfOv0HbB+Ljs0+2aFyRWl90DjzU8kcD9lQW5i76faWy8HRw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=CHEjAoC69VXdBks94HEYmeYGFOFSYDBxDKQhVtoGcY0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795695657334712.6395625652469;
	Thu, 26 Nov 2026 04:20:57 -0800 (PST)
Message-ID: <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: don't warn about
 keyboard backlight type 0
From: Rong Zhang <i@rong.moe>
To: Arnav Kapoor <kapoorarnav43@gmail.com>, Hans de Goede
 <hansg@kernel.org>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  "Derek J . Clark"
 <derekjohn.clark@gmail.com>, Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
 	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261126073107.765676-1-kapoorarnav43@gmail.com>
References: <20261126073107.765676-1-kapoorarnav43@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:15:50 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Arnav,

On Thu, 2026-11-26 at 13:01 +0530, Arnav Kapoor wrote:
> On the Lenovo V14 G2 ITL (82KA), which has no keyboard backlight, every
> boot logs:
>=20
>   ideapad_acpi VPC2004:00: Unknown keyboard type: 0
>=20
> followed by "Keyboard backlight control not available". The KBLC type
> query (Arg0 =3D=3D 1) in this machine's DSDT reads KBGC from the EC but
> always returns Zero, and KBLC also returns Zero whenever the EC is not
> available or LFCM cannot be acquired. So 0 is not an unknown backlight
> type but the value for "no KBLC keyboard backlight", which the driver
> already handles by leaving features.kbd_bl unset.
>=20
> Only warn for non-zero values, and add the missing newline to the
> message.

See https://msgid.link/20261107140700.16036-1-punnaysharma805@gmail.com

Thanks,
Rong

>=20
> Fixes: ecaa1867b524 ("platform/x86: ideapad-laptop: Add support for keybo=
ard backlights using KBLC ACPI symbol")
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---
> Tested on a V14 G2 ITL (BIOS GGCN55WW) with the 7.0.14-based
> kernel: reloading the stock ideapad-laptop logs the warning, the same
> module with this patch applied doesn't, and the rest of the probe output
> and the sysfs state (platform profiles, fn_lock, camera_power,
> usb_charging, charge_types) are unchanged. Build-tested (W=3D1) on pdx86
> for-next.
>=20
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index d2344dcd6945..d5679ff2e8ab 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -2627,9 +2627,9 @@ static int ideapad_check_features(struct ideapad_pr=
ivate *priv)
>  =09=09=09} else if (val =3D=3D KBD_BL_TRISTATE_AUTO_TYPE) {
>  =09=09=09=09priv->features.kbd_bl =3D true;
>  =09=09=09=09priv->kbd_bl.type =3D KBD_BL_TRISTATE_AUTO;
> -=09=09=09} else {
> +=09=09=09} else if (val) {
>  =09=09=09=09dev_warn(&priv->platform_device->dev,
> -=09=09=09=09=09 "Unknown keyboard type: %lu",
> +=09=09=09=09=09 "Unknown keyboard type: %lu\n",
>  =09=09=09=09=09 val);
>  =09=09=09}
>  =09=09}
>=20
> base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
