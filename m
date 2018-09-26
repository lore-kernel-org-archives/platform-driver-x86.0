From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC PATCH] platform/x86: asus-wmi: Simplify the keyboard
 brightness updating process
Date: Wed, 26 Sep 2018 20:48:54 +0300
Message-ID: <CAHp75Vc18A6aUBrjyW6Df5gY563J0kbaEg2oi5yAVkJCKm0TZw@mail.gmail.com>
References: <20180816084104.434-1-jian-hong@endlessm.com> <CAPpJ_eeK68jvMQ02hR2i+eP8Xo9YyWWUGYqG7e6dsWP=XTTCyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPpJ_eeK68jvMQ02hR2i+eP8Xo9YyWWUGYqG7e6dsWP=XTTCyQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jian-Hong Pan <jian-hong@endlessm.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 10, 2018 at 11:57 AM Jian-Hong Pan <jian-hong@endlessm.com> wrote:
>
> 2018-08-16 16:41 GMT+08:00 Jian-Hong Pan <jian-hong@endlessm.com>:
> > The original asus-wmi queues a work which calls the ACPI/WMI methods to
> > update the keyboard LED brightness.  Similar drivers - acer-wmi,
> > dell-wmi-led just call the ACPI/WMI methods directly without workqueues.
> >
> > This patch simplifies the keyboard brightness updating process which
> > calls the kbd_led_update function directly without workqueue in
> > asus-wmi.

> Just gentle ping.  Any comment for this patch?

RFC patches are not supposed to be applied.
So, feel free to resend as non-RFC, or wait a bit more if anyone would
comment on it.

-- 
With Best Regards,
Andy Shevchenko
