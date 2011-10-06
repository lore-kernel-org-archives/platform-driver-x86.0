From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: Add wireless quirk for Lenovo 3000 N200
Date: Thu, 06 Oct 2011 16:38:34 +0800
Message-ID: <1317890314.11626.115.camel@linux-s257.site>
References: <1317756778-11822-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:42110 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932384Ab1JFIi6 (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Thu, 6 Oct 2011 04:38:58 -0400
In-Reply-To: <1317756778-11822-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Seth,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-10-04 =E6=96=BC 14:32 -0500=EF=BC=8CSe=
th Forshee =E6=8F=90=E5=88=B0=EF=BC=9A
> This quirk fixes the wlan rfkill status on this machine. Without
> it, wlan is permanently soft blocked whenever acer-wmi is loaded.
>=20
> BugLink: https://bugs.launchpad.net/bugs/865807
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
>  drivers/platform/x86/acer-wmi.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index af2bb20..dac286a 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -464,6 +464,15 @@ static struct dmi_system_id acer_quirks[] =3D {
>  		},
>  		.driver_data =3D &quirk_lenovo_ideapad_s205,
>  	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Lenovo 3000 N200",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "0687A31"),
> +		},
> +		.driver_data =3D &quirk_fujitsu_amilo_li_1718,
> +	},
>  	{}
>  };
> =20

Simple applied and tested on my acer machine, no problem!

Reviewed-by: Lee, Chun-Yi <jlee@novell.com>

Thank's for your patch!
Joey Lee
