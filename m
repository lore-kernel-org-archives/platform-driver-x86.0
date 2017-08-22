From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v1 2/6] platform/x86: intel_pmc_ipc: Use devm_* calls in
 driver probe
Date: Tue, 22 Aug 2017 12:45:26 +0300
Message-ID: <CAHp75VfO=rcyvDaRbb-9MjZEcHPHVMcF3P_NA+H=0wseMubq=A@mail.gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <5147288461b861d1b956e1adc3f1d61192086c34.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VdFAJ0zfu-tCviurB6J4er4NB_RpW6Wc+1o7tp1qPc+DA@mail.gmail.com> <55cbf2a1-b5c6-c320-a8b6-4475680cdb3e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55cbf2a1-b5c6-c320-a8b6-4475680cdb3e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sathya <sathyaosid@gmail.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Aug 22, 2017 at 8:05 AM, sathya <sathyaosid@gmail.com> wrote:
> On 08/18/2017 05:24 AM, Andy Shevchenko wrote:
>> On Tue, Aug 1, 2017 at 9:13 PM,
>> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:

>>> This patch cleans up unnecessary free/alloc calls in this driver
>>> by using devm_* calls.

>>>   static int ipc_plat_remove(struct platform_device *pdev)
>>>   {
>>> -       struct resource *res;
>>> -
>>>          sysfs_remove_group(&pdev->dev.kobj, &intel_ipc_group);
>>> -       free_irq(ipcdev.irq, &ipcdev);
>>
>> Can we get an IRQ at any time here?
>
> Yes, if the ipc_plat_probe() is successful then ipcdev.irq will have valid
> IRQ in all cases.

...which effectively means you can't remove free_irq() here. OTOH you
may replace it by explicit devm_free_irq() call.

>>>          platform_device_unregister(ipcdev.tco_dev);
>>>          platform_device_unregister(ipcdev.punit_dev);
>>>          platform_device_unregister(ipcdev.telemetry_dev);
>>>          ipcdev.dev = NULL;
>>>          return 0;
>>>   }


-- 
With Best Regards,
Andy Shevchenko
