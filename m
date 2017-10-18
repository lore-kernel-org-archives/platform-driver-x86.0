From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] dell-laptop: Fix keyboard led max_brightness property
 for Dell Latitude E6410
Date: Wed, 18 Oct 2017 22:09:41 +0300
Message-ID: <CAHp75VfPW88YhJR97POu08POP+Edw2dEm1gwfGMxddLeOydtgQ@mail.gmail.com>
References: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com> <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 18, 2017 at 9:06 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> This machine reports number of keyboard backlight led levels, instead of
> value of the last led level index. Therefore max_brightness properly need=
s
> to be subtracted by 1 to match led max_brightness API.
>
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D196913

> +       u8 kbd_led_num_of_levels_instead_of_last_index;

Sorry for last minute review comments.

First of all, can it be just boolean?

Naming... Yes, too hard as always was, is and will be.

What about just

kbd_led_use_levels?

Also, does it make sense to create a quirks as an unsigned long and
put there corresponding bits with definitions?

/* Comment what is this for */
#define QUIRK_KBD_LED_USE_LEVELS   0

unsigned long quirks;

?

> +       if (quirks && quirks->kbd_led_num_of_levels_instead_of_last_index=
 && info->levels)
> +               info->levels--;

With last suggestion if becomes something like

if (quirks & BIT(QUIRK_KBD_LED_USE_LEVELS) && info->levels)


--=20
With Best Regards,
Andy Shevchenko
