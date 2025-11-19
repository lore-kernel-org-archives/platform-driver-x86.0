Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43BC2D77E5
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763586472; cv=none; b=efH4jZAQYIdkSuFl1S5177aCR+tiaewZlvFt2XHQ44t/XlcVtEvwtU8k9kvPFUzuCGKqIvK8eVSUDCngebIWvviUPog6FSCMFZPZtamtolFhizJIadSNCq8sexO3O9db8KfwBjSr6eh4XzRi3k8BmvzdIMDwcqWR43fhVAq0vvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763586472; c=relaxed/simple;
	bh=iREFdzzJysrp3Et3JAuedcKCYlfWShY8Y9Y5wPCsl0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzLIcBXBive1rfsZxbDFJ+8Nro+2fR7ka3TLaQEHS7WSMTImGzoNKZrl+lYXn0DPZtsF+ZxGHBWmSUxPrUnSKz890DvhYOlDwaU1WJoH3dBWgvFVEuSAboX/CAUeFIFMh7y2wIO0EKxrCucdze1JVsYY1J9lu4eDtRoQoOHjqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iANflv5L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iANflv5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C04C116B1;
	Wed, 19 Nov 2025 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763586471;
	bh=iREFdzzJysrp3Et3JAuedcKCYlfWShY8Y9Y5wPCsl0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iANflv5LsAwXhCO7fduWiAtvzGvLBcKRetRojorZXQaYx4Vxen/wqZ4MHGY7c8yqv
	 kCLO+zxje7pYPke5768QDUMZayt3cqPGZTijSjN9dEGsksh2hfWfQULFhxfmznsfLU
	 lM9xaiZVoRsKYdqnLUHF8nAuERzv0P+hw5Ax2VM/1VEUi5oLY/HkrkLNAjoD+eNU29
	 l9vM96R9bihKwW/ZEl8dqSmBnCPJM0s5voDbNztiW1vxvxxMLSK8y3kY5R9Fj+FdYX
	 XZoquYMInpcyVqLDl/LYZHRud1wKM0nWuv6PEukahyXRW6dcfnSO+OJXwLhFt4hNnm
	 ZzY65A8f04aLQ==
Message-ID: <240e27f2-29ba-4b4c-b8b0-0534eed005c2@kernel.org>
Date: Wed, 19 Nov 2025 15:07:50 -0600
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
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>,
 "Shen, Yijun" <Yijun.Shen@dell.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
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
 <c31b5a46-5dea-48c6-bfe9-b3efc989f0de@kernel.org>
 <9885395c-fbf0-447e-a9b5-2231a3071dc7@kernel.org>
 <CAD-Ua_j=GiO9yjy1rg99xQXdTxV2Vp+3qjiUoMomLWZEEe0tyw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAD-Ua_j=GiO9yjy1rg99xQXdTxV2Vp+3qjiUoMomLWZEEe0tyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Sorry for the long silence, just back from vacation.
> 
> I have now tried these three patches on 6.18-rc5:
> 
> * 0001-crypto-ccp-Add-an-S4-restore-flow.patch
> * 0001-crypto-ccp-Prevent-calling-psp_tee_process_cmd-with-.patch
> * 0002-platform-x86-amd-pmf-Prevent-TEE-errors-after-hibern.patch
> 
> The good news: The original error (TEE enact cmd) is gone after hibernate.
> The bad news:
> * I tried four hibernate cycles
> * Two of them did shut down the laptop, two did not
> * After resuming from hibernate I could not reenter hibernate, reboot
> or shutdown at all on one occasion
> * I don't have logs for any of these :(

I think you are seeing an unrelated problem those other two cycles.

I've done testing myself (on top of 6.18-rc6) and they are testing solid 
for me.  I've posted the patches to the mailing list for review.

Link: 
https://lore.kernel.org/platform-driver-x86/20251119205942.3411155-1-superm1@kernel.org/

> 
> I assume these two are unrelated:
> * On boot I now get a message "RDSEED32 is broken. Disabling
> corresponding CPUID bit." before I enter my LUKS password

Yes; this is AMD SB-7055.  There is an updated linux-firmware microcode 
available for it.

> * Twice WiFi failed to reconnect after boot ("send auth to" followed
> by "authentication timed out") - I'm 100% sure this is not an issue
> with my home setup

Yes, should be unrelated to the PMF/CCP S4 issue.

> 
> I have not tried to debug any of these yet as I'm just back at my
> laptop but I can try to look into them a bit more if there's interest.
> 
> Thanks,
> Lars

I think if you can revisit on 6.18-rc6 with some more testing we can see 
how things are going.  FYI - the second patch for psp_tee_process_cmd 
appears to be unnecessary.  I couldn't reproduce any failures that 
required it.
