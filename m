From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] WMI: fix the incorrect wmi device may be chosen from
 BIOS's notification if multiple wmi devices exist in a system.
Date: Tue, 31 Jul 2012 15:22:41 +0800
Message-ID: <501787C1.10402@canonical.com>
References: <1342662201-29878-1-git-send-email-alex.hung@canonical.com> <20120728041532.GB31064@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:54104 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217Ab2GaHWr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 Jul 2012 03:22:47 -0400
In-Reply-To: <20120728041532.GB31064@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

On 07/28/2012 12:15 PM, Matthew Garrett wrote:
> On Thu, Jul 19, 2012 at 09:43:21AM +0800, Alex Hung wrote:
>
>> +static struct acpi_device *wmi_device;
>
> If a machine exports multiple WMI interfaces then having a static
> acpi_device doesn't make sense here. Instead we probably need the API to
> take some sort of token (maybe just the wmi_device itself as an opaque
> blob) back to the calling driver and then have it use that whenever it
> makes a wmi call. There'd be some fixing up involved, but it should be
> mostly mechanical.

Hi,

In the case I am looking at, there are two cases that wmi.c will not 
find the correct wmi device and interaction with hp-wmi.c will fail as 
below:

acpi_wmi_notify -(1)-> hp_wmi_notify -(2)-> wmi_get_event_data

The first is in acpi_wmi_notify and can be easily fixed by
 >> +		if (device->handle != wblock->handle)
 >> +			continue;

However, the second failure is from hp_wmi_notify() calls 
wmi_get_event_data() and neither function has a direct access to the 
wmi_device.

To replace the static acpi_device with your proposal, I am hoping to 
clarify your solution:

== Calling driver ==

Is it referring to hp-wmi.c in the above case?

It seems that hp-wmi does not have an handler to (hp's) wmi_device, and 
calling wmi_get_event_data() with a wmi_device requires to [1] get it 
from (a new API from) wmi.c, or [2] to add additional input parameter 
(i.e. wmi_device) to hp_wmi_notify().

Is this what you suggested?

== API to take some sort of token ==

Do you mean the API suggested in [1]? It needs communication between 
acpi_wmi_notify and wmi_get_event_data which is what troubles me now... 
(probably because I haven't understand your suggestion)

If it is [2] you are referring, I wanted to make the changes as small as 
possible, but it is worthwhile to check it out. The changes may be 
larger but "mechanical".

If it is neither, could you please share more thoughts and details with me?

>
>>   /*
>>    * GUID parsing functions
>>    */
>> @@ -652,8 +654,9 @@ acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
>>
>>   	list_for_each(p, &wmi_block_list) {
>>   		wblock = list_entry(p, struct wmi_block, list);
>> +		if (wmi_device != NULL && wmi_device->handle != wblock->handle)
>> +			continue;
>>   		gblock = &wblock->gblock;
>> -
>>   		if ((gblock->flags & ACPI_WMI_EVENT) &&
>>   			(gblock->notify_id == event))
>>   			return acpi_evaluate_object(wblock->handle, "_WED",
>> @@ -900,6 +903,10 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
>>   		wblock = list_entry(p, struct wmi_block, list);
>>   		block = &wblock->gblock;
>>
>> +		if (device->handle != wblock->handle)
>> +			continue;
>> +		wmi_device = device;
>> +
>>   		if ((block->flags & ACPI_WMI_EVENT) &&
>>   			(block->notify_id == event)) {
>>   			if (wblock->handler)
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
