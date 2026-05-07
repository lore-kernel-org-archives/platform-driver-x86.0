Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E520173
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 00:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778198555; cv=none; b=o3jHrrztm+dXhNdmB6TUhE32m28eGO3zmoe4wHG6rlIaosNRSCndHteLzVn8+GPYfsR6AXwUgCq0OMEmQQxiVrE8VsJNRR/GiCcLZj+nTREDZ8DASEjy0VMsFtdW/xSLPmGSh8SDkrbitpTmZ+X9u42SfNcVNKlYNAlmst+pB+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778198555; c=relaxed/simple;
	bh=HEAKvMPyA9pnqrJ/Dkr8XJslH13pyUVdOl0nGxIeV04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmiJ1MkRmH4cRFyity/UTvyDKODIa0sId5ASQsNkgm6l67mqH1HR9xU/NwdWbLoEoEanH5x4iWp1SwTp9Jw6pYEK5ht1ukU8yH/nhsT34oYkNB2nguABJcD18Lkv45DbHCfdsjt3F0UdLC56vobZq4xay2qe5tczeaMQ+h+LmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=ajJrzsRG; arc=none smtp.client-ip=185.125.25.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="ajJrzsRG"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBTfY002szhbT;
	Fri,  8 May 2026 01:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778198164;
	bh=exyiSme+I1jmYBUTx8Y8xsS6PkukjakYByGYd8Et3Q8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ajJrzsRGnv02iHm3JxASqhJj7KCXBYn1Ub+NlQ8xyL4URB5lHLBzHY9Fr4sbzYvRW
	 Y1Xtbd0c+10Z8WVScL5K5WJeHWPGbnRijuH2EtL52IwKqtn6WDFNHW0OIYCQDB4ay8
	 N5+WoWDCS5B8RaBGRGhwYko+e5HStn18rgyQAaH7HHUq9XfDyPQBOx8TShY4u67F4z
	 fvQN/kp6F2gPqGcbYdapnDWDJEnOPrKHhisEgWvaojunjzXilQcqAllhwgk6HauOmP
	 kTWxRNnmEuTrEzhTNNHnxhQC+yUlqBto7B19PUA6uQcA9G9Y2RMVxV/iBhPZhY5tRq
	 orsPmzncdXMRQ==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBTfW4hGYzgwV;
	Fri,  8 May 2026 01:56:03 +0200 (CEST)
Message-ID: <b81e43c5-9fbb-48d0-ad59-0768823d6c3f@gibson.sh>
Date: Fri, 8 May 2026 01:56:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo
 Laptops
To: Mario Limonciello <superm1@kernel.org>,
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
 <f268efcd-ad44-4b5c-b2f8-9837c5678a7f@kernel.org>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <f268efcd-ad44-4b5c-b2f8-9837c5678a7f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 08.05.26 01:48, Mario Limonciello wrote:
> 
>>
>> Are you sure it behaves like this?
>> The check is basically "is the SMU table's s0i3_last_entry_status != 0".
>> And as far as I can tell this is the case after every successful suspend,
>> it only seems to be reset by rebooting or if a suspend fails.
>>
>> See smu_fw_info_show() (for /sys/kern/debug/amd_pmc/smu_fw_info):
>> seq_printf(s, "Last S0i3 Status: %s\n", table.s0i3_last_entry_status ?
>> "Success" :
>>            "Unknown/Fail");
>>
>> When I read /sys/kern/debug/amd_pmc/smu_fw_info right after booting,
>> it prints
>> "Last S0i3 Status: Unknown/Fail"
>> After resuming, even minutes (and presumably hours) later, it prints
>> "Last S0i3 Status: Success"
>> indicating that s0i3_last_entry_status still is != 0.
>>
>>>
>>> Now you might have been confused by not looking at commit
>>> 4dbd11796f3a8eb95647507befc41995458a4023.  This fixes the behavior as
>>> it's supposed to be.
>>>
> First suspend entry:
> 
> amd_pmc_s2idle_prepare()
> ->amd_pmc_setup_smu_logging()
> ->->memset_io(dev->smu_virt_addr, 0, sizeof(struct smu_metrics))
> 
> That is the table is cleared.
> 
> amd_pmc_s2idle_check()
> ->get_metrics_table() && table.s0i3_last_entry_status
> 
> The table is fetched and check (last entry will be 0).
> No delay.
> 
> At this point system is in hardware sleep.
> 
> If system resumes from hardware sleep table.s0i3_last_entry_status will
> be non-zero.
> 
> If you re-enter:
> 
> amd_pmc_s2idle_check() will do the msleep.
> 
> If you exit:
> 
> amd_pmc_s2idle_restore()
> -> amd_pmc_validate_deepest()
> 
> This will read metrics table and tell you in logs if you didn't get to
> HW sleep.
> 

Ah, now I get it - sorry for the confusion!
I somehow missed that amd_pmc_setup_smu_logging() is called at each
amd_pmc_s2idle_prepare() - my mistake.

There goes the simple solution :-/
