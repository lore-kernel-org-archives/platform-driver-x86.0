Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D813FC5DB
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 19:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390831; cv=none; b=aZGVzrrurXeTs7oCbrQZEDv8rcdtvaXcvjxyfN2SLLXRHuZz71KFCxXrSRElbkOyDlbMvPXeo89bKmsDZFl7ADi2gVdsxmab/CHWyC0LltV5qz01BLRckMOk6WzfgbqxhRKXpenwihtLsuB2S42f08CsgnRbmMy3Zngb5BwdJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390831; c=relaxed/simple;
	bh=GDYroukuC5C9a9/uzUFYM9W47PjTcGcWjvxg7BsIyDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WpHaakW5zhWpyZItk8O9CvOjoA+wsfFkSoKUWnJuBAo8yP+1Qi+l2y7r3zLd5eUFPKd52e2YNEcyjEhn6TWLEx0TdGvMaQojXpjFGYhgEOOPvNTgp7wk/+omFhcnDv4wI1gwYLpbQG50W1LzhXBl66ULG6Pf4amBLnvoYFMSgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=OEoHowBb; arc=none smtp.client-ip=45.157.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="OEoHowBb"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gLykD17DFzmpC;
	Thu, 21 May 2026 21:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1779390820;
	bh=FEq58i2/WQWFmrdpm60AMcW089UOmeOGlfqji08xG2Q=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OEoHowBbijxFS2I0cA5bMat2Cc3touhJp6uD4pQigONfeWN6WqFg2Y7xNYmDNS1Bb
	 NN0xVKryha7kQh68DswTRxOg1IdQ6L/GlhyV6YebgC1pYEhXeNHewpSlqDq7I2L/Z/
	 seVo6CsqCDCwoDQSeafmsTUDjCoU8mZDqIyZJj5USoMdFD+C2M29WJuUVTU6L9FYen
	 cZ3Bv5v2lnGpYd0EGjx8ZPR1i2fsDOwXbDVBW3xCfGIqorlaC43X+nc2ZkvD7FZhqa
	 JHC5CnrBAsY51VATvJabCb5WIJrspaUKuno+zRbCQAmUxKwCQ9kPgb14fCE5lHGwxJ
	 84q7lxkJAhdsg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gLykB6DBbzcm;
	Thu, 21 May 2026 21:13:38 +0200 (CEST)
Message-ID: <af087465-2487-46dd-bd19-ba6b0790b2f0@gibson.sh>
Date: Thu, 21 May 2026 21:13:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] amd_pmc: Delay s2idle suspend for some devices
To: Mario Limonciello <superm1@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512202645.1549111-1-daniel@gibson.sh>
 <76150f44-1f08-49c4-b4e8-b37ee143911a@kernel.org>
From: Daniel Gibson <daniel@gibson.sh>
Content-Language: de-DE, en-GB
In-Reply-To: <76150f44-1f08-49c4-b4e8-b37ee143911a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 21.05.26 16:44, Mario Limonciello wrote:
> On 5/12/26 15:26, Daniel Gibson wrote:
>> On some AMD Zen3 and Zen3+-based Lenovo IdeaPad laptops the keyboard and
>> the lid switch stop working after the first suspend, until rebooted.
>>
>> More specifically, they stop sending events when pressing a key or
>> closing the lid - it's still possible to toggle the capslock- and
>> numlock-LEDs with an external keyboard or read the lid state at
>> /proc/acpi/button/lid/LID/state.
>>
>> See also https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>
>>
>>   Documentation/arch/x86/amd-debugging.rst  | 30 ++++++++++++
>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++++++
>>   drivers/platform/x86/amd/pmc/pmc.c        | 60 +++++++++++++++++++++--
>>   drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>   4 files changed, 127 insertions(+), 3 deletions(-)
>>
> 
> Can you see if this series helps your issue instead of quirks?
> 
> https://lore.kernel.org/linux-acpi/5996185.DvuYhMxLoT@rafael.j.wysocki/

I tried and it did not help with the issue.

By the way, applying it was a PITA: I downloaded the mbox.gz from
lore.kernel.org, but it contained the threads messages in reverse, so
git am tried to apply them in reverse order, which of course didn't work
very well.. eventually I used `git am -i` to apply one at a time.

Is that normal or a lore.kernel.org bug or did I do something wrong?
