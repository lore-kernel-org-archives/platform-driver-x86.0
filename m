Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5E1519AC
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 02:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761531351; cv=none; b=Dgh6EN/7SmAbo8G2kzklNUTN1cOmiW+xJgTLQfBFAT1pudAyUAuaHZPS4aBT4euXI6JZ5jOuYb7svYdRmM1I+EfnZymys2GUPNQRppD6mE+YPMbI7E7ldXBNCL6yo01u6tLavVPMXKk73kATct8Du5qUUopxS4E4KErNfCndQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761531351; c=relaxed/simple;
	bh=YCLOJHesDAP0Ku8ZuzZLMTU/4yLQerGN4LvQEJgSwyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZ034r9YCSJw5ezlW5hjJpw+SiiFK0ogmrniGfUy7mNWvAOhaueXkKvTKPodXY8yttjOMg8Cx7Csd6BRczCrYA5R2X2EL/76CQcWId+wnjIl9V+qn1sII11UZWZ1kl6VG+XF6+dQWxH+e0t0HFCeAcJharj+BSiyHvjF/X+UsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kP7b/+U7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kP7b/+U7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07C7C4CEE7;
	Mon, 27 Oct 2025 02:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761531351;
	bh=YCLOJHesDAP0Ku8ZuzZLMTU/4yLQerGN4LvQEJgSwyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kP7b/+U7RlfJXroSUQD722FsXBdqeS+WYVx+heDiDP98FJ3gqKkzrW1c08Yp7IrZp
	 RRa1nwT2R+dViDTnOLXUpplbkPY59SLKmuuFxGshMRnsmU9AbA3m6LxjkYND7vbVtK
	 fHezmw6K7iFx1pZiTs/3Pq6eybxLJzF+4Ed+BhPC2eqfkktCowWa8e2/8SIuUqSMsr
	 C2q5HHYMqUAYCiEzZ2QRLozsLu2j/31tTRoUzZdkaSeer7KXb/a2PN0N1QGVtFnlGx
	 vnKUw5exOdLgu+9PzhjeyLaWvgI/DR7GOOylapnfasM/bmexQw9kcOFc/JHuNfhSvS
	 lWwd9vS0nEYSQ==
Message-ID: <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
Date: Sun, 26 Oct 2025 21:15:49 -0500
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
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/26/25 6:21 PM, Lars Francke wrote:
> I did try your patch for the TEE enact cmd issue (I have not applied
> the second one yet, I'll try that as well) and I'm sorry to say that
> it didn't help. dmesg looks exactly the same as before as far as I can
> tell.
> 
> I'll triple check if I did everything correctly but I manually
> confirmed that my source tree contains your patch so I'm _fairly_
> certain.
> 
> I did upload the dmesg[1] and more[2] again. Happy to try more patches.
> 
> [1] <https://github.com/lfrancke/amd-pmf-hibernate/blob/main/hibernate-debug-20251027-001557/dmesg-full.log>
> 
> [2] <https://github.com/lfrancke/amd-pmf-hibernate/tree/main/hibernate-debug-20251027-001557>

One way to be sure it's applied is to add a pr_info() message into the 
new function.  Then you'll know exactly when the new function is called 
in the logs.

But assuming that was in place then I feel this will still require some 
other coordination work with the PMF driver then too.
> 
> 
> On Sun, Oct 26, 2025 at 10:16 PM Mario Limonciello <superm1@kernel.org> wrote:
>>
>>
>>
>> On 10/26/25 3:39 PM, Lars Francke wrote:
>>>> Can you try this attached patch which inserts that flow to see if it
>>>> helps?
>>>
>>> I haven't build my own kernel in a good 20 years, I'm on it though.
>>> I've applied it on top of 6.17.5 - is that good or do I need something
>>> newer (6.18 or similar)?
>>>
>>> Thanks!
>>
>> 6.17.5 should be fine.  But I suggest you add both patches.  It would be
>> a nice confirmation if the other patch fixes your power off after
>> hibernate issue.

