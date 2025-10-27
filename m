Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70305218ACC
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570621; cv=none; b=ftY8oFqqLTyZJUQv2qcO8hWHBV8s0Cm7nZCBIEFGAUELYx6D14sx7O41cJzs5Ss3QMmV3DkbwJTezytaXURzumgLDetP7rhz2f4cpQX++4rb9/dyuDcOMq+2k1YxGl8QOWf7Vf5vco46MKkFNl61Ja+sFDdRTfzIP9/Idi6C70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570621; c=relaxed/simple;
	bh=h3zyHopPpCguSecJTGo3OdHGV/k2LzQ6IHTAuD3PQJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWubXgzJcWyFOEb7jDso0dyTnIKxPD1dzNVE+2gn3sg5l1udBfksUXy979ojBcdgQltnQ8SbYxPJN58kKYeD+QrrPleS6fXHhf11jFIVVTOMgvWUb0lj9Q8CyPfGDzTladiytqPqQznFsdzsusi7NXdDbkbGcYjz/Z8WHLjQI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmDQM++R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmDQM++R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF82C4CEF1;
	Mon, 27 Oct 2025 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761570620;
	bh=h3zyHopPpCguSecJTGo3OdHGV/k2LzQ6IHTAuD3PQJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmDQM++R43ZEM1acIeYe38+wV/Ozq3+hGfmALxLqG5AygovGarpi/UZs4wgw5MCeX
	 6lVHzy5tMEK4y50fidvFxqnNrDIUZAUzW8CBXfjzkJdxrbedOP+n7w0rmkpf7aRvCx
	 7feo1zlz65zqUAxos9bVvwvNnJYC+YOWimsE8JKfcPaRT0sntj9HOMh6N8L254/6e+
	 f0Wixt+XvPBeBgTh7Zi7tQPAZQZJeS8dTVe7hOJYOWmKduYCUTk6CBULSBpdAwysQs
	 yXz3cRuQ+/4SKwkS5L727VkUyPRVdUiSfb3nAzElj4FvfOR/rqBxi4AR7cTk9PFkUi
	 ZmfJraSuSR9ug==
Message-ID: <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
Date: Mon, 27 Oct 2025 08:10:18 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Lars Francke <lars.francke@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
 <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/25 7:11 AM, Shyam Sundar S K wrote:
> 
> 
> On 10/27/2025 16:42, Lars Francke wrote:
>>> One way to be sure it's applied is to add a pr_info() message into the
>>> new function.  Then you'll know exactly when the new function is called
>>> in the logs.
>>>
>>> But assuming that was in place then I feel this will still require some
>>> other coordination work with the PMF driver then too.
>>
>> I did that now, thanks for the hint.
>> I added a pr_info to the sp_restore method but it is never printed.
>> Just to confirm that I'm building and booting the right kernel I also
>> added a debug line right before the "TEE enact" error:
>>
>> Oct 27 10:50:06 lars-laptop kernel: Lars patch worked
>> Oct 27 10:50:06 lars-laptop kernel: amd-pmf AMDI0105:00: TEE enact cmd
>> failed. err: ffff000e, ret:0
>>
>> In other words: I'm pretty certain I have your patch applied but
>> sp_restore is never called which I think was the intention.
>>
>> I did play around a bit in the code but all I achieved are NULL
>> pointer crashes :)
>> It looks like "i2c_hid_core_pm" might be a typo/copy & paste error? I
>> assume it should be "sp_pci_pm_ops"?
> 
> Yes — that should be sp_pci_pm_ops. Keep the pr_info in sp_restore();
> if that log appears but the issue remains, the PMF driver will need to
> be updated to support the .restore callback.
> 

Yes; sorry about that.  If you need me to spin a new one, let me know.

But I am still suspecting we're going to need PMF driver changes too 
because if the ring is not active then it's going to mean the TA wasn't 
running.
