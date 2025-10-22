Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CD318E20
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Oct 2025 20:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761163752; cv=none; b=Srh//dv4S3hyya4s77Cab42n2KRC2fI7eLE7eu1Ld6T5GdbMUxOffp356pahA4tdXmUJNL4TGUog75C3lUhUs0GdmR6DFOiSV4bhWQxcN4c47bLQQOecdS6ivfSaT1ITGF/3GnBUWO5aszQBmVl6cvKCCjgzK0KEBD1H5lBwpL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761163752; c=relaxed/simple;
	bh=b3Lwfmg2txpuMnGShg6Iy0TD+LdXiurl/sRAYs/QO6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=pTX6BZ5DE/LFJmWhUEaRE/iw7YIugiXfOImALH8AE+VuC805xTEb9LY0XQ5rvREFr2LHBDYG5B7AYFKHgOqe5g+02mJUc5nxGJSQlFxOhxLOiOdshuIP+K52uJGblt7c0kSlmz99h3ZavVjjp0d3i6m1NYUon0sfzK3ttpcjO0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGZOshex; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGZOshex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296D8C4CEF7;
	Wed, 22 Oct 2025 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761163751;
	bh=b3Lwfmg2txpuMnGShg6Iy0TD+LdXiurl/sRAYs/QO6k=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=MGZOshexbySws1lY34DQyTDPKj0dR4Sgk9Dc2vA6buk1iEUQ+xrvzfLjd2SQbc1ev
	 OoY3VX/ukSt9CNL6An+ViupsbZ1SzbUq+A6zUjUy1PMBuvPTKJRNWzAIZdSXyN9laT
	 ZkPY4jTPBxjRASWtpJZaR0SPerUltCUhkZxsBrSeqONdPuQVcR1QH7dDrGICalsbJS
	 bzmGhI+/DE77KTi9B6cG0PdORGFN3Uc8d8yUCycif+Oxde6QiXa3AzbemIrvFVwOPc
	 mo4mS26zLESoIksNRxhSvCLpM/z48GYBFrkhVADauep7KZaiCzAk0QrC8N427s8W8E
	 SuCn664o+zsjg==
Message-ID: <41429892-61f0-4ef4-aaa8-415bf64d0976@kernel.org>
Date: Wed, 22 Oct 2025 15:09:10 -0500
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
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
Content-Language: en-US
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org,
 "Kumar, Rajesh (SW Driver)" <Rajesh1.Kumar@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/25 3:04 PM, Lars Francke wrote:
> Hi,
> 
> while I've been active in the open-source ecosystem for years, this is
> my first report to the kernel. Please be gentle if I made mistakes.
> 
> I'm debugging hibernation & sleep issues with my HP ZBook Ultra G1a.
> It has a AMD RYZEN AI MAX+ PRO 395 w/ Radeon 8060S.
> 
> After resuming from hibernation I get this log line once a second:
>    amd-pmf AMDI0105:00: TEE enact cmd failed. err: ffff000e, ret:0
> 
> Right after hibernation and before the first of those errors I get:
>    ccp 0000:c3:00.2: tee: command 0x5 timed out, disabling PSP
> 
> On boot it looks good:
>    ccp 0000:c3:00.2: psp enabled
> 
> I had to google what TEE, CCP and PSP mean so it's partial guesswork
> on my end that these are related. It looks like PSP hardware(?)
> doesn't come out of hibernation properly and is disabled which means
> all further calls to it fail and I get the error message.
> It looks scary but seems harmless?
> 
> Commit 11e298f3548a6fe5e6ad78f811abfba15e6ebbc1 from 2024 has
> more or less exactly my error message but it doesn't seem
> to be fixed for this case.
> https://lore.kernel.org/all/20240216064112.962582-2-Shyam-sundar.S-k@amd.com/
> (I picked my recipients partially from that mail & maintainers.pl output)
> 
> My Environment
> - Kernel: 6.17.4-arch2-1
> - Hardware: HP ZBook Ultra G1a with AMD Ryzen AI Max+ Pro 395
> - Distribution: Arch Linux
> 
> I can (try to) test patches and provide additional debug output if needed.
> I have not tried any of the 6.18 RCs yet but I'll try to figure out
> how I can install them next. Looking at the git history I can't
> see any changes between 6.17.4 and 6.18 that seem relevant though.
> 
> Thanks for your help!
> 
> Cheers,
> Lars
> 

Thanks for the report!

Right now the PMF driver runs the same code during suspend/resume and 
hibernate/resume (there are common callbacks).

However different things happen to the platform during suspend/resume 
and hibernate/resume.

In suspend/resume the TA that was loaded into the TEE environment 
continues to be loaded.

In hibernate/resume the system will lose all context and the TA is no 
longer loaded.

So I feel the correct solution here is to add a dedicated restore() 
callback which reloads the TA before going down the common path.
