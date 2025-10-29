Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD019CCFD
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 03:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761709096; cv=none; b=dSWOHrxdXFXPd0Ru6x2kTuXNMze+NkZ62AS/kO7x1w1LknB4dap4vz7dAWBrpfL3i37BDqSE0qHNmotFl19qqFnfgKDL6h+tZU/UTAPdXxHVlppQrkA6IfTPw0gbAvGDVmyvqpexm1+meLgfP8H1Xo10HT8PXamLRDbDTau2MGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761709096; c=relaxed/simple;
	bh=zawR1yK8pSG50chMHyAKehxoiXWH7rSbgkXJqekof9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9/5keiuxcJNJ9kc77eveQZs/ZIqIj6LJdVlytu3CDcGGiAMQlg7kfCWYXjfqDkFUZpfRoi1jIrlDlhcb3RZsmcRC/Icpx9ZtzDzi97yFWZuKVdviitoAwO0Yq2MvDYes6WU6uVyfrFWOurOMq+VgBCLlrWh2L+Me8NQ9cXGxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSxpR/Ek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSxpR/Ek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8F1C4CEFB;
	Wed, 29 Oct 2025 03:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761709095;
	bh=zawR1yK8pSG50chMHyAKehxoiXWH7rSbgkXJqekof9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WSxpR/EkcmTMf/joHkHnTS2uBbAD5udx07uHs9/KMwhIPIRd2vcOb3JY6MygqxmGS
	 FfMdBHwyxKgmxbXcHGc7sRLdcFIrf2+CwbemJTRhFxFy3/K/3vcfV1QApnuqiL+MOK
	 EJyiNXHToH2yIdD+QdaYIFW7lubHMrInNbSqgxO7SsoPf3+hCUdeJIV+peUdBvld+c
	 UG8h+3dsARzO7AMJCJ5yPizs+C32jllbKWtFqKMzn+1JgMYf7UZZQ1RKSDbsgg/5Ay
	 qF2cW6ZMpI910NTHYsrYmd65epECILvMLV46XFVaiH1kiZJieZyTy0IbGRk6jFqzU9
	 sdzHeo76ZhQ1Q==
Message-ID: <eee498d1-6c12-4988-9a70-1e108848da62@kernel.org>
Date: Tue, 28 Oct 2025 22:38:14 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
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
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <CAD-Ua_gxPsTbG_3shtqAZX_E4ns5hHPZbTszQAXH2jbfLxP_Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/28/2025 6:45 PM, Lars Francke wrote:
> On Tue, Oct 28, 2025 at 6:12 PM Shyam Sundar S K
> <Shyam-sundar.S-k@amd.com> wrote:
> 
>> Can you try the attached patches now?
>>
>> First patch is the same which Mario shared last time and the 2nd one
>> is on PMF to handle the .restore() callback for hibernate.
>>
>> I have tried this on 6.18-rc3 (though this should not matter)
> 
> I just did and I'm afraid that the patches made it even worse for some reason.
> Hibernate works but when rebooting I end up in the console, the cursor
> is blinking but I can't do anything - no keyboard input, nothing. And
> what's even weirder is that after a reboot I have nothing in my
> journal on that boot. Not a single line. I have no idea how to debug
> this behavior, sorry. Usually when my patches broke the system I would
> still get logs. If you have any idea what I can do to debug let me
> know.
> 
> Thanks,
> Lars
> 

FWIW I tested Shyam's PMF + my CCP patch and didn't observe this behavior.

Can you please add this patch and see if it improves things?

https://lore.kernel.org/linux-pm/5935682.DvuYhMxLoT@rafael.j.wysocki/T/#u

