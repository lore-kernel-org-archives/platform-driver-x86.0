Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC0308F09
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760368501; cv=none; b=YN1UF8WV3m4BkHAin23538R2YmHkOOT88CVwfX0U0wCXWMh5sM/10V3m8KXu/kSzMnsdeIux5eAkIDYieamcSrm+VWky+lkRuHKNtou1xiDXv0E5u0Vbdx07/PthOVuRXgna29syG30uPZOc/pW+T4KUdRqIyZ0ybfCnNH4KtbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760368501; c=relaxed/simple;
	bh=WMF2gBjx6zWvga4AMXl6nlQRhRUEDzjZ2TLKECDrbUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuV+fMSffYQAp6QQj7LZk7Q/5KwtNuH8Ckf3JTYKgky+G09DVmrekRNKDBOnurEnDevpSYVPWEfw3f0hYojsh72zYDJQeTvSLUsgtteu+hmI+dSPNATfz6KynGNSURdHgGQlL2vLlwKj0S7Nxr/03G7tZV9BGXvayRubwn2wwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qW2TAtwA; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qW2TAtwA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b2iWZSmLqxQp1r8YG6L24MlUfrNjFnzuDFhWjciBGZA=; b=qW2TAtwASU/OebUDWdpx4zhJ6a
	JBnC28B/vcu23brpHFfM2U0mvQy1Bka6UJuiXvUyoLJ+IdEJ3f4mzlAFHN753LESTB75BIfZGFriI
	/JOfc08OLNcWZs31YYVpNiP96C+J7i0IKN8FbrGpDHgZAI44rl0KpW/8z7/LY8EVnWOj/nZm2ZIQZ
	0br+wqI3JX1wdebP3kpnYGvfnh5jr/XwZIuXQ1w/4eQJ9fh+e+J+0B4Fos8j5P/JGihJxwMORNkIC
	gnxdc+L34WUFw8hFlwavKZbLAtcSI17giyB5r/od0+9D7hQ1iuoXqlNCku+MdGLxThAYCSf/+R4Ls
	zx4CsbdQ==;
Received: from [187.90.170.228] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v8KG7-008zD6-KA; Mon, 13 Oct 2025 17:14:47 +0200
Message-ID: <bc152605-04c5-50f5-d924-dc1d11b7a34d@igalia.com>
Date: Mon, 13 Oct 2025 12:14:42 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/4] Some TGL and overall S0ix debug improvements
Content-Language: en-US
To: irenic.rajneesh@gmail.com, david.e.box@intel.com,
 xi.pardee@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, =?UTF-8?Q?Ilpo_J=c3=a4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20250922230812.1584253-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2025 19:52, Guilherme G. Piccoli wrote:
> In this series, we try to improve a bit the debugging of s0ix-related
> failures, specially on Tiger Lake platforms.
> 
> First patch is a simple clean-up, while patches 2 and 3 attempt to dump
> more information on failure cases. For patch 3, it would be good to have
> maintainers' validation that we can indeed dump the LPM registers in both
> fail paths, as proposed here.
> 
> Now, the most controversial one is patch 4, sent as RFC: it effectively
> reverts a commit that previously dropped SLP_Sx_DBG register dump on
> TGL s0ix-failures. It mentions sub-states as a reason, but without
> details. Questions that remain: is it the case that all TGL CPUs have
> this limitation, or only some of them? If some of them, can/should we
> filter them instead of suppressing this debug info for all Tiger Lake
> CPUs? Also, what is the con in dumping this register, is it just
> potential bogus values or this could cause an impact on successful
> suspend path?
> 
> Thanks in advance for reviews!
> Cheers,
> 
> 
> Guilherme
> 
> 
> Guilherme G. Piccoli (4):
>   platform/x86/intel/pmc: Fix typo on CNP register name (and clarify comment)
>   platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers and distinguish between them
>   platform/x86/intel/pmc: Always dump LPM status regs on unsuccessful paths
>   [RFC] platform/x86/intel/pmc: Re-add SLP_S0_DBG register dump on Tiger Lake
> 

Hi folks, gentle ping.
If you prefer, I can also resend, rebased on top of Linus latest tree.

Cheers,


Guilherme
