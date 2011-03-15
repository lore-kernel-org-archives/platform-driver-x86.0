From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] acer-wmi: Fix WMI ID
Date: Tue, 15 Mar 2011 10:24:07 -0600
Message-ID: <4D802D570200002300029DA0@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

Hi Pali,=20

=E6=96=BC =E6=97=A5=EF=BC=8C2011-02-27 =E6=96=BC 12:06 +0100=EF=BC=8CPa=
li Roh=C3=A1r =E6=8F=90=E5=88=B0=EF=BC=9A
> This patch change WMI ID to upper characters. With this patch module
> acer-wmi is automatically loaded when WMI ID is detected.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20
> --- a/drivers/platform/x86/acer-wmi.c	2011-02-27 11:53:50.000000000 +=
0100
> +++ b/drivers/platform/x86/acer-wmi.c	2011-02-27 11:58:30.000000000 +=
0100
> @@ -84,8 +84,8 @@ MODULE_LICENSE("GPL");
>   */
>  #define AMW0_GUID1		"67C3371D-95A3-4C37-BB61-DD47B491DAAB"
>  #define AMW0_GUID2		"431F16ED-0C2B-444C-B267-27DEB140CF9C"
> -#define WMID_GUID1		"6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3"
> -#define WMID_GUID2		"95764E09-FB56-4e83-B31A-37761F60994A"
> +#define WMID_GUID1		"6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3"

WMID_GUID1 already fixed by Matthew's patch, don't need fix again.


> +#define WMID_GUID2		"95764E09-FB56-4E83-B31A-37761F60994A"
>  #define WMID_GUID3		"61EF69EA-865C-4BC3-A502-A0DEBA0CB531"
>=20
>  /*
> @@ -94,7 +94,7 @@ MODULE_LICENSE("GPL");
>  #define ACERWMID_EVENT_GUID "676AA15E-6A47-4D9F-A2CC-1E6D18D14026"
>=20
>  MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
> -MODULE_ALIAS("wmi:6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3");
> +MODULE_ALIAS("wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3");

The same, here.

>  MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
>=20
>  enum acer_wmi_event_ids {
>=20
>=20

I am not sure miss your any patch, but looks like you still send out th=
e
same change.=20
Please git pull your platform-drivers-x86/master repo, you will look th=
e
newest acer-wmi source code.


Thank's a lot!
Joey Lee
