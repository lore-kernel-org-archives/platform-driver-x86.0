From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: surface3_power: i2c_acpi_new_device()
 returns a PTR_ERR
Date: Tue, 21 Apr 2020 01:33:24 +0300
Message-ID: <CAHp75VfC7-saRXnGDpee1dxAqDSDcveHMoC872WN9-SL4sDH4Q@mail.gmail.com>
References: <20200420220421.171298-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200420220421.171298-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 21, 2020 at 1:04 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> i2c_acpi_new_device() never returns NULL, it either returns an i2c_client
> or a PTR_ERR. Adjust the mshw0011_probe() error handling to take this
> into account.
>
> Note the goto out_err will cause i2c_unregister_device() to get called
> even though the i2c_acpi_new_device() fails, this is ok as it accepts
> a NULL pointer argument (and treats it as a no-op).
>

Thanks, I guess it repeats [1].

[1]: http://git.infradead.org/linux-platform-drivers-x86.git/commitdiff/4dbccb873f2b35ad1b26419ff88c80509e2d4cbb

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/surface3_power.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86/surface3_power.c
> index 946ac2dc08ae..32e6e86e27dd 100644
> --- a/drivers/platform/x86/surface3_power.c
> +++ b/drivers/platform/x86/surface3_power.c
> @@ -522,8 +522,10 @@ static int mshw0011_probe(struct i2c_client *client)
>         strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
>
>         bat0 = i2c_acpi_new_device(dev, 1, &board_info);
> -       if (!bat0)
> -               return -ENOMEM;
> +       if (IS_ERR(bat0)) {
> +               error = PTR_ERR(bat0);
> +               goto out_err;
> +       }
>
>         data->bat0 = bat0;
>         i2c_set_clientdata(bat0, data);
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
