From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: new backlight driver
 for DELL AIO
Date: Fri, 27 Oct 2017 23:26:17 +0300
Message-ID: <CAHp75VdmavL0wEnrXhC+ocw+gt5nw_SCz2qm0pXW+0TCW00u6w@mail.gmail.com>
References: <1509004429-1596-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509004429-1596-1-git-send-email-acelan.kao@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 26, 2017 at 10:53 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> The Dell AIO machines released after 2017 come with a UART interface
> to communicate with the backlight scalar board. This driver creates
> a standard backlight interface and talks to the scalar board through
> UART.
>
> In DSDT this uart port will be defined as
>    Name (_HID, "DELL0501")
>    Name (_CID, EisaId ("PNP0501")
> The 8250 PNP driver will be loaded by default, and this driver uses
> "DELL0501" to confirm the uart port is a backlight interface and
> leverages the port created by 8250 PNP driver to communicate with
> the scalar board.

So, I will wait for next version based on serdev approach and then
will give my comments if any.

-- 
With Best Regards,
Andy Shevchenko
