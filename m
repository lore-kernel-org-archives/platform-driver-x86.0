From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Call led hw_changed API on
 kbd brightness change
Date: Tue, 19 Jun 2018 20:04:49 +0300
Message-ID: <CAHp75VfLMwTEOSKd3cy8j1RuQMwTDFnp_aMzQvod-DJG5e0KVQ@mail.gmail.com>
References: <20180611071838.47945-1-chiu@endlessm.com> <CAHp75VdfUO9rS-=nn+Ffe8bMEbCO-0xe8QBVqsJAZVFTMYkNxg@mail.gmail.com>
 <CAB4CAwdKJiuEiV1CtoyYTZTatRt73BQbRX5kyEtpqNj8STj5-w@mail.gmail.com> <CAD8Lp4596OLxc9sw=DwAZ_nHLEOt686xxatqCmSpV0eEWwigjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD8Lp4596OLxc9sw=DwAZ_nHLEOt686xxatqCmSpV0eEWwigjQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Chris Chiu <chiu@endlessm.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Hans de Goede <hdegoede@redhat.com>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 19, 2018 at 7:46 PM, Daniel Drake <drake@endlessm.com> wrote:

>> > Can we avoid those ugly castings?


> Now kbd_led_set can continue being a correctly typed function pointer
> for led_classdev.brightness_set. And from the code you are adding here
> you can call __kbd_led_set directly with signed integer values, and
> rely on correct bounds correction without ugly casts.
>
> Andy, what do you think?

Thanks, Daniel for investigation.

I'm fine with solution(s) that has no ugly casting and no regression
on the hardware we support.

-- 
With Best Regards,
Andy Shevchenko
