Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A73C0635;
	Tue,  2 Jun 2026 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389395; cv=none; b=dp7esdhvTDt+vqiUXBNHOZzgAIZ+LRhq2DztZb806VvQi/CBVt22jXczERXdluV2NPHTWa3GmfFJ2eSGL4JCraTfHDDFixxdTah0AEH5TKaWo/P4FnWvOBiZ/9dNBMqMO8lk83LvaJpbCjvYCE6Lb+7TZlYekGU7V/HUYLQIuCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389395; c=relaxed/simple;
	bh=QSfmnQGPwkc1pwyTVWPynfa4KKGr3RF/KCduufxZ9GE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LqI4tcyFH5i71HOWXf2Z3k2cr8e2Q2tRIBYP+LX+cGksAaVs3hJ9vZJrIwU3XxhzTDNxrP5WWmYj1S5GOrHXW6KNGhOAoVsYMkbbVIBHTno3/xrTDMB8uu6CwPascnDB4+ckbjPohXhH8i6ACjg4yOq0UMnmCD6k6F/M66bgZd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cSwdHOW2; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cSwdHOW2"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gV41X49mhz668G;
	Tue,  2 Jun 2026 10:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780389392;
	bh=QSfmnQGPwkc1pwyTVWPynfa4KKGr3RF/KCduufxZ9GE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=cSwdHOW2blDjXc/RC6bVeobiU3NBG6IXT+4cZDAoIccpCSGhk5cDgzWKHXR3enXm5
	 ieFBwXpMfCSgaGauxtSGS0kLlz/mSsw5T9HkyQqFHC5x1p190pPmDpQjFjnI9devsG
	 TSzgPx3p721sXBn9FhLOp16FtcuKTpvbK50zN0jW14EM914jqEhIs6+zjx9CnXhqhf
	 7bB8V+fzcHfDOxjlKrv0cQMFzbNopBGIYY4mRw4SMsUj/6J0lN/fYRH2goDlmd2rWN
	 ICZkWFA/EEkcjU+vqIuuUKnHeQsxNmg1uxczUBSPior8ngnD5QtThTG0A8GhKnjiP9
	 nxQv8E3xbtrBw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gV41X3S20z4xp2;
	Tue,  2 Jun 2026 10:36:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gV41W3Gp3z8tYd;
	Tue,  2 Jun 2026 10:36:31 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C606960345;
	Tue,  2 Jun 2026 10:36:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b00ba475-fc58-4be3-82f8-5fdfdfe70303@leemhuis.info>
Date: Tue, 2 Jun 2026 10:36:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kernel
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, moravec@ukf.sk,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <4fb7bbf1-466e-438c-a301-e118e7e2a225@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <4fb7bbf1-466e-438c-a301-e118e7e2a225@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178038939110.3788222.13934239099803645351@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: C606960345
X-NC-CID: iMI2/wKsvZqAng/GaMty4XffXCekFGufQuf1quVqKbbOZj+RL6I=

Resending below mail to the platform maintainers & list, maybe someone
here might have an idea (I had miss-read MAINTAINERS file earlier and
sent the mail to the HP WMI Sensor maintainer -- uuphs, sorry!), Ciao,
Thorsten

On 6/1/26 17:58, Thorsten Leemhuis wrote:
> Hi James! I noticed a regression report that might or might not be
> related to hp-wmi; to quote
> https://bugzilla.kernel.org/show_bug.cgi?id=221569 :
> 
> """
>> Hello, I'm testing 7.1 kernel tree end seeing much louder fan on my laptop even when system is idling. CPU fan is spinning nearly all the time even CPU reported temperatures are low. Currently:
>>
>> migo@migo-HP:~$ uname -a
>> Linux migo-HP 7.1.0-rc4-00685-g4cbfe4502e3d #45 SMP PREEMPT_DYNAMIC Sun May 24 12:47:18 CEST 2026 x86_64 GNU/Linux
>>
>>
>> In 7.0 kernel tree is my laptop much quieter, fan spins only sometimes and with lower RPM.
>>
>> Machine is: HP OmniBook X Flip Laptop 16-ar0xx, with Arch Linux installed.
>>
>> Is there any way I can make more exact/useful report or debug this issue?
> """
> 
> See the ticket for details and kernel logs, I asked a few questions to
> hopefully make things a bit easier for you.
> 
> Maybe you might have an idea what's wrong here; if not, I guess Milan,
> the reporter (CCed), must bisect this to find the change that causes the
> problem.
> 
> Ciao, Thorsten
> 

