From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH -rc1] msi-laptop: fix config-dependent build error
Date: Thu, 31 Mar 2011 00:41:27 -0600
Message-ID: <4D94BCC7020000230002AA34@novprvlin0050.provo.novell.com>
References: <AANLkTikwbY5mm10ZWg7B6XeSBkZXFqKcYVZfJCi2QGx_@mail.gmail.com>
 <20110330152022.9b3e6942.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20110330152022.9b3e6942.randy.dunlap@oracle.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: randy.dunlap@oracle.com
Cc: torvalds@linux-foundation.org, mjg@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=B8=89=EF=BC=8C2011-03-30 =E6=96=BC 15:20 -0700=EF=BC=8CRa=
ndy Dunlap =E6=8F=90=E5=88=B0=EF=BC=9A
> From: Randy Dunlap <randy.dunlap@oracle.com>
>=20
> The msi-laptop driver uses input_*() and sparse_keymap_*() interfaces=
=2E
> It should depend on the INPUT subsystem being present and select
> INPUT_SPARSEKMAP so that those interfaces are present.
>=20
> ERROR: "input_free_device" [drivers/platform/x86/msi-laptop.ko] undef=
ined!
> ERROR: "input_register_device" [drivers/platform/x86/msi-laptop.ko] u=
ndefined!
> ERROR: "sparse_keymap_setup" [drivers/platform/x86/msi-laptop.ko] und=
efined!
> ERROR: "input_allocate_device" [drivers/platform/x86/msi-laptop.ko] u=
ndefined!
> ERROR: "sparse_keymap_report_event" [drivers/platform/x86/msi-laptop.=
ko] undefined!
> ERROR: "input_unregister_device" [drivers/platform/x86/msi-laptop.ko]=
 undefined!
> ERROR: "sparse_keymap_free" [drivers/platform/x86/msi-laptop.ko] unde=
fined!
>=20
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: "Lee, Chun-Yi" <jlee@novell.com>
> ---
>  drivers/platform/x86/Kconfig |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> --- lnx-2639-rc1.orig/drivers/platform/x86/Kconfig
> +++ lnx-2639-rc1/drivers/platform/x86/Kconfig
> @@ -187,7 +187,8 @@ config MSI_LAPTOP
>  	depends on ACPI
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on RFKILL
> -	depends on SERIO_I8042
> +	depends on INPUT && SERIO_I8042
> +	select INPUT_SPARSEKMAP
>  	---help---
>  	  This is a driver for laptops built by MSI (MICRO-STAR
>  	  INTERNATIONAL):
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thank's, it's good to me!

Acked-by: "Lee, Chun-Yi" <jlee@novell.com>
