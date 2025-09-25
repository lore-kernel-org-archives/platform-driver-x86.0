Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B97B125A0
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Sep 2025 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820635; cv=none; b=F/OEGKgzynQayQFyLSSiCs0+qLz3oYcjC4czTqBkvwEmcc5siQO61lPtTWh3mM8AQDiedjUvjJeh/s49YSCIS/+VX3+WdvjEiw/z9ndXubPKe+Z4zBV2Trw+NbZ6DFPXikOL5ZgNwB74RjX3jrAhSJRDpWxMKRQAtdBIAiIL9Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820635; c=relaxed/simple;
	bh=ZGSbltVvr4IwNf8c443lbdomZkLl41N2Jp8rYuaKsXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrDgj60yJJBIdmFIxK5U0yS8uOW1ENk7tuRvrhNVRwjXfGGSAGt6pEIXJMYxuaJl1idHfBi7MSAck/Ub4Uqngyhx4v7J77rxZ+1LBkEk9uHGoexPbUJuqCzWfDiI1WbkeKA5lJgrcsfRnVOwvmJrwl73Pf3OJos9QuJpPhdA0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=R2IqIxSm; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="R2IqIxSm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sVS2okRvDGmGXPK4KjhzCoeXLlcHDyro9z09xgjPEBA=; b=R2IqIxSm4t1Lq8XRhr4T9MwtkQ
	WsNmMCs8RuR3jCyTcXrZT+vCrTuIItU/sqVu6ivZYBxdTWJK9dSYsWC/4U54eAjz9rhqZuTn4G6Zg
	EjVy7Hulcd70agsyM5XHyxvZRD97O62WZ2wLj9m3vkQxQDzxmWhUgAyUBjXxA9f/vOZgEKgmL3JtU
	AhygL05Qzn1FRLY/3hjerytBFcwaN2rg6dmf98asF+nywKd/OT4n+nFflci9/Ri1WMBYZIZCAxXCY
	LEep5jsuLTN0tpVLqxPBjNVzshF23gf3WK5xGuBqvDg9tqwJGAPE+utwjc4BMaqwie62VtKRrE1nk
	hq7uiAuw==;
Received: from 201-27-133-184.dsl.telesp.net.br ([201.27.133.184] helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v1pad-000342-Ds; Thu, 25 Sep 2025 19:17:07 +0200
Message-ID: <5af4810f-b995-39c3-e844-3a7c4473aa62@igalia.com>
Date: Thu, 25 Sep 2025 14:17:02 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers
 and distinguish between them
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, xi.pardee@linux.intel.com,
 david.e.box@intel.com, irenic.rajneesh@gmail.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-3-gpiccoli@igalia.com>
 <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
 <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
 <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2025 06:57, Ilpo Järvinen wrote:
> [...]
>> Lemme know if you prefer that I keep the old naming or fix it properly,
>> like SLP_S0_DBG_2, etc.
> 
> I'd prefer Xi or David comment on this whether to add the number there or 
> not. This will end up being after the merge window material anyway so lets 
> give them a few days.
> 

Perfect for me, thanks!


>> Sorry, I couldn't understand this sentence. Can you clarify it for me?
>> What assumption and what do you think we should do?
> 
> I was just referring to the ++ line that you for some reason snipped. 
> It assumed certain order of things in the input array which arms a 
> trap. But then, we know all the current inputs are okay with this simple 
> approach and I'm not sure if this code is getting much changes in the 
> future so it might be over-engineering to store the number into the 
> input array within the struct.
> 

OK, thanks for the clarification. Let's see the input from others and we
take it from there =)
