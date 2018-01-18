From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Support tablet mode switch for Dell laptops
Date: Thu, 18 Jan 2018 17:13:07 +0200
Message-ID: <CAHp75VcKgRCjqw0U=F3ez1XaMdY+e0oVRWvrjWxNyADv8+tsKA@mail.gmail.com>
References: <1516283990-3665-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:41819 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754818AbeARPNJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Jan 2018 10:13:09 -0500
In-Reply-To: <1516283990-3665-1-git-send-email-notmart@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Martin <notmart@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, bhush94@gmail.com, Platform Driver <platform-driver-x86@vger.kernel.org>

On Thu, Jan 18, 2018 at 3:59 PM, Marco Martin <notmart@gmail.com> wrote:
> Dell laptops send events to intel-vbtn.c
> 0xCC when the laptop enters in tablet mode and
> 0xCD when the laptop goes out of it
>
> This has been confirmed working on a Dell Inspiron 13-7352
> and an Inspiron 13-7000
>
> I'm not sure intel-vbtn is the right place for it, as it
> should be dell-specific, but this is the only device driver
> where those events arrive at all
> also, it would need a way to query the initial state of the switch

Yeah, to me sounds like a hack for now.
So, I would like to hear from everyone: Pali, Mario, Darren?

> CC:platform-driver-x86@vger.kernel.org
> CC:Matthew Garrett <mjg59@srcf.ucam.org>
> CC:"Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> CC:Darren Hart <dvhart@infradead.org>
> CC:Andy Shevchenko <andy@infradead.org>
>
> Signed-off-by: Marco Martin <notmart@gmail.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
> index 146d02f..1fa63e8 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -61,6 +61,10 @@ static int intel_vbtn_input_setup(struct platform_devi=
ce *device)
>         priv->input_dev->name =3D "Intel Virtual Button driver";
>         priv->input_dev->id.bustype =3D BUS_HOST;
>
> +       input_set_capability(priv->input_dev, EV_SW, SW_TABLET_MODE);
> +       /*TODO: query initial state (and if the switch is present*/
> +       input_report_switch(priv->input_dev, SW_TABLET_MODE, 0);
> +
>         ret =3D input_register_device(priv->input_dev);
>         if (ret)
>                 goto err_free_device;
> @@ -84,7 +88,13 @@ static void notify_handler(acpi_handle handle, u32 eve=
nt, void *context)
>         struct platform_device *device =3D context;
>         struct intel_vbtn_priv *priv =3D dev_get_drvdata(&device->dev);
>
> -       if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
> +       if (event =3D=3D 0xCC) {
> +               input_report_switch(priv->input_dev, SW_TABLET_MODE, 1);
> +               input_sync(priv->input_dev);
> +       } else if (event =3D=3D 0xCD) {
> +               input_report_switch(priv->input_dev, SW_TABLET_MODE, 0);
> +               input_sync(priv->input_dev);
> +       } else if (!sparse_keymap_report_event(priv->input_dev, event, 1,=
 true))
>                 dev_info(&device->dev, "unknown event index 0x%x\n",
>                          event);
>  }
> --
> 2.7.4
>



--=20
With Best Regards,
Andy Shevchenko
