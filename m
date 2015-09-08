From: Kyle Evans <kvans32@gmail.com>
Subject: Re: [PATCH] hp-wmi: limit hotkey enable
Date: Tue, 08 Sep 2015 10:58:47 -0500
Message-ID: <55EF05B7.2020206@gmail.com>
References: <1438959360-20901-1-git-send-email-kvans32@gmail.com> <20150828184228.GA64484@vmdeb7> <55E1CF30.10501@gmail.com> <20150906180339.GC90062@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35055 "EHLO
	mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755405AbbIHP6u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Sep 2015 11:58:50 -0400
Received: by ioiz6 with SMTP id z6so123231386ioi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2015 08:58:49 -0700 (PDT)
In-Reply-To: <20150906180339.GC90062@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

On 09/06/2015 01:03 PM, Darren Hart wrote:
> On Sat, Aug 29, 2015 at 10:26:40AM -0500, Kyle Evans wrote:
>> On 08/28/2015 01:42 PM, Darren Hart wrote:
>>> On Fri, Aug 07, 2015 at 09:56:00AM -0500, Kyle Evans wrote:
>>>> Do not attempt to initialize hotkeys if the query returns a value.
>>>> Furthermore, do not write initialize magic on systems that do not have
>>>> feature query 0xb. Fixes Bug #82451.
>>>>
>>>> Signed-off-by: Kyle Evans <kvans32@gmail.com>
>>>
>>> Hi Kyle,
>>>
>>> Please always include the maintainer from MAINTAINERS on Cc when submitting
>>> kernel patches. See Documentation/SubmittingPatches.
>>>
>>> For example:
>>>
>>> $ scripts/get_maintainer.pl -f drivers/platform/x86/hp-wmi.c
>>> Darren Hart <dvhart@infradead.org> (maintainer:X86 PLATFORM DRIVERS)
>>> platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
>>> linux-kernel@vger.kernel.org (open list)
>>>
>>> This will ensure a more timely response.
>>>
>>>> ---
>>>>   drivers/platform/x86/hp-wmi.c | 17 +++++++++++++----
>>>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>>>> index 0669731..557650f 100644
>>>> --- a/drivers/platform/x86/hp-wmi.c
>>>> +++ b/drivers/platform/x86/hp-wmi.c
>>>> @@ -54,6 +54,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>>>>   #define HPWMI_HARDWARE_QUERY 0x4
>>>>   #define HPWMI_WIRELESS_QUERY 0x5
>>>>   #define HPWMI_BIOS_QUERY 0x9
>>>> +#define HPWMI_FEATURE2_QUERY 0xb
>>>>   #define HPWMI_HOTKEY_QUERY 0xc
>>>>   #define HPWMI_FEATURE_QUERY 0xd
>>>>   #define HPWMI_WIRELESS2_QUERY 0x1b
>>>> @@ -309,10 +310,18 @@ static int __init hp_wmi_bios_2009_later(void)
>>>>   static int hp_wmi_enable_hotkeys(void)
>>>>   {
>>>>   	int ret;
>>>> -	int query = 0x6e;
>>>> +	int query = 0xff;
>>>> +	int value = 0x6e;
>>>>
>>>> -	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
>>>> -				   0);
>>>> +	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 0, &query,
>>>> +				   0, sizeof(query));
>>>> +
>>>> +	if (!query) {
>>>
>>> I suspect this should come after the test for ret. If there is a more
>>> fundamental error, it would make sense to exit with -EINVAL first. Despite query
>>> being initialized to 0xff, we have no guarantee the firmware won't set it to 0
>>> and still return an error.
>>
>> That makes sense. Another sticky bit is, do we want to fail on a device that
>> doesn't need this? Not really.
>>
>> How about I throw out the initial read, because, the test for FEATURE2_QUERY
>> is the bit that actually fixes the bug. The read is just fearful bug
>> prevention. How is this?
>>
>> @@ -309,10 +310,13 @@ static int __init hp_wmi_bios_2009_later(void)
>>   static int hp_wmi_enable_hotkeys(void)
>>   {
>>   	int ret;
>> -	int query = 0x6e;
>> +	int query;
>> +	int value = 0x6e;
>
> "Reverse Christmas Tree" ordering please (longest to shortest, and it's OK to
> group like types:
>
> int value = 0x6e;
> int query;
> int ret;
>
> It's also fine to group like types, preferred by some maintainers, I'm not
> particular, but do appreciate consistency.
>
> int value = 0x6e;
> int query, ret;
>
> Both are acceptable.
>
> Is there a reason 0x6e doesn't merit some kind of a HP_WMI_QUERY_XYZ define?
>

Probably not. 0x6e is a magic value that goes into a magic EC register, 
0xe6. There are a small handful of laptop models that need this value 
for hotkeys to work. I think these all came out in the 2008 time frame. 
Models after that period seem to have a different values, but as far as 
I know, the value is present at boot and the hotkeys just work. I've not 
heard of anyone else having a broken laptop and needing to write a 
different value. If one crops up then that is something that should be 
done, but it does not fit into the context of any existing enum.

>>
>> -	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
>> -				   0);
>> +	if (!hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &query,
>> +				  0, sizeof(query)))
>> +		ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
>> +					   sizeof(value), 0);
>>
>>   	if (ret)
>>   		return -EINVAL;
>
> The problem with this is it doesn't distinguish between the feature not being
> present, and an actual failure, since it doesn't capture the ret of
> FEATURE2_QUERY.
>
> Consider the possible return values for FEATURE2_QUERY on devices with the
> feature and devices without, does the above code do the right thing in all
> cases?
>

My line of thinking was that if the feature query fails for any reason 
then we probably don't want to perform the write. But I do understand 
building code for future use. How about I break that query out into it's 
own function like the 2009_later query. I'm not sure what it should be 
called because I'm not sure what it's actually for or when it actually 
appeared, but how about hp_wmi_bios_2008_later?

>
>>
>>
>>>
>>> Rafael, would you agree?
>>>
>>> And technically, EINVAL isn't the right error for a general error (but that's a
>>> preexisting problem). You don't have to fix that to get this in.
>>>
>>>
>>>> +		if (!hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &query,
>>>> +					  0, sizeof(query)))
>>>> +		    ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
>>>
>>> Careful with indentation, use tabs please. checkpatch.pl would have caught this.
>>>
>>>
>>>> +					       sizeof(value), 0);
>>>> +	}
>>>>
>>>>   	if (ret)
>>>>   		return -EINVAL;
>>>> @@ -663,7 +672,7 @@ static int __init hp_wmi_input_setup(void)
>>>>   			    hp_wmi_tablet_state());
>>>>   	input_sync(hp_wmi_input_dev);
>>>>
>>>> -	if (hp_wmi_bios_2009_later() == 4)
>>>> +	if (hp_wmi_bios_2009_later() == HPWMI_RET_UNKNOWN_CMDTYPE)
>>>>   		hp_wmi_enable_hotkeys();
>>>
>>> This bit is fine, but no magic number cleanup is mentioned in the change log.
>>> Was this change intentional?
>>
>> It was intentional but I didn't think it was worth a patch request. I had
>> forgot that I made the change when creating a new patch and was on the fence
>> about what to do about it so I didn't do anything. I'll be sure to call out
>> that sort of thing in the future.
>
> Right, rolling it together with a semi-related change is OK for things like in
> my opinion. But do make note of it in the changelog.
>
