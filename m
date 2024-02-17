Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C71CD32;
	Sat, 17 Feb 2024 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708157638; cv=none; b=o6T5lrfYRqf4d2cCqia8aIKIMSkKvEQ+z6Eq5YXSWncJ8CzgUZ54UQFQQywWz8BdQ++DUk1SoUpxzcBSNjCp2BmEfKCTu78Zfzy4s4DGhDcx4HD/C692aQaQslAwr3wNWme0ggSEjtZh8S2wTK8UEetaTaS3oqtgH3nQTirWU3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708157638; c=relaxed/simple;
	bh=6kvv5nMzbXFLZHuEpIOebOQn5zB11sRpCF23aJzqzdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=ZAJQUIDkj9k1qSAXY4EzE4Ux8Zrpp7Hp2JnQQ+4DoK0kunyVqmIG+Lqy007VCUYpSDwzVltoP6KCUtNpq+vmqUFeO2uWG4sgs2jVniYjfx5mAANj38vOJLaIBIJM1skzkQuNV7WZt2Wgw07T3pvaNoW870ZnwvfFjDsEsxCJ1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rbFpZ-00084E-8q; Sat, 17 Feb 2024 09:13:53 +0100
Message-ID: <687a566b-95cf-4fa6-bc8e-7ef0b0475a3f@leemhuis.info>
Date: Sat, 17 Feb 2024 09:13:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8-rc: system freezes after resuming from suspend
Content-Language: en-US, de-DE
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
 <0d3bdb0f-63a7-4c48-b4d4-157b7b7c1689@amd.com>
 <92c8d543-bdf1-434e-8d92-23eeb513b35e@localhost>
 <0a103f43-0340-4c01-8a26-ecdfc186915a@amd.com>
 <d20ee821-c0e8-43c3-944c-125bf4064a16@localhost>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Trolli Schmittlauch <t.schmittlauch@orlives.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
In-Reply-To: <d20ee821-c0e8-43c3-944c-125bf4064a16@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708157635;3d4a64ff;
X-HE-SMSGID: 1rbFpZ-00084E-8q

[/me among others adds Shyam (author of the culprit) and Hans (committed
it) to the list of recipients]

For the newly joined, this thread starts here:
https://lore.kernel.org/all/ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost/

On 17.02.24 00:26, Trolli Schmittlauch wrote:
>>> Still, I had the time to bisect the vanilla kernel and landed at 
>>> 7c45534afa4435c9fceeeb8ca33c0fdc269c2240 as the first bad commit.

Reminder, that's 7c45534afa4435 ("platform/x86/amd/pmf: Add support for
PMF Policy Binary") [v6.8-rc1]

>>>  Could be a red herring though[]
>> If this turns out to be accurate, it's actually quite interesting.
>> You can prove it's accurate by doing a module blacklist for the
>> amd-pmf driver (even on 6.8-rc4+).
>>
>> If that works, it's a great hint at the problem scope and we need to
>> pull Shyam into the conversation.
> I just checked this with Linux version 6.8.0-rc4 (nixbld@localhost) (gcc
> (GCC) 12.3.0, GNU ld (GNU Binutils) 2.40) #1-NixOS SMP PREEMPT_DYNAMIC
> Sun Feb 11 20:18:13 UTC 2024.
> 
> Blacklisting the "amd-pmf" module indeed resolves the issue, good catch.
> I've attached to s2idle logs of 4 successful cycles without amd-pmf. To
> be honest, I don't know why the script considers the kernel to be
> tainted. I have compiled the kernel via the NixOS packaging
> infrastracture though without checking whether the distro applies any
> patches, but a guix user had also confirmed the issue in the Framework
> forum so I guess this issue is vanilla enough.
> 
> Looking forward to resolving this. I guess for most use cases I can just
> keep the module blacklisted for now?

Ciao, Thorsten

P.S.: To be sure the issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot introduced 7c45534afa4435 /
#regzbot title platform/x86/amd/pmf: system freezes after resuming from
suspend
#regzbot ignore-activity
