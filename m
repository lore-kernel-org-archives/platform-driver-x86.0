Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC0380FF1;
	Mon, 31 Aug 2026 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202184; cv=none; b=rljihJFxrjTojTXf3CXW89e9s2oUjcEca89dndj8A6V94nzB6oaw23HJL09qB/lqHmHiq76ANwvcsqkYXNhvMQJhnrZxqj0jqhCKCOFkoFzJhS3qHz8a/4L2Ezoz7RfAsDyYQx7L75DBEOzQgQWPlmSRCwvqC9HzCPn+xZYuEgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202184; c=relaxed/simple;
	bh=hTGudjtpdSOtOrAOCrFcB4XC3BXnwQSa0ef2M+jtzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PddE8C+gb1WHiyn46hmeOPr5ja5L5Jf6i8hmRh0U3T82bRh+B0yjkF+zWhHUIAOmFrJxBSWHhvQC9umI3M6Anh+OgFsGuN7GDXX13FBLT4//xn2au32V9mK/Bvp8umm8RxHEKbUUEpdg2OSGE+3mBe/xJdFo0GcbQHTGJhCnM0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=EG3KKG1N; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="EG3KKG1N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UV1gM1U2p8jHqQ3spHsXWtQidWRgEuz/1lspV0W9kXs=; b=EG3KKG1NYSezy0W2lQR8oHm7i0
	WNb40Y+XQZuUZcqmN3KOGHCmHV/A8HNJZD1g+dvQBdkGQR4ot6rquFFDG0eq2JG07nUmU0alIH8s7
	ZxrUnygvGBjnXNlsaczsk9GS3UhaXG6JF16mBLyWqAjCRiLcsj1xOdWTa4gmjzO31ydd1z+4evLEl
	pVZ1RqtgbNG3kO02QnDuqgSDBKih02e3g+soJ1YMZuInPIHN7yiJg48513KArp9dh9xTazDbyG8Xv
	qhV0ARfDffisIp7XR0YTm2SXVPqOMcfpZiY4yqpFdhYwi7MLDrqlWw+PX34SW6rbc4thmo2OvKsBp
	oKhgfIpQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x174Y-000BE3-1P;
	Mon, 31 Aug 2026 20:49:34 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x174X-000He4-2J;
	Mon, 31 Aug 2026 20:49:33 +0200
Message-ID: <3a8985e1-77b4-4127-af0a-ec1c397eb1ad@computerix.info>
Date: Mon, 31 Aug 2026 20:49:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
Content-Language: en-US
To: Tim Chen <tim.c.chen@linux.intel.com>, "Chen, Yu C"
 <yu.c.chen@intel.com>, Mario Limonciello <mario.limonciello@amd.com>
Cc: "Badole, Vishal" <Vishal.Badole@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 platform-driver-x86@vger.kernel.org, K Prateek Nayak
 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28109/Mon Aug 31 08:24:07 2026)


This would need some more testing efforts,
because all my kernels are built without debugfs
(using an earlier version of Mario's patch),
and without Mario's patch and without debugfs,
I don't get any big/little scheduling at all.
So I'd need to build and test with debugfs
(tomorrow I'm on a mountain tour, perhaps later this week).

Prof. Dr. Klaus Kusche
Privat: Söllmnitz 32 d, D-07554 Gera/Söllmnitz
036695/859909 klaus.kusche@computerix.info https://www.computerix.info
Dienstlich: DHGE Gera, Weg der Freundschaft 4, D-07546 Gera
klaus.kusche@dhge.de https://www.dhge.de

On 31/08/2026 19:29, Tim Chen wrote:
> On Mon, 2026-08-31 at 13:24 +0200, Klaus Kusche wrote:
>> Hello,
>>
>> both patches in combination seem to have the desired effect.
>>
>> But I just look at a bar graph showing the current load
>> of each core. 
>> The graph suggests that long-running CPU-intensive processes 
>> migrate to fast cores when fast cores become available.
>> And I have the impression that LTO compilations
>> finish significantly faster now.
>>
>> I don't have exact numbers or benchmarks.
> 
> Thanks for testing the fix.
> 
> If you just apply https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/,
> with default aggr_tolerance, what numbers do you see?
> 
> That will be helpful for further tuning.  Thanks.
> 
> Tim 

