From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: peaq-wmi: Remove unnecessary checks
 from peaq_wmi_exit
Date: Mon, 30 Oct 2017 16:09:11 +0200
Message-ID: <CAHp75VcgwYgF_U9KQfdN-37t_bPXtC5G2m19sy0XJu=CEBwowg@mail.gmail.com>
References: <20171030130738.14415-1-hdegoede@redhat.com> <20171030130738.14415-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171030130738.14415-2-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 30, 2017 at 3:07 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> peaq_wmi_exit will only ever get called if peaq_wmi_init succeeds, so
> there is no need to repeat the checks from peaq_wmi_init.

Both pushed to my review and testing queue, thanks!

>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/peaq-wmi.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
> index 2da48ecc90c1..9b9e1f39bbfb 100644
> --- a/drivers/platform/x86/peaq-wmi.c
> +++ b/drivers/platform/x86/peaq-wmi.c
> @@ -66,7 +66,7 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
>  }
>
>  /* Some other devices (Shuttle XS35) use the same WMI GUID for other purposes */
> -static const struct dmi_system_id peaq_dmi_table[] = {
> +static const struct dmi_system_id peaq_dmi_table[] __initconst = {
>         {
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "PEAQ"),
> @@ -102,12 +102,6 @@ static int __init peaq_wmi_init(void)
>
>  static void __exit peaq_wmi_exit(void)
>  {
> -       if (!dmi_check_system(peaq_dmi_table))
> -               return;
> -
> -       if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
> -               return;
> -
>         input_unregister_polled_device(peaq_poll_dev);
>  }
>
> --
> 2.14.2
>



-- 
With Best Regards,
Andy Shevchenko
