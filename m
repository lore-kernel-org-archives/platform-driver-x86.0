From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add a comment explaining the 0xb2
 magic number
Date: Sat, 27 May 2017 13:39:46 +0300
Message-ID: <CAHp75VfWtoJYQqs-ZY38A6MSMmJVpNF1AhPFDrsz5z=WfZk=hw@mail.gmail.com>
References: <e630e25d78e60a4f1c9bf4bdc725f0693d617db2.1495862128.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33775 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755985AbdE0Kjr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 06:39:47 -0400
In-Reply-To: <e630e25d78e60a4f1c9bf4bdc725f0693d617db2.1495862128.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>

On Sat, May 27, 2017 at 8:15 AM, Darren Hart <dvhart@infradead.org> wrote:
> From: Andy Lutomirski <luto@kernel.org>
>
> The hotkey table is 0xb2, add a comment for clarity.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Darren Hart <dvhart@infradead.org>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> Cc: Andy Shevchenko <andy@infradead.org>
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/x86/dell-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-=
wmi.c
> index 8a64c79..24467b1 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -449,6 +449,7 @@ static void __init handle_dmi_entry(const struct dmi_=
header *dm,
>         if (results->err || results->keymap)
>                 return;         /* We already found the hotkey table. */
>
> +       /* The Dell hotkey table is type 0xB2.  Scan until we find it. */
>         if (dm->type !=3D 0xb2)
>                 return;
>
> --
> 2.9.4
>



--=20
With Best Regards,
Andy Shevchenko
