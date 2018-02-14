From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Increase timeout to wait
 for EC answer
Date: Wed, 14 Feb 2018 21:29:29 +0200
Message-ID: <CAHp75VenHdg3-1ZXsJEMLO5zcspwqJeGObq1E75muLgvF6jyHw@mail.gmail.com>
References: <1518340729-12463-1-git-send-email-aaron.ma@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518340729-12463-1-git-send-email-aaron.ma@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaron Ma <aaron.ma@canonical.com>
Cc: Ike Panhc <ike.pan@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Feb 11, 2018 at 11:18 AM, Aaron Ma <aaron.ma@canonical.com> wrote:
> Lenovo E41-20 needs more time than 100ms to read VPC,
> the funtion keys always failed responding.
> Increase timeout to get the value from VPC, then
> the funtion keys like mic mute key work well.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 5b6f18b18801..535199c9e6bc 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -113,7 +113,7 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
>  /*
>   * ACPI Helpers
>   */
> -#define IDEAPAD_EC_TIMEOUT (100) /* in ms */
> +#define IDEAPAD_EC_TIMEOUT (200) /* in ms */
>
>  static int read_method_int(acpi_handle handle, const char *method, int *val)
>  {
> --
> 2.14.3
>



-- 
With Best Regards,
Andy Shevchenko
