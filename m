From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFT PATCH v2 2/2] compal-laptop: Check return value of
 power_supply_register
Date: Fri, 20 Feb 2015 14:12:02 +0100
Message-ID: <1424437922.1870.1.camel@AMDC1943>
References: <1424437480-22364-1-git-send-email-k.kozlowski@samsung.com>
 <1424437480-22364-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1424437480-22364-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Matthew Garrett <matthew.garrett@nebula.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On pi=C4=85, 2015-02-20 at 14:04 +0100, Krzysztof Kozlowski wrote:
> The return value of power_supply_register() call was not checked and
> even on error probe() function returned 0. If registering failed then
> during unbind the driver tried to unregister power supply which was n=
ot
> actually registered.
>=20
> This could lead to memory corruption because power_supply_unregister(=
)
> unconditionally cleans up given power supply.
>=20
> Fix this by checking return status of power_supply_register() call. I=
n
> case of failure, clean up sysfs entries and fail the probe.
>=20

(...)

> =20
> @@ -1072,6 +1074,7 @@ static int compal_remove(struct platform_device=
 *pdev)
> =20
>  	data =3D platform_get_drvdata(pdev);
>  	power_supply_unregister(&data->psy);
> +	/* FIXME: missing hwmon_device_unregister() */
> =20
>  	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);


Crap, I forgot to remove the FIXME note. It is no longer needed because
patch 1 fixes this.

I'll resend. Sorry for the noise.
