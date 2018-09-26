From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 4/4] platform/x86: intel_telemetry: report debugfs failure
Date: Wed, 26 Sep 2018 16:56:39 +0300
Message-ID: <CAHp75VcE+BY=8aKEGqzkDBVazLGtwNNCa1CYCKGirS1vBLVXPg@mail.gmail.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com> <20180903180415.31575-4-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903180415.31575-4-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, matt.turner@intel.com, "Brown, Len" <len.brown@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 3, 2018 at 9:05 PM Rajneesh Bhardwaj
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> On some Goldmont based systems such as ASRock J3455M the BIOS may not
> enable the IPC1 device that provides access to the PMC and PUNIT. In
> such scenarios, the ioss and pss resources from the platform device can

IOSS
PSS

> not be obtained and result in a invalid telemetry_plt_config.

What is telemetry_plt_config?

> This is also applicable to the platforms where the BIOS supports IPC1
> device under debug configurations but IPC1 is disabled by user or the
> policy.
>
> This change allows user to know the reason for not seeing entries under
> /sys/kernel/debug/telemetry/* when there is no apparent failure at boot.
>
> Cc: Matt Turner <matt.turner@intel.com>
> Cc: Len Brown <len.brown@intel.com>
> Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@intel.com>
>

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=198779
>
There should be not a blank line.

> Acked-by: Matt Turner <matt.turner@intel.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>

> +exit:
> +       pr_debug(pr_fmt(DRIVER_NAME) " Failed\n");

Completely useless.

Device core does it in generic way.

-- 
With Best Regards,
Andy Shevchenko
