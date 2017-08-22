From: sathya <sathyaosid@gmail.com>
Subject: Re: [RFC v1 2/6] platform/x86: intel_pmc_ipc: Use devm_* calls in
 driver probe
Date: Mon, 21 Aug 2017 22:05:09 -0700
Message-ID: <55cbf2a1-b5c6-c320-a8b6-4475680cdb3e@gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <5147288461b861d1b956e1adc3f1d61192086c34.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VdFAJ0zfu-tCviurB6J4er4NB_RpW6Wc+1o7tp1qPc+DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33213 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750899AbdHVFFL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2017 01:05:11 -0400
In-Reply-To: <CAHp75VdFAJ0zfu-tCviurB6J4er4NB_RpW6Wc+1o7tp1qPc+DA@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

Hi,


On 08/18/2017 05:24 AM, Andy Shevchenko wrote:
> On Tue, Aug 1, 2017 at 9:13 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> This patch cleans up unnecessary free/alloc calls in this driver
>> by using devm_* calls.
>>   static int ipc_plat_remove(struct platform_device *pdev)
>>   {
>> -       struct resource *res;
>> -
>>          sysfs_remove_group(&pdev->dev.kobj, &intel_ipc_group);
>> -       free_irq(ipcdev.irq, &ipcdev);
> Can we get an IRQ at any time here?
Yes, if the ipc_plat_probe() is successful then ipcdev.irq will have 
valid IRQ in all cases.
>
>>          platform_device_unregister(ipcdev.tco_dev);
>>          platform_device_unregister(ipcdev.punit_dev);
>>          platform_device_unregister(ipcdev.telemetry_dev);
>>          ipcdev.dev = NULL;
>>          return 0;
>>   }
>
-
Sathya
