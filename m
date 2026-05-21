Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69643537C8;
	Thu, 21 May 2026 19:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779392622; cv=none; b=KteqsFFpy5fdySSVc1JF3xPKrCplVKSiQ9nPRcUrNx/g/ig7HSPNsymi9eNh3MpHtHUgHaL2+8mc5VvTr3dI97STI55YixJxn51p2Rsi5L6CY7OEwiq43Q5ltJqMEG+2+7uzBW2HFm8gjLe613McoGenhIWvsaiNLkNvrHSoNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779392622; c=relaxed/simple;
	bh=E12mJ/op0Wp2VN1a8MHATsz1IugHGZk87Lz+hmzpB2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UEgDNtctjasVYW53FnAGPkHVy7TSsoY51z7tMz7NN6HK+sw6oDK+I/xy5wzWiwvC8A2a4Mfyq08NbnUKU8lewXIF2I00iyXkm8epUmCRNV91w70zT20c5WLPHU+kwcyQPREMEmWtu+ph/7dODOT768Bm7Rdt61N2NwAUs2wkwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCW/WsDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCW/WsDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B3A1F000E9;
	Thu, 21 May 2026 19:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779392621;
	bh=56ftgVtbtTYa2fFBuXeGfsUZaNSur3g4WMmvRj6iuyE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=iCW/WsDLkxQ0oVjMUrVYQNOXydSy1P+AUBCbRDfoiPmLYFtpjW0/zOX8JKXnj19kH
	 HKKjIm5sDMWZr94I3VViwkcQ/skSmDxvRmkZAzGlXitWqlwWRlfhtPAZ9O/b5BkYdS
	 0PhuO+Lvm3keSWX71YXc+QUftxBXqEnI32qT27H0q+p1TD9djLQUDNzG+d7rc3Pc9+
	 NTSqukFPjmN0zcFDUN40SShCGFqDpLXAjsp7ctpallMUjq2BLT59svQw8KgZh/q7D1
	 V68DfUqo1UMMbZE/kJ7QrC9GIjZQz24XNv4jlxGH+VukrBmmpQhG20O4U1h1UOiDGw
	 oY7EdqJbIRwDQ==
Message-ID: <d7193b2f-6690-4938-9fbc-401b2ba2e1c0@kernel.org>
Date: Thu, 21 May 2026 14:43:39 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] amd_pmc: Delay s2idle suspend for some devices
Content-Language: en-US
To: Daniel Gibson <daniel@gibson.sh>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512202645.1549111-1-daniel@gibson.sh>
 <76150f44-1f08-49c4-b4e8-b37ee143911a@kernel.org>
 <af087465-2487-46dd-bd19-ba6b0790b2f0@gibson.sh>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <af087465-2487-46dd-bd19-ba6b0790b2f0@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/21/26 14:13, Daniel Gibson wrote:
> On 21.05.26 16:44, Mario Limonciello wrote:
>> On 5/12/26 15:26, Daniel Gibson wrote:
>>> On some AMD Zen3 and Zen3+-based Lenovo IdeaPad laptops the keyboard and
>>> the lid switch stop working after the first suspend, until rebooted.
>>>
>>> More specifically, they stop sending events when pressing a key or
>>> closing the lid - it's still possible to toggle the capslock- and
>>> numlock-LEDs with an external keyboard or read the lid state at
>>> /proc/acpi/button/lid/LID/state.
>>>
>>> See also https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>
>>>
>>>    Documentation/arch/x86/amd-debugging.rst  | 30 ++++++++++++
>>>    drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++++++
>>>    drivers/platform/x86/amd/pmc/pmc.c        | 60 +++++++++++++++++++++--
>>>    drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>>    4 files changed, 127 insertions(+), 3 deletions(-)
>>>
>>
>> Can you see if this series helps your issue instead of quirks?
>>
>> https://lore.kernel.org/linux-acpi/5996185.DvuYhMxLoT@rafael.j.wysocki/
> 
> I tried and it did not help with the issue.
> 

OK thanks for trying, figured it was worth a shot.

> By the way, applying it was a PITA: I downloaded the mbox.gz from
> lore.kernel.org, but it contained the threads messages in reverse, so
> git am tried to apply them in reverse order, which of course didn't work
> very well.. eventually I used `git am -i` to apply one at a time.
> 
> Is that normal or a lore.kernel.org bug or did I do something wrong?
> 

Try using 'b4 shazam' or 'b4 am' next time.  You basically feed a lore 
URL as an argument and it does the rest.
