Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC51A9F96;
	Sat,  5 Sep 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622876; cv=none; b=OKq2mHt1r7+/q6w2qT6C4lrgMnR+tK6OxPovvV7qGWpikdRx8JcGADl4SwRCLiIfylxsMhydYJ5IYK4QUZIBlK3zzAYBhbSPsdRW2mk2N1jMTmaeiwjGcaNhIgBF57PmQzR4ML4F9w1e6MQCWgv2rcCKvOOSody7TQ8t9++SpNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622876; c=relaxed/simple;
	bh=W0vqP7ZDXWAayUQvdP1iDcCGosmxbiO6PbWb8Yu/AZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvRs5fHA/lrnO8LTSjvG0gxkHYxJ2ugsCu3vcNUtFxgrSQDuP42NrIbZfRWtQYHxeP/vTi7FhZUn5oo14/5BV+Rd5MkecOXy7BaS1bkTZVQVJ7Sx5gaKEYYumajoUhYekO5pk3AgjDnny10doX7Uyp+BJwqqk593iOZ5sCkIGjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=oytu1VGI; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="oytu1VGI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=SCh+61Iwqro2r3rqpqY2xI3Sn0uPvozbHukCZz+Sx3Q=; b=oytu1VGIceAhDrXH9MVK9mcOVh
	zsVwbr3ZWei+XbA3okDIgh9xDUgToSjQM/eFBKCBo6aEQyzBk7AjGPZ6sbe/wEX8xHkPDlJRm92nr
	NvTBbGOPhEn5fMGplTLyN6juWBLGthT6xnJ+QP1cgxl3glU5zcmMz6zXEPqbisV8pi2kyJu43+dVX
	KjgENcT9z6M2aLgcvnBKxXniLKdGGvK6M656Iqa2VFA+gMXvdvTA3mEnagdkHNMg2zXqME08zyak0
	XToIdFjADp4d3MXYWTRwVL0x9h7KyMCtqsPyMXjRq6ajIuZ+4TahzOZ4UBHgGG3CH2tO6MVKhO0Er
	9Dx2ZETA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x2sVo-0005zm-1a;
	Sat, 05 Sep 2026 17:41:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x2sVn-000Eb4-2i;
	Sat, 05 Sep 2026 17:40:59 +0200
Message-ID: <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
Date: Sat, 5 Sep 2026 17:40:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
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
Content-Language: en-US
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28114/Sat Sep  5 08:23:38 2026)


Hello,

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

I did some quick testing (no perfect benchmark environment,
just checking runtime and CPU consumption with "time").

I timed a kernel build (-j 24 and full lto, my own .config)
and an application build (also with a lot of parallelism)
with three different kernels:

a) Cache aware scheduling completely configured off

b) Cache aware scheduling turned on, but without patch

c) Cache aware scheduling turned on, with patch

Big/little scheduling was always on, 
Mario's patch was always applied
(without it, results are significantly worse,
because I use kernels without debugfs,
so big/little scheduling is off without the patch).

Results:

There is no significant difference between b) and c) 
(<= 1 % wallclock time)
Sometimes b) is better, sometimes c) is better,
I'd say the differences are below the accuracy of my tests.

But a) was reproducibly better than b) and c)
w.r.t. wallclock time: 2-2.6 %
It was also very slightly better w.r.t. total kernel CPU seconds.
The results w.r.t. total usermode CPU seconds varied too much.
(I always ran the application build twice,
and for all a), b) and c), the second run consumed
significantly more usermode CPU seconds,
but took a little less wallclock time - I don't know why).

So in short, at least for the two build benchmarks I made,
and with respect to the wallclock time they took, AMD Ryzen HX 370 
does slightly better completely *without* cache aware scheduling,
but cache aware scheduling looses less than 3 %,
both with and without the patch.

The big difference I observed when 7.2 came out 
was perhaps due to the fact
that the older version of Mario's patch I had
did not apply correctly or did not work as expected with 7.2.

Greetings

-- 
Prof. Dr. Klaus Kusche
Privat: Söllmnitz 32 d, D-07554 Gera/Söllmnitz
036695/859909 klaus.kusche@computerix.info https://www.computerix.info
Dienstlich: DHGE Gera, Weg der Freundschaft 4, D-07546 Gera
klaus.kusche@dhge.de https://www.dhge.de
