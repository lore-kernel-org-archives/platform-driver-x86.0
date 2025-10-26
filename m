Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837585C96
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761500671; cv=none; b=ihsyVGFj/6KbZWXNEMwMHYHxQcApc5akt5mwCs+ZXgShQP7VKB313mJcPrIQJTivhJbvbOGjBfFLoSvcg8Y2wqqXCNOLSmt7tGgAm2qu8ZtkvaTdOvDDsK/eOBaT9Q2Y7Rna9KFaQEK7odrqMO/hkI0IsZGnezC5cDrGkiqFbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761500671; c=relaxed/simple;
	bh=Fr2yYU0eXlXpfb8Q7mUd0Jj7dy5WARRNOmcfBfV8mBM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JZqe1BY1mcW+ILUH8us9M6f4y1zT6SFBXQE61MfQsoKpcuwWZlLJDJqICCwikOYX3ecu1I1xqu7vv/47b/ryOXQCTran+CSDCOXXtHiJ1OqxS0MIBDHGxdKfW8PU36G27z/KicVTmENvJL35H+eNqIYpol+UHq64y3QFG/2hGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPQ7Okjr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPQ7Okjr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1FCC4CEE7;
	Sun, 26 Oct 2025 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761500671;
	bh=Fr2yYU0eXlXpfb8Q7mUd0Jj7dy5WARRNOmcfBfV8mBM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=mPQ7Okjr2k/oYM9muSnsSzg4s126/TtlRLwV6KVh4MjLIi44Zde1Iq18atUfhkcO8
	 PN+1lkpP/b52/zG4+CHKmktfaErT7XLtU5+hQM5tRYSDbIySv4f2p5Ue4DOcX7D9u/
	 WIKZ+TtHP3LT3nhBz0hBQNhi4FujBcxdRZaaxNya16OSc8O6rcYYDFEqexySna+PLZ
	 Z7zSI7UB/xknWbGBzOqHfki8VPshri/DJ0aQmPzxJSCJaWjfJCFXd9OmjpISJwR+wL
	 fNY7hQGAg4I/cw9MHrOTiatnrnW0AmL+6/jTLRTB/dgdRBbnWsGYiztR+nBdlMnK2a
	 sQdoBV7YReWTg==
Message-ID: <c6f2002f-abc4-4d63-a143-1c3e466cbeff@kernel.org>
Date: Sun, 26 Oct 2025 12:44:29 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Lars Francke <lars.francke@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
Content-Language: en-US
In-Reply-To: <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/26/25 12:40 PM, Mario Limonciello wrote:
> 
> 
> On 10/26/25 11:49 AM, Shyam Sundar S K wrote:
>> + Mario
>>
>> On 10/26/2025 22:16, Lars Francke wrote:
>>> Hi,
>>>
>>> thank you Mario for the super quick response.
>>> It arrived so fast I missed it.
>>>
>>> On Sun, Oct 26, 2025 at 3:17 PM Shyam Sundar S K
>>> <Shyam-sundar.S-k@amd.com> wrote:
>>>>> After resuming from hibernation I get this log line once a second:
>>>>>    amd-pmf AMDI0105:00: TEE enact cmd failed. err: ffff000e, ret:0
>>>>
>>>> Can you please share full dmesg log? Perhaps with both ccp and amd_tee
>>>> drivers enabled with dynamic debug.
>>>
>>> I have (with AI help, but reviewed manually) created a shell script to
>>> collect the necessary information. I have attached the full dmesg file
>>> to this mail but am not sure if that is proper etiquette here?
>>>
>>> I put up the script & more debug information in a dedicated
>>> repository: https://github.com/lfrancke/amd-pmf-hibernate/tree/main
>>>
>>>>> Right after hibernation and before the first of those errors I get:
>>>>>    ccp 0000:c3:00.2: tee: command 0x5 timed out, disabling PSP
>>>>>
> 
> This comes from tee_wait_cmd_completion().  Looking at the suspend/ 
> resume handling code from ccp.ko, I notice that we don't actually have 
> any special handling for the TEE ring for S4.  Normally that ring is 
> initialized at bootup (by sending PSP_CMD_TEE_RING_INIT to PSP).
> 
> During the S4 resume flow I don't expect that this has happened and is 
> needed explicitly in the restore() call.
> 
> Can you try this attached patch which inserts that flow to see if it helps?
> 
> Note mostly to myself: I need to double check flows but I think restore 
> also needs a pm_hibernate_is_recovering() check in this case too if this 
> works.
> 
>>>>> On boot it looks good:
>>>>>    ccp 0000:c3:00.2: psp enabled
>>>>
>>>> Do you see this message after hibernation exit?
>>>
>>> Yes. On a fresh boot it works without issues but after the first
>>> hibernate I get these.
>>>
>>>
>>>>> Commit 11e298f3548a6fe5e6ad78f811abfba15e6ebbc1 from 2024 has
>>>>> more or less exactly my error message but it doesn't seem
>>>>> to be fixed for this case.
>>>>> https://lore.kernel.org/all/20240216064112.962582-2-Shyam-sundar.S- 
>>>>> k@amd.com/
>>>>
>>>> This was a case fixed for S2Idle cases, but I seem to understand that
>>>> you are attempting hibernate here, right?
>>>
>>> Correct. I use hibernate.
>>>
>>> The issue I'm really trying to debug is a separate one (I'll report
>>> separately): Hibernate doesn't reliably turn off the laptop. Image is
>>> being written successfully but I have to press the power button for
>>> 4s.
> 
> Potential theory on root cause is that it's the same regression reported 
> here [1].
> 
> If so the root cause is [2], and the fix is [3].
> 
> Link:
> https://lore.kernel.org/linux-pm/a2563b83-e5d7-4d02- 
> a317-54d51e718d32@kernel.org/T/ 
> #m19966ea259837e4b02c6d0a55d67acfe15fc64ae [1]
> Link: https://git.kernel.org/torvalds/c/469d80a3712c6  [2]

Sorry - minor correction.  Root cause is [4].
> Link: https://lore.kernel.org/linux-pm/20251026033115.436448-1- 
> superm1@kernel.org/ [3]

Link: https://git.kernel.org/torvalds/c/449c9c02537a [4]
