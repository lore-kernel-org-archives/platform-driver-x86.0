From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] ideapad_laptop: add an event for mic mute hotkey
Date: Wed, 8 Jun 2016 11:26:44 +0800
Message-ID: <57579074.1080303@canonical.com>
References: <1464593208-13190-1-git-send-email-alex.hung@canonical.com>
 <575140DE.1000504@canonical.com> <20160607215404.GB3829@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:54775 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752845AbcFHD0y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2016 23:26:54 -0400
In-Reply-To: <20160607215404.GB3829@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org

On 06/08/2016 05:54 AM, Darren Hart wrote:
> On Fri, Jun 03, 2016 at 04:33:34PM +0800, Ike Panhc wrote:
>> On 05/30/2016 03:26 PM, Alex Hung wrote:
>>> Newer ideapad supports new mic new hotkey, and it is implemented
>>> via ACPI interface.  This patch conver the mic mute event to
>>> a keycode KEY_MICMUTE
>>>
>>> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>>> ---
>>>  drivers/platform/x86/ideapad-laptop.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>>> index 4a23fbc..aa87a42 100644
>>> --- a/drivers/platform/x86/ideapad-laptop.c
>>> +++ b/drivers/platform/x86/ideapad-laptop.c
>>> @@ -567,6 +567,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
>>>  static const struct key_entry ideapad_keymap[] = {
>>>  	{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
>>>  	{ KE_KEY, 7,  { KEY_CAMERA } },
>>> +	{ KE_KEY, 8,  { KEY_MICMUTE } },
>>>  	{ KE_KEY, 11, { KEY_F16 } },
>>>  	{ KE_KEY, 13, { KEY_WLAN } },
>>>  	{ KE_KEY, 16, { KEY_PROG1 } },
>>> @@ -809,6 +810,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>>>  				break;
>>>  			case 13:
>>>  			case 11:
>>> +			case 8:
>>
>> fall through is easier to read
>>
>>> +				ideapad_input_report(priv, vpc_bit);
>>> +				break;
>>
>> so above two lines are not necessary.
> 
> Are you happy with the changes otherwise Ike?
> 
>>
>>>  			case 7:
>>>  			case 6:
>>>  				ideapad_input_report(priv, vpc_bit);
>>>
> 
> Thanks,
> 

Yes. Looks good to me.
