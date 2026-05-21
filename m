Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C517B43F
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779399994; cv=none; b=UfYj+rpWmHM/3qjq/06imuo5/GsLKoKoWHmEzle5wLgH8fJCmUgi733qNBIx08dBNXiUyEY4cuNF4OOyi6PVEjJnAa6Mn4gry6W1P0NRaN1FunozlSxyMmgIHSCC3x0C3i1gmR0kQ+Mbn7UfrAQN7tkmseoZS6xVEkd3rxR36a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779399994; c=relaxed/simple;
	bh=gBG5OodVmJOhRAnczfEnpCGVmd385S56c7MZEpBbPyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WS0qPSsWVP1NzNiraKi2jyH0pv+3VVUYnipbhs8rEnskE4GaOUtgg8ZuKjUjnnjmtNYzrcf9KuyZMGLKImAHTVNV/VmnDDJmCn2ytJcCuScQ/vkdlkpQxdOTwzqP0apERFpUTgiQqUdo4i54ZFuphom2sZuJPAO46Ug5u880NRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=Hu+N7yco; arc=none smtp.client-ip=185.125.25.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="Hu+N7yco"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gM0TW0svVzSDl;
	Thu, 21 May 2026 22:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1779395566;
	bh=Proekrv2gGIRl0a20lk9n0VBYZdJa5j8D/8EuIA7XW4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Hu+N7ycoO9hVMHRxSIWHWInNFOvOUI1P2rBHadDgab5nYQfsJ4WNNHsVPVBV28UWa
	 K5l1ipSahvj3WIjJwjRdaF9BFoQxDiw480V+d3En1QwduNXfa4U0+w8Qt1RBGzmHjQ
	 nI4CYTFglzWukmhK3XAIX6u9DEbPOFME7zh1SOefAHUpFZu7C9I1O12YbROJ9iTxIo
	 VyorWGH1SMMWaKb8ZgBt02codRmcHsLCmH329R1CG2AxhPRPNPtn//IyVC/N5m7Qk0
	 yUjEX8M5ERcsGO5W7heE2EMyWXpmONf7UYCeDy3VeAIrgNg4KIE7/c01SC2RxwHfg9
	 /Z0wDB3vdT03g==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gM0TV0m5kzcZv;
	Thu, 21 May 2026 22:32:46 +0200 (CEST)
Message-ID: <7eb87251-5330-4449-bdd1-051e019d277f@gibson.sh>
Date: Thu, 21 May 2026 22:32:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] amd_pmc: Delay s2idle suspend for some devices
To: Mario Limonciello <superm1@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512202645.1549111-1-daniel@gibson.sh>
 <76150f44-1f08-49c4-b4e8-b37ee143911a@kernel.org>
 <af087465-2487-46dd-bd19-ba6b0790b2f0@gibson.sh>
 <d7193b2f-6690-4938-9fbc-401b2ba2e1c0@kernel.org>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <d7193b2f-6690-4938-9fbc-401b2ba2e1c0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 21.05.26 21:43, Mario Limonciello wrote:
> On 5/21/26 14:13, Daniel Gibson wrote:
>> On 21.05.26 16:44, Mario Limonciello wrote:
>>> On 5/12/26 15:26, Daniel Gibson wrote:
>>>> On some AMD Zen3 and Zen3+-based Lenovo IdeaPad laptops the keyboard
>>>> and
>>>> the lid switch stop working after the first suspend, until rebooted.
>>>>
>>>> More specifically, they stop sending events when pressing a key or
>>>> closing the lid - it's still possible to toggle the capslock- and
>>>> numlock-LEDs with an external keyboard or read the lid state at
>>>> /proc/acpi/button/lid/LID/state.
>>>>
>>>> See also https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>>
>>>>
>>>>    Documentation/arch/x86/amd-debugging.rst  | 30 ++++++++++++
>>>>    drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++++++
>>>>    drivers/platform/x86/amd/pmc/pmc.c        | 60 ++++++++++++++++++
>>>> +++--
>>>>    drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>>>    4 files changed, 127 insertions(+), 3 deletions(-)
>>>>
>>>
>>> Can you see if this series helps your issue instead of quirks?
>>>
>>> https://lore.kernel.org/linux-acpi/5996185.DvuYhMxLoT@rafael.j.wysocki/
>>
>> I tried and it did not help with the issue.
>>
> 
> OK thanks for trying, figured it was worth a shot.

Of course :)

> 
>> By the way, applying it was a PITA: I downloaded the mbox.gz from
>> lore.kernel.org, but it contained the threads messages in reverse, so
>> git am tried to apply them in reverse order, which of course didn't work
>> very well.. eventually I used `git am -i` to apply one at a time.
>>
>> Is that normal or a lore.kernel.org bug or did I do something wrong?
>>
> 
> Try using 'b4 shazam' or 'b4 am' next time.  You basically feed a lore
> URL as an argument and it does the rest.

Thanks for the suggestion, that sounds like just what I needed :)

BTW, could you take a look at my documentation changes in the main
thread when you have some spare minutes?
Thanks in advance!
