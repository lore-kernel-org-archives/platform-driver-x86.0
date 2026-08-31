Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7332E728;
	Mon, 31 Aug 2026 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175518; cv=none; b=j3/buShZFBkbxYvVfih4TUIaB1PUHpFmG31Vjrk0kOsST9aJAeuqL4P4IUjjWuOpKL/lAJNX/gT9/plpkcsa51u06+wUUKX6K2I8Z/fusOA/A2SJP3LhW4RsX3gwlGyR1b/HauIalQUxPa9iy0XmXm5K5YPeWEjnG8KsS89bwz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175518; c=relaxed/simple;
	bh=p4wQP1qwcJTpToRhDCRppjKYMZ4KaqIZGdm0pfw4U0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7zeZ9cYZvR7RQUsRA6/zoC9qHHyZ6cRlPSpBDyZuOEMCKT9JncpxrucRNQtjkvh2wAxvN5FLDQHnVNhLLnwZojUq7/lyyYUBTUAvxB3SOrhxeZzQqMlsMG9RUd02Jxex66DvASb22GtcK8YXwGGnF5eiCQGIDmpLUObkgKktas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=c21NwaL2; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="c21NwaL2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QzH8JgGE6MlqJwXxDjVZrKkYeIPDh++//oo58Muo12E=; b=c21NwaL2HzPSX7I7fGkorLMpIu
	3miZ82r4WyW2DmNh1KB0qC8icfLITxRDJRA8saygoSl/Wz9PyUXQm99dsLZugKovEQn4dGhCstE2i
	wnUiobBvNtKdCSWbDPDFFOOieUs2cFSlXMezVtaLD2llvweYOPynJ84CziWKAyq0btt4So2sDQkC3
	pKalAloUGTXtbixpdLi1n9iRaHedSeb6Ip7Uv4eWjB33ipe7Zw99RgzXNaiPbX3j2Lybh4dYv0+90
	LXUOtcdQqfadZvWFWpwl/UvKj+Ig9zKT3pV7JBvRzIhrYETuJp/IVDanEB/keHOZ4Ye/83IQZ970o
	nO4vXkxQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x108L-000Kxr-0k;
	Mon, 31 Aug 2026 13:25:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x108K-000IWV-1d;
	Mon, 31 Aug 2026 13:25:00 +0200
Message-ID: <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
Date: Mon, 31 Aug 2026 13:24:59 +0200
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
To: "Chen, Yu C" <yu.c.chen@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: "Badole, Vishal" <Vishal.Badole@amd.com>, tim.c.chen@linux.intel.com,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 platform-driver-x86@vger.kernel.org, K Prateek Nayak
 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28109/Mon Aug 31 08:24:07 2026)


Hello,

both patches in combination seem to have the desired effect.

But I just look at a bar graph showing the current load
of each core. 
The graph suggests that long-running CPU-intensive processes 
migrate to fast cores when fast cores become available.
And I have the impression that LTO compilations
finish significantly faster now.

I don't have exact numbers or benchmarks.

P.S.: I'm currently on holiday (for three weeks).
So my responses will be much slower than usual.

Greetings

Prof. Dr. Klaus Kusche
Privat: Söllmnitz 32 d, D-07554 Gera/Söllmnitz
036695/859909 klaus.kusche@computerix.info https://www.computerix.info
Dienstlich: DHGE Gera, Weg der Freundschaft 4, D-07546 Gera
klaus.kusche@dhge.de https://www.dhge.de

On 31/08/2026 04:08, Chen, Yu C wrote:
> Hi,
> 
> On 8/31/2026 9:53 AM, Mario Limonciello wrote:
>> Add a few others who have worked on CAS.
>>
>> On 8/29/26 10:42, Klaus Kusche wrote:
>>>
>>> Hello,
>>>
>>> I'm running linux on an AMD Ryzen HX 370.
>>> I use Gentoo and compile a lot of things (including the kernel)
>>> with Clang using full LTO, which results in a single LTO process
>>> running for minutes on an otherwise idle processor.
>>>
>>> Before Cache-aware scheduling was introduced,
>>> AMD's pstate driver informed the scheduler about big and little cores,
>>> and the scheduler always moved those LTO processes to a big/fast core.
>>>
>>> Now, the cache-aware scheduling takes precedence over big/little
>>> scheduling: All big cores form one L3 cache domain,
>>> and all little cores form the other L3 cache domain.
>>>
>>> When a process is started on a little core (and LTO is in most cases),
>>> it will no longer be moved to a big core,
>>> even if it runs for minutes and all big cores are idle.
>>>
>>> In case of LTO this hurts twice and badly
>>> (slows down LTO not just noticeably, but dramatically:
>>> In total, any compilation with LTO-linking takes much longer
>>> compared to earlier kernels without cache-aware scheduling):
>>>
>>> * The little cores run slower (3.3 GHz instead of 5.1 GHz).
>>>
>>> * LTO linking is very cache intensive,
>>> and the L3 cache of the little cores is only half the size (8 MB)
>>> of the L3 cache of the big cores (16 MB).
>>>
>>>
>>> So if a big core is idling, and a process on a little core
>>> is long-running, big/little scheduling should overrule
>>> cache-aware scheduling and move that process to a big core,
>>> even if this moves the process to another cache domain.
>>>
>>> Greetings
>>>
>>
>> Not so sure if it would help this case but I will note there is a 
>> debugfs knob you might be able to use called aggr_tolerance (it was 
>> introduced in c1e7fe5e75ed11fa85368e5a186472afd3858f3a if you want to 
>> read more about it's background).
> 
> Thanks Mario and Kusche for bringing this issue up. Yes, we can tune Cache
> Aware scheduling via debugfs or even turn it off. The issue in current code
> is that the cache aware scheduling overwrites the strategy of asymmetric 
> scheduling,
> and Ricardo also found this issue previous and there is a patch to address
> that, by honoring CPU capacity during cache aware scheduling, for the 
> **misfit**
> task. It would be helpful to see if this patch makes things better:
> https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/
> 
> thanks,
> Chenyu

