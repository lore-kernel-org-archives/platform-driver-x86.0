Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8003713B58C
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737065972; cv=none; b=kjiYlgmDrOnoJ18AkBCDU73P8G0eCIqy+klvc2uGj9C5b07KT7VISr50IhCaCLptL8K9sr+fuLkI0skg1rF9B0YtfGn6iiGNn6o6yawkExf5oxot6JXwllSPVqukMszsSiBgsGHB2Jufhj50vJPWA94HQpXdYQaK/i4w5kqIiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737065972; c=relaxed/simple;
	bh=LZAgZTv9Tf54EKItiMQQ+4x8m4c2OzWw0lbzl1nGF34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4qYeRofRTOJSacFC8jAGIM18koYAokiSFJ5ckeSNPTh0a2IEZ8osKS7z1Jt1MDYjKYyDcyN+d/54cjX3ih/Ht1ZbHhVqFDeQKWp3nJf7zFweTGrswseW595T41977avKhPquBFRnhOXkCLnMhMHfDxR1r8xVYW8mJjWGQiVpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=vY3Ece44; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="vY3Ece44"
Received: from [IPV6:2a02:842a:8223:5500::978] (unknown [IPv6:2a02:842a:8223:5500::978])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7C553780331;
	Thu, 16 Jan 2025 23:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1737065967;
	bh=LZAgZTv9Tf54EKItiMQQ+4x8m4c2OzWw0lbzl1nGF34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vY3Ece44wk9ns5uSJBbpjJfUQvvEJVPvGl3HGrmGRP26LNoE1IOpXd5SgHA943PTB
	 ajZ6J2XvGV4+PJFCgY20RMc1h1A7LnaO+uJDuV+pRSeUBfE12VYyg8Nuwu5oTN21ck
	 0G1qyqZ2cJDSL3dRbyDhXGvqZljqtzkQBWJfCqUgJDoP2iIXufCxRtlr5JXqaauzaJ
	 qrc/40QmS1Y6uOne+q/1Wthv9QOHwiM/JFXjWW2897IJ1J40JxNSo8pHXU3bagXAM5
	 VKPUFqyWtxg6jSWmPDmkqYKp7s+FX/YWMdHsGGXBs4ANacW/k7I3qp2cfqV3GxQghr
	 gNiEsFTarKq0w==
Message-ID: <2753220f-8063-4e2b-858f-dc2426f60beb@free.fr>
Date: Thu, 16 Jan 2025 23:19:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <7e374fd6-407a-42cc-9836-387583cfce2c@free.fr>
 <f12e0b5a-488f-4876-888d-58beff9cb825@linux.intel.com>
Content-Language: en-US
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <f12e0b5a-488f-4876-888d-58beff9cb825@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 5:33 PM, Ilpo Järvinen wrote:

>> +static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>> +					    bool *ppab_enable,
>> +					    u8 *dstate,
>> +					    u8 *gpu_slowdown_temp)
>> +{
>> +	int ret;
>> +	struct victus_gpu_power_modes gpu_power_modes;
> 
> You could order the function local variables into reverse xmas tree order 
> (from the longest lines to the shortest). If it doesn't make sense 
> somewhere due to internal dependencies, it's not a big deal to diverge 
> at times (but probably doesn't happen within the context of this patch).

Fixed for v5; I didn't know about that.
I found 3 others occurrences of the same thing to fix into my work, fixed them too.

>> +/* Note: HP_POWER_LIMIT_DEFAULT can be used to restore default PL1 and PL2 */
>> +static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
>> +{
>> +	int ret;
>> +	struct victus_power_limits power_limits;
>> +
>> +	power_limits.pl1 = pl1;
>> +	power_limits.pl2 = pl2;
>> +	power_limits.pl4 = HP_POWER_LIMIT_NO_CHANGE;
>> +	power_limits.cpu_gpu_concurrent_limit = HP_POWER_LIMIT_NO_CHANGE;
>> +
>> +	/* We need to know both PL1 and PL2 values in order to check them */
>> +	if (pl1 == HP_POWER_LIMIT_NO_CHANGE || pl2 == HP_POWER_LIMIT_NO_CHANGE)
>> +		return -EINVAL;
>> +
>> +	/* PL2 is not supposed to be lower than PL1 */
>> +	if (pl2 < pl1)
>> +		return -EINVAL;
> 
> Here too these validations could be done before assignments into 
> power_limits.

This makes sense, I may even have seen it sooner. Fixed for v5.

> In the meantime, I've applied the large thermal profile refactoring series 
> from Kurt which will cause some conflicts here so if you could in addition 
> rebase this on top of what's in the review-ilpo-next branch please.
 
Sure, I used the following command to get it (I hope this is the good one):
git clone -b review-ilpo-next git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git

Then I carefully managed to understand the changes, and adapt mines on top of the new hp-wmi.c file.

I also successfully ensured the updated resulting patch still completely works on my machine (as always before sending anything). I'm now noticing having the amd_pmf driver loaded doesn't conflict anymore with the registration of the hp-wmi driver as platform profile handler, which is perfect. (As for now, changing platform profiles through amd_pmf driver alone isn't doing anything visible yet).

I'm sending the updated v5.

Best regards,
Julien ROBIN
