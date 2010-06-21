From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [PATCH] X86: intel_ips, check for kzalloc properly
Date: Mon, 21 Jun 2010 17:33:48 +0200
Message-ID: <4C1F865C.1070707@gmail.com>
References: <1277132531-14242-1-git-send-email-jslaby@suse.cz> <20100621082535.14301a7c@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50377 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932791Ab0FUPdz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Jun 2010 11:33:55 -0400
In-Reply-To: <20100621082535.14301a7c@virtuousgeek.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Jiri Slaby <jslaby@suse.cz>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/21/2010 05:25 PM, Jesse Barnes wrote:
> On Mon, 21 Jun 2010 17:02:11 +0200
> Jiri Slaby <jslaby@suse.cz> wrote:
> 
>> Stanse found that there are two NULL checks missing in ips_monitor. So
>> check their value too and bail out appropriately if the allocation
>> failed.
>>
>> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
>> Cc: Jesse Barnes <jbarnes@virtuousgeek.org>
>> Cc: Matthew Garrett <mjg@redhat.com>
>> ---
>>  drivers/platform/x86/intel_ips.c |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
>> index cdaf40e..3c7ea9a 100644
>> --- a/drivers/platform/x86/intel_ips.c
>> +++ b/drivers/platform/x86/intel_ips.c
>> @@ -931,7 +931,8 @@ static int ips_monitor(void *data)
>>  	mch_samples = kzalloc(sizeof(u16) * IPS_SAMPLE_COUNT, GFP_KERNEL);
>>  	cpu_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
>>  	mchp_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
>> -	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples) {
>> +	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples ||
>> +			!cpu_samples || !mchp_samples) {
>>  		dev_err(&ips->dev->dev,
>>  			"failed to allocate sample array, ips disabled\n");
>>  		kfree(mcp_samples);
> 
> Ah cool, am I also missing the appropriate kfree() calls for the last
> two?  The context doesn't have it.  Otherwise,

I checked when I was patching that and the last is not freed there.
However I didn't add it since at least one must be non-NULL and in this
case it can be only the last. (Until somebody add another allocation
indeed.) So should I add even the last free there?

thanks,
-- 
js
