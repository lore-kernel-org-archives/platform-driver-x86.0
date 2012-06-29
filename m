From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: use ASUS_WMI_METHODID_DSTS2 as default DSTS ID.
Date: Fri, 29 Jun 2012 14:21:35 +0200
Message-ID: <CAHR064jYsmaoSBGACY9u_EZmHfGekgtaOioT_caXUH2XgiJyAQ@mail.gmail.com>
References: <1340164055-1062-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:51625 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917Ab2F2MVh convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 29 Jun 2012 08:21:37 -0400
In-Reply-To: <1340164055-1062-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: Alex Hung <alex.hung@canonical.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 20, 2012 at 5:47 AM, Alex Hung <alex.hung@canonical.com> wr=
ote:
> According to responses from the BIOS team, ASUS_WMI_METHODID_DSTS2
> (0x53545344) will be used as future DSTS ID. In addition, calling
> asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS2, 0, 0, NULL) returns
> ASUS_WMI_UNSUPPORTED_METHOD in new ASUS laptop PCs. This patch fixes
> no DSTS ID will be assigned in this case.
>
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-wmi.c | =C2=A0 =C2=A07 +------
> =C2=A01 files changed, 1 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 25e3093..0f69a97 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1461,14 +1461,9 @@ static int asus_wmi_platform_init(struct asus_=
wmi *asus)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!asus_wmi_evaluate_method(ASUS_WMI_MET=
HODID_DSTS, 0, 0, NULL))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->dsts_id =
=3D ASUS_WMI_METHODID_DSTS;
> - =C2=A0 =C2=A0 =C2=A0 else if (!asus_wmi_evaluate_method(ASUS_WMI_ME=
THODID_DSTS2, 0, 0, NULL))
> + =C2=A0 =C2=A0 =C2=A0 else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->dsts_id =
=3D ASUS_WMI_METHODID_DSTS2;
>
> - =C2=A0 =C2=A0 =C2=A0 if (!asus->dsts_id) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Can't find=
 DSTS");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* CWAP allow to define the behavior of th=
e Fn+F2 key,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this method doesn't seems to be present=
 on Eee PCs */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (asus->driver->quirks->wapf >=3D 0)
> --
> 1.7.0.4
>

Hum, I don't like acking patches referencing documentation I can't
read, but I don't really have the choice !

Matthew, could you merge this one ?
Thanks,

Acked-By: Corentin Chary <corentin.chary@gmail.com>


--=20
Corentin Chary
http://xf.iksaif.net
