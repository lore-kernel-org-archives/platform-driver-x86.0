From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [External] Re: [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Date: Thu, 2 Jul 2020 06:44:44 -0400
Message-ID: <7d0e1dcc-7285-71e1-7125-604cb2630595@lenovo.com>
References: <markpearson@lenovo.com>
 <20200629191748.3859-1-markpearson@lenovo.com>
 <CAHp75VeO5SzYs=kRh+BV_vydO7PTPLkmu8aiYXvSJFTewSTYwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAHp75VeO5SzYs=kRh+BV_vydO7PTPLkmu8aiYXvSJFTewSTYwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Thanks Andy

On 7/2/2020 5:29 AM, Andy Shevchenko wrote:
> On Mon, Jun 29, 2020 at 10:23 PM Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org> wrote:
> 
> Thanks for the patch, my comments below.
> 
>>    Newer Lenovo Thinkpad platforms have support to identify whether the
>>    system is on-lap or not using an ACPI DYTC event from the firmware.
>>
>>    This patch provides the ability to retrieve the current mode via sysfs
>>    entrypoints and will be used by userspace for thermal mode and WWAN
>>    functionality
> 
> Please use proper indentation (no need to have spaces) and punctuation
> (like period at the end of sentences).
Ack
> 
> ...
> 
>>   drivers/platform/x86/thinkpad_acpi.c | 111 ++++++++++++++++++++++++++-
>>   1 file changed, 109 insertions(+), 2 deletions(-)
> 
> You specifically added a new ABI, where is documentation? It's a show stopper.
Ah - my apologies I didn't know that was a requirement.

Any pointers on where to add it? I looked in Documentation/ABI and I 
couldn't find anything around thinkpad_acpi to add this to.
Should there be a sysfs-devices-platform-thinkpad_acpi file?

If that's the case I'm happy to look at creating that but as a first 
time kernel contributor would you object if I took that on as a separate 
exercise rather than as part of this patch. I'm guessing it would need 
more time, care and reviewers from other contributors to the 
thinkpad_acpi.c driver
> 
> ...
> 
>> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
>> +                       "dytc_lapmode");
> 
> One line?
Ack
> 
> ...
> 
>> +       int output;
>> +
>> +       output = dytc_command(DYTC_CMD_GET);
> 
>> +       if ((output == -ENODEV) || (output == -EIO))
>> +               return output;
> 
> Why not simple
> 
>   if (output < 0)
>     return output;
Agreed. I'll fix

> 
> Btw, how will this survive the 31st bit (if some method would like to use it)?
Hmmm - good point. I'll revisit this.

> 
> I think your prototype should be
> 
> int foo(cmd, *output);
Looking at it again - I agree.

> 
> ...
> 
>> +       new_state = dytc_lapmode_get();
>> +       if ((new_state == -ENODEV) || (new_state == -EIO) || (new_state == dytc_lapmode))
>> +               return;
> 
> What about other errors?
> What about MSB being set?
Ack - this needs fixing

> 
> ...
> 
>> +       dytc_lapmode = dytc_lapmode_get();
>> +
>> +       if (dytc_lapmode < 0 && dytc_lapmode != -ENODEV)
>> +               return dytc_lapmode;
> 
>> +       res = sysfs_create_group(&tpacpi_pdev->dev.kobj,
>> +                               &dytc_attr_group);
>> +
>> +       return res;
> 
> return ...(...);
> 
> So, we create a group for all possible error cases but ENODEV. Why?
There seemed a good reason when I originally wrote it - but now I'm 
wondering why too.
I specifically was catching the ENODEV because of concerns around 
creating the group on platforms that didn't have the support for this 
feature - but I think in doing that I missed the obvious of all errors.

I'll revisit and fix.

> 
>> +}
> 
> ...
> 
>> +       sysfs_remove_group(&tpacpi_pdev->dev.kobj,
>> +                       &dytc_attr_group);
> 
> One line?
Ack.
As a minor note I think these all arose because of getting checkpatch to 
run cleanly. I prefer one line too and if that's your preference it 
works for me.

> 
> ...
> 
>> +static struct ibm_struct dytc_driver_data = {
>> +       .name = "dytc",
>> +       .exit = dytc_exit
> 
> Comma is missed.
Ack

> 
>> +};
> 
I'll work on these and get an updated version out for review. Thank you 
for your time looking at these.

Mark
