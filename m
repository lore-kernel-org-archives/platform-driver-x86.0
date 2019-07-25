From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: Use existing defined
 KBD_LED_* magic values
Date: Thu, 25 Jul 2019 20:59:57 +0300
Message-ID: <CAHp75VdwQZtjus58gbUo1DtAehU_m8KKpEhNfgkMvkjKcJ7GYw@mail.gmail.com>
References: <20190724081415.8926-1-rhyskidd@gmail.com> <20190724081415.8926-3-rhyskidd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724081415.8926-3-rhyskidd@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhys Kidd <rhyskidd@gmail.com>
Cc: Matthew Garrett <mjg59@google.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 24, 2019 at 11:14 AM Rhys Kidd <rhyskidd@gmail.com> wrote:
>
> These values have already been defined in platform/x86/dell-smbios.h
>

Pushed to my review and testing queue, thanks!


> Signed-off-by: Rhys Kidd <rhyskidd@gmail.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 68a8a4eba4e3..fc33c38f5f82 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -311,13 +311,13 @@ static const struct key_entry dell_wmi_keymap_type_0011[] = {
>         { KE_IGNORE, 0xfff1, { KEY_RESERVED } },
>
>         /* Keyboard backlight level changed */
> -       { KE_IGNORE, 0x01e1, { KEY_RESERVED } },
> -       { KE_IGNORE, 0x01e2, { KEY_RESERVED } },
> -       { KE_IGNORE, 0x01e3, { KEY_RESERVED } },
> -       { KE_IGNORE, 0x02ea, { KEY_RESERVED } },
> -       { KE_IGNORE, 0x02eb, { KEY_RESERVED } },
> -       { KE_IGNORE, 0x02ec, { KEY_RESERVED } },
> -       { KE_IGNORE, 0x02f6, { KEY_RESERVED } },
> +       { KE_IGNORE, KBD_LED_OFF_TOKEN,      { KEY_RESERVED } },
> +       { KE_IGNORE, KBD_LED_ON_TOKEN,       { KEY_RESERVED } },
> +       { KE_IGNORE, KBD_LED_AUTO_TOKEN,     { KEY_RESERVED } },
> +       { KE_IGNORE, KBD_LED_AUTO_25_TOKEN,  { KEY_RESERVED } },
> +       { KE_IGNORE, KBD_LED_AUTO_50_TOKEN,  { KEY_RESERVED } },
> +       { KE_IGNORE, KBD_LED_AUTO_75_TOKEN,  { KEY_RESERVED } },
> +       { KE_IGNORE, KBD_LED_AUTO_100_TOKEN, { KEY_RESERVED } },
>  };
>
>  static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
