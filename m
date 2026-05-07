Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D94431352D;
	Thu,  7 May 2026 23:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197738; cv=none; b=L6gdo8p1fFnZLf2cPRrWl4U+Xxg71YN9i+a0YS4mKWFZ5j1c5CAlTKzH/27wsvYLGvYbCoDdjlSliXfUz6gxJ84ayPLT1obB5cKtoHkiTBDk4gXnQbeswoCv8EjPzsijWsIxNjKBwyLg+iDdz0YnxSDUaSVIv2MIl4rV+BaAE3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197738; c=relaxed/simple;
	bh=xAR6486zIPdiPNb8tQvSFcmfwrh1/lxVxQCFaeEQYfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3XOdGlufsluEJuWeltftddT+1QFAx7bEQciaDQnZKzdu/JBrOmDIMxmE9Bio9eDbL2mkaMpjrt1wBM9IYnMmzIPcG2iLPydVbfmYe3w6z3yW85uZOqXOgxa2gjRLFq3nEXOM7HQVpMwWXoqvWUeutjHg0aYHFOSaCPiuHe/AuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZaERyca; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZaERyca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FD3C2BCC9;
	Thu,  7 May 2026 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778197737;
	bh=xAR6486zIPdiPNb8tQvSFcmfwrh1/lxVxQCFaeEQYfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cZaERycahO0LGdbSbxEzUAkilo4p6ygA3MpGITOH4ug/5m4QwRceAYmKugqGvwx7u
	 3epzyNGjQfoLV8sXl8pZc2hocdUHaNqDqDXsMqQlsMRkuJGqT6s0dRxAi9S2ocNTYO
	 JILG1bAUi5gN+FoLAjrmfeut7hx19d8j7x8XrSB55lrI76MLJct+CUP3JqZuF56F/v
	 CqXW7ilC2jRRyTtEwyT8IttQX2rTx7h5auaUAVH5pkOfaDlCYq667G519BzJnEaXGi
	 zhbkNRoLTbdBy07WN2BAY3SZeRJDakxNtayoI83b17GotSPYYKZdzrEZU3wYAHUy2t
	 Ru1roEpuGXQkw==
Message-ID: <f268efcd-ad44-4b5c-b2f8-9837c5678a7f@kernel.org>
Date: Thu, 7 May 2026 18:48:55 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo
 Laptops
Content-Language: en-US
To: Daniel Gibson <daniel@gibson.sh>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Sindre Henriksen <sindrehenriksen93@gmail.com>
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-2-daniel@gibson.sh>
 <ecd9767a-ea6d-8c1f-699e-e1ced0247f2e@linux.intel.com>
 <13165764-9660-4887-bc13-54f2b9fee3a1@gibson.sh>
 <dcdd32ff-b2eb-4cd9-b1e7-0cf3fd5ba3df@gibson.sh>
 <887bf769-4c02-4d61-bfb1-127a710b670c@kernel.org>
 <36c3e7fa-f153-42d2-b1c2-8f5b9564ee77@gibson.sh>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <36c3e7fa-f153-42d2-b1c2-8f5b9564ee77@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> 
> Are you sure it behaves like this?
> The check is basically "is the SMU table's s0i3_last_entry_status != 0".
> And as far as I can tell this is the case after every successful suspend,
> it only seems to be reset by rebooting or if a suspend fails.
> 
> See smu_fw_info_show() (for /sys/kern/debug/amd_pmc/smu_fw_info):
> seq_printf(s, "Last S0i3 Status: %s\n", table.s0i3_last_entry_status ? "Success" :
> 		   "Unknown/Fail");
> 
> When I read /sys/kern/debug/amd_pmc/smu_fw_info right after booting, it prints
> "Last S0i3 Status: Unknown/Fail"
> After resuming, even minutes (and presumably hours) later, it prints
> "Last S0i3 Status: Success"
> indicating that s0i3_last_entry_status still is != 0.
> 
>>
>> Now you might have been confused by not looking at commit
>> 4dbd11796f3a8eb95647507befc41995458a4023.  This fixes the behavior as
>> it's supposed to be.
>>
First suspend entry:

amd_pmc_s2idle_prepare()
->amd_pmc_setup_smu_logging()
->->memset_io(dev->smu_virt_addr, 0, sizeof(struct smu_metrics))

That is the table is cleared.

amd_pmc_s2idle_check()
->get_metrics_table() && table.s0i3_last_entry_status

The table is fetched and check (last entry will be 0).
No delay.

At this point system is in hardware sleep.

If system resumes from hardware sleep table.s0i3_last_entry_status will 
be non-zero.

If you re-enter:

amd_pmc_s2idle_check() will do the msleep.

If you exit:

amd_pmc_s2idle_restore()
-> amd_pmc_validate_deepest()

This will read metrics table and tell you in logs if you didn't get to 
HW sleep.

