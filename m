Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDDE1B6CFE
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022186; cv=none; b=dUkS9f2QIWJMTHJpyToU6j4x+aDSYvC9Q7leTZtoWOPSbrM3RCeNWgk2hU6U9i1YDok3BuyNIVnYqhX5ZvhtfktgYTM3O9mEfVJy5GYpKPiWEOXzsxOtn7+Lj82gPf6kGVpE3H31oZnu80RkbrG5swGCHAqCq4uKVgR2RIZKZEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022186; c=relaxed/simple;
	bh=smeX6e1CTvynpWOp8xhkUKZxH7rlU1zmn+b77ENMSBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nyUQXJtcMCM4LhMd1frfA96NzzIbvSABpBK8VeuIkUtvLsZxZiTwLbWfgnxMG183fcWcH9CHXhLJaDQ9d5ujCef4m4BKFdOUvL+DW/hrukZGAfRFSvCK/u1D0V1iCWHlJQIzCC6NrjasK/EE90JVRF4rs7YRO65QifvnPWJb+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=PmvQYCBM; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="PmvQYCBM"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 759F2402A5;
	Tue, 15 Oct 2024 12:56:24 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 577FE402CF;
	Tue, 15 Oct 2024 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=Ywqa2bFdgSTE
	RlmCh6svrT2Jh4E=; b=PmvQYCBMxW8EstztwnSYFcu285jy3YZCP7P/HqG4n19V
	w0Cj3ISEOEIzmEE9voMivRS0fmexWIj1AwWoqZBd1oCBWlM+8sFOiaDnvoJ/Plat
	VAMpbG8s8E7IPjKRHeDue0yar47X3jlS40vYVWeb3sEkwLc/KIdosCHrz2oSj+A=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=c2Q0XN
	eFscASqOmaj3ekRv3hUWL2RDrplIOOpoggAwNiZ6UgTt0wmRnhBfvkCWJ3tvumXq
	RI3mwKEOphsBtqthuLpNfNMgkNQVamUIZRTb51FSeEQggK11lQ3lchsbed126pwJ
	dJzcH8lwA6poiNX95Kx1ClUukwvS8jhn7DcY0=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 4A031402A5;
	Tue, 15 Oct 2024 12:56:24 -0700 (PDT)
Message-ID: <46a265d1-bd53-48a2-93b2-3d083f1ed437@fatooh.org>
Date: Tue, 15 Oct 2024 12:56:24 -0700
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
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-15 03:40, Shyam Sundar S K wrote:
>> This time, I get some debug lines from amd_pmc_dump_registers(). I am
>> including my debug patch here--I think it gives a bit of context that
>> I can understand better.
>>
>>
>> <6>[ 1143.655752] amd_pmc_probe: 1
>> <6>[ 1143.655763] amd_pmc_probe: 2
>> <6>[ 1143.655764] amd_pmc_probe: 3
>> <6>[ 1143.655773] amd_pmc_probe: 4
>> <6>[ 1143.655796] amd_pmc_probe: 5
>> <6>[ 1143.655797] amd_pmc_probe: 6
>> <6>[ 1143.655798] amd_pmc_is_stb_supported cpu_id: 5352
>> <7>[ 1143.684758] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
>> <7>[ 1143.684768] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:100000
>> <7>[ 1143.684770] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>> <6>[ 1143.684772] amd_pmc_s2d_init size: 1048576
>> <3>[ 1143.684873] amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
>> <7>[ 1143.684886] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:ff
>> <7>[ 1143.684894] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:5
>> <7>[ 1143.684901] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>> <6>[ 1143.684903] amd_pmc_s2d_init s2d_dram_size ret: -5
>> <7>[ 1143.715734] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
>> <7>[ 1143.715741] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
>> <7>[ 1143.715744] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>> <7>[ 1143.746780] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
>> <7>[ 1143.746790] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
>> <7>[ 1143.746793] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
>> <6>[ 1143.746795] amd_pmc_s2d_init p_a_l: 0 p_a_hi: 0 s_p_a: 0 sz:
>> 16777216
>>
> 
> High and low addresses are zero, because STB is not enabled on your
> system. So S2D (Spill to DRAM) mailbox commands are expected to fail.
> You will have to contact Frame.work team to get you the STB feature
> enabled.

Thank you for checking the logs.

Would it be valid to have the driver check for this, as in the
following (untested) patch?


diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 6ca497473d78..148d57fc7b95 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -1001,6 +1001,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
         amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
         amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
  
+       if (!phys_addr_hi && !phys_addr_low) {
+               printk(KERN_WARNING "amd_pmc: STB is not enabled on the system; disable enable_stb or contact system vendor\n");
+               return -ENOMEM;
+       }
+
         stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
  
         /* Clear msg_port for other SMU operation */


Something like that could have helped me understand the situation is
better. If a patch like that would be welcome, I can test and submit
it.

Thanks,
Corey
