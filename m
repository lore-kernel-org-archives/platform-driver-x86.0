From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Platform: samsung-laptop: add DMI information for Samsung
 N150 Plus
Date: Fri, 23 Dec 2011 15:15:23 +0100
Message-ID: <CAHR064h7a=RQq=p1J+gKpC5_6ow8ChUFFkC39HwtmerHaMksjw@mail.gmail.com>
References: <87ty4ss0z4.fsf@prochyra.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:60922 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757256Ab1LWOPZ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Dec 2011 09:15:25 -0500
In-Reply-To: <87ty4ss0z4.fsf@prochyra.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrzej Prochyra <andrzej@prochyra.name>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 22, 2011 at 11:19 PM, Andrzej Prochyra
<andrzej@prochyra.name> wrote:
> From: Andrzej Prochyra <andrzej@prochyra.name>
>
> Adds DMI information for Samsung N150 Plus which identifies itself as
> "N150P" so that the driver loads and the 'acpi_backlight=3Dvendor'
> parameter does not need to be used in order for backlight control to
> work.
>
> Signed-off-by: Andrzej Prochyra <andrzej@prochyra.name>
> ---
> =C2=A0drivers/platform/x86/samsung-laptop.c | =C2=A0 10 ++++++++++
> =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> index 09e26bf..e3a496a 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -780,6 +780,16 @@ static struct dmi_system_id __initdata samsung_d=
mi_table[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.callback =3D =
dmi_check_cb,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ident =3D "N150P"=
,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_SYS_VENDOR,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "SAMSUN=
G ELECTRONICS CO., LTD."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_PRODUCT_NAME, "N150P"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_BOARD_NAME, "N150P"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .callback =3D dmi_=
check_cb,
> + =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ },
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
> --
> 1.7.4.1

Hi,
On top of what is based this patch ?
Could you try https://github.com/iksaif/platform-drivers-x86/tree/samsu=
ng-laptop
or https://github.com/iksaif/samsung-laptop-dkms ?
Are both ACPI and VGA backlight non-fonctional ? What's in
/sys/class/backlight/ ?
Thanks


--=20
Corentin Chary
http://xf.iksaif.net
