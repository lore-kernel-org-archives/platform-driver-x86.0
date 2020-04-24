From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/1] platform/x86: Add Slim Bootloader firmware update support
Date: Fri, 24 Apr 2020 14:08:41 +0300
Message-ID: <CAHp75VcqV3e8ecAUX+dr9h-bE+1XJ_71hJRA1b9XdouJJLD2ZA@mail.gmail.com>
References: <20200423224222.29730-1-jithu.joseph@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200423224222.29730-1-jithu.joseph@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jithu Joseph <jithu.joseph@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, Sean V Kelley <sean.v.kelley@intel.com>, kuo-lang.tseng@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 24, 2020 at 1:49 AM Jithu Joseph <jithu.joseph@intel.com> wrote:
>
> v1 Upstream submission is available here:
> https://lore.kernel.org/lkml/20200420194405.8281-1-jithu.joseph@intel.com
>

Pushed to my review and testing queue, thanks!

> v2 primarily addresses review comments from Andy Shevchenko to v1.
>
> Changes in v2
>  - Rebased on top of tag: v5.7-rc2
>  - Added ABI documentation file
>  - Changed the ordering of SBL entry in Makefile and Kconfig
>  - Replaced kstrtobool() with kstrtouint() for user input processing
>  - Added DocLink: tag to annottate weblink in commit message
>  - Minor edits to commit message in p1/1
>  - Style related changes
>
> From v1 submission:
>
> Slim Bootloader(SBL) [see link below] is a small open-source boot
> firmware, designed for running on certain Intel platforms. SBL can be
> thought-of as fulfilling the role of a minimal BIOS
> implementation, i.e initializing the hardware and booting
> Operating System.
>
> This driver creates sysfs interfaces which allows user space entities
> to trigger update of SBL firmware.
>
> Acknowledgment: Initial draft of the driver code was authored by
> Maurice Ma <maurice.ma@intel.com>
>
> DocLink: https://slimbootloader.github.io
>
> Jithu Joseph (1):
>   platform/x86: Add Slim Bootloader firmware update signaling driver
>
>  .../ABI/testing/sysfs-platform-sbl-fwu-wmi    |  12 ++
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/Kconfig                  |  10 ++
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/sbl_fwu_wmi.c            | 144 ++++++++++++++++++
>  5 files changed, 174 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-sbl-fwu-wmi
>  create mode 100644 drivers/platform/x86/sbl_fwu_wmi.c
>
>
> base-commit: ae83d0b416db002fe95601e7f97f64b59514d936
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
