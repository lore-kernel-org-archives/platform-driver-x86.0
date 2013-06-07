From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH 1/3] thinkpad_acpi: return -NODEV while operating uninitialized LEDs
Date: Fri, 07 Jun 2013 10:53:50 +0200
Message-ID: <87vc5qxpwh.fsf@nemi.mork.no>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
	<1370593209-21358-2-git-send-email-adam.lee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370593209-21358-2-git-send-email-adam.lee@canonical.com> (Adam
	Lee's message of "Fri, 7 Jun 2013 16:20:07 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Lee <adam.lee@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

Adam Lee <adam.lee@canonical.com> writes:

> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5401,9 +5401,12 @@ static int led_write(char *buf)
>  		return -ENODEV;
> =20
>  	while ((cmd =3D next_cmd(&buf))) {
> -		if (sscanf(cmd, "%d", &led) !=3D 1 || led < 0 || led > 15)
> +		if (sscanf(cmd, "%d", &led) !=3D 1)
>  			return -EINVAL;
> =20
> +		if (!tpacpi_leds[led].led)
> +			return -ENODEV;

This looks risky.  Why did you remove the index sanity check?  What wil=
l
happen now if the input is e.g "-1" or "42"?

BTW, the magic number 15 should probably be (TPACPI_LED_NUMLEDS - 1)
instead.



Bj=C3=B8rn
