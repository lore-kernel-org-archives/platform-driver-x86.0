Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A742FCDB;
	Tue, 28 Jul 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239997; cv=none; b=VFrfyCVy1TPhVK5j9Z4+NQvL9UBPrkRPRgUSJNVQg5OPFaCtxuCj0w3Zb1TTrTtcpJp16tfaR/ZZIK3hRqE2eb/IwhtiEqikDy48v9PCcuz/K8LoVYmDiTHnl5s53F0bd/zsrwKoXvl5UHH6FqeK5y3q9UJ/NQ/wSH6PnBDewX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239997; c=relaxed/simple;
	bh=6iGHSb1YxFl+QTAiAng109nVByl/3q0N+OOEO3YYHTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ml0QE9cu1OyjKHnes8YjLKtU5H5PaAoOo0gRkLbnH9oWFnUkuGaUiUz9f2j3IpQ1yRpRFjG4th5Xaj1pSwT6sjRVAVahVFGA8XNCMaAW1d/O9BuNGc7McUgf1EzTIC420DW0V5ziHHQ2DUDRnjoz//xvh/fd6FRT7jsX1QQw2a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ivO3MorK; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ivO3MorK"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4h8Yt32zfzz40Yb;
	Tue, 28 Jul 2026 13:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785239979;
	bh=6iGHSb1YxFl+QTAiAng109nVByl/3q0N+OOEO3YYHTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ivO3MorKZVwDdIzVjNmzkSgJRsNc/eiihKry6Ma8FpPr31hLBQqr/wfC2fgirqxFv
	 J3/pIMD40qMh8YBtPmacJ0bo+sIsTHo3sCAR6ERrTBTBOZ6ZyoS093+Vu3EV4P5KhL
	 vdya0Rcy5LaRqlDW+HO39SVLYCcMlwovRI8N7vqpxYRjY+2wuhl2TitF7QIHVkOXGx
	 dicuL8YtOL6y1Rl4AGHAb8wfudKkNeN6WjELGwkMIJJQJ8ozpYaaJbATSmEIP+FDWn
	 yd4ej6h7IFCdKDzYpvjKWCy4jT+wB0+i1ZgHadKFMUCO1hUe4AuZhkEOC2gg1n4zel
	 40N4s18W/5wZA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4h8Yt32DtXz40MT;
	Tue, 28 Jul 2026 13:59:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h8Yt22jKCz8sbj;
	Tue, 28 Jul 2026 13:59:38 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1CC085FC55;
	Tue, 28 Jul 2026 13:59:29 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3c76ba49-4e19-4bb1-83f6-805dbfb5bcaa@leemhuis.info>
Date: Tue, 28 Jul 2026 13:59:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy: "routed through for-next, ... unless introduced in the
 most recent cycle"
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
References: <56f2c589-2133-417d-9bbd-2c0b11b83c87@leemhuis.info>
 <28ffe1e4-bbbd-3945-bb8f-f372d825d0ec@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <28ffe1e4-bbbd-3945-bb8f-f372d825d0ec@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178523996943.624316.18411309507579081375@mxe9fb.netcup.net>
X-NC-CID: 70wUwKT8QKDG6vffWw2RQl18uMbGxgS3TpBIbTC0JWt0agYzi0E=

On 7/28/26 13:39, Ilpo Järvinen wrote:
> On Tue, 28 Jul 2026, Thorsten Leemhuis wrote:
>> Hi Ilpo! I stumbled about a few messages of yours where you apply a
>> commit for later mainlining were you wrote this:
>>
>>> FYI [if applicable to your patch], as per Linus' policy change, also
>>> fixes are mostly routed through for-next unless the fix is for a
>>> commit introduced in the most recent cycle or is clearly a regression
>>> fix.
>>
>> Could you point me to the source of "per Linus' policy change"? I really
>> wonder if I missed something, as from what I know Linus wants fixes for
>> regressions in all recent released merged quickly (e.g. in the current
>> cycle), unless very dangerous or so. My knowledge is among others based
>> on this statement from Linus:
>> https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/
> [...]
> What I'm referring to is this policy change:
> 
> https://lore.kernel.org/lkml/CAHk-=wjt1NiKOdyAMz_DT7NmZ++SizPOhRSi492ukdTnpDzHQw@mail.gmail.com/
> 
> Perhaps it's just misunderstanding of my wording. [...]

Yeah, words is not as clear as math, and even the latter sometimes
leaves room for interpretation if you are not careful. :-D

Many thanks for the detailed explanation, now I understand your intend
better. It's just that "people queue fixes for recently user-reported
regressions in for-next instead of mainlining them quickly" was one of
the biggest problems I saw when I started regression tracking. It got
better, but there is still a lot of room for improvement, which is why
that short note got me wondering what the exact meaning was. But seems
we are mostly in alignment here.

Ciao, Thorsten
