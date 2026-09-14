Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E58743441C;
	Mon, 14 Sep 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381718; cv=none; b=GuICU3H7fn77m19BX9dybkCpanA1qzwgyGDJAhjplYlKVSj7+vPuXsxVaoREyDe20ijuEVy9Z1t02Eawp4dJHBmQJAbAJXKXZreWUvZqdf4Y1InXpcjl94gYwAjo0iciQS1T8O4Z+jsWGHJw14x8MfDc5WefgMzlW0Fkibd/ZhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381718; c=relaxed/simple;
	bh=yYKXkUa6U5itDFzN+bvB+KOWYGBJioUrzwpjwreiqXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmqHT+wp0cvPXoiluTnUQq7YK/YaNu7omR2xy0YAPG7hVz2K5hbZtY2PJtFwsf0C+LT1sRekk7SXZ4nlv4OnTqn6IkF4Wfq7kzCnsFXKBGhANzGu4nzJc1/pHnkkaKL89gKNi/+WkN9jYP8NL0/u+qi+OFJ3fW5PN7A0uzh/PoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=uuZOGJv3; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="uuZOGJv3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8zAqkgW2sMApTPwkq/a2qAgIgc1eNMZTEsYiCXgFMnU=; b=uuZOGJv3iDED8tdQFeMon17Qc4
	gdsQvU7q780DlOPqjlYuD2Zgrj4H04bYZvcQyaa2H5aaQCAVHrcjZMU4x1sJewIMLxxHhjiwcJJm9
	gNlqaKFYCUAse4A8sO6+vko5xFaObr9iVRyDJwZK3DXI7LCTuv+r2IX2JKfdRm7IzrDnE5zO2rsMk
	fMXZItKKrsp00GbzU/frr2nqzk9vOGi6BdhlEsfsvJOQ+ezR8RIKoGED0xWQpil0b16VUxJpl3/Py
	pOWb6BReyYpcdDYqHS+neaWWmlfL10+woTvZxz3PbSwgiq7Oox3l0CC2gOt21F3JxpanS7w4MvAD6
	TY3jO2fw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x63vB-000H99-2b;
	Mon, 14 Sep 2026 12:28:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x63uz-0007Nw-0t;
	Mon, 14 Sep 2026 12:28:09 +0200
Message-ID: <6b173ff1-6fde-401d-a4a8-6fa8bbe3287c@computerix.info>
Date: Mon, 14 Sep 2026 12:27:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
To: "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen
 <tim.c.chen@linux.intel.com>, Mario Limonciello <mario.limonciello@amd.com>
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
 <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
 <76dba935-1052-4fa9-a70c-16cecdfd12c8@amd.com>
 <4da55124e32dd0587a3516c8f5ed512bffbbb42e.camel@linux.intel.com>
 <2fe2c681-b748-41fa-8b56-1169c86cefbc@intel.com>
Content-Language: en-US
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <2fe2c681-b748-41fa-8b56-1169c86cefbc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28123/Mon Sep 14 08:24:19 2026)


I did some very quick tests.

1.) /sys/kernel/sched/debug/domains/* does not exist on my system,
not even with debug_fs on.

/sys/kernel/debug/x86/sched_itmt_enabled is "Y",
/sys/kernel/debug/x86/sched_core_priority looks good
(big cores have values almost twice as high as small cores)

2.) The situation with 7.2.5 which seems to include 
https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/
is almost unchanged: Without cache aware scheduling, 
my build jobs run faster (wallclock time):
Just 6:16 compared to 6:19 for my kernel build with full LTO,
but 4:50 compared to 5:20 (???) for my python uv build
(the python uv build seems to be a very interesting test case?)

However, with cache sched enabled, in spite of the longer 
wallclock time, cpu seconds are sometimes a little bit lower.

3.) https://lore.kernel.org/lkml/20260810033742.1688718-1-yu.c.chen@intel.com/
seems to make things much worse:
Kernel builds had the LTO step and the CC compressed step
placed on little cores for significant amounts of time,
resulting in total build times above 8 minutes.
Same impression by watching the bar graph for individual cores
for the uv build.

Prof. Dr. Klaus Kusche
Privat: Söllmnitz 32 d, D-07554 Gera/Söllmnitz
036695/859909 klaus.kusche@computerix.info https://www.computerix.info
Dienstlich: DHGE Gera, Weg der Freundschaft 4, D-07546 Gera
klaus.kusche@dhge.de https://www.dhge.de

On 10/09/2026 03:29, Chen, Yu C wrote:
> On 9/10/2026 3:51 AM, Tim Chen wrote:
>> On Wed, 2026-09-09 at 08:19 -0500, Mario Limonciello wrote:
>>>
>>> On 9/9/26 03:59, Klaus Kusche wrote:
>>>>
>>>> Hello,
>>>>
>>>> On 08/09/2026 23:54, Tim Chen wrote:
>>>>>> I did some quick testing (no perfect benchmark environment,
>>>>>> just checking runtime and CPU consumption with "time").
>>>>>>
>>>>>> I timed a kernel build (-j 24 and full lto, my own .config)
>>>>>> and an application build (also with a lot of parallelism)
>>>>>> with three different kernels:
>>>>>>
>>>>>> a) Cache aware scheduling completely configured off
>>>>>>
>>>>>> b) Cache aware scheduling turned on, but without patch
>>>>>>
>>>>>> c) Cache aware scheduling turned on, with patch
>>>>>>
>>>>>> Big/little scheduling was always on,
>>>>>> Mario's patch was always applied
>>>>>> (without it, results are significantly worse,
>>>>>
>>>>> Sorry, I am a bit confused.  You mentioned later the result for (b)
>>>>> and (c) are about the same with or without the patch
>>>>> exposing debugfs (commit c1e7fe5e75ed11fa85368e5a186472afd3858f3a
>>>>> Mario mentioned in another mail).
>>>>> But here you say the result is much worse without Mario's patch.
>>>>> Is Mario's patch the one above or some other patch?
>>>>
>>>> The with/without patch in (b) and (c)
>>>> refers to the patch you sent on 31/08/2026
>>>> ( https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/ ),
>>>> not to Mario's patch.
>>>>
>>>
>>> Just to clarify Mario's patch in this context refers to the fix to
>>> ITMT/debugfs fixes as Klaus doesn't nominally enable debugfs in Kconfig:
>>>
>>> eaece4849991d62fcd6f46637c55dcce00e25d70
>>>
>>
>> Ricardo reminded me that AMD's hybrid CPU relies on SD_ASYM_PACKING instead
>> of SD_ASYM_CPUCAPACITY. So the patch I pointed to
>> (https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/)
>> only fixes the SD_ASYM_CPUCAPACITY case and would not have an effect on
>> your test system.
>>
>> The fact that ITMT needs to be turned on to improve performance also point
>> in that direction.
>>
>> There was a bug that Chen Yu fixes for ITMT compatability with cache aware scheduling.
>> It prevents a task from getting stuck in the wrong LLC in the ITMT case
>> (https://lore.kernel.org/lkml/20260810033742.1688718-1-yu.c.chen@intel.com/).
>> Klaus, Can you apply that with Mario's ITMT/debugfs patch to see if that
>> improves performance on your system?
>>   
>> Tim
> 
> Yes, that patch tries to coordinate ITMT with cache-aware scheduling. It 
> would also
> be helpful to get a dump of /sys/kernel/sched/debug/domains/*  to 
> confirm that the
> SD_ASYM_PACKING flag is set at the MC domains as well as 
> /sys/kernel/debug/x86/sched_itmt_enabled
> to double-check that ITMT is enabled and 
> /sys/kernel/debug/x86/sched_core_priority to look at
> CPU priorities.
> 
> thanks,
> Chenyu

