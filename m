From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-laptop: return proper error for store_ledd if
	write_acpi_int fail
Date: Thu, 8 Jul 2010 09:50:43 +0200
Message-ID: <AANLkTinet1TQyWcj_uFWchbO5mMRJovNmgAwmUM6fun3@mail.gmail.com>
References: <1278568535.7162.18.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:53918 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528Ab0GHHur convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Jul 2010 03:50:47 -0400
In-Reply-To: <1278568535.7162.18.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Thu, Jul 8, 2010 at 7:55 AM, Axel Lin <axel.lin@gmail.com> wrote:
> In current implementation, store_ledd() does not return error if writ=
e_acpi_int
> fail.
> This patch fixes it by return -ENODEV if write_acpi_int fail.
>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
> =A0drivers/platform/x86/asus-laptop.c | =A0 =A07 ++++---
> =A01 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index 93487eb..975751d 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -796,10 +796,11 @@ static ssize_t store_ledd(struct device *dev, s=
truct device_attribute *attr,
>
> =A0 =A0 =A0 =A0rv =3D parse_arg(buf, count, &value);
> =A0 =A0 =A0 =A0if (rv > 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (write_acpi_int(asus->handle, METHOD=
_LEDD, value))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (write_acpi_int(asus->handle, METHOD=
_LEDD, value)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("LED displa=
y write failed\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 asus->ledd_status =3D (=
u32) value;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 asus->ledd_status =3D (u32) value;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0return rv;
> =A0}
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

Thanks !

Acked-by: Corentin Chary <corentincj@iksaif.net>
--=20
Corentin Chary
http://xf.iksaif.net
