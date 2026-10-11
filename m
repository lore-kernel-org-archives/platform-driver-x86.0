Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A153ACF1D
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 23:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760352; cv=none; b=jlapIps1swhTCbSKRN7+TNZKHwGLBNZnKj7OABs+OpdYAHx52GGOrFU3yYML6PMEZAjE1SA7FrC0WXaR6wfcIxM6xo4NBNg+bQoRi+s+77CsJzohvGLk9xzEu/ctB070N0uu7jhTk1GvzqMllhMi5A0XQybUkgwS1ldEvJxTwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760352; c=relaxed/simple;
	bh=aIY1LJMf+ogG/k/TaIlH39shHJD1zBBT9saPWgDjzaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cc+ZmTIIrH+qI1jVdOyeMHUfSJaaPIvnOdD3RDF0XVMr0Na0aeGPOixxLMc/5FVzKX//wXtJQhpzlUbz2UvXfMZcs9NsMPmAP0LpOj/PavLqHyqltj7OjyadUnjCifAMkDh9oufkHO6G1gX6ZeqreGFdoU4pgqiu5KxX2sC/ceE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RtFiItqr; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RtFiItqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791760348; x=1792365148; i=w_armin@gmx.de;
	bh=aIY1LJMf+ogG/k/TaIlH39shHJD1zBBT9saPWgDjzaU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RtFiItqrbW2DhXzNOE7Ptq3vU7eEu9yQEvel4hhfzZ40Ta/aSjYs0L0dRbKrx2OH
	 b8NeFIfFOKvs87ZLrrofIqfTXX9KXYHy/Z4qiw3aliVRjRt64cB0m2h30PXjY11Xt
	 AVL73Qv0mlDr4QOzIx19lhmW8suyy4ghWlwFl8pJLoSnG2ymKuG/7kcXRbeSEbklB
	 QznNaGpWV2TP2wmss78S321BaWAJCTkAdGNoL7joBuSOxb3Ci+0KMjR7bqSc3gLTp
	 CpwT55SfVZ8QKM/drWpKBemwQJp45g1gPHav81RVruwZnnttGkys+gZGExFpNTuSW
	 zR1yzqu/joNKxkrRvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpap-1wnLH90Lgl-00po0l; Mon, 12
 Oct 2026 01:12:28 +0200
Message-ID: <29b9df2d-b7a1-4b2f-9d46-30aa04e4a943@gmx.de>
Date: Mon, 12 Oct 2026 01:12:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Hardware support request] uniwill-laptop: MECHREVO Yilong15Pro
 GM5HG0A keyboard backlight
To: bifangknt <bifangknt@qq.com>
Cc: platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <tencent_B151EE01B6705AB1C44E1D81C38D9D4C7D07@qq.com>
 <750f97be-7d45-41b1-84e2-3fbb9229f602@gmx.de>
 <tencent_EAAEE9BC1F36ECF8E88372E7B025D0AA270A@qq.com>
 <1720cd41-9685-4edf-9653-511c396b2302@gmx.de>
 <tencent_8D0E2B7612F49BB973D94868D7129175D809@qq.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <tencent_8D0E2B7612F49BB973D94868D7129175D809@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:om69M5avtDuJ8dI+I75589jFmC1WfQ/Dv2j2AlP4JcAlVR6RJTG
 qLOJq421k+BWBuV3UwAEh9AtV0Qu/ekNHodd5UVnjHK/t1D5KdY6thFpVYEqhQwda2wCkPp
 XcT6kFN0VAfIefOrarLOHGiEjOnaqub/TzQOaoz4HhyZRdwk7dQBWISAE8tnKuuWr+kpz8a
 KMwxcVq9GExwgSB0LH/Og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y3Juk2LEudw=;c9Fqwss5DDNNEfEPDkmlEq6ePo2
 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
 ZNQqcGmA==

Am 11.10.26 um 06:01 schrieb bifangknt:

> Hello Armin,
>
> Thank you for checking the ACPI tables and preparing the patch.
> I appreciate your help in getting this machine supported upstream.
>
> One small clarification about my name: I previously signed my emails as "bifang", but I would prefer to use "Bi Fang" for attribution.
>
> This is my first involvement in Linux kernel development, and I would be grateful if my reporting and testing could be acknowledged in the commit message for the patch adding support for this model, where appropriate.
> You have my permission to use the following tags:
>
> Reported-by: Bi Fang <bifangknt@qq.com>
> Tested-by: Bi Fang <bifangknt@qq.com>
>
> The Tested-by tag refers to my testing of the modified driver you attached, including loading without force and working keyboard backlight control.
> I would also be happy to test the final patch if you need further confirmation.
>
> Thank you again for your time and guidance.
>
> Best regards,
> Bi Fang

Alright, i will CC you on the patch series containing this patch, so you can give it a try.

Thanks,
Armin Wolf

