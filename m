From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-laptop: fix a memory leak in asus_laptop_get_info
	error path
Date: Tue, 29 Jun 2010 07:30:22 +0200
Message-ID: <AANLkTimQPSWFCxhBXPNrCokCkYc3dOoorVCQXxSlsBuE@mail.gmail.com>
References: <1277780987.5478.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:38420 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932Ab0F2FaZ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Jun 2010 01:30:25 -0400
In-Reply-To: <1277780987.5478.2.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Tue, Jun 29, 2010 at 5:09 AM, Axel Lin <axel.lin@gmail.com> wrote:
> The callers of write_acpi_int_ret() pass ACPI_ALLOCATE_BUFFER,
> the caller must kfree the returned buffer if AE_OK is returned.
>
> This patch adds a missing kfree(buffer.pointer) before return -ENOMEM
> if kstrdup fail.
>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
> =A0drivers/platform/x86/asus-laptop.c | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index 71db2ef..3d76c6a 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1397,8 +1397,10 @@ static int asus_laptop_get_info(struct asus_la=
ptop *asus)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0asus->name =3D kstrdup(string, GFP_KERNEL);
> - =A0 =A0 =A0 if (!asus->name)
> + =A0 =A0 =A0 if (!asus->name) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(buffer.pointer);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0if (*string)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_notice(" =A0%s model detected\n", s=
tring);
> --
> 1.5.4.3
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Acked-by: Corentin Chary <corentincj@iksaif.net>

--=20
Corentin Chary
http://xf.iksaif.net
