From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v1 2/6] platform/x86: intel_pmc_ipc: Use devm_* calls in
 driver probe
Date: Fri, 18 Aug 2017 15:24:47 +0300
Message-ID: <CAHp75VdFAJ0zfu-tCviurB6J4er4NB_RpW6Wc+1o7tp1qPc+DA@mail.gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com> <5147288461b861d1b956e1adc3f1d61192086c34.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5147288461b861d1b956e1adc3f1d61192086c34.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Aug 1, 2017 at 9:13 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> This patch cleans up unnecessary free/alloc calls in this driver
> by using devm_* calls.

>  static int ipc_plat_remove(struct platform_device *pdev)
>  {
> -       struct resource *res;
> -
>         sysfs_remove_group(&pdev->dev.kobj, &intel_ipc_group);

> -       free_irq(ipcdev.irq, &ipcdev);

Can we get an IRQ at any time here?

>         platform_device_unregister(ipcdev.tco_dev);
>         platform_device_unregister(ipcdev.punit_dev);
>         platform_device_unregister(ipcdev.telemetry_dev);

>         ipcdev.dev = NULL;
>         return 0;
>  }


-- 
With Best Regards,
Andy Shevchenko
