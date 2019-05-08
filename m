From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 00/11] asus-wmi: Support of ASUS TUF Gaming series laptops
Date: Wed, 8 May 2019 16:26:31 +0300
Message-ID: <CAHp75VdpS_ZX1qKj9PXNhS04C+pEkn7y02CTVshy=4f-42sriQ@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 19, 2019 at 12:57 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> Hi,
>
> this is the third version of the patch series.

Doesn't apply to the for-next branch.
Individual comments on the patches are coming as well.

>
> Changelog:
> v3:
>   * Use devm_* function in patch 01
>   * Detect DSTS/DCTS using _UID in patch 04
>   * Detect event queue by _UID as well in patch 05
>   * Rename poll function in patch 05
>   * Fix terminology in patches 09 and 10
>   * Correct commit messages
> v2:
>   * Fix logging
>
> INTRODUCTION
> The support for this laptop series is currently non-existent, as the
> asus-nb-wmi driver (which is essentially configuration for asus-wmi) fails
> to load and multiple ACPI errors are logged in dmesg. This patch series
> adds pretty comprehensive support for these relatively new laptops, adds
> some code organization, and fixes a couple of bugs in the asus-wmi module.
>
> Original message from V1/V2:
> https://lkml.org/lkml/2019/4/10/973
>
> It is really long, so I will not copy it completely here, please refer
> to the original for notes on design decisions and existing minor issues
> (other than quirks, which should be hopefully solved now).
>
> Yurii Pavlovskyi (11):
>   platform/x86: asus-wmi: Fix hwmon device cleanup
>   platform/x86: asus-wmi: Fix preserving keyboard backlight intensity on
>     load
>   platform/x86: asus-wmi: Increase the input buffer size of WMI methods
>   platform/x86: asus-wmi: Improve DSTS WMI method ID detection
>   platform/x86: asus-wmi: Support WMI event queue
>   platform/x86: asus-nb-wmi: Add microphone mute key code
>   platform/x86: asus-wmi: Organize code into sections
>   platform/x86: asus-wmi: Enhance detection of thermal data
>   platform/x86: asus-wmi: Control RGB keyboard backlight
>   platform/x86: asus-wmi: Switch fan boost mode
>   platform/x86: asus-wmi: Do not disable keyboard backlight on unloading
>
>  .../ABI/testing/sysfs-platform-asus-wmi       |  71 ++
>  drivers/platform/x86/asus-nb-wmi.c            |   3 +-
>  drivers/platform/x86/asus-wmi.c               | 797 +++++++++++++++---
>  drivers/platform/x86/wmi.c                    |  19 +
>  include/linux/acpi.h                          |   1 +
>  include/linux/platform_data/x86/asus-wmi.h    |   7 +-
>  6 files changed, 797 insertions(+), 101 deletions(-)
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
