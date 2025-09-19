Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B671F152D;
	Fri, 19 Sep 2025 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285710; cv=none; b=SICi8NrVJNbT2Da5IEMUbOlls6f+ntjyLX1gD7mNAh1SWdIYNsE9nFmKQAPfbZZmZ5oEXXt6s6DKmMJm8iH4hsEnB9apNENC1F1JzUAwPZfPL56L9qzLk5XDcEB+Z9sT0aCyyv8GLyTWTxjfwgq3K704DyHTBiTOUzGj2wSzl6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285710; c=relaxed/simple;
	bh=ym/RfpWNBn+UdG/UgOcvrNKigukIM8ROQPUFBxabl/Y=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gEO/GHaQbnt3ZxC6GdhL2EdbOvVm9x3gEGyNSJR0m97wkASlrzHe8afiAT/DehYiwmvLR3Zdm0wDQPG+89LtBPbJyaOVFe3Zjh0ouJhOOrH+k1afjqCj2wdTwdLc6bPfiYttMWS1HeWvXxB0QJQxcmfq+JqQkUZISo9eGKuUF2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tuxedo.de; spf=pass smtp.mailfrom=tuxedo.de; dkim=pass (2048-bit key) header.d=tuxedo.de header.i=@tuxedo.de header.b=R+TQUbkj; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tuxedo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxedo.de header.i=@tuxedo.de header.b="R+TQUbkj"
Received: from mail.tuxedocomputers.com (localhost [IPv6:::1])
	(Authenticated sender: cs@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1B11B2FC0047;
	Fri, 19 Sep 2025 14:32:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedo.de; s=default;
	t=1758285141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Fgn+3u0TJ4mDZHVB6HQOPaIDla7NrygN6gCBI9CxgY=;
	b=R+TQUbkjBajQAsMtOK+KXmXa4mjqWW2xjiNYDxXqmkVXZAAXdjsu1vkHNQLo8Glj0WtJEt
	Y2d0sTtCFPgu09u28iFj/Wy8MwLWr9IHLa6RjVelcj3ev7kClct5FqEv4/fxrlXXZ+/eKU
	vNejPs0QZ5lfrKTOia27WFgncKLFGmjOhk3t/euB6wRtZlscASXrlwYctoZhNmgyCGf8ce
	IsphOP5TM0boqs/thNS6KNRMz7Vbc8uXSh4RqxO2KPnKY8B+Kxeb2kWQEfZMp3pWW991An
	rGv7Bx574LyaqNhgPV0B43xHBHlEQDMv4Drdn96FSQ4y/dZ9iYbTNjhM6hIfbg==
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 14:32:21 +0200
From: Christoffer Sandberg <cs@tuxedo.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd/pmc: Add Stellaris Slim Gen6 AMD to
 spurious 8042 quirks list
In-Reply-To: <5f33c919-571b-45b7-b2bb-c755b4195035@kernel.org>
References: <20250901164216.46740-1-wse@tuxedocomputers.com>
 <3830aeee-91d7-48ee-b67e-8aefbbd2124e@kernel.org>
 <c154022c-c00d-46ba-86fb-2030ccab0272@tuxedocomputers.com>
 <5f33c919-571b-45b7-b2bb-c755b4195035@kernel.org>
Message-ID: <d4c1b3f882ce2f4522c716c681bbaf7c@tuxedo.de>
X-Sender: cs@tuxedo.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2.9.2025 17:25, Mario Limonciello wrote:
> On 9/2/2025 9:37 AM, Werner Sembach wrote:
>> 
>> Am 02.09.25 um 16:15 schrieb Mario Limonciello:
>>> On 9/1/2025 11:42 AM, Werner Sembach wrote:
>>>> From: Christoffer Sandberg <cs@tuxedo.de>
>>>> 
>>>> Prevents instant wakeup ~1s after suspend
>>>> 
>>>> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>> 
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/ 
>>>> platform/x86/amd/pmc/pmc-quirks.c
>>>> index 7ffc659b27944..8b8944483b859 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>>> @@ -248,6 +248,13 @@ static const struct dmi_system_id fwbug_list[] 
>>>> = {
>>>>               DMI_MATCH(DMI_PRODUCT_NAME, "Lafite Pro V 14M"),
>>>>           }
>>>>       },
>>>> +    {
>>>> +        .ident = "TUXEDO Stellaris Slim 15 AMD Gen6",
>>>> +        .driver_data = &quirk_spurious_8042,
>>>> +        .matches = {
>>>> +            DMI_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>>>> +        }
>>>> +    },
>>>>       {}
>>>>   };
>>> 
>>> FYI - this seems to conflict with other changes on review-ilpo-fixes 
>>> and fixes branches.
>>> 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform- 
>>> drivers-x86.git/commit/drivers/platform/x86/amd/pmc/pmc-quirks.c? 
>>> h=review-ilpo-fixes&id=c96f86217bb28e019403bb8f59eacd8ad5a7ad1a
>> Sorry, i will rebase and send a v2.
>>> 
>>> Also - a few other comments.
>>> 
>>> 1) Do you have line of sight to a firmware (BIOS or EC) fix?  If so; 
>>> it would be better to specify a specific firmware release that is 
>>> affected.
>> 
>> No
>> 
>> @Christoffer you have more knowledge of how realistic it is to get 
>> this fixed by the odm?
> 
> OK, even if you don't get a solution in the firmware in this
> generation it's good to understand this issue and root cause it so
> that you can have it fixed properly next generation.
> 
> It's not always realistic but ideally bringing a new product to market
> shouldn't require a quirk.
> 

Agreed, would of course rather fix it in firmware when it's a firmware 
problem. Sometimes, like the case for the previous patch (for 
InfinityBook Pro Gen10) it was unfortunately not possible to locate and 
solve in time. Was even briefly thought to be fixed before launch 
because issue disappeared (in that configuration).

Another curiosity, this second quirk entry (for the Stellaris Slim Gen6) 
is actually for previous generation. The issue didn't surface until a 
major kernel jump. Initially thought to be a regression, however, 
bisecting ended up in kernels where the issue happened seeming randomly 
every ~2-3 suspend/resume cycle. Therefore currently thought to be a 
system configuration dependent race condition whether issue triggers or 
not.

>> 
>> But even then, we still don't have fwupd support to get the fw update 
>> out easily
>> 
> 
> 😢
> 
>>> 
>>> 2) Shouldn't you also have DMI_SYS_VENDOR or some other matching keys 
>>> else set?  Or is it really all these boards with this specific name?
>> 
>> I was following the style of the i8042 quirk list where we also always 
>> only did boardnames
>> 
>> Ofc we only tested the boards the odm has sent to us
>> 
>> best regards,
>> 
>> Werner Sembach
>> 
> 
> But this isn't a hardware problem with the board itself, it's a
> firmware problem.  The board ID you're using is just a convenient
> proxy for it.
> 

Firmware is what we're suspecting as well.

Small update, according to latest info, a write from Linux, on port 60, 
supposedly triggers the interrupt. However, so far I have only seen a 
keyboard reset that is done before suspend and that does not seem to be 
it.

> I've seen the debugging for a few issues like this and it can be all
> across the board.  A few examples:
> 
> * polarity issues
> * debounce issues
> * incorrectly set PCD (Kinda like a Kconfig for BIOS)


Thanks for the ideas, any further insights are of course very welcome.
