From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 14/19] sony-laptop: fix handling sony_nc_hotkeys_decode
 result
Date: Mon, 05 Oct 2015 09:42:53 +0200
Message-ID: <561229FD.9010308@samsung.com>
References: <1443103227-25612-1-git-send-email-a.hajda@samsung.com>
 <1443103227-25612-15-git-send-email-a.hajda@samsung.com>
 <20151003163932.GB110874@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61438 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751948AbbJEHni (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 Oct 2015 03:43:38 -0400
In-reply-to: <20151003163932.GB110874@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

On 10/03/2015 06:39 PM, Darren Hart wrote:
> On Thu, Sep 24, 2015 at 04:00:22PM +0200, Andrzej Hajda wrote:
>> The function can return negative value.
>>
>> The problem has been detected using proposed semantic patch
>> scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].
>>
>> [1]: http://permalink.gmane.org/gmane.linux.kernel/2046107
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Sorry for the delay Andrsej, and thank you for your patch. Given my delay, I've
> made a couple of changes myself rather than asking you to resubmit. Please
> review and let me know if you have any concerns.

Looks OK. Thanks for fixing.

Regards
Andrzej

>
> First, The description above is incomplete and relies on context from the URL
> to fully explain the problem you are fixing. In the future, please ensure the
> commit message is self-sufficient.
>
> I have changed the message to read:
>
>     sony-laptop: Fix handling sony_nc_hotkeys_decode result
>
>     sony_nv_hotkeys_decode can return a negative value. real_ev is a u32 variable.
>     The check for real_ev > 0 is incorrect.
>
>     Use an intermediate ret variable.
>
>     The problem has been detected using proposed semantic patch
>     scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].
>
>     [1]: http://permalink.gmane.org/gmane.linux.kernel/2046107
>
>     Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>     [dvhart: clarify commit msg, drop superfluous else block]
>     Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>
> See below for an additional change.
>
>> ---
>> Hi,
>>
>> To avoid problems with too many mail recipients I have sent whole
>> patchset only to LKML. Anyway patches have no dependencies.
>>
>> Regards
>> Andrzej
>> ---
>>  drivers/platform/x86/sony-laptop.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
>> index aeb80d1..d8a2115 100644
>> --- a/drivers/platform/x86/sony-laptop.c
>> +++ b/drivers/platform/x86/sony-laptop.c
>> @@ -1204,6 +1204,8 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
>>  {
>>  	u32 real_ev = event;
>>  	u8 ev_type = 0;
>> +	int ret;
>> +
>>  	dprintk("sony_nc_notify, event: 0x%.2x\n", event);
>>  
>>  	if (event >= 0x90) {
>> @@ -1225,13 +1227,15 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
>>  		case 0x0100:
>>  		case 0x0127:
>>  			ev_type = HOTKEY;
>> -			real_ev = sony_nc_hotkeys_decode(event, handle);
>> +			ret = sony_nc_hotkeys_decode(event, handle);
>>  
>> -			if (real_ev > 0)
>> -				sony_laptop_report_input_event(real_ev);
>> -			else
>> +			if (ret > 0) {
>> +				sony_laptop_report_input_event(ret);
>> +				real_ev = ret;
>> +			} else {
>>  				/* restore the original event for reporting */
>>  				real_ev = event;
>> +			}
> This 4 line else block is superfluous. real_ev is initialized to event and only changed here if ret > 0. Therefore, there is no need to set real_ev to event again. I have simply dropped the else block
>
