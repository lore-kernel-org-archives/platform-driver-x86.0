From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7] Support intel-vbtn based tablet mode switch
Date: Mon, 29 Jan 2018 20:57:08 +0200
Message-ID: <CAHp75Ve5C=AtmE1nir1nrjPv8KkdhmTLGj4A=6M5osJyidw8jg@mail.gmail.com>
References: <1517070957-2372-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:38658 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751374AbeA2S5J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Jan 2018 13:57:09 -0500
In-Reply-To: <1517070957-2372-1-git-send-email-notmart@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Martin <notmart@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bhushan Shah <bhush94@gmail.com>

On Sat, Jan 27, 2018 at 6:35 PM, Marco Martin <notmart@gmail.com> wrote:
> Some laptops such as Dell Inspiron 7000 series have the
> tablet mode switch implemented in Intel ACPI,
> the events to enter and exit the tablet mode are 0xCC and 0xCD
>

It doesn't apply :-(

> CC: platform-driver-x86@vger.kernel.org
> CC: Matthew Garrett <mjg59@srcf.ucam.org>
> CC: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> CC: Darren Hart <dvhart@infradead.org>
> CC: Mario Limonciello <mario_limonciello@dell.com>
> CC: Andy Shevchenko <andy@infradead.org>
>
> Signed-off-by: Marco Martin <notmart@gmail.com>
>
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
> Acked-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
> index 58c5ff3..0979811 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -26,6 +26,9 @@
>  #include <linux/suspend.h>
>  #include <acpi/acpi_bus.h>
>
> +/* When NOT in tablet mode, VGBS returns with the flag 0x40 */
> +#define TABLET_MODE_FLAG 0x40
> +
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("AceLan Kao");
>
> @@ -42,6 +45,8 @@ static const struct key_entry intel_vbtn_keymap[] =3D {
>         { KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },          /* volume-up key =
release */
>         { KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },           /* volume-down ke=
y press */
>         { KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },        /* volume-down ke=
y release */
> +       { KE_SW,  0xCC, { .sw =3D { SW_TABLET_MODE, 1 } } }, /* Tablet mo=
de in */
> +       { KE_SW,  0xCD, { .sw =3D { SW_TABLET_MODE, 0 } } }, /* Tablet mo=
de out */
>         { KE_END },
>  };
>
> @@ -88,6 +93,7 @@ static void notify_handler(acpi_handle handle, u32 even=
t, void *context)
>
>  static int intel_vbtn_probe(struct platform_device *device)
>  {
> +       struct acpi_buffer vgbs_output =3D { ACPI_ALLOCATE_BUFFER, NULL }=
;
>         acpi_handle handle =3D ACPI_HANDLE(&device->dev);
>         struct intel_vbtn_priv *priv;
>         acpi_status status;
> @@ -110,6 +116,22 @@ static int intel_vbtn_probe(struct platform_device *=
device)
>                 return err;
>         }
>
> +       status =3D acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_outpu=
t);
> +       /* VGBS being present and returning something means
> +        * we have a tablet mode switch
> +        */
> +       if (ACPI_SUCCESS(status)) {
> +               union acpi_object *obj =3D vgbs_output.pointer;
> +
> +               if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +                       input_report_switch(priv->input_dev,
> +                                                               SW_TABLET=
_MODE,
> +                                                               !(obj->in=
teger.value & TABLET_MODE_FLAG));
> +               }
> +       }
> +
> +       kfree(vgbs_output.pointer);
> +
>         status =3D acpi_install_notify_handler(handle,
>                                              ACPI_DEVICE_NOTIFY,
>                                              notify_handler,
> --
> 2.7.4
>



--=20
With Best Regards,
Andy Shevchenko
