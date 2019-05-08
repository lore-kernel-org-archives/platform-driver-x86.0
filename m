From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 05/11] platform/x86: asus-wmi: Support WMI event queue
Date: Wed, 8 May 2019 16:47:12 +0300
Message-ID: <CAHp75VdRE8C=ZODLuKC0JktKv4rbw_Y4fOA4J5wBYKPU+URK+A@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com> <22dc9bfe-af2f-7ea9-e5bc-95647d5411a8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22dc9bfe-af2f-7ea9-e5bc-95647d5411a8@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 19, 2019 at 1:10 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> Event codes are expected to be retrieved from a queue on at least some
> models. Specifically, very likely the ACPI WMI devices with _UID ATK are
> queued whereas those with ASUSWMI are not [1].
>
> The WMI event codes are pushed into a circular buffer queue. After the INIT
> method is called, ACPI code is allowed to push events into this buffer.
> The INIT method cannot be reverted. If the module is unloaded and an event
> (such as hotkey press) gets emitted before inserting it back the events get
> processed delayed by one or if the queue overflows, additionally delayed by
> about 3 seconds.
>
> It might be considered a minor issue and no normal user would likely
> observe this (there is little reason unloading the driver), but it does
> significantly frustrate a developer who is unlucky enough to encounter
> this. Therefore, the fallback to unqueued behavior occurs whenever
> something unexpected happens.
>
> The fix flushes the old key codes out of the queue on load. After receiving
> event the queue is read until either ..FFFF or 1 is encountered. Also as
> noted in [1] it is checked whether notify code is equal to 0xFF before
> enabling queue processing in WMI notify handler.

It's rather a big change. Can it be split to smaller pieces?

-- 
With Best Regards,
Andy Shevchenko
