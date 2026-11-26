Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658444;
	b=yzjYEwXs4HvY/h4HM8FMP5TDIOr63baWsAcFP59ZoKqEbQQFzN1F8w3T9/xoaneBVF5z
	 izK7ytYM6cDjnXo8ublQXuP1l9ISpjc50MK0aYtz3wAdMPhm/wqAWrtJj8TaE1OW39NNP
	 3zixsnCMOCPv40AMn58EO5ZxhorXNwaWYUyyEoBd9NE6V+r6WY0VqrRSXsnCjZpg8S9vj
	 IDdaQlOLfhQ05PxTFDKbKWx6Bz0meFt9NbByjTQVIlD0fcjQUJr3VDSzOppuF3cAGrmh7
	 bRL28poyGDksjKre6PNmbxulr1Ck6LQLOR6PxAWEYuB1LE0dLkC2bQeAbV6It0Apd8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658444;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LFd5tt1hKDKREj5QcmPaWcxkKoEQYLk6cu801kswLEI=;
	b=v1T1KUV9/c/mg8LiphDsc92cccLjsQAA5u+KC5pxrymIzw7kLl+/Kdf50ge5Es3s18qf
	 fsUz+BOFvNOCs5O1WXNOEf/ATWwt/BaL0re+rWVjwO3G8ZG/NhD+3voE32RGdnYM8vrRe
	 DFzZfgnj5JasBimMNRgPHI0DX/yFY9HDxVp+YTmqbAAhJFtxrtnyrod/8KwihQF33oo2v
	 wa/sFofzE3fsHKt2tAaueyhjFNicENO/60DF7QDlKVpXdJy1BWlfHpDpjrD79gwBNTDMK
	 9+1DoAbb9aVeU9MoRseYnj4kX79UyZ71pMJJ4mk1Dx1DYb2CC6eVF8xsw6hBh8WV3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ye4XHx41;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041E6606A31E;
	Thu, 26 Nov 2026 02:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ye4XHx41
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795658440; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LFd5tt1hKDKREj5QcmPaWcxkKoEQYLk6cu801kswLEI=;
	b=Ye4XHx41iaArDjh/hj+rMiLVSJSfQAla2kFqdPJ+S+3+KUIQv1a1oLzU6IzmZAG5bx0qrvP2Akojm9YX5Fs4vLI7g3aLkLaoDNsxYSbx7ldXmczX5ZKX74FwSak/fVzaC06axwu/sEp6I8hWgO1RK50/0e9E+O6cyfraY9c0+Vw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFSrVWD_1795658439;
Received: from 30.178.67.187(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XFSrVWD_1795658439 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 10:00:40 +0800
Message-ID: <054a57ae-d5b8-446b-8203-1b342f530920@linux.alibaba.com>
Date: Thu, 26 Nov 2026 10:00:38 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on
 partitioned systems
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 xlpang@linux.alibaba.com
References: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
 <39da5f7295537024b97eeca6b567720c117ee002.camel@linux.intel.com>
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
In-Reply-To: <39da5f7295537024b97eeca6b567720c117ee002.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Srinivas,

On 11/26/26 1:49 AM, Srinivas Pandruvada wrote:
> On Wed, 2026-11-25 at 17:22 +0800, Qinyun Tan wrote:
> 
> Hi Tan,
> 
> Thank you for submitting this change, similar change was in our queue
> waiting to test.
> 
> You have moved definition of MAX_POWER_DOMAINS to header file, but this
> there is no description of that in the commit description.
> If you happen to post update, add that.

Thanks for the ack. I moved MAX_POWER_DOMAINS to the shared header so
that plr_power_domain_id() can use the same limit as tpmi_get_logical_id().
If I send a v2, I'll make that clear in the commit message.

> 
> 
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> 


Thanks,
Qinyun Tan.
