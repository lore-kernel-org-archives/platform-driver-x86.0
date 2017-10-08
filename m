From: "Kuppuswamy, Sathyanarayanan" <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v5 1/8] platform/x86: intel_pmc_ipc: Use spin_lock to
 protect GCR updates
Date: Sun, 8 Oct 2017 11:54:13 -0700
Message-ID: <3e38abb3-efce-49b9-ce2d-854c42bdfb12@gmail.com>
References: <cover.1507414288.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <e70046c8d49173840f8ee7218e8b2288301f8e67.1507414288.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VdaTvaOgNJE1vHHDfT2V8MYyQFnpr0qdUmBVJ2743eQKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdaTvaOgNJE1vHHDfT2V8MYyQFnpr0qdUmBVJ2743eQKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Souvik Kumar Chakravarty <souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kupuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,


On 10/8/2017 11:38 AM, Andy Shevchenko wrote:
> On Sun, Oct 8, 2017 at 1:19 AM,
> <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> Currently, update_no_reboot_bit() function implemented in this driver
>> uses mutex_lock() to protect its register updates. But this function is
>> called with in atomic context in iTCO_wdt_start() and iTCO_wdt_stop()
>> functions in iTCO_wdt.c driver, which in turn causes "sleeping into
>> atomic context" issue. This patch fixes this issue by replacing the
>> mutex_lock() with spin_lock() to protect the GCR read/write/update APIs.
>>
>> Fixes: 9d855d4 ("platform/x86: intel_pmc_ipc: Fix iTCO_wdt GCS memory mapping failure")
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kupuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>   * Rebased this patch on top of Andy's review branch.
> Oh, what I asked you is to use vanilla kernel as a base.
> Please, be sure (you assured me, though it's not true)
I did test this patch on top of 4.14-rc3, but I have included another 
patch (""platform/x86: intel_pmc_ipc: Use devm_* calls in driver probe 
function") from your review branch before testing.
I assumed that your will be pushing this patch along with devm_* fixes 
patch (since you already reviewed it), So I re-based them together on 
top of 4.14-rc3.  Sorry, it looks like my assumption is incorrect.
>   that it's
> applied against vanilla (or our fixes branch) and send just this one
> patch separately.
I will send it separately now.
>
> No need to resend v5 right now.
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
