From: Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/5] platform/x86: intel_pmc_ipc: Add pmc gcr
 read/write/update api's
Date: Sun, 2 Apr 2017 18:51:05 -0700
Message-ID: <CAENHMvPLE5KZMZ+NoU5fmNzDEoONz=SeAaSC=q8GfhFEHFOJ6g@mail.gmail.com>
References: <e537ff68732d86418982349624fd6de741bccc9b.1491002056.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170331133728.GA23725@rajaneesh-OptiPlex-9010> <1ca7187132bd2b98ca87d0829a3c76022f041924.1491002056.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75Vc0Mjk81TLDVwr9jkeeHqCvJ729aQLqg09zov7--AjKyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75Vc0Mjk81TLDVwr9jkeeHqCvJ729aQLqg09zov7--AjKyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, David Box <david.e.box-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

Thanks for your comments.

On Sun, Apr 2, 2017 at 6:58 AM, Andy Shevchenko
<andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Apr 1, 2017 at 2:27 AM, Kuppuswamy Sathyanarayanan
> <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> This patch adds API's to read/write/update PMC GC registers.
>> PMC dependent devices like iTCO_WDT, Telemetry has requirement
>
> iTCO_wdt
will fix it in next version.
>
>> to acces GCR registers. These API's can be used for this
>> purpose.
>
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>
>> +static inline int is_gcr_valid(u32 offset)
>
> Pointer to ipcdev should be a parameter to this function.

But ipcdev is a static variable, visible across this file. So there is
no point in passing it as parameter.

I just noticed that I am not holding the mutex lock in these
functions. I will fix it in next version.

>
>> +{
>> +       if (!ipcdev.has_gcr_regs)
>> +               return -EACCES;
>> +
>> +       if (offset > PLAT_RESOURCE_GCR_SIZE)
>> +               return -EINVAL;
>> +
>> +       return 0;
>> +}
>
>> +/**
>> + * intel_pmc_gcr_update() - Update PMC GCR register bits
>> + * @offset:    offset of GCR register from GCR address base
>> + * @mask:      bit mask for update operation
>> + * @val:       update value
>> + *
>
>> + * Updates the bits of given GCR register as specified by
>> + * mask and val
>
> -> * @mask and @val.
>
> You would need to refresh how to use kernel doc.
-:) will fix it in next version.
>
>> + *
>> + * Return:     negative value on error or 0 on success.
>> + */
>
> With Best Regards,
> Andy Shevchenko



-- 
--

Sathya
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
