Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7222A31E830;
	Sun, 23 Aug 2026 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787475970; cv=none; b=owyaBNsjJKmuflHgK3ASh1cpGZonsiKoUUr5S2Gikot5fGw9j9Egaq01M6RA1tJOmFDLQOzsXzUlFlEWMKwYgHdD0ijiSv8Wull3MJBwOEvSnCSmpUWvCxwoKJ7+CvFJFFrS2Zumq74zpH7s2JRfUUU3F3MdgsYFH2Xn59LBYTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787475970; c=relaxed/simple;
	bh=BIOVbq/Kxgiv+mg1/biVyMp4Ww0S3dHHa/buypgw3eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ifkf5CLyjgcmBJ+VRzHYut3Ywv75fHtFbardOvAngiA+rMBR5qvZc8nftsqSz1Mw/cwmQtPZtHP6fGTANmq5CbDAF/n7seR4NkqUo5etaPuJ00wpA8dNJEH3+fbFGM0vXpbeyqzidDUNF0iSuWH+HhXwxlGdFVmfSQLsbfTAaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=GQooo3kG; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="GQooo3kG"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hSSnd4ypMz4GRs;
	Sun, 23 Aug 2026 11:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787475957;
	bh=BIOVbq/Kxgiv+mg1/biVyMp4Ww0S3dHHa/buypgw3eo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GQooo3kGgDH1qR42CU8mpcusIHAD3IlDDI3DpopfSfx8hMyhdPNfcPH2GfeqBq494
	 tp4cUTHI/9mOdMi2vC7CLg4RP1H6zypp5FRPXOl7QJVY8sPIgilaBBPvJO2SJ4DuaO
	 003mRadLi9mBJetEZy6FFfHOErqYPUSwEDgzwxNtfUIl2sst8fTpUcUDUPTMzF2zBz
	 NTWtOVZl2vIq99YCQOGsZRfRfRxMDn1FULdzCTSMi641qpsiFIjEx7QEiwbloPFCqh
	 iHbJpt84xmnyfPKak1Bf8sazEAGMpjANdGZfoNaAqrxymJPzHuNj7DVA0ahPGX06yY
	 m/v692006civA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hSSnd4GYlz7xRX;
	Sun, 23 Aug 2026 11:05:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hSSnc6fGZz8tZK;
	Sun, 23 Aug 2026 11:05:56 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 116615FAEB;
	Sun, 23 Aug 2026 11:05:56 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3e64d1dc-7d33-4156-bf14-1573cde3cd0e@leemhuis.info>
Date: Sun, 23 Aug 2026 11:05:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] hp_bioscfg hangs boot on HP Laptop 15-bs1xx;
 blacklisting fixes it
To: =?UTF-8?Q?VOLKAN_SAL=C4=B0H?= <volkan.salih.06@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: 
 <CA+wWBLPxFPQB1Dt0MAJSNZ43dhGDspSD9jH98TArTf_etjLmSw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CA+wWBLPxFPQB1Dt0MAJSNZ43dhGDspSD9jH98TArTf_etjLmSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178747595632.2441704.2874934309583728851@mxe9fb.netcup.net>
X-NC-CID: i8BYNCHcTtG8sNuFxh6eS56s8fFuiRt5pYddU75jzLp42x97qu0=

Hi! Thx for your report.

On 8/23/26 02:36, VOLKAN SALİH wrote:
> 
> I am seeing a boot regression involving hp_bioscfg on an HP Laptop
> 15-bs1xx.
> 
> System:
>   Model: HP Laptop 15-bs1xx
>   SKU: 7WG51EA#AB8
>   Mainboard: HP 8444
>   BIOS: F.75 (04/26/2024)
>   GPU: Intel HD Graphics 5500 / Broadwell-U [8086:1616]
>   Distribution: Zorin OS 18.1 Pro (Ubuntu 24.04 based)
> 
> Kernel results:
>   6.17.0-40-generic:
>     boots normally
> 
>   7.0.0-30-generic:
>     hangs during boot
> 
>   7.0.0-30-generic with acpi=off:
>     boots
> 
>   7.0.0-30-generic with only hp_bioscfg blacklisted:
>     boots normally with ACPI enabled

The latter three are heavily patches vendor kernels. Please test if
vanilla 7.2 is still affected and report back if it is; if not, you want
to talk to your vendor about backporting fixes, as 7.0 is EOL and thus
unsupported upstream.

Ciao, Thorsten
> The working kernel command line workaround is:
> 
>   module_blacklist=hp_bioscfg modprobe.blacklist=hp_bioscfg
> 
> The boot reaches hp_bioscfg initialization immediately before the hang.
> The WMI GUID shown during probing is:
> 
>   5FB7F034-2C63-45E9-BE91-3D44E2C707E4
> 
> The system also reports these firmware ACPI errors:
> 
>   ACPI BIOS Error (bug): Could not resolve symbol
>   [\_SB.PCI0.LPCB.HEC.ECRD], AE_NOT_FOUND
> 
>   ACPI Error: Aborting method \_TZ.TZ00._TMP due to previous error
>   ACPI Error: Aborting method \_TZ.TZ01._TMP due to previous error
> 
> I inspected the hp_bioscfg module from Ubuntu's 7.0.0-30 kernel:
> 
>   /lib/modules/7.0.0-30-generic/kernel/drivers/platform/x86/hp/hp-bioscfg/hp-bioscfg.ko.zst
> 
> It contains the old error strings:
> 
>   hp_bioscfg: ACPI-package does not have enough elements: %d < %d
>   Error expected type %d for elem %d, but got type %d instead
> 
> I noticed the recent patch series:
> 
>   "platform/x86: hp-bioscfg: fix ACPI package handling on HP EliteBook 840 G2"
> 
> including:
> 
>   e0ddfd77c0c3 - pass validated element count to package parsers
>   1d143d78299d - bound ordered-list parsing by package count
>   40e10e6cc8f7 - accept reduced ACPI packages from older HP BIOS
>   b0e2af3ec94e - warn on element type mismatch instead of failing
> 
> The series was applied to the platform-drivers-x86 review-ilpo-next
> branch.
> 
> Could this HP 15-bs1xx boot hang be another manifestation of the same
> older-HP-BIOS ACPI package handling problem?
> 
> If so, would these fixes be suitable for backporting to the affected
> stable/vendor kernel series?
> 
> I can test patches or a patched hp_bioscfg module on this machine.
> 
> Regards,
> mr.Volkan SALiH
> 

