From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
Date: Thu, 27 Aug 2020 23:12:33 +0300
Message-ID: <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Raul E Rangel <rrangel@chromium.org>
Cc: linux-input <linux-input@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "S, Shirish" <Shirish.S@amd.com>, Andy Shevchenko <andy@infradead.org>, Dan Murphy <dmurphy@ti.com>, Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "Lee, Chun-Yi" <jlee@suse.com>, Pavel Machek <pavel@ucw.cz>, Rajat Jain <rajatja@google.com>, Stephen Boyd <swboyd@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 27, 2020 at 10:52 PM Raul E Rangel <rrangel@chromium.org> wrote:
>
> The i8042_mutex must be held by writers of the AUX and KBD ports, as
> well as users of i8042_command. There were a lot of users of
> i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> This resulted in i8042_commands being issues in between PS/2
> transactions.
>
> This change moves the mutex lock into i8042_command and removes the
> burden of locking the mutex from the callers.

Which is wrong according to your very patch. See below.

> It is expected that the i8042_mutex is locked before calling
> i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> layer via ps2_begin_command and ps2_end_command. Other modules
> (serio_raw) do not currently lock the mutex, so there is still a
> possibility for intermixed commands.

...

> +       mutex_lock(&i8042_mutex);
> +
>         spin_lock_irqsave(&i8042_lock, flags);
>         retval = __i8042_command(param, command);
>         spin_unlock_irqrestore(&i8042_lock, flags);
>
> +        mutex_unlock(&i8042_mutex);

Question 1. Why do you need mutex at all in the above situation? Spin
lock isn't enough?

...

> -       i8042_lock_chip();
> -
>         if (value == LED_OFF)
>                 i8042_command(NULL, CLEVO_MAIL_LED_OFF);
>         else if (value <= LED_HALF)
>                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
>         else
>                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
> -
> -       i8042_unlock_chip();
> -

Now, these three commands are not considered as a transaction (no
atomicity). That's why your patch is wrong.

>  }

...

>         int rc;
>
> -       i8042_lock_chip();
>         rc = i8042_command(&param, A1655_WIFI_COMMAND);
> -       i8042_unlock_chip();
>         return rc;

rc become redundant.

-- 
With Best Regards,
Andy Shevchenko
