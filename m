From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH 1/1] platform: x86: Deletion of checks before backlight_device_unregister()
Date: Mon, 24 Nov 2014 22:28:32 +0100
Message-ID: <3842367.ojrMxTW2rH@path>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <547389A6.9090106@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <547389A6.9090106@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: platform-driver-x86.vger.kernel.org

Hi Markus,

Le lundi 24 novembre 2014, 20:40:22 SF Markus Elfring a =E9crit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 24 Nov 2014 20:30:29 +0100
>=20
> The backlight_device_unregister() function tests whether its argument=
 is
> NULL and then returns immediately. Thus the test around the call is n=
ot
> needed.
>=20
> This issue was detected by using the Coccinelle software.

What script was used ? Is it in scripts/coccinelle ?


> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/ms=
i-wmi.c
> index 70222f2..6d2bac0 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -354,8 +354,7 @@ static void __exit msi_wmi_exit(void)
>  		sparse_keymap_free(msi_wmi_input_dev);
>  		input_unregister_device(msi_wmi_input_dev);
>  	}
> -	if (backlight)
> -		backlight_device_unregister(backlight);
> +	backlight_device_unregister(backlight);
>  }
>=20
>  module_init(msi_wmi_init);

=46or this part:
Acked-by: Anisse Astier <anisse@astier.eu>

Regards,

Anisse
