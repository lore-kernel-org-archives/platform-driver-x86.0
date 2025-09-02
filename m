Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC552DECBF;
	Tue,  2 Sep 2025 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826724; cv=none; b=nz8STClqCIbRGYHyfYWHR65uU9tbZyXm5FfKfIXNDVWktEV060KYGfQNyW3cBTnG3wFwxLqkv++klrPn07xBXuBg4tcGawlQwEAKbagARWTOKs3Xvfd2z5ZqEcakw70PEaoctMG9h0dBDJryKujUE5iO5iLWCJroUgHSkqFNhlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826724; c=relaxed/simple;
	bh=l/nS55o1t/A9e4SaZ6nyh5QjR04WTvooR5oRakfTc+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtvSB+ODDAES7hgJVP+8eTcDfTHWxvFGQ0LakTj94eZxVsSds/A4Xx707d8FrankCCSoZd+azqn6MlgnavujvgK33VsKFt1IujqXwY9R5S138Dt278P61PbpCEySNVlfCcduVKZRE2FA1PBPLQmVw6Giw8f/N5fmHWgJkVLfqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5erzpUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5erzpUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EE8C4CEF5;
	Tue,  2 Sep 2025 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756826723;
	bh=l/nS55o1t/A9e4SaZ6nyh5QjR04WTvooR5oRakfTc+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p5erzpUrIssF2EgMkfCi2998Dqdtqw9bJugMrhWgNbyUvWK39HQJHU7B1c22D/CNf
	 oPySDfoRaSszCd6hwqRPbyNHatGHFcTFQJSOUdGVZX9g7hPJpUBJS5SE40Eor+XUeY
	 5bjoWATTQZ4RqtxGPtL5TQwIKlvmNBdxgN9f/RGKBLMIIRHrsE0sE7BL5aga3LvGz6
	 WX6FiLDcE3VG2gziPqAWMpUH6hyfON1OvxjHIGA1foP5iNwQ5+BY9pxGGAkOaQ0uIJ
	 jRY20mOeLG20gFJwT2LnOe2AKaG+792J7ClaX3hC2Q8N6LkAM+Sk9R5ZCwYEUzTejB
	 6h6n8cfxPc2gw==
Message-ID: <5f33c919-571b-45b7-b2bb-c755b4195035@kernel.org>
Date: Tue, 2 Sep 2025 10:25:20 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Add Stellaris Slim Gen6 AMD to
 spurious 8042 quirks list
To: Werner Sembach <wse@tuxedocomputers.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Christoffer Sandberg <cs@tuxedo.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250901164216.46740-1-wse@tuxedocomputers.com>
 <3830aeee-91d7-48ee-b67e-8aefbbd2124e@kernel.org>
 <c154022c-c00d-46ba-86fb-2030ccab0272@tuxedocomputers.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <c154022c-c00d-46ba-86fb-2030ccab0272@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/2/2025 9:37 AM, Werner Sembach wrote:
> 
> Am 02.09.25 um 16:15 schrieb Mario Limonciello:
>> On 9/1/2025 11:42 AM, Werner Sembach wrote:
>>> From: Christoffer Sandberg <cs@tuxedo.de>
>>>
>>> Prevents instant wakeup ~1s after suspend
>>>
>>> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> ---
>>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/ 
>>> platform/x86/amd/pmc/pmc-quirks.c
>>> index 7ffc659b27944..8b8944483b859 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>> @@ -248,6 +248,13 @@ static const struct dmi_system_id fwbug_list[] = {
>>>               DMI_MATCH(DMI_PRODUCT_NAME, "Lafite Pro V 14M"),
>>>           }
>>>       },
>>> +    {
>>> +        .ident = "TUXEDO Stellaris Slim 15 AMD Gen6",
>>> +        .driver_data = &quirk_spurious_8042,
>>> +        .matches = {
>>> +            DMI_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>>> +        }
>>> +    },
>>>       {}
>>>   };
>>
>> FYI - this seems to conflict with other changes on review-ilpo-fixes 
>> and fixes branches.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform- 
>> drivers-x86.git/commit/drivers/platform/x86/amd/pmc/pmc-quirks.c? 
>> h=review-ilpo-fixes&id=c96f86217bb28e019403bb8f59eacd8ad5a7ad1a
> Sorry, i will rebase and send a v2.
>>
>> Also - a few other comments.
>>
>> 1) Do you have line of sight to a firmware (BIOS or EC) fix?  If so; 
>> it would be better to specify a specific firmware release that is 
>> affected.
> 
> No
> 
> @Christoffer you have more knowledge of how realistic it is to get this 
> fixed by the odm?

OK, even if you don't get a solution in the firmware in this generation 
it's good to understand this issue and root cause it so that you can 
have it fixed properly next generation.

It's not always realistic but ideally bringing a new product to market 
shouldn't require a quirk.

> 
> But even then, we still don't have fwupd support to get the fw update 
> out easily
> 

😢

>>
>> 2) Shouldn't you also have DMI_SYS_VENDOR or some other matching keys 
>> else set?  Or is it really all these boards with this specific name?
> 
> I was following the style of the i8042 quirk list where we also always 
> only did boardnames
> 
> Ofc we only tested the boards the odm has sent to us
> 
> best regards,
> 
> Werner Sembach
> 

But this isn't a hardware problem with the board itself, it's a firmware 
problem.  The board ID you're using is just a convenient proxy for it.

I've seen the debugging for a few issues like this and it can be all 
across the board.  A few examples:

* polarity issues
* debounce issues
* incorrectly set PCD (Kinda like a Kconfig for BIOS)


