From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] acer-wmi: setup accelerometer when appropriate acpi
 device was found
Date: Fri, 28 Apr 2017 21:58:19 +0300
Message-ID: <CAHp75VeCBu7PsBQwVxNirBLfWQJXNdA2HGB3eT0WwSEA6hJZ0Q@mail.gmail.com>
References: <20170428082359.20034-1-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35674 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1946024AbdD1S6U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 14:58:20 -0400
In-Reply-To: <20170428082359.20034-1-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lee, Chun-Yi" <jlee@suse.com>

On Fri, Apr 28, 2017 at 11:23 AM, Lee, Chun-Yi <joeyli.kernel@gmail.com> wrote:
> The 98d610c3739a patch was introduced since v4.11-rc1 that it causes
> that the accelerometer input device will not be created on workable
> machines because the HID string comparing logic is wrong.
>
> And, the patch doesn't prevent that the accelerometer input device
> be created on the machines that have no BST0001. That's because
> the acpi_get_devices() returns success even it didn't find any
> match device.
>
> This patch fixed the HID string comparing logic of BST0001 device.
> And, it also makes sure that the acpi_get_devices() returns
> acpi_handle for BST0001.
>

Pushed to testing, thanks.

> Fixes: 98d610c3739a ("acer-wmi: setup accelerometer when machine has appropriate notify event")
> Reference: https://bugzilla.kernel.org/show_bug.cgi?id=193761
> Reported-by: Samuel Sieb <samuel-kbugs@sieb.net>
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index dac0fbe..dbb4e6e 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1896,7 +1896,7 @@ static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
>         if (!strcmp(ctx, "SENR")) {
>                 if (acpi_bus_get_device(ah, &dev))
>                         return AE_OK;
> -               if (!strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
> +               if (strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
>                         return AE_OK;
>         } else
>                 return AE_OK;
> @@ -1917,8 +1917,7 @@ static int __init acer_wmi_get_handle(const char *name, const char *prop,
>         handle = NULL;
>         status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
>                                         (void *)name, &handle);
> -
> -       if (ACPI_SUCCESS(status)) {
> +       if (ACPI_SUCCESS(status) && handle) {
>                 *ah = handle;
>                 return 0;
>         } else {
> @@ -2290,8 +2289,8 @@ static int __init acer_wmi_init(void)
>                 if (err)
>                         return err;
>                 err = acer_wmi_accel_setup();
> -               if (err)
> -                       return err;
> +               if (err && err != -ENODEV)
> +                       pr_warn("Cannot enable accelerometer\n");
>         }
>
>         err = platform_driver_register(&acer_platform_driver);
> --
> 2.6.2
>



-- 
With Best Regards,
Andy Shevchenko
