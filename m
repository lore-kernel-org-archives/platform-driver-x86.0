From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: fix potential null pointer dereferences
Date: Sun, 27 Jan 2019 22:32:00 +0200
Message-ID: <CAHp75Vfv1sMyAQn=ue0hroqAnbkhQayCj64xNBHO5PRRv53GSA@mail.gmail.com>
References: <20190122200302.19861-1-2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122200302.19861-1-2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 22, 2019 at 10:04 PM Mattias Jacobsson <2pi@mok.nu> wrote:
>
> In the function wmi_dev_match() there are three variables that
> potentially can result in a null pointer dereference. Namely:
> dev/wblock, driver/wmi_driver, and wmi_driver->id_table.
>
> Check for NULL and return that the driver can't handle the device if any
> of these variables would result in a null pointer dereference.
>
> The NULL checks are performed prior to running container_of() for the
> variables dev/wblock and driver/wmi_driver.
>
> Fixes: 844af950da94 ("platform/x86: wmi: Turn WMI into a bus driver")
> Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
> ---
>  drivers/platform/x86/wmi.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index bea35be68706..c596479e8b13 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -763,10 +763,18 @@ static void wmi_dev_release(struct device *dev)
>
>  static int wmi_dev_match(struct device *dev, struct device_driver *driver)
>  {
> -       struct wmi_driver *wmi_driver =
> -               container_of(driver, struct wmi_driver, driver);

AFAIU this is just a pointer arithmetics, no need to move it.

> -       struct wmi_block *wblock = dev_to_wblock(dev);

> -       const struct wmi_device_id *id = wmi_driver->id_table;
> +       const struct wmi_device_id *id;
> +       struct wmi_block *wblock;
> +       struct wmi_driver *wmi_driver;
> +

> +       if (dev == NULL || driver == NULL)
> +               return 0;

On which circumstances this may ever happen?

> +       wblock = dev_to_wblock(dev);
> +       wmi_driver = container_of(driver, struct wmi_driver, driver);
> +
> +       if (wmi_driver->id_table == NULL)
> +               return 0;
> +       id = wmi_driver->id_table;
>
>         while (id->guid_string) {
>                 uuid_le driver_guid;
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
