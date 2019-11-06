From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/3] asus_wmi: Support of ASUS TUF laptops on Ryzen CPUs
Date: Wed, 6 Nov 2019 09:21:30 +0200
Message-ID: <CAHp75VfS_AC+QmCY5M1VXd6QJLFQ=YtTdY4yDrJMPPMY_JxYLg@mail.gmail.com>
References: <20191104213417.18036-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104213417.18036-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonid Maksymchuk <leonmaxx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Chris Chiu <chiu@endlessm.com>, Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 4, 2019 at 11:34 PM Leonid Maksymchuk <leonmaxx@gmail.com> wrote:
>
> Hi,
>
> this patch series adds support of ASUS TUF laptops on Ryzen CPUs to existing
> asus_wmi platform driver and also fixes minor bug.
>
> v2: fixed indentation.

Usual versioning
RFC [RFC v2, ...]
v1
v2, ...

Okay, next one will be v3 to avoid overlapping.

I'll take first patch later, but I also will give more comments to patch 2.
Please, give me time to review it properly.

>
> Leonid Maksymchuk (3):
>   asus_wmi: Fix return value of fan_boost_mode_store
>   asus_wmi: Add support for fan boost mode on FX505DY/FX705DY
>   asus_wmi: Set default fan boost mode to normal
>
>  drivers/platform/x86/asus-wmi.c            | 57 ++++++++++++++++++++++--------
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 43 insertions(+), 15 deletions(-)
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
