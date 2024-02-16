Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336597484;
	Fri, 16 Feb 2024 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708065117; cv=none; b=NXnfUy5danz8iQxStFCq2IBvLLAZeYurvM0k+jX2KPXAv8C9HC48n6vsIfGefX9Fm+r1cLYD4Op2EWj44vELzYfO83EwGg4J2ZuOJZBjSgbTh4XxAVNZNekYe114kFQ9mpeC2WjvEsDVRoZr6gXFKJ3ymz+eNJ6fqN1dkTh2yN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708065117; c=relaxed/simple;
	bh=WlzTvqaVZaHacDUt4+KJJgz1oxCtY/LMY/1QpJV2xzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ8J5KegkhHf7+n/u0nkC0h8NEGnnXa1dvJL0dlU8aaEk2J6pjVbBDefi43xNglG7yANH1fwOzE65ns6t53tgzreDAyF9Pg5dgRNaR34XHYkeLhe69p4g1jF4yMWNglmA3kDheuwTEA6WxVB1gpgR8dna9jVm2YryOkdlepjy5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rarlJ-0007LX-AO; Fri, 16 Feb 2024 07:31:53 +0100
Message-ID: <4db957c0-8ccc-4da8-9445-c209f0cdf983@leemhuis.info>
Date: Fri, 16 Feb 2024 07:31:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: intel-vbtn: 14c200b7ca46 breaks suspend on Thinkpad
 X1 Tablet Gen2
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708065115;f3e52d2b;
X-HE-SMSGID: 1rarlJ-0007LX-AO

On 13.02.24 23:35, Alexander Kobel wrote:
> 
> after upgrading to 6.7.1 or 6.6.13 (LTS), my Thinkpad X1 Tablet doesn't suspend anymore. Or, rather, it suspends, but wakes again immediately. This happens regardless of whether the keyboard is attached or not, with all ACPI wakeup triggers disabled according to /proc/acpi/wakeup.
> I could identify the following commit as the culprit:
> 
> 	14c200b7ca46b9a9f4af9e81d258a58274320b6f
> 	platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
> 

To be sure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced 14c200b7ca46b9a9f4af9e81d258a5827432
#regzbot title platform/x86: intel-vbtn: suspend broken on Thinkpad X1
Tablet Gen2
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
