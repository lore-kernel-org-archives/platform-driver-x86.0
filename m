Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF902DBF76
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 May 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879386; cv=none; b=ZfVHwuZI3fTqhiUQskkXrgh6+SuZRMJPIP9sQIWp7vHaLQhdqcnRbBRPSdcEAs//dOj+wKn8jqyYQ0mUSFNKop2+VNMVh9b1fqgeTh3SfUB6pFVJmnS3wRtjT7EQ1iHpsxXHYAOO599mGnS6uSVVsR4g4X8VPVFKGT0awdKcPHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879386; c=relaxed/simple;
	bh=t6NYEMUouDBm+YDlmQnoIPvFQi4VWA5FQFO6UtsjjzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Msq1c4k4Xwd8NfNtOx0IKNKM8+pWizMJ9gnpc2Or32mre7KGDT3ru0pF+tNFxtC87B/HJ0sUUS9eCTg4993UpX3C8YLn/PGpl8mJR6Rlf3bnACiYEdTIwAkRr+bXZx9wpJf5j5iFVJBLKoRBqTNPF5Rtci3rsPMLUoUy6N1N7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jIGU/gPe; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jIGU/gPe"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g8ClM30Kfz64RN;
	Mon,  4 May 2026 09:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777879343;
	bh=t6NYEMUouDBm+YDlmQnoIPvFQi4VWA5FQFO6UtsjjzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jIGU/gPe9csztd7cIAzL8syb3Wti5ymlzfDuuiRkGI15gDkXxwMYm9uXsDGaqjb2j
	 +FcoSvn5h4L9zco1TPPyyI4bM5CEzey/RjTCTq5rsS1ooAusyDXGLB6NFsU8TMC5hn
	 eQ/67whIIAwWl0SFP5OwfN0pJ2scXYolqUOjACulAvHVNruEHQxDe2iyVDxr7GfELw
	 7Y4vOzpPQbZCsIiPmb7ZuwCg3ADAYw4tjGmOsESev5bZh7FCcXSUs4IceKvSUxayMZ
	 EOLM1lWKDkoZmjaaKr+PbJLeQWqfK12JW4F3OebVftiBgMvumipmFqmycYTq3TXOfP
	 NetBnNEFgF+oA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g8ClM2HjTz50Mc;
	Mon,  4 May 2026 09:22:23 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g8ClL5DGVz8sZg;
	Mon,  4 May 2026 09:22:22 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 457E66344D;
	Mon,  4 May 2026 09:22:22 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <38bef028-d574-4e7a-b857-f10ab6796833@leemhuis.info>
Date: Mon, 4 May 2026 09:22:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] hp-wmi fails to probe on HP OMEN (board 8D41)
To: Krishna Chomal <krishna.chomal108@gmail.com>,
 yue li <mc.root.ly@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: 
 <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com>
 <afb0f9gaS5z_SmRX@archlinux>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <afb0f9gaS5z_SmRX@archlinux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177787934254.492545.9723547086132448185@mxe9fb.netcup.net>
X-NC-CID: 7Zrl8g7eefazJq4/4dMuw4z4Ax06va3kwZ2trkre2l+VYg+WhRQ=

On 5/3/26 09:26, Krishna Chomal wrote:
> On Thu, Apr 30, 2026 at 12:59:58PM +0800, yue li wrote:
>> [...]
>> Regression:
>> The hp-wmi driver works correctly on kernel 6.18.6-zen1-1-zen,
>> but fails to probe on 7.0.2-zen1-1-zen with error -22.
>>
>> Issue:
>> On the affected kernel, loading the module fails:
> [...]
> Thanks for reporting. This is a known issue [1]. There are 2 failures in
> your dmesg output:
> 1. Unknown EC layout: The fix for this has been sent recently.
>    Currently, it is in the review-ilpo-fixes branch [2].
> 2. Probe failed: This is due to a failure in parsing the fan table. The
>    fix for this has been merged into 7.1-rc1 [3].
> 
> Using kernel 7.1 (or applying the above mentioned 2 patch manually to
> your current build) should restore full support for your device.

You you then maybe be so kind and submit backports to the 7.0.y stable
series to prevent more people from running into this?

Ciao, Thorsten

> [1] https://lore.kernel.org/platform-driver-x86/4ae4d7f9-f1db-4394-b0d9-
> c75dc39afcf8@gmail.com
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-
> drivers-x86.git/commit/?h=review-ilpo-
> fixes&id=c2d4b76458c9ebf81eae2916970320f1f61ad002
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> commit/drivers/platform/x86/hp/hp-wmi.c?h=v7.1-
> rc1&id=9d317a54e46d3b6420567dc5b63e9d7ff5c064a3


