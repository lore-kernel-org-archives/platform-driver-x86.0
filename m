From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 0/2] platform/x86 asus_wmi: Support of ASUS TUF laptops
 on Ryzen CPUs
Date: Mon, 25 Nov 2019 13:09:08 +0200
Message-ID: <CAHp75VeD4bKLrhnWw6vPa_K7QQXGsvyD3COZb9FwripOVAawvQ@mail.gmail.com>
References: <20191124140625.20736-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191124140625.20736-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonid Maksymchuk <leonmaxx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Chris Chiu <chiu@endlessm.com>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Nov 24, 2019 at 4:07 PM Leonid Maksymchuk <leonmaxx@gmail.com> wrote:
>
> Hi,
>
> this patch series adds support of Throttle themal policy ACPI device to
> existing asus_wmi platform driver. Support of this device is required
> for ASUS TUF laptops on Ryzen CPUs to properly work on Linux.
>

In both patches you forgot a colon after platform/x86 prefix.

> v2: fixed indentation.
> v3: patches 2/3 and 3/3 are refactored.
> v4: patch 2/3 are simplified.
> v5: add new device instead of merging with fan boost mode
>
> Leonid Maksymchuk (2):
>   platform/x86 asus_wmi: Support throttle thermal policy
>   platform/x86 asus_wmi: Set throttle thermal policy to default
>
>  drivers/platform/x86/asus-wmi.c            | 128 +++++++++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |   1 +
>  2 files changed, 129 insertions(+)
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
