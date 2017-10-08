From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Add DMI check before binding to
 the WMI interface
Date: Sun, 8 Oct 2017 21:09:23 +0300
Message-ID: <CAHp75VePt2R30r89-tDs1ZPYV8VT+4_2LqW=O7YamER85qZ3KA@mail.gmail.com>
References: <20171005180404.15044-1-hdegoede@redhat.com> <20171005180404.15044-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20171005180404.15044-2-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kai Heng Feng <kai.heng.feng@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 9:04 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> It seems that the WMI GUID used by the PEAQ 2-in-1 WMI hotkeys is not
> as unique as a GUID should be and is used on some other devices too.
>
> This is causing spurious key-press reports on these other devices.
>
> This commits adds a DMI check to the PEAQ 2-in-1 WMI hotkeys driver to
> ensure that it is actually running on a PEAQ 2-in-1, fixing the
> spurious key-presses on these other devices.
>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1497861
> BugLink: https://bugzilla.suse.com/attachment.cgi?id=743182
> Cc: stable@vger.kernel.org

So, I have pushed to my review queue as is, though please consider my
comments in perhaps a separate patch.
Thanks!

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/peaq-wmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
> index bc98ef95514a..67fa3fa32011 100644
> --- a/drivers/platform/x86/peaq-wmi.c
> +++ b/drivers/platform/x86/peaq-wmi.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <linux/acpi.h>
> +#include <linux/dmi.h>
>  #include <linux/input-polldev.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -64,8 +65,22 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
>         }
>  }
>
> +/* Some other devices (Shuttle XS35) use the same WMI GUID for other purposes */
> +static const struct dmi_system_id peaq_dmi_table[] = {
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "PEAQ"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PEAQ PMM C1010 MD99187"),
> +               },
> +       },
> +};
> +
>  static int __init peaq_wmi_init(void)
>  {
> +       /* WMI GUID is not unique, also check for a DMI match */
> +       if (!dmi_check_system(peaq_dmi_table))
> +               return -ENODEV;
> +
>         if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>                 return -ENODEV;
>
> @@ -86,6 +101,9 @@ static int __init peaq_wmi_init(void)
>
>  static void __exit peaq_wmi_exit(void)
>  {
> +       if (!dmi_check_system(peaq_dmi_table))
> +               return;
> +
>         if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>                 return;
>
> --
> 2.14.2
>



-- 
With Best Regards,
Andy Shevchenko
