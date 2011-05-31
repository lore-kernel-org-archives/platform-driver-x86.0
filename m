From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] acer-wmi: fix bitwise bug when set device state
Date: Tue, 31 May 2011 00:31:57 -0600
Message-ID: <4DE517FD020000230002D4DA@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: corentincj@iksaif.net, dtor@mail.ru, Joey Lee <JLee@novell.com>, carlos@strangeworlds.co.uk, trenn@suse.de, platform-driver-x86@vger.kernel.org

Hi Matthew,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 14:20 +0800=EF=BC=8CLe=
e, Chun-Yi =E6=8F=90=E5=88=B0=EF=BC=9A
> Fix a bitwise bug that was found by Joern Heissler, it must be OR
> but not AND when we query current device state.
>=20
> Acked-by: Joern Heissler <linux-acpi@joern.heissler.de>
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Dmitry Torokhov <dtor@mail.ru>
> Cc: Corentin Chary <corentincj@iksaif.net>
> Cc: Thomas Renninger <trenn@suse.de>
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> ---
>  drivers/platform/x86/acer-wmi.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 005417b..7d4675a 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1156,9 +1156,9 @@ static acpi_status wmid3_set_device_status(u32 =
value, u16 device)
>  	struct wmid3_gds_input_param params =3D {
>  		.function_num =3D 0x1,
>  		.hotkey_number =3D 0x01,
> -		.devices =3D ACER_WMID3_GDS_WIRELESS &
> -				ACER_WMID3_GDS_THREEG &
> -				ACER_WMID3_GDS_WIMAX &
> +		.devices =3D ACER_WMID3_GDS_WIRELESS |
> +				ACER_WMID3_GDS_THREEG |
> +				ACER_WMID3_GDS_WIMAX |
>  				ACER_WMID3_GDS_BLUETOOTH,
>  	};
>  	struct acpi_buffer input =3D {

Sorry for my mistake!!
There have a bitwise bug in commit
6d88ff0f8ef3529f68233d3963b2a7e07f8e4f69 in kernel 3.0-rc1.=20

Please kindly help to review and merge this patch to 3.0-rc2 to fix it.


Thank's a lot!
Joey Lee
