Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794063300;
	b=bgq30HdRnsqldBw2Lk1rlqgXlzRuMl4JkgqJC1Xc4aZ5YTzs4QOAFCcfhH1STmBiVpyZ
	 ho6aMqqRSbBfQELiRibsjgxS5xMqqEqoD7XeevOdn/jroKNRiS4XWijQf3BLks3iTEOrw
	 87KK0p4XZUid3/rCjIAfpVHtPEN3KqCBKiG3PE2X3QtmpMhsemN9H0Car5cVcvSJXWIua
	 0+58Wedkg2MwtBvuYBSVbllcmt4RsfWA18A2+K6QGoTGWKZbbaZnotSRj8GxHBWs1EbyJ
	 ZkRSOlRq0uc4wEDQdUQJzci37XLvWnQEVk8UTyWBzqKSOd+dKTdIOMZC0xXM6/FpXIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063300;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=hcx4rkb5UDfldirdxNkVVRGffFaCO3Uk9EZz6oAx954=;
	b=SLed4xK81Gu5KTlGYl02mwXBqmYMQXdagrWQU/b/7GDZVQRGyzsAl6ZXF884mk7AD+6C
	 +EJSlso+MmJ9RvILQp/8jnBWC67p5AKYMHcstDE5y7VMtEnTcsF3lXSj3GOlArzZdrjfw
	 nvLxTlnBrgq28H3OF+u2YvPSg/7pOQmdh5gE7bhQudvQZ3WkvlqgHCE8fjF7UtRjWukaV
	 geKI1WlJ6xcfXuqCUeCIEQiovVPQcKer/s3McTAIFh736KWk9qTMkSMKbMp+aj5PQNSl3
	 s1KXJxgSA5lUhUxS/Pz3IUhDWSQo0jlXCwk4SKkp6NaYIhAViSdIE/eAGi6wVrQG3CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZNJlFPJj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F5606D824;
	Sat,  7 Nov 2026 14:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069F5606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZNJlFPJj
ARC-Seal: i=1; a=rsa-sha256; t=1794063284; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WMkp4XAWn755Wn6dHuYIcibPDiZqPoIvE2QWQlh0DUlV2O20SHjSh/OqMWeQUTjQptUOM6TNIlqJnPn6l32qYZ/Fi+A7gcWerTo78Rder7gCZ9GR9nbXqpZllU97Lm2PUD1hY66fRWmrIMQGMwu3rL1gS5P3vEPiingrlJ7vaWs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794063284; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hcx4rkb5UDfldirdxNkVVRGffFaCO3Uk9EZz6oAx954=; 
	b=eicQaKCBBV+DQmLj4BSXQFpLWy9jSrOXITZ7xP8LQUOo7T1metGSl0WITrt3wgBIbXpqeDdWJMk/zF7138mEr3kQFDKpfKhG9kYNZznvRVFGTTu9UKkkpBc0DRaEcZg7OH0RlnOOzSgWJzwK20FbcN4kxFPc43v95IBySrmKHxY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ZNJlFPJjmvipuacrXmH/7hRCRy6ehMz5zsy/tO2uVoxEvXpZa4ITI0D0b/SpD3WKer1LVKiB48FUH75hi5SqNsXKDHTmW3yoFjKEYRxJowaQ24/oQLozAghKVrf2HP7EhJqN+zHx0XbyLcrwexFyaDfMjeGoFpx2wW8E0F8YG0nw1+7zRx6lPIjT0MSpSuGzwt3MmvQqUhmNwhq4/v4w24zbTGqY4x4Ii35cE6h04jomRpSPL64LxhMv+Ov0HSseLqi0eZwgzueidp66Dqn7Wvt60FM5TD8/Goy3OjPKVNAQBqn8lbRkNJYI1fA5W3JhPbFSSrPsLDRbfYqIFgWcww==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=hcx4rkb5UDfldirdxNkVVRGffFaCO3Uk9EZz6oAx954=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794063282508348.20409846462576;
	Sat, 7 Nov 2026 06:54:42 -0800 (PST)
Message-ID: <2083b714f5f20e86d76629a9ec334c0ce0e05774.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Do not warn if KBLC
 reports no backlight
From: Rong Zhang <i@rong.moe>
To: Punnay Sharma <punnaysharma805@gmail.com>, Hans de Goede
 <hansg@kernel.org>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>
Cc: Artem <temmi556@mail.ru>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Stuart Hayhurst
 <stuart.a.hayhurst@gmail.com>, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261107140700.16036-1-punnaysharma805@gmail.com>
References: <20261107140700.16036-1-punnaysharma805@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 22:49:29 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Punnay,

On Sat, 2026-11-07 at 19:35 +0530, Punnay Sharma wrote:
> On probe, the driver asks KBLC for the keyboard backlight type and
> warns about any result other than 0x5 or 0x7.
>=20
> The LOQ 15IRX10 with an RGB keyboard returns 0x1. Its KBLC sets bit 0
> in every result, and sets bit 2 for the type query only if the EC field
> GZ35 is 0. On this model GZ35 is not 0, and a separate USB controller
> (048d:c693) drives the keyboard lights. So 0x1 means that KBLC controls
> no keyboard backlight, but the driver logs on every boot:
>=20
>   ideapad_acpi VPC2004:00: Unknown keyboard type: 1
>=20
> Add KBD_BL_NONE_TYPE for 0x1 and do not warn about it.
>=20
> Tested on a Lenovo LOQ 15IRX10 (BIOS R3CN44WW).

+CC Artem.

It seems that some devices provides functional KBLC despite
KBD_BL_QUERY_TYPE returns 0x1. See
https://bugzilla.kernel.org/show_bug.cgi?id=3D221198

Mark, Derek, could you check the documentation about keyboard backlight
type?

Thanks,
Rong

>=20
> Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
> ---
> KBD_BL_NONE_TYPE is placed last to avoid a conflict with Rong Zhang's
> pending keyboard backlight series.
>=20
> The same warning appears on other models, e.g. LOQ 15AHP10 [1] and
> Legion 5 Pro 16ACH6H [2].
>=20
> [1] https://lore.kernel.org/all/3f03931e7eafcb1781ca3cf922e588ab57caadcf@=
lavx.hu/
> [2] https://github.com/johnfanv2/LenovoLegionLinux/issues/336
>=20
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index fcb5ed7035f5..eb4158bed264 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -148,6 +148,7 @@ enum {
>  #define KBD_BL_QUERY_TYPE=09=090x1
>  #define KBD_BL_TRISTATE_TYPE=09=090x5
>  #define KBD_BL_TRISTATE_AUTO_TYPE=090x7
> +#define KBD_BL_NONE_TYPE=09=090x1=09/* No backlight through KBLC */
> =20
>  #define KBD_BL_COMMAND_GET=09=090x2
>  #define KBD_BL_COMMAND_SET=09=090x3
> @@ -2246,7 +2247,7 @@ static int ideapad_check_features(struct ideapad_pr=
ivate *priv)
>  =09=09=09} else if (val =3D=3D KBD_BL_TRISTATE_AUTO_TYPE) {
>  =09=09=09=09priv->features.kbd_bl =3D true;
>  =09=09=09=09priv->kbd_bl.type =3D KBD_BL_TRISTATE_AUTO;
> -=09=09=09} else {
> +=09=09=09} else if (val !=3D KBD_BL_NONE_TYPE) {
>  =09=09=09=09dev_warn(&priv->platform_device->dev,
>  =09=09=09=09=09 "Unknown keyboard type: %lu",
>  =09=09=09=09=09 val);
>=20
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
