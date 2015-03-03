From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Patch] apple-gmux: lock iGP IO to protect from vgaarb changes
Date: Tue, 3 Mar 2015 09:27:53 -0800
Message-ID: <20150303172753.GF83894@vmdeb7>
References: <20150223215155.18444386@neptune.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59266 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754172AbbCCR1y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Mar 2015 12:27:54 -0500
Content-Disposition: inline
In-Reply-To: <20150223215155.18444386@neptune.home>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <matthew.garrett@nebula.com>

On Mon, Feb 23, 2015 at 09:51:55PM +0100, Bruno Pr=E9mont wrote:
> As GMUX depends on IO for iGP to be enabled and active, lock the IO a=
t
> vgaarb level. This should prevent GPU driver for dGPU to disable IO f=
or
> iGP while it tries to own legacy VGA IO.
>=20
> This fixes usage of backlight control combined with closed nvidia
> driver on some Apple dual-GPU (intel/nvidia) systems.
>=20
> On those systems loading nvidia driver disables intel IO decoding,
> disabling the gmux backlight controls as a side effect.
> Prior to commits moving boot_vga from (optional) efifb to less option=
al
> vgaarb this mis-behavior could be avoided by using right kernel confi=
g
> (efifb enabled but vgaarb disabled).
>=20
> This patch explicitly does not try to trigger vgaarb changes in order
> to avoid confusing already running graphics drivers. If IO has been
> mis-configured by vgaarb gmux will thus fail to probe.
> It is expected to load/probe gmux prior to graphics drivers.
>=20
> Fixes: ce027dac592c0ada241ce0f95ae65856828ac450 # nvidia interaction
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D86121
> Reported-by: Petri Hodju <petrihodju@yahoo.com>
> Tested-by: Petri Hodju <petrihodju@yahoo.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Matthew Garrett <matthew.garrett@nebula.com>
> Signed-off-by: Bruno Pr=E9mont <bonbons@linux-vserver.org>

Hi Bruno,

Only a minor nit below.

> ---
>  drivers/platform/x86/apple-gmux.c | 43 +++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86=
/apple-gmux.c
> index b9429fb..22da6a3 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c

=2E..

> @@ -475,7 +494,7 @@ static int gmux_probe(struct pnp_dev *pnp, const =
struct pnp_device_id *id)
>  			ver_minor =3D (version >> 16) & 0xff;
>  			ver_release =3D (version >> 8) & 0xff;
>  		} else {
> -			pr_info("gmux device not present\n");
> +			pr_info("gmux device not present or IO disabled\n");
>  			ret =3D -ENODEV;
>  			goto err_release;
>  		}
> @@ -483,6 +502,22 @@ static int gmux_probe(struct pnp_dev *pnp, const=
 struct pnp_device_id *id)
>  	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
>  		ver_release, (gmux_data->indexed ? "indexed" : "classic"));
> =20
> +	/*
> +	 * Apple systems with gmux are EFI based and normally don't use
> +	 * VGA. In addition changing IO+MEM ownership between IGP and dGPU
> +	 * disables IO/MEM used for backlight control on some systems.
> +	 * Lock IO+MEM to GPU with active IO to prevent switch.
> +	 */
> +	pdev =3D gmux_find_pdev();
> +	if (pdev && vga_tryget(pdev,
> +			       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM)) {
> +		pr_err("gmux boot_vga IO+MEM vgaarb-locking failed\n");

On this and the above, keep in mind the pr_fmt will already prefix this=
 with
KBUILD_MODNAME, the "gmux" is probably redundant.=20

> +		ret =3D -EBUSY;
> +		goto err_release;
> +	} else if (pdev)
> +		pr_info("gmux: locked IO for PCI:%s\n", pci_name(pdev));

The driver uses pr_fmt, so no need to prefix with "gmux:"
--=20
Darren Hart
Intel Open Source Technology Center
