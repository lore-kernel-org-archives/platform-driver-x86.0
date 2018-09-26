From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH 4/4] platform/x86: intel_telemetry: report debugfs failure
Date: Wed, 26 Sep 2018 19:54:13 +0530
Message-ID: <69ad420e-362c-d8c9-331f-056cdaefb1eb@linux.intel.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
 <20180903180415.31575-4-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VcE+BY=8aKEGqzkDBVazLGtwNNCa1CYCKGirS1vBLVXPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcE+BY=8aKEGqzkDBVazLGtwNNCa1CYCKGirS1vBLVXPg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, matt.turner@intel.com, "Brown, Len" <len.brown@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
List-Id: platform-driver-x86.vger.kernel.org



On 26-Sep-18 7:26 PM, Andy Shevchenko wrote:
> On Mon, Sep 3, 2018 at 9:05 PM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> On some Goldmont based systems such as ASRock J3455M the BIOS may not
>> enable the IPC1 device that provides access to the PMC and PUNIT. In
>> such scenarios, the ioss and pss resources from the platform device can
> IOSS
> PSS

Fine.

>
>> not be obtained and result in a invalid telemetry_plt_config.
> What is telemetry_plt_config?

Internal data structure that holds platform config, maintained by the 
telemetry platform driver.

>
>> This is also applicable to the platforms where the BIOS supports IPC1
>> device under debug configurations but IPC1 is disabled by user or the
>> policy.
>>
>> This change allows user to know the reason for not seeing entries under
>> /sys/kernel/debug/telemetry/* when there is no apparent failure at boot.
>>
>> Cc: Matt Turner <matt.turner@intel.com>
>> Cc: Len Brown <len.brown@intel.com>
>> Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
>> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@intel.com>
>>
>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=198779
>>
> There should be not a blank line.

OK.

>
>> Acked-by: Matt Turner <matt.turner@intel.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
>> +exit:
>> +       pr_debug(pr_fmt(DRIVER_NAME) " Failed\n");
> Completely useless.
>
> Device core does it in generic way.

If i remove this print then perhaps there is no need of this patch. 
Reason to print this is that the platform driver / core driver does not 
show any error. In-fact they are even loaded in module table. OTOH, this 
debugfs interface fails. This is very confusing to the users if they 
check the lsmod output so i feel this print might help.

>
