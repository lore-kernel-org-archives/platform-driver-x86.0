Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1957A95C
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Oct 2024 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729996474; cv=none; b=DmAkvv250LrFxgQBXw7fsyx/TNRhMT9fDCmrF8psZOpaFT+EyzGLTVo6/rImTSgne9eHcGIr4vMmKAXpKjbSfawls6HF+W40Zb4XEItWvBcClrl5O3CZnVIud+DgoJuS7sHEHZiVGqoqtThqswUu/NYCNiBVt7XnNcCNoChDiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729996474; c=relaxed/simple;
	bh=dtd3LfmS4oAeBPTF3qcYIY/c0G6/pxBGXjaPk4h+AXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph4dMSKQUAHuj5wVFIeimg/DLtJANeE2vDCAY+YHI0CzS6e60XwIMHLPuJdpF+ySkrhe6oHI2laQV4pdSvq6DU5fJZoXQ7JwygWUkZhRzmCkl2aDwBUoSymYxdFqfyhuM8AWljTxHlRg6tcL0F3TP0D9kLBjnjQ12+YZaGVKnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=E3y8hMef; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="E3y8hMef"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 997E5401DC;
	Sat, 26 Oct 2024 19:34:25 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 7C30D404BC;
	Sat, 26 Oct 2024 19:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=JYRakWl2g4Gi
	Nbf0c9gRuusKzV0=; b=E3y8hMef3wfRKUROGmpaal7C7PVmsi/XZ3mI2WbDkple
	FfhdCZrZhkTmpS1H9ECs7gOGVvL+slYZE0hNaNBwx/B5YWBX3IeUtr6hnh/qHK7s
	qsKxrQmjqX/li5yfp7czYbZXntMQ6UKC9wcp83ecBcXK99XiLIoZ02gA69lPUC4=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=Uu9ASs
	W2Kb/SWIL93OjhCUBhm/fhA1OSencr0nim+JQVoEckllwAUt1WP1K9/t04dgd1yn
	JQdSeSzGbcpWUNUgA8cWbd9qwcYXBEMKMfLD1przHmNknf4AqagmoGsw9dOsoPCp
	xcH3/TQfX0Xu9ZXpepHJblqspVzE5wVx6MNmA=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 6FF70401DC;
	Sat, 26 Oct 2024 19:34:25 -0700 (PDT)
Message-ID: <c1858949-d0f6-43a3-97ed-48a23cadbe1e@fatooh.org>
Date: Sat, 26 Oct 2024 19:34:25 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Detect when STB is not available
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 platform-driver-x86@vger.kernel.org
References: <20241025051141.924760-1-bugfood-ml@fatooh.org>
 <d8734a53-23d7-65b8-d632-1884814f181f@linux.intel.com>
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <d8734a53-23d7-65b8-d632-1884814f181f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-10-25 07:55, Ilpo Järvinen wrote:
>> Per discussion on platform-driver-x86@vger.kernel.org, this condition
>> indicates that the STB is not available.
> 
> If you want to refer to discussion, add it into a Link: tag. Only write
> the conclusion into the commit message (the part you have there after
> comma).

Thank you, I have added a Link tag to the mailing list archives.

I wanted to avoid taking credit for the claim, though--I don't have the 
background to claim that on my own. I have changed the wording to refer 
to Shyam Sundar S K, hoping that's an ok thing to do.

>> In order to avoid the ioremap warning, and to help the user understand
>> the situation, catch the invalid address and print an error.
>>
>> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
> 
> Isn't Fixes tag appropriate for this change?

Hmm... I didn't think so at first, but I guess so? I didn't do a git 
bisect, but I can identify that the code in question was added by 
3d7d407dfb05, so I added that as a Fixes tag.

>> ---
>>   drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index bbb8edb62e00..72b1dfc64bf1 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -998,6 +998,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>>   	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
>>   	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
>>   
>> +	if (!phys_addr_hi && !phys_addr_low) {
>> +		dev_err(dev->dev, "amd_pmc: STB is not enabled on the system; disable enable_stb or contact system vendor\n");
> 
> Won't that end up duplicating the prefix if you put one into the string?
> The prefix is handled for you by pr_fmt() which is already provided in
> this file.

Ah, yes, I missed that.

Thank you for your review. I will submit a patch v2 momentarily.

-Corey
