From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] acer-wmi: setup accelerometer when machine has
 appropriate notify event
Date: Tue, 27 Dec 2016 14:00:01 +0200
Message-ID: <CAHp75VfJi_1LaPmE=Gxz_H-AcWqHnSRSGJgdA=GpZtUQwOs91Q@mail.gmail.com>
References: <1478132332-25284-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36018 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752694AbcL0MAD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Dec 2016 07:00:03 -0500
In-Reply-To: <1478132332-25284-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lee, Chun-Yi" <jlee@suse.com>

On Thu, Nov 3, 2016 at 2:18 AM, Lee, Chun-Yi <joeyli.kernel@gmail.com> wrot=
e:
> The accelerometer event relies on on the ACERWMID_EVENT_GUID notify.
> So, this patch changes the codes to setup accelerometer input device
> when detected ACERWMID_EVENT_GUID. It avoids that the accel input
> device created on every acer machines.
>
> In addition, patch adds a clearly parsing logic of accelerometer hid
> to acer_wmi_get_handle_cb callback function. It is positive matching
> the "SENR" name with "BST0001" device to avoid non-supported hardware.
>

Pushed to testing with slightly massaged commit message.
Thanks.

> v2:
> Fix the string comparison logic of SENR.
>
> Reported-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Cc: Darren Hart <dvhart@infradead.org>
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> Index: linux/drivers/platform/x86/acer-wmi.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/platform/x86/acer-wmi.c
> +++ linux/drivers/platform/x86/acer-wmi.c
> @@ -1808,11 +1808,24 @@ static int __init acer_wmi_enable_lm(voi
>         return status;
>  }
>
> +#define ACER_WMID_ACCEL_HID    "BST0001"
> +
>  static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 lev=
el,
>                                                 void *ctx, void **retval)
>  {
> +       struct acpi_device *dev;
> +
> +       if (!strcmp(ctx, "SENR")) {
> +               if (acpi_bus_get_device(ah, &dev))
> +                       return AE_OK;
> +               if (!strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
> +                       return AE_OK;
> +       } else
> +               return AE_OK;
> +
>         *(acpi_handle *)retval =3D ah;
> -       return AE_OK;
> +
> +       return AE_CTRL_TERMINATE;
>  }
>
>  static int __init acer_wmi_get_handle(const char *name, const char *prop=
,
> @@ -1839,7 +1852,7 @@ static int __init acer_wmi_accel_setup(v
>  {
>         int err;
>
> -       err =3D acer_wmi_get_handle("SENR", "BST0001", &gsensor_handle);
> +       err =3D acer_wmi_get_handle("SENR", ACER_WMID_ACCEL_HID, &gsensor=
_handle);
>         if (err)
>                 return err;
>
> @@ -2177,10 +2190,11 @@ static int __init acer_wmi_init(void)
>                 err =3D acer_wmi_input_setup();
>                 if (err)
>                         return err;
> +               err =3D acer_wmi_accel_setup();
> +               if (err)
> +                       return err;
>         }
>
> -       acer_wmi_accel_setup();
> -
>         err =3D platform_driver_register(&acer_platform_driver);
>         if (err) {
>                 pr_err("Unable to register platform driver\n");
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver=
-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
With Best Regards,
Andy Shevchenko
