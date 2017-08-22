From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v1 4/6] platform: x86: Add generic Intel IPC driver
Date: Tue, 22 Aug 2017 12:50:54 +0300
Message-ID: <CAHp75Vc17xhZGWN_KFgBut2RXcb5JMj1-eTRf82NsCs_wGOdxA@mail.gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <ed86bc43a959eb1aacbbca4eeb03547e25571aa8.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VftGZRoT6aFMD8Mi1GQ=846gwSWTsE-HU00+ijuTtgo4g@mail.gmail.com> <a6c43a40-9c47-330c-975c-cb60e63793a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:36908 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932306AbdHVJuz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2017 05:50:55 -0400
In-Reply-To: <a6c43a40-9c47-330c-975c-cb60e63793a4@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: sathya <sathyaosid@gmail.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Tue, Aug 22, 2017 at 8:09 AM, sathya <sathyaosid@gmail.com> wrote:
> On 08/18/2017 05:38 AM, Andy Shevchenko wrote:
>> On Tue, Aug 1, 2017 at 9:13 PM,
>> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:

>>> +struct intel_ipc_dev_cfg {
>>> +       void __iomem *base;
>>> +       void __iomem *wrbuf_reg;
>>> +       void __iomem *rbuf_reg;
>>> +       void __iomem *sptr_reg;
>>> +       void __iomem *dptr_reg;
>>> +       void __iomem *status_reg;
>>> +       void __iomem *cmd_reg;
>>
>> No, you have to switch to regmap instead.
>
> Do you want me to register regmap in intel_pmc_ipc.c and pass this regmap
> pointer to devm_intel_ipc_dev_create()
> instead of regular mem address ? Please correct me if my understanding is
> incorrect.
>
> But I don't understand how this change will improve the design.

We will have a core part which takes a PMC/SCU regmap on input.

Core part will not know about exact PMC in use. On top of core part
you will have one driver per PMC type.

In exchange core part will provide a generic set of functions like
"send simple command", "send command", "do ...smth...".

Core part _is_ a library.

>>> +       int mode;
>>> +       int irq;
>>> +       int irqflags;
>>> +       int chan_type;
>>> +       bool use_msi;
>>> +};

-- 
With Best Regards,
Andy Shevchenko
