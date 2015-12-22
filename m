From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] ideapad: Report hard block off if it is never on
Date: Tue, 22 Dec 2015 11:33:32 +0800
Message-ID: <5678C48C.7060604@canonical.com>
References: <1450237773-1685-1-git-send-email-ike.pan@canonical.com>
 <20151218225653.GD15346@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33386 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944AbbLVDdl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Dec 2015 22:33:41 -0500
In-Reply-To: <20151218225653.GD15346@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, David Woodhouse <dwmw2@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/19/2015 06:56 AM, Darren Hart wrote:
> On Wed, Dec 16, 2015 at 11:49:33AM +0800, Ike Panhc wrote:
> 
> Hi Ike,
> 
> +David Woodhouse (MODULE_AUTHOR)
> 
>> Hardware radio switch is rare on recently ideapad and some of them
>> reported radio hardware blocked by error. With more and more ideapads
>> available in market to maintain the dmi table becomes a
>> never-finished job.
> 
> Indeed, inverting this logic or eliminating it would be an improvement.
> 
> To be clear, the only platforms which need to be listed in the DMI table are
> those without a hw radio switch AND which will report hw_blocked when the ACPI
> VPCCMD_R_RF call is made (instead of always returning 0 as they should)?
> 
> As such, the DMI list is a list of laptops with buggy firmware - correct?
> 
>> Therefore I am thinking an easy way to detect by response from
>> hardware. This patch will make driver says hardware switch is not
>> blocked if the response from ACPI is always radio blocked.
>>
>> For an ideapad without radio switch, no matter what ACPI says, driver
>> will report false on hardware blocked.
>>
>> For an ideapad with radio switch, if driver loaded with radio on, no
>> behavior is changed.
>>
>> For an ideapad with radio switch and driver loaded with radio off,
>> driver will report unblocked falsely and network manager might not
>> scan if wireless driver reports blocked. Once the switch is on,
>> driver will report correct information.
> 
> 
> This would be a regression for existing platforms though.
> 
> Do we have the ASL for some of the offending models compared with the good ones
> so we can inspect and look for a deterministic detection mechanism?

Thanks for the suggestion. It makes sense to me.

Unfortunately I do not have one yet. Let me ask for acpidump for them.

> 
> 
>>
>> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
>> ---
>>  drivers/platform/x86/ideapad-laptop.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index a313dfc..91ccb4e 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -482,11 +482,16 @@ static void ideapad_sync_rfk_state(struct ideapad_private *priv)
>>  {
>>  	unsigned long hw_blocked = 0;
>>  	int i;
>> +	static int hw_unblock_once;
>>  
>>  	if (priv->has_hw_rfkill_switch) {
>>  		if (read_ec_data(priv->adev->handle, VPCCMD_R_RF, &hw_blocked))
>>  			return;
>> +		if (hw_blocked)
>> +			hw_unblock_once = 1;
>>  		hw_blocked = !hw_blocked;
>> +		if (!hw_unblock_once)
>> +			hw_blocked = 0;
>>  	}
>>  
>>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>> -- 
>> 1.9.1
>>
>>
> 
