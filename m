Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74931408031
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 22:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288896; cv=none; b=m0+p9LwS4JZol5hqba13jmon4vssz1KizTCGJRhu2Fz5aYcwe7UCt88cMW7vFOCwn8fJOh3dzf+qSM2bq/LDWRkOqQKmBdUr6pnpOKGCO2lPMFJ70SOnsjneT+paBSaiBYBgUWDy99qWlFOD8qrDvfedU2ywQkmitTVxW+WHlcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288896; c=relaxed/simple;
	bh=R8ReyzejurCcDiDdwoA9Qd4DPWWEHhTuzlaTC6Fgs7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sdNWGUvLT4lIsJ+70WSS5vQ9bveZZJI79fDGjW7aTvTvf/+2iIJ1b8xYGGekBL87adY2JpgBbWx1U5DGr/IhvXuuJ4O9gCvnzco1Dh5LPTRbR1fMloPQVMVDmbx9yOYWtdzEF/4zqC+kKL1M9T/2imwZTsGD9kQDsfnFUCme0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KjnOBXPp; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KjnOBXPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790288891; x=1790893691; i=w_armin@gmx.de;
	bh=j5ywg6dfCs6T3mp16ivP5iuaQ5csQ/MO/oLo0ZXab2Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KjnOBXPpvDkAlqbzDtE2jnkxKVVT5z+cPfZods9hqO4EeDyUGFWI5+RBFfiJBY66
	 t9qWsu0GuNIQLhDBApdD95EkWbcvZxem/edn/OrZaoU1gG1u1V4rC/rzMcEf9deNj
	 UhLbNOSuTYAjPwOJtFUWW151yiqv2Ns2AAEyTDwRydWfhFZBy67Ihzb9HDOF2AqLV
	 ilh+etvYcSTLxAEIlsnf3CrdB1Q1sbbcBDuEYyN8oEHR6pmWw8qf7IZ+BbAKpOGJn
	 G+OiaGSswxnxSWL2KjysBSELoqiTeOosYdvRv8cYMI+UTxPhe+k1db2k16EeNe0DG
	 pd2E0K5hXSd54yzitA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKhm-1xPuSn2ylO-00JDSa; Fri, 25
 Sep 2026 00:28:11 +0200
Message-ID: <3051fb4d-b344-465d-bb86-b2c2c19eece7@gmx.de>
Date: Fri, 25 Sep 2026 00:28:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] acer-wmi: add Aspire A715-79G WMI GUIDs and EC fan profile
 support
To: Muhammed Anas <muhammedanaspaika@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <da17da33edc92ca4a33a760ac05815a46c767844.camel@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <da17da33edc92ca4a33a760ac05815a46c767844.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:W5YCMjKNNFTYAa04DSt0yhi7560Gjtu3S2CcOutHyHoxtdqQQW7
 lAheZyehJ54S4v4IWMvpA3pgEcvCGMMIQJxFXiTeYcXm3kvnpVMOLTMDQfvIIZZMnEjVA+h
 r08O+C7rDuGY0G8S27mhFpazCFAQr+w6lcNvmjhsGjqy0+/mqGFJ9K6+BgpOTDiAUdbzGgG
 ucmhGSh+pYk7VmzM9Nl2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ESBNIMMNkXQ=;q6q14sXTWbP/qrmUjqilXnOYNcK
 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
 y8ff

Am 24.09.26 um 14:00 schrieb Muhammed Anas:

> Hi all,
>
> The Acer Aspire A715-79G (ITE 8222 EC) exposes Acer WMI GUIDs
> ABBC0F6B/ABBC0F6C/ABBC0F6D which are absent from acer-wmi's device
> table, so the driver does not bind. Consequence on Linux: the EC
> stays in its default (quiet) thermal profile and the fans never spin
> automatically at idle (60-75 C); on Windows they are presumably
> activated by the NitroSense driver via the EC profile command
> (unverified).
>
> Reverse-engineering of the platform (DSDT + register experiments)
> shows the EC selects its fan profile through the \_SB.WMI SCMD ACPI
> method:
>    SCMD(0x69, BIT(profile-1)) with profile numbers 1-4 mapping to bit
>    values 1/2/4/8: 1=quiet 2=balanced 3=performance 4=gaming
> Setting a profile at boot restores automatic fan control (verified on
> 7.1.13 and 7.2.5: ~2700 RPM idle, ramps under heavy sustained
> all-core load; partial-core loads do not move the fan on any profile).
>
> Proposal:
> 1. Add the three GUIDs to acer_wmi_id_table[] in
>     drivers/platform/x86/acer-wmi.c.
> 2. On probe (or via platform_profile), select the EC profile so stock
>     kernels control the fans automatically.
>
> Full evidence and a runnable reference module live here:
>    https://github.com/ancxanas/acer-ec (docs/reverse-engineering.md)
>
> Happy to test patches.

I am afraid to tell you that those three WMI GUIDs come from the Windows
WMI-ACPI sample code, so understanding the purpose behind them might become
very tedious.

Can you share the output of acpidump?

Thanks,
Armin Wolf

PS: Did you use a chat bot for your reverse engineering?

