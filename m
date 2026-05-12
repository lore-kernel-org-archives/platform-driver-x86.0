Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32301F151C
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778547035; cv=none; b=Ulm+3BU3pPO3xAQI7TJKY0VEn+VOLScZra3xmuL89XNAeTAzN3PTwRHZMa1OCSHF5libryNMCy1s1qSPOZpQeEUNRFYYLIzQES75xihhFtNYyEqu2dl1E0OZnFzaSyPe/5AGpl9AgKHDsCNTdLHgiTEQ6bKxHQEOGIym8RIs4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778547035; c=relaxed/simple;
	bh=1tuIwqiE8pUlhEhCMT8z4e0s/dI3Li9F4AB0jMNRuds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQL5ekYswS+x6irC6rzKp0ZSrNNU3YvkZYqpDRbTudSfehYuHh1bPc1pT+nOBgaBy2elgK20HUtcRYRdmsN8IFbPvXSotxPuwrYssDIRE0rd3m8HeHwn0GJcIhQJnOzxrCRgbAtGBSMZpV1AirI7ZEJ29edBxU1lmhd7PxIrzrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=EL6uM8BA; arc=none smtp.client-ip=84.16.66.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="EL6uM8BA"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gDygP3KFSzFpV;
	Tue, 12 May 2026 02:50:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778547025;
	bh=qWj0qHf+vVHruHgR1f1kc9gZADhAuK+ML2Yxdr8s9RU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EL6uM8BAogXG1mgf54ArPMTRABc5MxC0XLVbWYyU0MzrI+QuTy11Yj7jmRrxb0yEP
	 eXa6+UyNaaijpF5/PtnLZFVHN+kofdEozrkaZndsDW9gtGHRkwnjzswCncnp+7wqwT
	 +x1gT2RdDaMyofUqXNrxqPACpqJAbU3SJbX0tkdUVjd6qC6Hz/YZwIS2tecuM1NpQg
	 5QZQmTWt3AEUecBegYKe1xMHj2lRrU1tXrJUlC+x5kPonhiKFFJmaZ2Z+YmRGsxXRB
	 YfwBBifIOipmiJuPVD/MWpnRkb7eWq6D8ZS2U9w1G1cdiNWt25aWhIT1Fyd3ekb6Su
	 aS5jChivkBgVg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gDygN5ZVBz6dV;
	Tue, 12 May 2026 02:50:24 +0200 (CEST)
Message-ID: <d34a8638-c9d6-4963-a7e5-ee2c977b2b54@gibson.sh>
Date: Tue, 12 May 2026 02:50:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260509013105.816339-1-daniel@gibson.sh>
 <20260509013105.816339-6-daniel@gibson.sh>
 <14ccefdc-eab5-b5a9-b8f1-1128bbf7f217@linux.intel.com>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <14ccefdc-eab5-b5a9-b8f1-1128bbf7f217@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 11.05.26 14:49, Ilpo Järvinen wrote:
> On Sat, 9 May 2026, Daniel Gibson wrote:
> 
>> must be updated with the actual commit IDs when they are merged
> 
> Please write a proper changelog text.
> 
> Unfortunately, I cannot know the commit ID in advance as it depends on the 
> commit content itself (git object hashing works that way).

Yeah, I know - I already feared I'd have to submit this documentation
later when the other stuff is merged, but thought I'd post it here
anyway to maybe get feedback on the documentation text itself while its
context is in the same email thread.

 >>
>> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
>> ---
>>  Documentation/arch/x86/amd-debugging.rst | 25 ++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
>> index 3176a1240fee..3af7799cca1a 100644
>> --- a/Documentation/arch/x86/amd-debugging.rst
>> +++ b/Documentation/arch/x86/amd-debugging.rst
>> @@ -249,6 +249,31 @@ state entry.
>>  
>>  `commit 40b8c14936bd2 ("drm/amd/display: Disable unneeded hpd interrupts during dm_init") <https://git.kernel.org/torvalds/c/40b8c14936bd2>`_
>>  
>> +Keyboard and Lid Switch stop working after resume
>> +-------------------------------------------------
>> +On various variants of the Lenovo IdeaPad Slim 3 with Barcelo and Rembrandt CPUs
>> +the lid switch and keyboard, or at least the Fn/Multimedia keys, stopped working
>> +after resume, until the next reboot.
>> +
>> +This was caused by buggy firmware having timing problems, the EC needed some idle
>> +time right before the CPU cores are suspended, or it got into an inconsistent state.
>> +
>> +For laptops that are known to be affected this workaround is enabled
>> +automatically, to test this workaround on other machines you can set the
>> +``delay_suspend`` parameter of the ``amd_pmc`` module.
>> +
>> +If you need to set the ``delay_suspend`` parameter to fix your machine, please
>> +report this at platform-driver-x86@vger.kernel.org for it to be added to the
>> +list of devices that need this workaround, so in future kernel versions it's
>> +enabled automatically.
>> +
>> +Note that the current workaround isn't perfect: The problems can still happen
>> +if resume is triggered by a timer (wakealarm).
>> +
>> +`commit TODO ("platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops") <https://git.kernel.org/torvalds/c/TODO>`_
>> +
>> +`commit TODO ("platform/x86/amd/pmc: Add delay_suspend module parameter") <https://git.kernel.org/torvalds/c/TODO>`_
>> +
>>  Runtime power consumption issues
>>  ================================
>>  
>>
> 

