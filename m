From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [External] RE: [PATCH v2] platform/x86:
 thinkpad_acpi: performance mode interface
Date: Fri, 21 Aug 2020 15:35:38 -0400
Message-ID: <1806c4ec-6788-bcc7-7e09-8e5274d2b9d5@lenovo.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
 <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0-JELcaX3dgTY1BKDJOnGuQNvXXbHMiUzJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: "Limonciello, Mario" <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>
Cc: "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Mario

On 8/21/2020 3:15 PM, Limonciello, Mario wrote:
>>
<snip>
> 
> Thanks for adapting a lot of my feedback, this looks much better to me.
> 
No problems and genuinely thank you for the feedback. Sorry it took so 
long to get this update out - PTO and other things got in the way :)

>>
<snip>
>> +
>> +The sysfs entry provides the ability to return the current status and to set
>> the
>> +desired mode. For example::
>> +
>> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>> +
> 
> I was thinking about this some more, do you actually want another mode that "disables"
> this feature?   IE "O" turns it off an calls DYTC_DISABLE_CQL.
> 
> For example if a user wanted to test the recently landed code in thermald 2.3
> and compare performance between the two it seems like this and that "might" fight.
> As an outsider looking in - I of course may be wrong too here.
> 
> If at some point in the future thermald does a better job than this implementation you
> might also want an "out" to let thermald or another piece of userland turn this off
> if it's in the picture.
> 
I'm still digging into this one. Right now I haven't found a good clean 
way of just disabling the firmware. Currently when thermald goes in and 
tweaks the CPU power registers it has the effect of overriding the FW 
anyway - but I appreciate that's not quite the same as actually doing it 
explicitly.

I'm still discussing with the BIOS team how to implement this - these 
conversations take time.... I suspect I'll need a new BIOS API which 
will take a while to implement and get rolled out. I didn't want to hold 
up this patch as there are benefits for users in the meantime and Lenovo 
do plan on supporting the thermal software going forwards. I'm not not 
dropping the plan to have a disable function as I can see the benefits.

Thanks for the input. Let me know if you want a reviewed-by tag added. I 
think it's kinda awesome having input from a Dell engineer on a Lenovo 
related driver and I hope in the future I can provide the same help ;) 
Open source is awesome.

Mark
