From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC v3 0/7] PMC/PUNIT IPC driver cleanup
Date: Tue, 3 Oct 2017 18:06:51 -0700
Message-ID: <61866414-0801-1962-9c92-410a4b82b006@linux.intel.com>
References: <cover.1504588701.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VcRGqb86cfggF9zFtfzkZkx7CSH9-nYQ2rk_G8Rgn2t7w@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VcRGqb86cfggF9zFtfzkZkx7CSH9-nYQ2rk_G8Rgn2t7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Souvik Kumar Chakravarty <souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

Thanks for the review. I really appreciate you taking the time to review 
such big chunk of code changes.


On 10/01/2017 07:46 AM, Andy Shevchenko wrote:
> On Tue, Sep 5, 2017 at 8:37 AM,
> <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> Hi All,
>>
>> Currently intel_pmc_ipc.c, intel_punit_ipc.c, intel_scu_ipc.c drivers implements the same IPC features.
>> This code duplication could be avoided if we implement the IPC driver as a generic library and let custom
>> device drivers use API provided by generic driver. This patchset mainly addresses this issue.
>>
>> Along with above code duplication issue, This patchset also addresses following issues in intel_pmc_ipc and
>> intel_punit_ipc drivers.
>>
>> 1. Intel_pmc_ipc.c driver does not use any resource managed (devm_*) calls.
>> 2. In Intel_pmc_ipc.c driver, dependent devices like PUNIT, Telemetry and iTCO are created manually and uses lot of redundant buffer code.
>> 3. Global variable is used to store the IPC device structure and it is used across all functions in intel_pmc_ipc.c and intel_punit_ipc.c.
>>
>> More info on Intel IPC device library:
>> -------------------------------------
>>
>> A generic Intel IPC class driver has been implemented and all common IPC helper functions has been moved to this driver. It exposes APIs to create IPC device channel, send raw IPC command and simple IPC commands. It also creates device attribute to send IPC command from user space.
>>
>> API for creating a new IPC channel device is,
>>
>> struct intel_ipc_dev *devm_intel_ipc_dev_create(struct device *dev, const char *devname, struct intel_ipc_dev_cfg *cfg, struct intel_ipc_dev_ops *ops)
>>
>> The IPC channel drivers (PUNIT/PMC/SCU) when creating a new device can configure their device params like register mapping, irq, irq-mode, channel type,etc  using intel_ipc_dev_cfg and intel_ipc_dev_ops arguments. After a new IPC channel device is created, IPC users can use the generic APIs to make IPC calls.
>>
>> For example, after using this new model, IPC call to PMC device will look like,
>>
>> pmc_ipc_dev = intel_ipc_dev_get(INTEL_PMC_IPC_DEV);
>> ipc_dev_raw_cmd(pmc_ipc_dev, cmd, PMC_PARAM_LEN, (u32 *)ipc_in, 1, NULL, 0, 0, 0);
>>
>> I am still testing the driver in different products. But posted it to get some early comments. I also welcome any PMC/PUNIT driver users to check these patches in their product.
> I have applied first patch from the series with some small changes.
> Please rebase the rest on top of my review branch (review-andy).
Will do. I will soon send v4 version.
> Before sending new version, address comments that others and me did.
Yes.
>

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
