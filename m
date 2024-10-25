Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A07A81ADA
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 05:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729833458; cv=none; b=QnuSgDjL9dS0Dj0ZM78/08pC4pwBgmHtth+SXRq4ImeP/y2Rs6r3GjEd4Jt+a8g6cX5YkLrg1MBbcnA7MYYT0LtOG7g8NconTtypB4hk0QhYMtsMemKMBnS/eVyJPVItQ+5NpUnWBpRlBrFbNTsA0dpfqnmh8pONhvUiFL3EsSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729833458; c=relaxed/simple;
	bh=eJtz2dCXWQgiqN1hF6ZvdgkV3nP1TCS3khn1fBR4+cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=B2oKqMgXFE/A8zkv/w/QUZZEAHcqGEp/6YFRqWgY2GM8lNyS9aavzX/+UElpnARyvgreLGZJjF0VFAv9jVzOFicNKatX7yPlRfwEO3Pwq4QO91o/9zI9Imzwc5bJC76CSc6e4O11XK1n/Em1RuUmHt+nTbM28N9sfFIF9jNcY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=MRyENto0; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="MRyENto0"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 69E8F40557;
	Thu, 24 Oct 2024 22:17:35 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 4AD2A405BE;
	Thu, 24 Oct 2024 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=r1b11gwq6ucM
	5n0caFVG8tILFps=; b=MRyENto00KEe1jErSEvthpNY4mSrqZcko9Am3eG7NyMQ
	2rvMPjU1DhBIQ9LupypkS6OmTZL1YqhAUE3BFOIfciNuFNeNT2eMGhSATBknM1C6
	7Z0BZx0kzsOZza/HEd+hUugEHEf4NNLgmRws3YWrhN96BaHgusRc1H2zHD/7IiU=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=Io8Kzm
	4kmPEuLcVUNze9dQl/C7WOxCVHeDsJvF8xvnqavIl170ZXh1DedOOwb4TJo0p1El
	IPAzlkZMTXg/dhkliNKXelf6tZ01lEh8nqwQ4OyqBzqaGvYzk+DBv5e3z+/kYIv1
	tYY7NhKbiCIETug6x4qSy2PmNEV3Nbqyp7/B0=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 3E27640557;
	Thu, 24 Oct 2024 22:17:35 -0700 (PDT)
Message-ID: <a58c770c-caa4-417b-a796-f2fc15c70bd2@fatooh.org>
Date: Thu, 24 Oct 2024 22:17:35 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: please help with intermittent s2idle problem on AMD laptop
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
 <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
 <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
 <4d0d49eb-c407-4d63-847b-69f155449850@fatooh.org>
 <c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com>
 <46a265d1-bd53-48a2-93b2-3d083f1ed437@fatooh.org>
 <593793c4-ea34-42e2-8160-367c6856a724@amd.com>
From: Corey Hickey <bugfood-ml@fatooh.org>
Content-Language: en-US
In-Reply-To: <593793c4-ea34-42e2-8160-367c6856a724@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-10-22 23:09, Shyam Sundar S K wrote:
>> Would it be valid to have the driver check for this, as in the
>> following (untested) patch?
>>
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>> b/drivers/platform/x86/amd/pmc/pmc.c
>> index 6ca497473d78..148d57fc7b95 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -1001,6 +1001,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev
>> *dev)
>>          amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low,
>> dev->s2d_msg_id, true);
>>          amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi,
>> dev->s2d_msg_id, true);
>>   
>> +       if (!phys_addr_hi && !phys_addr_low) {
>> +               printk(KERN_WARNING "amd_pmc: STB is not enabled on
>> the system; disable enable_stb or contact system vendor\n");
>> +               return -ENOMEM;
>> +       }
>> +
>>          stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>>   
>>          /* Clear msg_port for other SMU operation */
>>
>>
>> Something like that could have helped me understand the situation is
>> better. If a patch like that would be welcome, I can test and submit
>> it.
> 
> Sorry I missed this thread. Yes, please submit this change for review.
> 
> Instead of returning -ENOMEM, just return -EINVAL (as the address
> obtained from PMFW is incorrect).

No problem. I adjusted the patch a bit, tested it, and sent it to you 
and platform-driver-x86@vger.kernel.org as:

[PATCH] platform/x86/amd/pmc: Detect when STB is not available

Please note that I do not have any system where STB is available, so I 
cannot test the "working" path.

I think I followed the appropriate patch submission guidelines; if not, 
please let me know.

Thank you,
Corey
