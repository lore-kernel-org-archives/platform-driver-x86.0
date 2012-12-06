From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v2 7/8] msi-wmi: Fix memory leak
Date: Thu, 06 Dec 2012 10:55:45 +0800
Message-ID: <1354762545.21227.1589.camel@linux-s257.site>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
	 <1354291477-8788-8-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:55641 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754166Ab2LFC4z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Dec 2012 21:56:55 -0500
In-Reply-To: <1354291477-8788-8-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E4=BA=94=EF=BC=8C2012-11-30 =E6=96=BC 18:04 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Fix memory leak - don't forget to kfree ACPI object when returning fr=
om
> msi_wmi_notify() after suppressing key event.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/msi-wmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/ms=
i-wmi.c
> index 2264331..b96766b 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -176,7 +176,7 @@ static void msi_wmi_notify(u32 value, void *conte=
xt)
>  				pr_debug("Suppressed key event 0x%X - "
>  					 "Last press was %lld us ago\n",
>  					 key->code, ktime_to_us(diff));
> -				return;
> +				goto msi_wmi_notify_exit;
>  			}
>  			last_pressed[key->code - SCANCODE_BASE] =3D cur;
> =20
> @@ -195,6 +195,8 @@ static void msi_wmi_notify(u32 value, void *conte=
xt)
>  			pr_info("Unknown key pressed - %x\n", eventcode);
>  	} else
>  		pr_info("Unknown event received\n");
> +
> +msi_wmi_notify_exit:
>  	kfree(response.pointer);
>  }
> =20
