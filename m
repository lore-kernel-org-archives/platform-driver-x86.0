Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C586149C54;
	Thu, 26 Dec 2024 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735193022; cv=none; b=rthM9guT4MH6WACovZXXeF38sBDJSH2To+VxxwnQyC6sTnUXRUEMra9cXL+agqlQ1HHfIeK9i5Uc97d4OExrK2HreNjJqubyQ+lghkokQ4NYbPF1f3l9+TeXlzzGu0JOks/n7rv0rk6TZ9MYplbiSvpf8O4D/p80ViJvh+mE8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735193022; c=relaxed/simple;
	bh=L2SqcaWG/bY9uKtfEK0xRQ+D9GeSPTqhuskElDHEtik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1mq1wQoTilBhTcHKWcLLg1aKeP7fVpg77XmiLw14+aYUyPLgxs1l3UQZl6NJf0TWr6YsuEk5fACupuFOvS+3iKLXvssNHUSGTuJNU554EPwvR8wKipDHoqMv4HPIyI254JFxIMBxy0ES4wyWwXZW0aIoa4aRRqqSyYpe0l9nVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=fKpYTIx/; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="fKpYTIx/"
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 5C8C920179;
	Thu, 26 Dec 2024 06:03:33 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id DF32E2675E;
	Thu, 26 Dec 2024 06:03:24 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 3DF463E8D6;
	Thu, 26 Dec 2024 07:03:17 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id A170040078;
	Thu, 26 Dec 2024 06:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1735192996; bh=L2SqcaWG/bY9uKtfEK0xRQ+D9GeSPTqhuskElDHEtik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fKpYTIx/pKwwtZRwrAqWjsus81kLAk70O33mDIPyv195j05c/qrhWQ7Vxc2kwz8w8
	 WrNtF7gir081CsfU/LpRGl7F+5OCjUAr0wTNlX3On0KBWGNk4iO8v7rrmtJAZPJEck
	 oQf7kcwxaOZoi2s3sKU5oTHvrdOEJ/4JnmqxiNZo=
Received: from [198.18.0.1] (unknown [203.175.14.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6F51D40CC8;
	Thu, 26 Dec 2024 06:03:12 +0000 (UTC)
Message-ID: <7c5bdef1-9201-4d38-a6e0-6acd95d8aa38@aosc.io>
Date: Thu, 26 Dec 2024 14:03:08 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-wmi: mark 8A15 board for timed OMEN
 thermal profile
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Alexis Belmonte <alexbelm48@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 Kexy Biscuit <kexybiscuit@aosc.io>, xiaoxi404 <1577912515@qq.com>,
 Ai Chao <aichao@kylinos.cn>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20241223100748.2157703-1-jeffbai@aosc.io>
 <31f0819a-1a56-8f40-b898-76ed113ef545@linux.intel.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <31f0819a-1a56-8f40-b898-76ed113ef545@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[1577912515.qq.com:server fail,jeffbai.aosc.io:server fail];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,gmx.de,aosc.io,qq.com,kylinos.cn,baylibre.com,vger.kernel.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,qq.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A170040078

Hi Ilpo,

Sorry for the late reply but your email fell through the cracks.

在 2024/12/24 03:15, Ilpo Järvinen 写道:
> On Mon, 23 Dec 2024, Mingcong Bai wrote:
> 
>> From: xiaoxi404 <1577912515@qq.com>
>>
>> The HP OMEN 8 (2022), corresponding to a board ID of 8A15, supports OMEN
>> thermal profile and requires the timed profile quirk.
>>
>> Upon adding this ID to both the omen_thermal_profile_boards and
>> omen_timed_thermal_profile_boards, significant bump in performance can be
>> observed. For instance, SilverBench (https://silver.urih.com/) results
>> improved from ~56,000 to ~69,000, as a result of higher power draws (and
>> thus core frequencies) whilst under load:
>>
>> Package Power:
>>
>> - Before the patch: ~65W (dropping to about 55W under sustained load).
>> - After the patch: ~115W (dropping to about 105W under sustained load).
>>
>> Core Power:
>>
>> - Before: ~60W (ditto above).
>> - After: ~108W (ditto above).
>>
>> Add 8A15 to omen_thermal_profile_boards and
>> omen_timed_thermal_profile_boards to improve performance.
>>
>> Signed-off-by: xiaoxi404 <1577912515@qq.com>
>> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> 
> Hi,
> 
> I wanted to apply this but the first signed-off-by line threw me off. It
> should contain person's name before the email address line like yours does
> (assuming the first signed-off-by is necessary in the first place, the
> patch itself looks quite trivial given it's just about adding one ID).
> 

Understood, but that is how this person represents themselves online. If 
that is indeed a problem, I can consult them for how this should be handled.

Best Regards,
Mingcong Bai
