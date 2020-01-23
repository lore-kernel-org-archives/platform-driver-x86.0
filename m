From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Support left round button on N56VB
Date: Thu, 23 Jan 2020 14:32:47 +0200
Message-ID: <CAHp75VdYL-CXaQYmpdJad5nd3uzBd8A9k3pyHgjdcASMHCAtqg@mail.gmail.com>
References: <20200113223927.102509-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113223927.102509-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 14, 2020 at 12:39 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> The N56VB laptop has a round button located on the left side above the
> keyboard. Map it to F13 since it does not have any predeterminated
> purpose.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index b361c73636a4..6f12747a359a 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -471,6 +471,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>         { KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
>         { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>         { KE_IGNORE, 0x6E, },  /* Low Battery notification */
> +       { KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
>         { KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
>         { KE_KEY, 0x7c, { KEY_MICMUTE } },
>         { KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
> --
> 2.24.1
>


-- 
With Best Regards,
Andy Shevchenko
