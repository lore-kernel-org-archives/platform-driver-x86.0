From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC PATCH 0/3] asus_wmi: Support of ASUS TUF laptops on Ryzen CPUs
Date: Mon, 4 Nov 2019 16:33:38 +0200
Message-ID: <CAHp75VdWSfR+4kMA470ZVBHiDi_HCGOwS6q=xOg0neubcxGG8Q@mail.gmail.com>
References: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Maxx <leonmaxx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, Daniel Drake <drake@endlessm.com>, Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 4, 2019 at 12:53 PM Leon Maxx <leonmaxx@gmail.com> wrote:
>
> Hi,
>
> this patch series adds support of ASUS TUF laptops on Ryzen CPUs to existing
> asus_wmi platform driver and also fixes minor bug.
>

All three patches are broken. Please, fix your MTA / MUA (for the
latter one it's highly recommended to use git-send-email).
You may test patches by sending to another address you have in some
extarnal domain.

> Leonid Maksimchuk (3):
>   platform/x86: asus_wmi: Fix return value of fan_boost_mode_store
>   platform/x86: asus_wmi: Support fan boost mode on FX505DY/FX705DY
>   platform/x86: asus_wmi: Set default fan boost mode to normal
>
>  drivers/platform/x86/asus-wmi.c            | 57 +++++++++++++++++++++--------
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 43 insertions(+), 15 deletions(-)



-- 
With Best Regards,
Andy Shevchenko
