Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.12.121.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327719;
	b=M/+KY5vGi2S+rSm+r09eR1gXbjoI+nMBARFjaFIwk5UfgEVAzj8J1XhSQCMPQ8xe3EWh
	 H0ypMT2k664RjyLzJa2MOGnAgsIeWPVF60Lr1h6IrfXawR3hjoMO4Ca0Ti94Gh3YDOKFX
	 sL2dNwUylJTncrHrc6583saIzlkOn2ptlqcBlGqlYXMQVhPg41yRkY+Y4tV+cDKG/D/6W
	 opQS9GcSDEdkOlqqUIG1WZrIO2IoiAWCDWcbGvOewqkBnc9UdQpImvABombOT0bY6GAVe
	 dgbkduE89puhKRPCSh7dEAy7qovsP3Mt+sduLMaAqfP0qZ9OZsU+rTdeBYzT6mL7Kww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327719;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pVLVh+TGscVXqvwUZS9QseOaZ7BrydJwWL6vHpXLb+o=;
	b=w1JGSpSDXTdRuleOtMejCOeiCI/k7uheeyOHpu2Yh8tSYSihEB2WgFNORSzkSMpsnQ4F
	 toohVMqGXZcdrOfolLJFIdkJPM/gVgiojr4iYiEBj+RV0SWjfCw/ax92XDjCFcxjwqZbC
	 gAmZbBuGcwcJKcc1Ix6P3z8VGC0i4xIS1O+3Unz9y315SsNaXpaDUygqY6lTTNCgBTlze
	 7amlLb8bndBovODMuflyi7/PIXxhhBaJ1LDq72+QpdIYXvKKKKbV5lSJ2r7wK8nK9JDWc
	 PT89Ew7QB8O8Gvh1fntoJ8znKyz2Yvrb3yIEeRuNXEyvzypkIkiP+a+oJ6p+nIbyaBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=barrensea.org;
	spf=pass smtp.mailfrom=barrensea.org;
	dkim=pass header.d=barrensea.org header.i=@barrensea.org header.a=rsa-sha256 header.s=mail header.b=eFNizDrH;
	arc=none smtp.remote-ip=198.12.121.168
Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A415606A320;
	Sun, 22 Nov 2026 06:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A415606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=barrensea.org header.i=@barrensea.org header.a=rsa-sha256 header.s=mail header.b=eFNizDrH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1795327711;
	bh=xzNeCi2m6cFwnHE3UxVXv5ZB1pxBCu55uK+vR0sAais=;
	h=From:To:Cc:Subject:In-Reply-To;
	b=eFNizDrHt7e+7NhPHppZqfCUoyb0E7dcqrP5j4s1Rx6CiRvfT8eziadc/49XWxPGD
	 TkgmyxFtOuzBQcIUldHHvDQvSQNtojJAlsxEQUGfC+SOC1/tMuba1XlPtEm3gQhBYD
	 wFGr1AdRJCQBVyemj940y5O+CPOY396YgpzZaaAadjxuYgz1Pj4uoOc7+wT4hdMPzU
	 Zuk2XQddGKbhUnErbz6l5U9kWoO5eiZ6vEycBX4cetwui/uLybT/QAqr1HJ9JMeVaL
	 s24ajcyc4F38Az/g+cvtn6cBlZBGkhgbtjm4yuKzL5IBkCTfOqERQYWSyl7uYG5+GC
	 2AgMYKiVmhgJw==
From: Yifei Yao <donplat@barrensea.org>
To: W_Armin@gmx.de
Cc: hansg@kernel.org,  ilpo.jarvinen@linux.intel.com,
  platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org,donplat@barrensea.org
Subject: Re: [PATCH v5] uniwill: Add support for MECHREVO WUJIE Series 15 X Pro
In-Reply-To: <878q3cc4im.fsf_-_@barrensea.org>
Date: Sun, 22 Nov 2026 14:08:26 +0800
Message-ID: <87mrr1iejp.fsf@barrensea.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Armin,

A gentle ping on this patch.It has been about 20 days since I posted the
rebased patch.  Could you please take a look when you have a chance?

To avoid any confusion, I have included our previous correspondence
below for reference, along with the rebased patch.

> > Am 11.10.26 um 10:14 schrieb Donjuanplatinum:
> >


> > Does the OEM control center for Windows support battery charging
> > modes? If yes then you should also select
> > UNIWILL_FEATURE_BATTERY_CHARGE_MODES.
> >
> > Other than that the patch looks fine to me, but i would be very happy
> > if you could rebase it on the current for-next branch.
> >
> > Thanks, Armin Wolf

> Hi Armin, I think some of my previous replies may have been missed. I
> have added and tested the battery charging mode:

> > > Can you check if UNIWILL_FEATURE_BATTERY_CHARGE_MODES also works on
> > > your device?  Please note that the embedded controller will still
> > > report to charge the battery to 100%, so this is not a reliable
> > > indicator. Do you know if the Windows OEM app provides such a
> > > setting on this device?
> > >
> > > Thanks, Armin Wolf
> > >

> > I also checked the battery charge modes in the Windows OEM
> > application. The OEM application provides this setting.

> > Additionally, I used the interfaces exposed by the OEM's
> > ACPIDriverDll.dll to test the three charge modes and confirmed that
> > their behavior matches the current implementation in the Uniwill
> > driver.



> > Other than that the patch looks fine to me, but i would be very happy i=
f you
> > could rebase it on the current for-next branch.

> I put the rebased patch here,it now base the for-next:

> >From c45bac93447a52dd2e4a76395202a13c6d91763c Mon Sep 17 00:00:00 2001
> From: Donjuanplatinum <donplat@barrensea.org>
> Date: Mon, 2 Nov 2026 11:03:25 +0800
> Subject: [PATCH] platform/x86: uniwill-laptop: Add support for MECHREVO W=
UJIE
>  Series 15 X Pro

> Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
> Series-X5SP4NAG).

> Signed-off-by: Yifei Yao <donplat@barrensea.org>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)

> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index f62d59f29676..d49be1caea50 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2715,6 +2715,20 @@ static struct platform_driver uniwill_driver =3D {
>  	.shutdown =3D uniwill_shutdown,
>  };
> +static struct uniwill_device_descriptor series_x5sp4nag_descriptor __ini=
tdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +                 UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
> +		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> +		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
> +};
> +
>  static struct uniwill_device_descriptor machenike_l16p_descriptor __init=
data =3D {
>  	.features =3D UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
> @@ -3075,6 +3089,14 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>  		},
>  		.driver_data =3D &x4sp4nal_descriptor,
>  	},
> +	{
> +		.ident =3D "MECHREVO WUJIE Series 15 X Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
> +		},
> +		.driver_data =3D &series_x5sp4nag_descriptor,
> +	},
>  	{
>  		.ident =3D "MACHENIKE L16 Pro",
>  		.matches =3D {
> --=20
> 2.56.0


--=20
Donjuanplatinum, Yifei Yao <donplat@barrensea.org>
GPG: 1C9E EEE5 4C8E D5A8 3039  1C87 A9F6 8632 D259 40E6
=E6=BB=A1=E5=A0=82=E5=85=AE=E7=BE=8E=E4=BA=BA =E5=BF=BD=E7=8B=AC=E4=B8=8E=
=E4=BD=99=E5=85=AE=E7=9B=AE=E6=88=90
