From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5] Support intel-vbtn based tablet mode switch
Date: Fri, 26 Jan 2018 17:57:41 +0200
Message-ID: <CAHp75VftsyEGz-ap_UQDwP33yXtNEnuekLJpwm4-qXxw8Ud3vw@mail.gmail.com>
References: <1516965688-9286-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:45062 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751743AbeAZP5m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 10:57:42 -0500
In-Reply-To: <1516965688-9286-1-git-send-email-notmart@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Martin <notmart@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bhushan Shah <bhush94@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Mario Limonciello <mario_limonciello@dell.com>

On Fri, Jan 26, 2018 at 1:21 PM, Marco Martin <notmart@gmail.com> wrote:
> Some laptops such as Dell Inspiron 7000 series have the
> tablet mode switch implemented in Intel ACPI,
> the events to enter and exit the tablet mode are 0xCC and 0xCD

Thanks for an update. It doesn't apply.

Please, rebase on top of our testing branch, add Mario's tag and resend.

>
> CC: platform-driver-x86@vger.kernel.org
> CC: Matthew Garrett <mjg59@srcf.ucam.org>
> CC: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> CC: Darren Hart <dvhart@infradead.org>
> CC: Mario Limonciello <mario_limonciello@dell.com>
> CC: Andy Shevchenko <andy@infradead.org>
>
> Signed-off-by: Marco Martin <notmart@gmail.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
> index 58c5ff3..3765c41 100644
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
> @@ -110,6 +116,20 @@ static int intel_vbtn_probe(struct platform_device *=
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
>         status =3D acpi_install_notify_handler(handle,
>                                              ACPI_DEVICE_NOTIFY,
>                                              notify_handler,
> --
> 2.7.4
>



--=20
With Best Regards,
Andy Shevchenko
