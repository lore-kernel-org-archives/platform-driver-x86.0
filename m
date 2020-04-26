From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 8/8] iio: light: cm32181: Fix integartion time typo
Date: Sun, 26 Apr 2020 20:51:41 +0300
Message-ID: <CAHp75Ve_PJDVOod7yA5d2OygVy7pe-wBvYxBygrqovbbGTeC8Q@mail.gmail.com>
References: <20200426110256.218186-1-hdegoede@redhat.com> <20200426110256.218186-8-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200426110256.218186-8-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kevin Tsai <ktsai@capellamicro.com>, Jonathan Cameron <jic23@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio <linux-iio@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Apr 26, 2020 at 2:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Fix integartion time typo and while at it improve the comment with
> the typo a bit in general.
>

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

(Applicable to all patches, after addressing corresponding comments)

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/iio/light/cm32181.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index 878fc13632d8..50cfb7d189df 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -237,7 +237,7 @@ static int cm32181_reg_init(struct cm32181_chip *cm32181)
>   *  @cm32181:  pointer of struct cm32181
>   *  @val2:     pointer of int to load the als_it value.
>   *
> - *  Report the current integartion time by millisecond.
> + *  Report the current integration time in milliseconds.
>   *
>   *  Return: IIO_VAL_INT_PLUS_MICRO for success, otherwise -EINVAL.
>   */
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
