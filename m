From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v5 2/6] platform/x86: intel_pmc_ipc: Add pmc gcr
 read/write/update api's
Date: Tue, 4 Apr 2017 15:07:32 -0700
Message-ID: <e8e453f6-8920-7081-7cd5-559856a33f6a@linux.intel.com>
References: <bf5a86829e9403d93e85270b2898b3c548417a05.1491264643.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAENHMvOyzbhDQzvpYFcxC9mvsfDGrco9RMy+rU=faT6RN_uW3A@mail.gmail.com>
 <83d48f6907b3392e38ee251cf9fa6d518f139288.1491264643.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VcNucpd17Z8gsoxW7qDsyR7UkJG4n-82J6CpM3j_3V_Ew@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VcNucpd17Z8gsoxW7qDsyR7UkJG4n-82J6CpM3j_3V_Ew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Box <david.e.box-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,


On 04/04/2017 06:53 AM, Andy Shevchenko wrote:
> On Tue, Apr 4, 2017 at 3:24 AM, Kuppuswamy Sathyanarayanan
> <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> This patch adds API's to read/write/update PMC GC registers.
>> PMC dependent devices like iTCO_wdt, Telemetry has requirement
>> to acces GCR registers. These API's can be used for this
>> purpose.
>> +/* GCR reg offsets from gcr base*/
>> +#define PMC_GCR_PMC_CFG_REG            0x08
>> +
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>> @@ -127,6 +127,7 @@ static struct intel_pmc_ipc_dev {
>>
>>          /* gcr */
>>          resource_size_t gcr_base;
>> +       void __iomem *gcr_mem_base;
>>          int gcr_size;
> Rearrange those lines to make __iomem pointer latter.
Will do it in next version. But the gcr_base resource pointer will be 
removed in next dependent patch. So I don't think it matters in the end.
>
>> +static inline int is_gcr_valid(u32 offset)
> Same comment as previously. It should take a pointer to struct
> intel_pmc_ipc_dev as a parameter.
This needs the driver cleanup. We can do it in refactoring patch.
>
>> +/**
>> + * intel_pmc_gcr_write() - Write PMC GCR register
>> + * @offset:    offset of GCR register from GCR address base
>> + * @data:      register update value
>> + *
>> + * Writes the PMC GCR register of given offset with given
>> + * value
> You have to use proper punctuation in the sentences in full Description section.
Will fix it in next version.
>
>> +/**
>> + * intel_pmc_gcr_update() - Update PMC GCR register bits
>> + * @offset:    offset of GCR register from GCR address base
>> + * @mask:      bit mask for update operation
>> + * @val:       update value
>> + *
>> + * Updates the bits of given GCR register as specified by
>> + * @mask and @val
> Ditto.
>
>> +int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
>> +{
>> +       u32 orig, tmp;
> One of them is redundant.
>
> I would go just with
> u32 value;
Will fix it in next version.
>
>> +       writel(tmp, ipcdev.gcr_mem_base + offset);
>> +
>> +       tmp = readl(ipcdev.gcr_mem_base + offset);
>> +
> Redundant.
>
>> +       if ((tmp & mask) != (val & mask)) {
> Why?! It the a case when writel() will fail? Needs to be commented.
Yes, I am checking whether the update is successful or  not. I can add a 
comment there to explain it.
>
>> +               ret = -EIO;
>> +               goto gcr_update_err;
>> +       }
>> +
>> +gcr_update_err:
> The keyword  'unlock' is missed in the label name.
"goto" to this label is only used when there is an error in update 
operation. Do you think we should still rename it to gcr_ipc_unlock ?
>
>> +       mutex_unlock(&ipclock);
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(intel_pmc_gcr_update);

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
