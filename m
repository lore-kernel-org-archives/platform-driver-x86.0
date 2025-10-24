Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2AE338F55
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303323; cv=none; b=meiCcuXR5m1G17R9L/hugGgLT1q4uQ91vUZlraO1PhcKEYfbTlhJd176KyYcEY++CK5vZY0Nn4Ic59rfllbGCQdUYV+ps8QsBFBIMilKR3JsCncSkjYneob/0IM6taFmzEarnhh1iNUddVpUCGuNsF88fzgiHp++FDxkcxzGlZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303323; c=relaxed/simple;
	bh=qIXLNZQxtAcnmZAdPbLvv+3M80/8VIxEFo++JVvGJXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ba7U52eBQdoZD+D2vIORz7iz0V2TKX2PN8bF4/K/rt3j/4DkktyFz9uWXmXEs4wbSUSNka4D+uT6GRnISawPkx0XcNvpA6UYO1pLW7yGPsGAzHZn0F6iwRbXZA2eLAs09pfTPVPxwsWZmQP2Gxg/yEd4MrnqKyQgpJF4wt4XpS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pQxwREji; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pQxwREji"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qn/zVlWrOAiF7VlqixX3NNmAfE1kXeErp26tML6wkaU=; b=pQxwREjiuH5hcYzk1Bx1+8XHs1
	Jrd1giB8GcLLdSGWWPAXWzOM1PHV0cMXxyK8q7jwFuatD3816qk2cquTwK9sQLjUHI8TsIy1YrTe/
	t4GUMYCIMPwXIgZPF8ioSJVsBMrbpNvZEUHZUD5BBbQ0+9MPPgzvthpJ8SkQYEXANA+7BD1aXDjCd
	dVW0UL9C+RupBB5IRVMOEFqStxgblORsyG6DXneb4BXl68JT4tSHE3R4jNbOATN6tK0mIyxS54NGI
	cYqs76dgrFOPLYaIg9QhEKDnCvc2ahNZhoEfb9QWVTm0y7lr1PAI44TV527gvYuq9/m+1qpRsF0fZ
	yReLARaQ==;
Received: from [177.68.247.4] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vCFRv-00EiqT-8a; Fri, 24 Oct 2025 12:55:11 +0200
Message-ID: <f50d335b-dcbc-8405-3ba0-bcfd194d65c2@igalia.com>
Date: Fri, 24 Oct 2025 07:55:06 -0300
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
To: Xi Pardee <xi.pardee@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 david.e.box@intel.com
Cc: platform-driver-x86@vger.kernel.org, irenic.rajneesh@gmail.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-3-gpiccoli@igalia.com>
 <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
 <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
 <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
 <232ab4da-42ea-4d17-96c8-ca0d93f04f33@linux.intel.com>
 <bbd83ee1-4a6d-ee6a-9bb9-cc5aba2ebd21@igalia.com>
 <4f2863e3-23ac-4d88-bd1d-f83e59851da4@linux.intel.com>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <4f2863e3-23ac-4d88-bd1d-f83e59851da4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2025 18:44, Xi Pardee wrote:
> [...]
> Hi,
> 
> We would prefer not to show reserved bits as they don't provide values 
> to the users.
> 
> Thanks!
> 
> Xi
> 

OK Xi, thanks for your review. I guess we can drop this one, no biggies.
Cheers,


Guilherme
