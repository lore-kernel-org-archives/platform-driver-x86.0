From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [v2][PATCH] platform/x86: thinkpad_acpi: not loading
 brightness_init when _BCL invalid
Date: Thu, 9 Jul 2020 21:31:00 +0300
Message-ID: <CAHp75VdZPLzXqO7A8KXq3dT-_TymysCrmZcBc8SAtfCKfBQy5A@mail.gmail.com>
References: <20200702085520.16901-1-aaron.ma@canonical.com> <20200702110740.19880-1-aaron.ma@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200702110740.19880-1-aaron.ma@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaron Ma <aaron.ma@canonical.com>
Cc: mapengyu@gmail.com, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 2, 2020 at 2:07 PM Aaron Ma <aaron.ma@canonical.com> wrote:
>
> When _BCL invalid, disable thinkpad_acpi backlight brightness control.
>
> brightness_enable is already checked at the beginning.
> Most new thinkpads are using GPU driver to control brightness now,
> print notice when enabled brightness control even when brightness_enable = 1.


> +       } else if (!tp_features.bright_acpimode) {
> +               pr_notice("thinkpad_acpi backlight interface not available\n");
> +               return 1;
>         }
>
> +       pr_notice("thinkpad_acpi native brightness control enabled\n");

In both cases don't you see the duplication of module name in the messages?

-- 
With Best Regards,
Andy Shevchenko
