From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Blacklist Lenovo ideapad 700-15ISK
Date: Tue, 3 Oct 2017 19:28:33 +0300
Message-ID: <CAHp75VffTebhp3At677T+jVN6ct=dTGVyUL-QUqqeDSTjAHYwg@mail.gmail.com>
References: <20171002035600.9617-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35392 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751964AbdJCQ2f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Oct 2017 12:28:35 -0400
In-Reply-To: <20171002035600.9617-1-kai.heng.feng@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 2, 2017 at 6:56 AM, Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
> peaq-wmi on Lenovo ideapad 700-15ISK keeps sending KEY_SOUND,
> which makes user's repeated keys gets interrupted.
>
> The system does not have Dolby button, let's blacklist it.

Pushed to my review queue, thanks!

P.S. It's not going to stable per se since it wasn't working from the
beginning correctly AFAIU.
If it's not true, update a patch with correct Fixes tag (apparently
not against peaq-wmi.c itself).

>
> BugLink: https://bugs.launchpad.net/bugs/1720219
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/platform/x86/peaq-wmi.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
> index bc98ef95514a..5673d5daebc3 100644
> --- a/drivers/platform/x86/peaq-wmi.c
> +++ b/drivers/platform/x86/peaq-wmi.c
> @@ -11,6 +11,7 @@
>  #include <linux/input-polldev.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/dmi.h>
>
>  #define PEAQ_DOLBY_BUTTON_GUID         "ABBC0F6F-8EA1-11D1-00A0-C90629100000"
>  #define PEAQ_DOLBY_BUTTON_METHOD_ID    5
> @@ -64,9 +65,22 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
>         }
>  }
>
> +static const struct dmi_system_id peaq_blacklist[] __initconst = {
> +       {
> +               /* Lenovo ideapad 700-15ISK does not have Dolby button */
> +               .ident = "Lenovo ideapad 700-15ISK",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "80RU"),
> +               },
> +       },
> +       {}
> +};
> +
>  static int __init peaq_wmi_init(void)
>  {
> -       if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
> +       if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID) ||
> +           dmi_check_system(peaq_blacklist))
>                 return -ENODEV;
>
>         peaq_poll_dev = input_allocate_polled_device();
> @@ -86,7 +100,8 @@ static int __init peaq_wmi_init(void)
>
>  static void __exit peaq_wmi_exit(void)
>  {
> -       if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
> +       if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID) ||
> +           dmi_check_system(peaq_blacklist))
>                 return;
>
>         input_unregister_polled_device(peaq_poll_dev);
> --
> 2.14.1
>



-- 
With Best Regards,
Andy Shevchenko
