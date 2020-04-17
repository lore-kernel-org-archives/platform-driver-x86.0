From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: surface3_power: Fix a NULL vs IS_ERR()
 check in probe
Date: Fri, 17 Apr 2020 16:40:49 +0300
Message-ID: <CAHp75VdACZz2apwYT2LXxTsHwbzKo0eOLu0-Qts-4Um7jXynnw@mail.gmail.com>
References: <20200407093052.GL68494@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20200407093052.GL68494@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>, Andy Shevchenko <andy@infradead.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Stephen Just <stephenjust@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 7, 2020 at 12:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The i2c_acpi_new_device() function never returns NULL, it returns error
> pointers.
>

Pushed to my review and testing queue, thanks!


> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/x86/surface3_power.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86/surface3_power.c
> index 946ac2dc08ae..cc4f9cba6856 100644
> --- a/drivers/platform/x86/surface3_power.c
> +++ b/drivers/platform/x86/surface3_power.c
> @@ -522,8 +522,8 @@ static int mshw0011_probe(struct i2c_client *client)
>         strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
>
>         bat0 = i2c_acpi_new_device(dev, 1, &board_info);
> -       if (!bat0)
> -               return -ENOMEM;
> +       if (IS_ERR(bat0))
> +               return PTR_ERR(bat0);
>
>         data->bat0 = bat0;
>         i2c_set_clientdata(bat0, data);
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
