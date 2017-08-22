From: sathya <sathyaosid@gmail.com>
Subject: Re: [RFC v1 4/6] platform: x86: Add generic Intel IPC driver
Date: Mon, 21 Aug 2017 22:09:43 -0700
Message-ID: <a6c43a40-9c47-330c-975c-cb60e63793a4@gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <ed86bc43a959eb1aacbbca4eeb03547e25571aa8.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VftGZRoT6aFMD8Mi1GQ=846gwSWTsE-HU00+ijuTtgo4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35506 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdHVFJp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2017 01:09:45 -0400
In-Reply-To: <CAHp75VftGZRoT6aFMD8Mi1GQ=846gwSWTsE-HU00+ijuTtgo4g@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

Hi Andy,


On 08/18/2017 05:38 AM, Andy Shevchenko wrote:
> On Tue, Aug 1, 2017 at 9:13 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> Currently intel_scu_ipc.c, intel_pmc_ipc.c and intel_punit_ipc.c
>> redundantly implements the same IPC features and has lot of code
>> duplication between them. This driver addresses this issue by grouping
>> the common IPC functionalities under the same driver.
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> ---
>>   arch/x86/include/asm/intel_ipc_dev.h | 148 ++++++++++++
> No, it should go under include/linux/platform_data/x86/
>
>> +/*
>> + * intel_ipc_dev.h: IPC class device header file
> No file names in the top of files.
>
>> + *
>> + * (C) Copyright 2017 Intel Corporation
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; version 2
>> + * of the License.
>> + *
>> + */
>> +struct intel_ipc_dev_cfg {
>> +       void __iomem *base;
>> +       void __iomem *wrbuf_reg;
>> +       void __iomem *rbuf_reg;
>> +       void __iomem *sptr_reg;
>> +       void __iomem *dptr_reg;
>> +       void __iomem *status_reg;
>> +       void __iomem *cmd_reg;
> No, you have to switch to regmap instead.
Do you want me to register regmap in intel_pmc_ipc.c and pass this 
regmap pointer to devm_intel_ipc_dev_create()
instead of regular mem address ? Please correct me if my understanding 
is incorrect.

But I don't understand how this change will improve the design.
>
>> +       int mode;
>> +       int irq;
>> +       int irqflags;
>> +       int chan_type;
>> +       bool use_msi;
>> +};
>
-
Sathya
