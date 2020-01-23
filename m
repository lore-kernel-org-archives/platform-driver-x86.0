From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/9] platform/x86: intel_pmc_ipc: Cleanups
Date: Thu, 23 Jan 2020 14:31:31 +0200
Message-ID: <CAHp75VcTeT0Brhe+in-XKfwwaaXSwfRK0ceNVgUPd_TOpk1TqQ@mail.gmail.com>
References: <20200122164619.73563-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200122164619.73563-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Zha Qipeng <qipeng.zha@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 22, 2020 at 6:46 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> This is another independent cleanup series that I split out from my SCU/PMC
> IPC rework patch set [1] as suggested by Greg. This removes code that is
> not used anywhere and makes certain functions static as they are not called
> outside of the driver. We also make the driver to use driver->dev_groups to
> expose sysfs attributes.
>
> [1] https://lkml.org/lkml/2020/1/21/678
>

Pushed to my review and testing queue, thanks!

> Mika Westerberg (9):
>   platform/x86: intel_pmc_ipc: Make intel_pmc_gcr_update() static
>   platform/x86: intel_pmc_ipc: Make intel_pmc_ipc_simple_command() static
>   platform/x86: intel_pmc_ipc: Make intel_pmc_ipc_raw_cmd() static
>   platform/x86: intel_pmc_ipc: Drop intel_pmc_gcr_read() and intel_pmc_gcr_write()
>   platform/x86: intel_pmc_ipc: Drop ipc_data_readb()
>   platform/x86: intel_pmc_ipc: Get rid of unnecessary includes
>   platform/x86: intel_pmc_ipc: Use octal permissions in sysfs attributes
>   platform/x86: intel_pmc_ipc: Propagate error from kstrtoul()
>   platform/x86: intel_pmc_ipc: Switch to use driver->dev_groups
>
>  arch/x86/include/asm/intel_pmc_ipc.h |  32 --------
>  drivers/platform/x86/intel_pmc_ipc.c | 114 ++++-----------------------
>  2 files changed, 16 insertions(+), 130 deletions(-)
>
> --
> 2.24.1
>


-- 
With Best Regards,
Andy Shevchenko
