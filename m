From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] intel_ips: Convert timers to use timer_setup()
Date: Thu, 2 Nov 2017 12:55:03 -0700
Message-ID: <CAGXu5jJSnM7ZWqkyqVNpcmBKrGMfGx_C5wG5q63PF4SUV8HVwQ@mail.gmail.com>
References: <20171005005421.GA23936@beast> <CAHp75VdeS+dAQn_yE1gsgDzpv1+C5+c-AkgSgH5ScxAKFyRKWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:53456 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934221AbdKBTzE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 15:55:04 -0400
Received: by mail-io0-f196.google.com with SMTP id 189so1522891iow.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Nov 2017 12:55:04 -0700 (PDT)
In-Reply-To: <CAHp75VdeS+dAQn_yE1gsgDzpv1+C5+c-AkgSgH5ScxAKFyRKWA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On Thu, Oct 5, 2017 at 1:41 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 5, 2017 at 3:54 AM, Kees Cook <keescook@chromium.org> wrote:
>> In preparation for unconditionally passing the struct timer_list pointer to
>> all timer callbacks, switch to using the new timer_setup() and from_timer()
>> to pass the timer pointer explicitly. Moves timer structure off stack and
>> into struct ips_driver.
>
> Pushed to my testing queue, thanks!

Hi,

I don't see this in -next yet. Should the tip tree carry this conversion?

Thanks!

-Kees

>
>>
>> Cc: Darren Hart <dvhart@infradead.org>
>> Cc: Andy Shevchenko <andy@infradead.org>
>> Cc: platform-driver-x86@vger.kernel.org
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>> This requires commit 686fef928bba ("timer: Prepare to change timer
>> callback argument type") in v4.14-rc3, but should be otherwise
>> stand-alone.
>> ---
>>  drivers/platform/x86/intel_ips.c | 15 +++++++--------
>>  1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
>> index 58dcee562d64..056afb731d79 100644
>> --- a/drivers/platform/x86/intel_ips.c
>> +++ b/drivers/platform/x86/intel_ips.c
>> @@ -300,6 +300,7 @@ struct ips_driver {
>>         struct task_struct *monitor;
>>         struct task_struct *adjust;
>>         struct dentry *debug_root;
>> +       struct timer_list timer;
>>
>>         /* Average CPU core temps (all averages in .01 degrees C for precision) */
>>         u16 ctv1_avg_temp;
>> @@ -942,9 +943,10 @@ static u32 calc_avg_power(struct ips_driver *ips, u32 *array)
>>         return avg;
>>  }
>>
>> -static void monitor_timeout(unsigned long arg)
>> +static void monitor_timeout(struct timer_list *t)
>>  {
>> -       wake_up_process((struct task_struct *)arg);
>> +       struct ips_driver *ips = from_timer(ips, t, timer);
>> +       wake_up_process(ips->monitor);
>>  }
>>
>>  /**
>> @@ -961,7 +963,6 @@ static void monitor_timeout(unsigned long arg)
>>  static int ips_monitor(void *data)
>>  {
>>         struct ips_driver *ips = data;
>> -       struct timer_list timer;
>>         unsigned long seqno_timestamp, expire, last_msecs, last_sample_period;
>>         int i;
>>         u32 *cpu_samples, *mchp_samples, old_cpu_power;
>> @@ -1049,8 +1050,7 @@ static int ips_monitor(void *data)
>>         schedule_timeout_interruptible(msecs_to_jiffies(IPS_SAMPLE_PERIOD));
>>         last_sample_period = IPS_SAMPLE_PERIOD;
>>
>> -       setup_deferrable_timer_on_stack(&timer, monitor_timeout,
>> -                                       (unsigned long)current);
>> +       timer_setup(&ips->timer, monitor_timeout, TIMER_DEFERRABLE);
>>         do {
>>                 u32 cpu_val, mch_val;
>>                 u16 val;
>> @@ -1107,7 +1107,7 @@ static int ips_monitor(void *data)
>>                 expire = jiffies + msecs_to_jiffies(IPS_SAMPLE_PERIOD);
>>
>>                 __set_current_state(TASK_INTERRUPTIBLE);
>> -               mod_timer(&timer, expire);
>> +               mod_timer(&ips->timer, expire);
>>                 schedule();
>>
>>                 /* Calculate actual sample period for power averaging */
>> @@ -1116,8 +1116,7 @@ static int ips_monitor(void *data)
>>                         last_sample_period = 1;
>>         } while (!kthread_should_stop());
>>
>> -       del_timer_sync(&timer);
>> -       destroy_timer_on_stack(&timer);
>> +       del_timer_sync(&ips->timer);
>>
>>         dev_dbg(&ips->dev->dev, "ips-monitor thread stopped\n");
>>
>> --
>> 2.7.4
>>
>>
>> --
>> Kees Cook
>> Pixel Security
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Kees Cook
Pixel Security
