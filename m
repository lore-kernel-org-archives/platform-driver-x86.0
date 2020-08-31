From: Raul Rangel <rrangel@chromium.org>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
Date: Mon, 31 Aug 2020 07:39:44 -0600
Message-ID: <CAHQZ30CuWSzaMNYSfh6Zr12Q1=GA_Yqpg0jaePDkFQjgsDDBPg@mail.gmail.com>
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
 <20200829074758.GA16838@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <20200829074758.GA16838@amd>
Sender: linux-leds-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-input <linux-input@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "S, Shirish" <Shirish.S@amd.com>, Andy Shevchenko <andy@infradead.org>, Dan Murphy <dmurphy@ti.com>, Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "Lee, Chun-Yi" <jlee@suse.com>, Rajat Jain <rajatja@google.com>, Stephen Boyd <swboyd@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Aug 29, 2020 at 1:48 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Thu 2020-08-27 13:52:22, Raul E Rangel wrote:
> > The i8042_mutex must be held by writers of the AUX and KBD ports, as
> > well as users of i8042_command. There were a lot of users of
> > i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> > This resulted in i8042_commands being issues in between PS/2
> > transactions.
> >
> > This change moves the mutex lock into i8042_command and removes the
> > burden of locking the mutex from the callers.
> >
> > It is expected that the i8042_mutex is locked before calling
> > i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> > layer via ps2_begin_command and ps2_end_command. Other modules
> > (serio_raw) do not currently lock the mutex, so there is still a
> > possibility for intermixed commands.
>
>
> > @@ -343,10 +330,14 @@ int i8042_command(unsigned char *param, int command)
> >       unsigned long flags;
> >       int retval;
> >
> > +     mutex_lock(&i8042_mutex);
> > +
> >       spin_lock_irqsave(&i8042_lock, flags);
> >       retval = __i8042_command(param, command);
> >       spin_unlock_irqrestore(&i8042_lock, flags);
> >
> > +      mutex_unlock(&i8042_mutex);
> > +
> >       return retval;
>
> There's something wrong with whitespace here. Checkpatch?
>                                                                         Pavel
It's fixed in the v2 patch: https://patchwork.kernel.org/patch/11741855/

Thanks
