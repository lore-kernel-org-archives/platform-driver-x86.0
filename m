From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v3 08/12] msi-wmi: Avoid repeating constants
Date: Mon, 10 Dec 2012 13:52:16 +0800
Message-ID: <1355118736.21227.1841.camel@linux-s257.site>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
	 <1354888162-12109-9-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:46824 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751286Ab2LJFxc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Dec 2012 00:53:32 -0500
In-Reply-To: <1354888162-12109-9-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E4=BA=94=EF=BC=8C2012-12-07 =E6=96=BC 15:49 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Use GUID defines in MODULE_ALIAS strings to avoid repeating strings.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Acked-by: Lee, Chun-Yi <jlee@suse.com>

Thanks your patch
Joey Lee

> ---
>  drivers/platform/x86/msi-wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/ms=
i-wmi.c
> index b96766b..4db0c55 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -34,14 +34,14 @@ MODULE_AUTHOR("Thomas Renninger <trenn@suse.de>")=
;
>  MODULE_DESCRIPTION("MSI laptop WMI hotkeys driver");
>  MODULE_LICENSE("GPL");
> =20
> -MODULE_ALIAS("wmi:551A1F84-FBDD-4125-91DB-3EA8F44F1D45");
> -MODULE_ALIAS("wmi:B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2");
> -
>  #define DRV_NAME "msi-wmi"
> =20
>  #define MSIWMI_BIOS_GUID "551A1F84-FBDD-4125-91DB-3EA8F44F1D45"
>  #define MSIWMI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
> =20
> +MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
> +MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
> +
>  #define SCANCODE_BASE 0xD0
>  #define MSI_WMI_BRIGHTNESSUP   SCANCODE_BASE
>  #define MSI_WMI_BRIGHTNESSDOWN (SCANCODE_BASE + 1)
