Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA41DDA14
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549730; cv=none; b=ehnJIT9DpDSleTKZlxBL9xoE81dT0xnWU0lK3qo8UYNb3fKr54DNLh1Niby3GxHcpjZ4DIeYOYfiNhBvH5RuxB28hGsM+sUip6OpAf/DA+oVSNUlbRk45fT4n+kZzkNmcLb2YVmFb+kZEiCOIlZCL8PFO1cY1Naxo3J1ZxJdu6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549730; c=relaxed/simple;
	bh=3bxC/lyevoadW1k6W4LYVEyP4oLBzTJYJM6HlttcvGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4JNJoKNcDmi0UreYqVQfHkPjCrR33im1yUp1mWNo3NGy6xYaDAQ2Pq+8WMaKaNGL7aS+ipeBgiWSEzi9UpC+T+u36T8PCZHOcQIt0YsuUq6+2CD8E1IO1Ush4v49unmsjNvPg4UThw0H2dczzvxh/R4E2JfrU6lGOFIFgjZVdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hgo9ANRD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hgo9ANRD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/PNI2ibxpJ/zaA5rki/Jz8C6cgbdzCX312aoibD77PI=; b=hgo9ANRDZ8tJDHO9gbWY/x3BaJ
	5LOaUz0mMlHZzYHhAL6po8k6yZd1tKQswkQ3VdOLGLJO2bpKtqW8okj9hkCH3kGRghMh0cT0OBV3Q
	oKXGTKqxbut2iWfPR+8zR246b7beDRogh/eKDJppx2gruQd6WnQgGfuw59c+dXAwviTsh+QwpY6ND
	/GAXU81dv+GRG4khh88dj25ZUMIgVdJiwyrcWgrBt2N4U3hp6R6FIxpvcpYA3qslRVFhYDao2nETr
	EQHJIwohMGXMiuu4AGXrVcB+fwcc1wyoOwT4sKon3e+6xdVVfU65Yq80xt9WxTTq4Y37uIek/28cS
	cAbkIZjw==;
Received: from 201-43-219-13.dsl.telesp.net.br ([201.43.219.13] helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v95P4-00A5qh-Dz; Wed, 15 Oct 2025 19:35:10 +0200
Message-ID: <41a37ac0-1fa1-fc43-b9ce-2f70a5f15aee@igalia.com>
Date: Wed, 15 Oct 2025 14:35:06 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] platform/x86/intel/pmc: Always dump LPM status regs
 on unsuccessful paths
Content-Language: en-US
To: david.e.box@intel.com, Xi Pardee <xi.pardee@linux.intel.com>,
 irenic.rajneesh@gmail.com
Cc: kernel-dev@igalia.com, kernel@gpiccoli.net,
 platform-driver-x86@vger.kernel.org
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-4-gpiccoli@igalia.com>
 <dcd817d1-6ce5-4c09-a65b-21507424849b@linux.intel.com>
 <71fef5d2-15fe-27ce-4004-998aadc9a8cb@igalia.com>
 <280be57c-5159-4e5b-9d8e-15cd67b84cc4@linux.intel.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <280be57c-5159-4e5b-9d8e-15cd67b84cc4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2025 20:55, Xi Pardee wrote:
> [...]
> When the system fails to enter the S0ix state during suspend, there are 
> two scenarios to consider:
> 1. If the system achieves PC10 residency, debugging S0ix can focus on 
> the information provided by slps0_dbg_maps or lpm_sts.
> 2. If the system does not achieve PC10 residency, the PMC core driver 
> supplies package C-state residency information instead.
> It is important to note that the data presented by 
> pmc_core_lpm_display() is only relevant when PC10 residency has been 
> attained.
> This difference helps ensure that users are provided with accurate and 
> meaningful information relevant to the power state achieved during suspend.
> Thanks!
> Xi
>>

Thanks for the clarification Xi! So, this patch doesn't make sense, in
the end - let's drop it.
With that, both patches 3 and 4 are discarded.

Lemme know if you / other maintainers see any value on patches 1-2 or
else, we can discard the whole series.
Cheers,


Guilherme
