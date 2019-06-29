From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 00/13] Support of ASUS TUF Gaming series laptops
Date: Sat, 29 Jun 2019 16:13:41 +0300
Message-ID: <CAHp75Vd4mYrwT__DgogRJdSUSOZXU+b6KX_50-O=zS_oSxwE8w@mail.gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 14, 2019 at 9:47 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> Hi,
>
> this is the fourth version of the patch series.
>

Pushed to my review and testing queue, thanks!

> Changelog:
> v4:
>   * Rebase on for-next branch
>   * Extract local variable in patch 01
>   * Rename new method to "..._method3" and keep comma in struct declaration
>     in patch 03 (NOTE: the arg2 does not fit on same line by 1 character)
>   * Patch "Improve DSTS WMI method ID detection":
>     - sort local variables
>     - use dev_info
>     - separate changes to wmi module in an own patch
>     - rename method ID constants and fix comment capitalization
>   * "Support WMI event queue": split into separate refactoring and new
>     functionality patches, use dev_info as well
>   * "Organize code into sections": split out error handling refactoring
>   * "Enhance detection of thermal data": remove unreasonable refactoring
>     and just change the currently used condition
>   * "Control RGB keyboard backlight": removed, will be posted afterwards.
>     I will follow on the status of the multicolor framework, it does look
>     promising for this.
>   * Mark URL references with "Link:"
>   * Minor corrections to commit messages
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
> Thread for V1/V2: https://lkml.org/lkml/2019/4/10/973
> Thread for V3: https://lkml.org/lkml/2019/4/19/178
>
> Yurii Pavlovskyi (13):
>   platform/x86: asus-wmi: Fix hwmon device cleanup
>   platform/x86: asus-wmi: Fix preserving keyboard backlight intensity on
>     load
>   platform/x86: asus-wmi: Increase input buffer size of WMI methods
>   platform/x86: wmi: Add function to get _UID of WMI device
>   platform/x86: asus-wmi: Improve DSTS WMI method ID detection
>   platform/x86: asus-wmi: Refactor WMI event handling
>   platform/x86: asus-wmi: Support WMI event queue
>   platform/x86: asus-nb-wmi: Add microphone mute key code
>   platform/x86: asus-wmi: Refactor error handling
>   platform/x86: asus-wmi: Organize code into sections
>   platform/x86: asus-wmi: Enhance detection of thermal data
>   platform/x86: asus-wmi: Switch fan boost mode
>   platform/x86: asus-wmi: Do not disable keyboard backlight on unloading
>
>  .../ABI/testing/sysfs-platform-asus-wmi       |  10 +
>  drivers/hid/hid-asus.c                        |   2 +-
>  drivers/platform/x86/asus-nb-wmi.c            |   3 +-
>  drivers/platform/x86/asus-wmi.c               | 427 ++++++++++++++----
>  drivers/platform/x86/wmi.c                    |  19 +
>  include/linux/acpi.h                          |   1 +
>  include/linux/platform_data/x86/asus-wmi.h    |   5 +-
>  7 files changed, 374 insertions(+), 93 deletions(-)
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
