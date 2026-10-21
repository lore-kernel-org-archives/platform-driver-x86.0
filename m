Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594615;
	b=efUx0mOTTl4B0EoaeNKO0R0bTHqjABAVl7eBMXS3hSPil1RK5HraqysVx+BuMbUI0rOG
	 /Kufe/TtKlNpCsNUUpp6krb59E4lCcJyD3fVjx9JWb3+CJFt/1g95YCmcPRfozKivt2QX
	 BRzVURB21Nd4GoHcpdL8xxM9u4gIs7UVVoFUPfcv62vq3aUmOgmBY9Ejb7S+S+i0INo0o
	 QW3aUmkTDYWaNM2ZRkGellls6P5+okpHWgGaXrPPGeB1Zn2bt+m29/frz4Ly78VLvsmsy
	 A6f5M0EWezgDns8C1tKNnDhRSKOeSwcxsO3j3Y9b/VoQ7R77pXh5SfI6ygOi+B9tLiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=+iZS27kP8nAiM5q/eM3mC7RULw+yzeHiTMTuDv45kL8=;
	b=N6iB+S4ECV+ADXWHfXz+R20rg4D1APUw437CRkve8I5aEJFn9Yiwq+QrnAjiuO7CgKmx
	 GqPZr9sJIOm3inSD7uWFsvtvO1MB19pbBYNVODikkWc91w4poPfEHAY6Ih0BtgO1fujT3
	 5YemVnN2sft1bqdPA5kuqreuMq3I35p0RbNLmCEi0j0ZSVkbndm0FiGVWXCLuYEBhGFL+
	 NUNYIEWq+i1PM8KqsMfoc51Kn8wRDFpHRLJ6DTr8WIDeovxCA+3LPsm90svw+SbGwtLBD
	 17Qe9rOqOgNO9V8P5R7TpB/ooqQlJnH6beTFt/PNzGpdES0V+VSJOKvQWy4HknNWugw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=fZWrf7yb;
	arc=none smtp.remote-ip=188.68.61.103
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF140606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 14:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF140606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=fZWrf7yb
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j8snC1nlwz8V2J;
	Wed, 21 Oct 2026 16:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792594607;
	bh=yl4upSdxfFCRoQtZCDjpGwpDplqSFA5GP7jpyhB8f8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fZWrf7yb937teLc66XyBfN6oH9oG6hSH/jZkv6PPdPO7DNWmaPNLDPvPLEuyn9YK2
	 ActWoWsEaz5F3DBN7XFLWU6MamS9k2fg6osZqrdENJCJpSagnkPfp1yzCpufgQICE8
	 sQ+UJl3hAfcJ81gorCbnqTPX2aQoZvIsVhyWoXHACzIlpaTo4s8KoYP2y4DP9LtcO4
	 lr1aZkyjOF8oAOF3y+m8vZpc0+CbnUAR31JWDmoA9t/ICo0hOglmupRCRjRZV5R/d+
	 ZdtOU2JIr4DWwwFxS+LUte/1gw/DXJsSXtr0otPRFEBSgub1P9FszGP4tDLuIkjVmp
	 jdHZjzgMCfk7g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j8snC14z4z8V21;
	Wed, 21 Oct 2026 16:56:47 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j8sn95lXXz8svW;
	Wed, 21 Oct 2026 16:56:45 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F21435FA56;
	Wed, 21 Oct 2026 16:56:40 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <bacdb44f-a4ab-4d55-a312-5648515f41ac@leemhuis.info>
Date: Wed, 21 Oct 2026 16:56:39 +0200
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
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Serhiy Shliapuhin <shlyapugin@gmail.com>,
 "qby140326@gmail.com" <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@lists.linux.dev
References: 
 <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179259460125.1334023.14108136300815828033@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: F21435FA56
X-NC-CID: EkqYTOKKNXtDN8si/SXeNHw7l499vEnKlm59d1sQ+/wjwokCjK4=

On 10/20/26 07:12, Serhiy Shliapuhin wrote:
> 
> On my RedmiBook Pro 15 (2021) none of the platform profiles exposed
> by bitland-mifs-wmi can actually be selected. "performance" and
> "balanced-performance" are always rejected with -EOPNOTSUPP, even
> while the laptop is charging, and "low-power" is accepted but has no
> effect. As a result power-profiles-daemon can only stay in Balanced.
> 
> This is a regression. With Ubuntu kernel 7.0.0-38-generic [...]

Can you avoid it by blacklisting bitland-mifs-wmi? And does it still
happen with vanilla 7.3? 7.0 is long EOL upstream (and 7.2 soon, too).

Ciao, Thorsten


