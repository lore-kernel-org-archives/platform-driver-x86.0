Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6623B7B68;
	Tue, 28 Jul 2026 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219070; cv=none; b=uc8Ov7M4i69pbze7uiAxiR7bZgOXgSo8CcqoM93TAWRtzYov06xdVr6WlgyaMkCpDabz+LmSbxtAaruPCm+KqXGKwUk8PHtriISYJKj1X3oaZfN/SY5bMZr1stO1SQy0ZTnCg5nz47dWph4HJsihp34Q9lNCJex/IAHJwT3GwVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219070; c=relaxed/simple;
	bh=tUwwtLcKBVqyZVLoi8+lfkpXgSjN4C+d7KAkw5Ea6sk=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=coI6FOA0nsWnioXC2VqcoI+QlT6Boxqg5TfCz/MBAIYk2rhCDuaKt5dlrBjs8C0bFCyQXguGSIh55S26Nvp/bSiykZ5ReVKHoZX6AkNhc8hcl61sFqElpE2c5P8HM2VKOrUj+RwWpt0JepO5eljRUWEYcAJxyIt/Li+XkfeZ05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=j8Yzu4P9; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="j8Yzu4P9"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h8Q7g6dbLz8fL5;
	Tue, 28 Jul 2026 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785219055;
	bh=tUwwtLcKBVqyZVLoi8+lfkpXgSjN4C+d7KAkw5Ea6sk=;
	h=Date:From:To:Cc:Subject:From;
	b=j8Yzu4P9aEiPLSYYFVGEIRKODSOdvfuN4WS2hE7IS8mCMP++h3uF1nctDRc1K27Z2
	 ThICLMwEDQrdr9rOk6Qf1gXnkrYP0ZNmL90dxFm5OEcdwZxf88HCEmcCLS1bnW1wBt
	 a1xT2xm7n08YvCWBS9vXF0VGMoDj89lSLdSzGQ2WOyEFD7j9QBueugCNe06v7zmVDQ
	 wpw+Y93IL9ZJrplsEDOBNms+ElApWIurABDC3ICkwAMo35WpExZs10H5n3CY0ooodQ
	 VcHrvBCRS0Pz8ZH8juAmUH1z+zEh0hXEbjCiiMkf+IIR7itcQ9YO+szwJwSWXU2cE0
	 j5qTcBpjsrblg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h8Q7g5vzTz8fB9;
	Tue, 28 Jul 2026 06:10:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h8Q7f11f7z8tbR;
	Tue, 28 Jul 2026 08:10:54 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5BF695FC31;
	Tue, 28 Jul 2026 08:10:49 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <56f2c589-2133-417d-9bbd-2c0b11b83c87@leemhuis.info>
Date: Tue, 28 Jul 2026 08:10:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Policy: "routed through for-next, ... unless introduced in the most
 recent cycle"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178521904965.87908.10676855622621531461@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 5BF695FC31
X-NC-CID: mHwVQd/matapqDOxoPShP+QBeQ2LyHXGEiHySy40crPnGvbuNhg=

Hi Ilpo! I stumbled about a few messages of yours where you apply a
commit for later mainlining were you wrote this:

> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.

Could you point me to the source of "per Linus' policy change"? I really
wonder if I missed something, as from what I know Linus wants fixes for
regressions in all recent released merged quickly (e.g. in the current
cycle), unless very dangerous or so. My knowledge is among others based
on this statement from Linus:
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/

To quote:

"""
And yes, I do consider "regression in an earlier release" to be a
regression that needs fixing.

There's obviously a time limit: if that "regression in an earlier
release" was a year or more ago, and just took forever for people to
notice, and it had semantic changes that now mean that fixing the
regression could cause a _new_ regression, then that can cause me to
go "Oh, now the new semantics are what we have to live with".

But something like this, where the regression was in the previous
release and it's just a clear fix with no semantic subtlety, I
consider to be just a regular regression that should be expedited -
partly to make it into stable, and partly to avoid having to put the
fix into _another_ stable kernel..
"""

Is there something newer that invalidates this?

Ciao, Thorsten
