From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [External] Re: [PATCH] platform/x86:
 thinkpad_acpi: psensor interface
Date: Fri, 7 Aug 2020 16:40:48 -0400
Message-ID: <3a557230-0815-4fb6-b329-edec177d7147@lenovo.com>
References: <markpearson@lenovo.com>
 <20200715235242.4934-1-markpearson@lenovo.com>
 <CAHp75Vcwg9aEpybYwEFvhYH4gpy7952i+zMs-2TKGPzkzuhO=g@mail.gmail.com>
 <PU1PR03MB2716FE7EF1BF12E5B9EC25188C730@PU1PR03MB2716.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <PU1PR03MB2716FE7EF1BF12E5B9EC25188C730-PIfHAIETUCsWqO6DXxnA3a82SN/2zMuYvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Nitin Joshi1 <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tomoki Maruichi <maruichit-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Sugumaran Lacshiminarayanan <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

First off apologies for my delay in replying and thanks to Nitin for 
covering for me. I took a week of PTO and then suffered the consequences 
of that for the week after - it's taken me a bit to catch-up.


On 7/27/2020 11:51 PM, Nitin Joshi1 wrote:
> Hi Andy ,
> 
>> -----Original Message-----
>> From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Sent: Monday, July 27, 2020 7:35 PM
>> On Thu, Jul 16, 2020 at 2:53 AM Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
>> wrote:
>>>
>>>          case TP_HKEY_EV_PALM_DETECTED:
>>>          case TP_HKEY_EV_PALM_UNDETECTED:
>>> -               /* palm detected hovering the keyboard, forward to user-space
>>> -                * via netlink for consumption */
>>> +               /* palm detected - pass on to event handler */
>>> +               tpacpi_driver_event(hkey);
>>>                  return true;
>>
>> Comment here tells something about the netlink interface to user space.
>> Can you elaborate why we need sysfs now and how it's all supposed to
>> work?
> Using  netlink , we were getting proximity events like '0x60b0' and '0x60b1' but for our WWAN requirement, we need default and current
> p-sensor state too .
> Some tools like "acpi-listen" uses netlink to display events but we need default and current p-sensor state also as per our requirement.
> hence , we have added new sysfs to get current p-sensor state using 'GPSS' method from BIOS .
> This will be used for implementing "Dynamic power reduction" app which is used to control Body SAR value as per FCC requirement .
> When Body or any object is near or away from p-sensor location on thinkpad system , then sysfs will be set .
> 
I think Nitin has covered it. Let us know if any follow on questions or 
concerns here.

>>
>> ...
>>
>>> +static int psensor_get(bool *state)
>>> +{
>>> +       acpi_handle psensor_handle;
>>> +       int output;
>>> +
>>> +       if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS",
>> &psensor_handle)))
>>> +               return -ENODEV;
>>> +
>>> +       if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
>>> +               return -EIO;
>>> +
>>> +       /* Check if sensor has a Psensor */
>>> +       if (!(output & BIT(PSENSOR_PRESENT_BIT)))
>>> +               return -ENODEV;
>>> +
>>> +       /* Return if psensor is set or not */
>>> +       *state = output & BIT(PSENSOR_ON_BIT) ? true : false;
>>> +       return 0;
>>> +}
>>
>> It reminds me of a function you created in one of the previous changes. Can
>> you rather create a parameterized helper which will serve for both?
> 
> Ack , we will check it .
I've been looking at this and I understand where you're coming from but 
the benefits of combining them aren't working for me.

The previous change was for the lapmode sensor which is a separate piece 
of hardware. The ACPI handle and access format is different and the 
lapmode sensor has some extra handling logic needed. The code has enough 
differences too that I don't think combining it makes a lot of sense.

Let me know if I'm missing something obvious or if you disagree.
> 
>>
>> ...
>>
>>> +/* sysfs psensor entry */
>>> +static ssize_t psensor_state_show(struct device *dev,
>>> +                                       struct device_attribute *attr,
>>> +                                       char *buf) {
>>
>>> +       return snprintf(buf, PAGE_SIZE, "%d\n", psensor_state);
>>
>> We know that %d takes much less than PAGE_SIZE, use sprintf().
>>
>>> +}
>>
>>> +
>>
>> No blank line here.
>>
> Ack
> 
>>> +static DEVICE_ATTR_RO(psensor_state);
>>
>> ...
>>
>>> +static struct attribute *psensor_attributes[] = {
>>> +       &dev_attr_psensor_state.attr,
>>
>>> +       NULL,
>>
>> No comma for terminator line(s).
>>
> 
> Ack
> 
>>> +};
>>
>> ...
>>
>>> +       /* If support isn't available (ENODEV) then don't return an error
>>> +        * but just don't create the sysfs group
>>> +        */
>>
>> /*
>> * Consider to use a proper multi-line comment style.
>> * Like here. (It's applicable to the entire patch)  */
>>
>> ...
>>
>>> +       err = sysfs_create_group(&tpacpi_pdev->dev.kobj,
>> &psensor_attr_group);
>>> +       return err;
>>
>> return sysfs...
> Ack
> 
I'll push a patch soon with these other adjustments.

Thanks for the review
Mark
