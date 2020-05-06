From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Wed, 6 May 2020 19:29:04 +0300
Message-ID: <CAHp75VdD_3CxtwT_07R8Cc=SE6Uw+FDpom5YxTX4Adq4DPjKkQ@mail.gmail.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Richard Hughes <hughsient@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 6, 2020 at 6:55 PM Richard Hughes <hughsient@gmail.com> wrote:
>
> Export standard LPC configuration values from various LPC/eSPI
> controllers. This allows userspace components such as fwupd to
> verify the most basic SPI protections are set correctly.
> For instance, checking BIOSWE is disabled and BLE is enabled.
>
> More cutting-edge checks (e.g. PRx and BootGuard) can be added
> once the basics are in place. Exporting these values from the
> kernel allows us to report the security level of the platform
> without rebooting and running an unsigned EFI binary like
> chipsec.
>

Isn't it covered by Intel SPI NOR driver?

-- 
With Best Regards,
Andy Shevchenko
