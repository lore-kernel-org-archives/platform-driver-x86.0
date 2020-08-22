From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [External] RE: [PATCH v2] platform/x86:
 thinkpad_acpi: performance mode interface
Date: Fri, 21 Aug 2020 21:31:42 -0400
Message-ID: <52fc84b9-f87d-c91d-4d24-1db768c5c812@lenovo.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
 <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <1806c4ec-6788-bcc7-7e09-8e5274d2b9d5@lenovo.com>
 <DM6PR19MB26369308415B8235B3C9997EFA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <9e0c14a9-3b24-4b64-6d9e-b312d28dfd44@lenovo.com>
 <DM6PR19MB263621A07F59D91C8E2F7205FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <DM6PR19MB263621A07F59D91C8E2F7205FA5B0-JELcaX3dgTY1BKDJOnGuQNvXXbHMiUzJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
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


On 8/21/2020 4:43 PM, Limonciello, Mario wrote:
>> -----Original Message----- From: Mark Pearson 
>> <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org> Sent: Friday, August 21, 2020 15:06
>> 
>> On 8/21/2020 4:00 PM, Limonciello, Mario wrote: <snip>
>>>>>> + +The sysfs entry provides the ability to return the 
>>>>>> current status and to set the +desired mode. For example::
>>>>>>  + +        echo H > 
>>>>>> /sys/devices/platform/thinkpad_acpi/dytc_perfmode + echo M
>>>>>>> /sys/devices/platform/thinkpad_acpi/dytc_perfmode + echo
>>>>>> L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode +
>>>>> 
>>>>> I was thinking about this some more, do you actually want 
>>>>> another mode that "disables" this feature?   IE "O" turns it
>>>>>  off an calls DYTC_DISABLE_CQL.
>>>>> 
>>>>> For example if a user wanted to test the recently landed code
>>>>> in thermald 2.3 and compare performance between the two it
>>>>> seems like this and that "might" fight. As an outsider 
>>>>> looking in - I of course may be wrong too here.
>>>>> 
>>>>> If at some point in the future thermald does a better job 
>>>>> than this implementation you might also want an "out" to let
>>>>>  thermald or another piece of userland turn this off if it's
>>>>>  in the picture.
>>>>> 
>>>> I'm still digging into this one. Right now I haven't found a 
>>>> good clean way of just disabling the firmware. Currently when 
>>>> thermald goes in and tweaks the CPU power registers it has the
>>>>  effect of overriding the FW anyway - but I appreciate that's 
>>>> not quite the same as actually doing it explicitly.
>>>> 
>>> 
>>> What about a modprobe parameter to disable at least?  That would
>>>  at least make it pretty easy to make a change, reboot and 
>>> compare with thermald (or other software) without disabling the 
>>> rest of the functionality of the thinkpad_acpi driver.
>>> 
>> The problem is I don't have a good way to disable the firmware 
>> (that I know of yet) so a modprobe parameter wouldn't really do 
>> much. I guess it could skip providing the sysfs entry points - but
>>  the FW will still be there doing it's thing, so I'm not sure I see
>>  the benefit of that. At least the sysfs entry point gives a bit 
>> more insight into what is going on. Let me know if I'm missing 
>> something obvious.
>> 
> 
> Oh so it's not actually the driver loading tells the firmware it's 
> supposed to work this way.  The firmware actually detects "I'm 
> running on Linux, so I'll do this differently"?
> 
Right. This patch is just providing a more friendly interface so user 
space can see what is going on and be able to do control of the 
different modes without the need for hotkeys.

Afraid I don't have much insight into the nitty gritty details of 
exactly how that works - I believe it's related to detecting the use of 
DPTF but the details aren't shared with me because of NDA's. As a 
thought it's quite possible (probable?) that if thermald is using DPTF 
the firmware will automatically disable itself. Proving that might be 
tricky - I'll see if the firmware team have any ideas.

Mark
