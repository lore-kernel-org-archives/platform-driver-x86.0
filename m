From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [Patch v2 resend] apple-gmux: lock iGP IO to protect from vgaarb changes
Date: Mon, 9 Mar 2015 17:11:03 -0500
Message-ID: <CAErSpo61r-_hy1hfUMm2ooXZVLTBhtjd-x5uXbyEg=WcG=itnQ@mail.gmail.com>
References: <20150223215155.18444386@neptune.home> <20150303172753.GF83894@vmdeb7>
 <20150305232038.1873d380@neptune.home> <20150306174254.GB19001@vmdeb7>
 <20150307011546.0050279d@neptune.home> <20150309225238.0b9ced4e@neptune.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:43458 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753253AbbCIWLY convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Mar 2015 18:11:24 -0400
Received: by qgfi50 with SMTP id i50so32279777qgf.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2015 15:11:23 -0700 (PDT)
In-Reply-To: <20150309225238.0b9ced4e@neptune.home>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Petri Hodju <petrihodju@yahoo.com>, Matthew Garrett <matthew.garrett@nebula.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>

On Mon, Mar 9, 2015 at 4:52 PM, Bruno Pr=C3=A9mont <bonbons@linux-vserv=
er.org> wrote:
> As GMUX depends on IO for iGP to be enabled and active, lock the IO a=
t
> vgaarb level. This should prevent GPU driver for dGPU to disable IO f=
or
> iGP while it tries to own legacy VGA IO.
>
> This fixes usage of backlight control combined with closed nvidia
> driver on some Apple dual-GPU (intel/nvidia) systems.
>
> On those systems loading nvidia driver disables intel IO decoding,
> disabling the gmux backlight controls as a side effect.
> Prior to commits moving boot_vga from (optional) efifb to less option=
al
> vgaarb this mis-behavior could be avoided by using right kernel confi=
g
> (efifb enabled but vgaarb disabled).
>
> This patch explicitly does not try to trigger vgaarb changes in order
> to avoid confusing already running graphics drivers. If IO has been
> mis-configured by vgaarb gmux will thus fail to probe.
> It is expected to load/probe gmux prior to graphics drivers.
>
> Fixes: ce027dac592c0ada241ce0f95ae65856828ac450 # nvidia interaction
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D86121
> Reported-by: Petri Hodju <petrihodju@yahoo.com>
> Tested-by: Petri Hodju <petrihodju@yahoo.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Matthew Garrett <matthew.garrett@nebula.com>
> Signed-off-by: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>
> ---
> Resending v2 in the hope Darren won't hit quoted-printable.
> Also adding linux-pci on CC by Bjorn's request in bugzilla.

The bugzilla is assigned to PCI, and I was just trying to resolve it.
But it looks like Darren might be the logical person to apply this, so
I'll ignore it unless poked again.

A few minor comments below.

> Changes since v1:
> - Dropped repeat of gmux in pr_info/pr_err calls
> - Mention PCI device we tried to lock IO for in case of error
>
>
>  drivers/platform/x86/apple-gmux.c | 43 +++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86=
/apple-gmux.c
> index b9429fb..22da6a3 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -22,6 +22,7 @@
>  #include <linux/delay.h>
>  #include <linux/pci.h>
>  #include <linux/vga_switcheroo.h>
> +#include <linux/vgaarb.h>
>  #include <acpi/video.h>
>  #include <asm/io.h>
>
> @@ -31,6 +32,7 @@ struct apple_gmux_data {
>         bool indexed;
>         struct mutex index_lock;
>
> +       struct pci_dev *pdev;
>         struct backlight_device *bdev;
>
>         /* switcheroo data */
> @@ -415,6 +417,22 @@ static int gmux_resume(struct device *dev)
>         return 0;
>  }
>
> +static struct pci_dev *gmux_find_pdev(void)
> +{
> +       struct pci_dev *pdev =3D NULL;

Typical to have a blank line here (between local variables and code).

> +       while ((pdev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pd=
ev))) {
> +               u16 cmd;
> +
> +               pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> +               if (!(cmd & PCI_COMMAND_IO))
> +                       continue;
> +
> +               return pdev;

This returns a device with reference count incremented.  The
convention in PCI, at least, is to name functions that acquire a
reference with "_get_", and functions that don't acquire a reference
with "_find_".  So maybe this function should be renamed?

> +       }
> +
> +       return NULL;
> +}
> +
>  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_i=
d *id)
>  {
>         struct apple_gmux_data *gmux_data;
> @@ -425,6 +443,7 @@ static int gmux_probe(struct pnp_dev *pnp, const =
struct pnp_device_id *id)
>         int ret =3D -ENXIO;
>         acpi_status status;
>         unsigned long long gpe;
> +       struct pci_dev *pdev =3D NULL;
>
>         if (apple_gmux_data)
>                 return -EBUSY;
> @@ -475,7 +494,7 @@ static int gmux_probe(struct pnp_dev *pnp, const =
struct pnp_device_id *id)
>                         ver_minor =3D (version >> 16) & 0xff;
>                         ver_release =3D (version >> 8) & 0xff;
>                 } else {
> -                       pr_info("gmux device not present\n");
> +                       pr_info("gmux device not present or IO disabl=
ed\n");
>                         ret =3D -ENODEV;
>                         goto err_release;
>                 }
> @@ -483,6 +502,23 @@ static int gmux_probe(struct pnp_dev *pnp, const=
 struct pnp_device_id *id)
>         pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_=
minor,
>                 ver_release, (gmux_data->indexed ? "indexed" : "class=
ic"));
>
> +       /*
> +        * Apple systems with gmux are EFI based and normally don't u=
se
> +        * VGA. In addition changing IO+MEM ownership between IGP and=
 dGPU
> +        * disables IO/MEM used for backlight control on some systems=
=2E
> +        * Lock IO+MEM to GPU with active IO to prevent switch.
> +        */
> +       pdev =3D gmux_find_pdev();
> +       if (pdev && vga_tryget(pdev,
> +                              VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_M=
EM)) {
> +               pr_err("IO+MEM vgaarb-locking for PCI:%s failed\n",
> +                       pci_name(pdev));

It'd be nice to use dev_info/dev_err() for all the messages here, but
I see the existing style is to just use pr_info()/pr_err().  So a
change to use the dev_ functions would be out of scope for the bug fix
itself, but possibly a useful follow-on.

> +               ret =3D -EBUSY;
> +               goto err_release;
> +       } else if (pdev)
> +               pr_info("locked IO for PCI:%s\n", pci_name(pdev));
> +       gmux_data->pdev =3D pdev;
> +
>         memset(&props, 0, sizeof(props));
>         props.type =3D BACKLIGHT_PLATFORM;
>         props.max_brightness =3D gmux_read32(gmux_data, GMUX_PORT_MAX=
_BRIGHTNESS);
> @@ -574,6 +609,7 @@ err_enable_gpe:
>  err_notify:
>         backlight_device_unregister(bdev);
>  err_release:
> +       pci_dev_put(pdev);
>         release_region(gmux_data->iostart, gmux_data->iolen);
>  err_free:
>         kfree(gmux_data);
> @@ -593,6 +629,11 @@ static void gmux_remove(struct pnp_dev *pnp)
>                                            &gmux_notify_handler);
>         }
>
> +       if (gmux_data->pdev) {
> +               vga_put(gmux_data->pdev,
> +                       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM);
> +               pci_dev_put(gmux_data->pdev);
> +       }
>         backlight_device_unregister(gmux_data->bdev);
>
>         release_region(gmux_data->iostart, gmux_data->iolen);
