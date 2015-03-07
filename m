From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Subject: Re: [Patch v2] apple-gmux: lock iGP IO to protect from vgaarb
 changes
Date: Sat, 7 Mar 2015 01:15:46 +0100
Message-ID: <20150307011546.0050279d@neptune.home>
References: <20150223215155.18444386@neptune.home>
	<20150303172753.GF83894@vmdeb7>
	<20150305232038.1873d380@neptune.home>
	<20150306174254.GB19001@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from hygieia.santi-shop.eu ([78.46.175.2]:50410 "EHLO
	hygieia.santi-shop.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756019AbbCGAP6 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 19:15:58 -0500
In-Reply-To: <20150306174254.GB19001@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <matthew.garrett@nebula.com>

On Fri, 06 March 2015 Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Mar 05, 2015 at 11:20:38PM +0100, Bruno Pr=C3=A9mont wrote:
> > As GMUX depends on IO for iGP to be enabled and active, lock the IO=
 at
> > vgaarb level. This should prevent GPU driver for dGPU to disable IO=
 for
> > iGP while it tries to own legacy VGA IO.
> >=20
> > This fixes usage of backlight control combined with closed nvidia
> > driver on some Apple dual-GPU (intel/nvidia) systems.
> >=20
> > On those systems loading nvidia driver disables intel IO decoding,
> > disabling the gmux backlight controls as a side effect.
> > Prior to commits moving boot_vga from (optional) efifb to less opti=
onal
> > vgaarb this mis-behavior could be avoided by using right kernel con=
fig
> > (efifb enabled but vgaarb disabled).
> >=20
> > This patch explicitly does not try to trigger vgaarb changes in ord=
er
> > to avoid confusing already running graphics drivers. If IO has been
> > mis-configured by vgaarb gmux will thus fail to probe.
> > It is expected to load/probe gmux prior to graphics drivers.
> >=20
> > Fixes: ce027dac592c0ada241ce0f95ae65856828ac450 # nvidia interactio=
n
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D86121
> > Reported-by: Petri Hodju <petrihodju@yahoo.com>
> > Tested-by: Petri Hodju <petrihodju@yahoo.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Matthew Garrett <matthew.garrett@nebula.com>
> > Signed-off-by: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>
> > ---
> > Respinning, fixing Darren's nit.
> >=20
> > Changes since v1:
> > - Dropped repeat of gmux in pr_info/pr_err calls
> > - Mention PCI device we tried to lock IO for in case of error

Hi Darren,

> Hi Bruno,
>=20
> I don't know if this is on your end or mine (I've not seen this befor=
e). Saving
> off your patch (through mutt like I do everything else) to a file and=
 applying
> works, build works, and git show and visual inspection look correct.
>=20
> However, checkpatch sees a lot of =3D3D instead of just =3D, and comp=
lains bitterly.
>=20
> Can you check this patch (from the list) and let me know what you fin=
d?

That smells like `Content-Transfer-Encoding: quoted-printable` not bein=
g
understood by check-patch when operating on a raw mail.
No idea if mutt can recode the mail to plain 8-bit/UTF-8 when saving...
patch from patch-utils might have the same issues with it while git-am =
is
fine (as it handles mail-patches including charset and other headers).

I'm sending the mail via claws-mail which might encode it more
conservatively than e.g. git-send-email. I can see if there's an option
to prefer 8-bit over quoted-printable though.

Bruno


> ERROR: patch seems to be corrupt (line wrapped?)
> #93: FILE: drivers/platform/x86/apple-gmux.c:27:
> =3D20
>=20
> ERROR: spaces required around that '=3D' (ctx:WxV)
> #108: FILE: drivers/platform/x86/apple-gmux.c:421:
> +	struct pci_dev *pdev =3D3D NULL;
>  	                     ^
>=20
> WARNING: Missing a blank line after declarations
> #109: FILE: drivers/platform/x86/apple-gmux.c:422:
> +	struct pci_dev *pdev =3D3D NULL;
> +	while ((pdev =3D3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))=
) {
>=20
> ERROR: spaces required around that '=3D' (ctx:WxV)
> #109: FILE: drivers/platform/x86/apple-gmux.c:422:
> +	while ((pdev =3D3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))=
) {
>  	             ^
>=20
> ERROR: spaces required around that '=3D' (ctx:WxV)
> #130: FILE: drivers/platform/x86/apple-gmux.c:447:
> +	struct pci_dev *pdev =3D3D NULL;
>  	                     ^
>=20
> ERROR: spaces required around that '=3D' (ctx:WxV)
> #155: FILE: drivers/platform/x86/apple-gmux.c:510:
> +	pdev =3D3D gmux_find_pdev();
>  	     ^
>=20
> ERROR: spaces required around that '=3D' (ctx:WxV)
> #160: FILE: drivers/platform/x86/apple-gmux.c:515:
> +		ret =3D3D -EBUSY;
>  		    ^
>=20
> ERROR: need consistent spacing around '-' (ctx:WxV)
> #160: FILE: drivers/platform/x86/apple-gmux.c:515:
> +		ret =3D3D -EBUSY;
>  		        ^
>=20
> ERROR: spaces required around that '=3D' (ctx:WxV)
> #164: FILE: drivers/platform/x86/apple-gmux.c:519:
> +	gmux_data->pdev =3D3D pdev;
>  	                ^
>=20
> total: 8 errors, 1 warnings, 96 lines checked
>=20
> /home/dvhart/apple.patch has style problems, please review.
>=20
> If any of these errors are false positives, please report
> them to the maintainer, see CHECKPATCH in MAINTAINERS.
>=20
