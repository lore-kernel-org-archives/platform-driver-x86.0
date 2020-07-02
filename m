From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: not loading brightness_init
 when _BCL invalid
Date: Thu, 2 Jul 2020 12:30:59 +0300
Message-ID: <CAHp75VeCHW=GMgyHRswsTrZ7b3TEnFh15F-5fyHcUsqXzoFS_g@mail.gmail.com>
References: <20200702085520.16901-1-aaron.ma@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200702085520.16901-1-aaron.ma@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaron Ma <aaron.ma@canonical.com>
Cc: mapengyu@gmail.com, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 2, 2020 at 11:55 AM Aaron Ma <aaron.ma@canonical.com> wrote:
>
> When _BCL invalid, disable thinkpad_acpi backlight brightness control.
>
> brightness_enable is already checked at the beginning,

> Always print notice when enabled brightness control.

Why?

...

> +       pr_notice("thinkpad_acpi native brightness control enabled\n");

'notice' level is quite high, why do we spam users with this?

-- 
With Best Regards,
Andy Shevchenko
