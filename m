Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E6244664
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761831305; cv=none; b=PeE5TpSS4/+FaTdtYu5QIN2DclEpu84OjVicff8K5CJoX2V8XdRGsIkkpdwc4eyWCrGCjATShrpS47x/niilEpYeW7StL3nYCBkSPlVec8sP/AqUDA5PTqztVyaaPj5UhbvNtgfBLKrMRsV3g8TaQx6TFODk2HPHne/PWG9E4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761831305; c=relaxed/simple;
	bh=rR86OGooQPSKr8dJJdfy/QymoaJrH0y/6QWn9MdGupw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjMKtf8o/YfzGQBjZcNO+IWalmf2wvfON1qq8/lZujchHtn8w+OeUylkmDKxiolqY595N8OcXdUSYPAwIfb3rXhCXG2HDceuiX2w2dzOE1bYE8doyGe048m+d6vOXR7ZZLl7bodV4OCWo1vGI5sU/73/YtUhNqG7p6decixXExw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heYbT3qA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heYbT3qA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56995C4CEF1;
	Thu, 30 Oct 2025 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761831304;
	bh=rR86OGooQPSKr8dJJdfy/QymoaJrH0y/6QWn9MdGupw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=heYbT3qAA5sA/t6HkjoO2nIq3anAZpS2H2tlARmOa0lKgTRd2cTNmg0VpFWQCZ1Us
	 96QTl8MyMgyxummgkaCQs86alg66w3drFP9QeXrDpElk+Ca7TsiHhZljllzntfyXZ+
	 +7F9AKJULbYLMXTLCCxTUB82SkvzcYXCYHjF6uVC8DZhdBQd1uji4IhjSdyHu1dZxU
	 7aYsQGYoWv76QxNzk78ggp4ngTn2cY6n+wVRRB9PynzFpCDbSTVyg1p/i9ZjEbuNI5
	 umS+Y9gHeg9UddexiyVIYOp4dF7BvXPnl+HEL/Yr50bSooHMA2R7se/xIp1MDr6/tT
	 fjc9ekCkvUUKA==
Message-ID: <c31b5a46-5dea-48c6-bfe9-b3efc989f0de@kernel.org>
Date: Thu, 30 Oct 2025 08:35:06 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
 <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
 <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org>
 <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
 <089b2cca-4c84-47b0-a96a-0363ffd642d7@amd.com>
 <CAD-Ua_gxPsTbG_3shtqAZX_E4ns5hHPZbTszQAXH2jbfLxP_Rg@mail.gmail.com>
 <eee498d1-6c12-4988-9a70-1e108848da62@kernel.org>
 <CAD-Ua_hX_PYxYUfFDcTv3R4pV0s5ninRSK+-1zxtttMhSPoQtg@mail.gmail.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <CAD-Ua_hX_PYxYUfFDcTv3R4pV0s5ninRSK+-1zxtttMhSPoQtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/29/2025 7:22 PM, Lars Francke wrote:
> On Wed, Oct 29, 2025 at 4:38 AM Mario Limonciello (AMD) (kernel.org)
> <superm1@kernel.org> wrote:
>> On 10/28/2025 6:45 PM, Lars Francke wrote:
>>> On Tue, Oct 28, 2025 at 6:12 PM Shyam Sundar S K
>>> <Shyam-sundar.S-k@amd.com> wrote:
>>>
>>>> Can you try the attached patches now?
>>>>
>>>> First patch is the same which Mario shared last time and the 2nd one
>>>> is on PMF to handle the .restore() callback for hibernate.
>>>>
>>>> I have tried this on 6.18-rc3 (though this should not matter)
>>>
>>> I just did and I'm afraid that the patches made it even worse for some reason.
>>> Hibernate works but when rebooting I end up in the console, the cursor
>>> is blinking but I can't do anything - no keyboard input, nothing. And
>>> what's even weirder is that after a reboot I have nothing in my
>>> journal on that boot. Not a single line. I have no idea how to debug
>>> this behavior, sorry. Usually when my patches broke the system I would
>>> still get logs. If you have any idea what I can do to debug let me
>>> know.
>>>
>>> Thanks,
>>> Lars
>>>
>>
>> FWIW I tested Shyam's PMF + my CCP patch and didn't observe this behavior.
> 
> Thanks. I tested the patches on 6.18-rc3 and I observed the same behavior.
> 
>> Can you please add this patch and see if it improves things?
>>
>> https://lore.kernel.org/linux-pm/5935682.DvuYhMxLoT@rafael.j.wysocki/T/#u
> 
> I tried this as well, didn't change anything.
> I'll try again in a couple of days with various combinations of
> patches just to make sure that I haven't made a mistake.
> 
> Lars

I have a suspicion.  With all those patches added (mine, Rafael's and 
Shyam's) can you please try to hibernate and then after resuming run:

# rmmod amd-pmf

And see if system hangs/reboots in a similar way?
