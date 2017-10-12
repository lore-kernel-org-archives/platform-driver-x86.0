From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH][next] platform/x86: intel_cht_int33fe: make a couple of
 local functions static
Date: Thu, 12 Oct 2017 23:36:34 +0300
Message-ID: <CAHp75Vf99OOTVqaei6FUUH9P=soNO92XKub4sdDss21PNFGLng@mail.gmail.com>
References: <20171011093010.17173-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171011093010.17173-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: Hans

On Wed, Oct 11, 2017 at 12:30 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The functions cht_int33fe_check_for_max17047 and cht_int33fe_find_max17047
> are local to the source and do not need to be in global scope, so make
> them static.
>
> Cleans up sparse warnings:
> symbol 'cht_int33fe_check_for_max17047' was not declared. Should it be
> static?
> symbol 'cht_int33fe_find_max17047' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/platform/x86/intel_cht_int33fe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
> index 94716b2fbc00..286c6207765d 100644
> --- a/drivers/platform/x86/intel_cht_int33fe.c
> +++ b/drivers/platform/x86/intel_cht_int33fe.c
> @@ -42,7 +42,7 @@ struct cht_int33fe_data {
>   * These helpers are used to work around this by checking if an i2c-client
>   * for the max17047 has already been registered.
>   */
> -int cht_int33fe_check_for_max17047(struct device *dev, void *data)
> +static int cht_int33fe_check_for_max17047(struct device *dev, void *data)
>  {
>         struct i2c_client **max17047 = data;
>         struct acpi_device *adev;
> @@ -62,7 +62,7 @@ int cht_int33fe_check_for_max17047(struct device *dev, void *data)
>         return 1;
>  }
>
> -struct i2c_client *cht_int33fe_find_max17047(void)
> +static struct i2c_client *cht_int33fe_find_max17047(void)
>  {
>         struct i2c_client *max17047 = NULL;
>
> --
> 2.14.1
>



-- 
With Best Regards,
Andy Shevchenko
