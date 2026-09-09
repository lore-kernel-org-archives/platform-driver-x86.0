Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A444A3E2;
	Wed,  9 Sep 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944362; cv=none; b=XLpTdyKbDyKIzWG3s+zrUOImjwcisieIbLrLW3zMVKlMEo6e3CGWDhU8JGun/bv/olKoB0vDEanwXAtIDnjEqghLB68V+DQBEODbK/ASUEataBLNTS4lHAeM+YOJVd2eTu4JiW3ThC30QYbgrEmb15GjUOrkQy0FeRviWvrf4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944362; c=relaxed/simple;
	bh=qLSlmNrNFe6NYtMyKkuZl5338B2KH2OFevOnG7eyFMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOJ+T9O+Wwv8cPWUdme7+fbi8gpQNNEAHiBr9j1ZrhALcT3bLNx3n45yjj1wYJIogtiAlUzRcMnXAqpPvboZ9Pvp9q0VcVzFR+4GFfkKhOuY4EEki2TxOTNWiin3bbFzmEXjShriyZqqvYT4goKijjaAv6A0mtV2LGm38f+Utfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=NGd3Xo3o; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="NGd3Xo3o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jyRWO5kreTeG1miRRc7E2bp5OOl/cxugwPpIIFWbAH4=; b=NGd3Xo3oAmLM56gwBlhBkRFUt7
	TAeACSrlmvKyvhJRfxTJhDKOp4V1VW9uxU89mUTxmPvMC3MFstbhs6D2WnNRuxhoVwRvlEZBau3/L
	fVpnP9pPGY1CBiF0edmWRapIalv/i8HhcQ2Ao8togQ6ImTKnDEiUIoAUXFTFqox3ZEAmkGULbebez
	ADZrVRUx0XieqhLs7GIP4yGVDy1pa4oKjGvgpkA+mpMI40Myfc0OrEQqzFUo1hOKHCZ0fWzpAn010
	vjDhPPGAWuqMF7l28dHKCPosDKfsCl1L4ySMUbGdG1H9fKelTJcuP1QxIlpescz+4R8WsL35RMZPz
	gdr3fZVg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x4E8z-0004ES-1q;
	Wed, 09 Sep 2026 10:59:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x4E8y-000EVu-39;
	Wed, 09 Sep 2026 10:59:01 +0200
Message-ID: <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
Date: Wed, 9 Sep 2026 10:59:00 +0200
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
 <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
 <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28118/Wed Sep  9 08:24:03 2026)


Hello,

On 08/09/2026 23:54, Tim Chen wrote:
>> I did some quick testing (no perfect benchmark environment,
>> just checking runtime and CPU consumption with "time").
>>
>> I timed a kernel build (-j 24 and full lto, my own .config)
>> and an application build (also with a lot of parallelism)
>> with three different kernels:
>>
>> a) Cache aware scheduling completely configured off
>>
>> b) Cache aware scheduling turned on, but without patch
>>
>> c) Cache aware scheduling turned on, with patch
>>
>> Big/little scheduling was always on, 
>> Mario's patch was always applied
>> (without it, results are significantly worse,
> 
> Sorry, I am a bit confused.  You mentioned later the result for (b)
> and (c) are about the same with or without the patch
> exposing debugfs (commit c1e7fe5e75ed11fa85368e5a186472afd3858f3a
> Mario mentioned in another mail).  
> But here you say the result is much worse without Mario's patch.
> Is Mario's patch the one above or some other patch? 

The with/without patch in (b) and (c)
refers to the patch you sent on 31/08/2026
( https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/ ),
not to Mario's patch.

>> because I use kernels without debugfs,
>> so big/little scheduling is off without the patch).
>>
>> Results:
>>
>> There is no significant difference between b) and c) 
>> (<= 1 % wallclock time)
> 
> Yes, I don't expect difference between (b) and (c).  My
> understanding is the patch in question is to only
> expose the default cache aware parameters via debugfs
> but don't acutally change them.
> 
>> Sometimes b) is better, sometimes c) is better,
>> I'd say the differences are below the accuracy of my tests.
>>
>> But a) was reproducibly better than b) and c)
>> w.r.t. wallclock time: 2-2.6 %
>> It was also very slightly better w.r.t. total kernel CPU seconds.
>> The results w.r.t. total usermode CPU seconds varied too much.
>> (I always ran the application build twice,
>> and for all a), b) and c), the second run consumed
>> significantly more usermode CPU seconds,
>> but took a little less wallclock time - I don't know why).
> 
> Will have to look around to see if we have some similar CPUs
> as HX-370.  My understanding is that the 4 big cores are in
> one L3 and the 8 small cores are in another L3.

Yes, as far as I know, it has 16 MB L3 cache for the 4 big cores
and 8 MB L3 cache for the 8 little cores.

> BTW, we have also found two issues with the active load balance
> paths for CAS that need fixes.  You may want to add those patches
> and see if they are helpful to improve things.

Most likely not within the next few days.
I'm still on holiday and quite busy:
Ars Electronica Festival in Linz.

> Active load balance fixes:
> https://lore.kernel.org/lkml/20260903020656.3793626-1-wanglu.priv@gmail.com/
> https://lore.kernel.org/lkml/2b0a35122ee615c6fa51076e5d79330e633755ac.camel@linux.intel.com/

-- 
Prof. Dr. Klaus Kusche
Privat: Söllmnitz 32 d, D-07554 Gera/Söllmnitz
036695/859909 klaus.kusche@computerix.info https://www.computerix.info
Dienstlich: DHGE Gera, Weg der Freundschaft 4, D-07546 Gera
klaus.kusche@dhge.de https://www.dhge.de



