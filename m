Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F342F5495
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758372303; cv=none; b=VuCDip1WKwp9XPvjQQzo96iaKGr5uVLo0Zs9YoNUpXbX3SeBDqKEWI/sb6Sd69fkC9Ab77ejGbKAMM3pQVJM6tyfNXKONC6Q76z4ta2zwnneeG3CjrPcYKGxRoRaTQ9kIFiJezCO2ZE30zAHEy/BirX+rYm1qfWo+AXuRwerVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758372303; c=relaxed/simple;
	bh=7//SMlwTXhVe62hU+pWZv91rJurX6+6BycVrQEBX1z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpjcF4LWK+539RucadYGiv7xeZZvm1aF44GMn1BnA8GB5F8A2wS2o85dR3oHYb0chFuO5lpleK4QrTs/QBrnePHsj570iisHk7sVycqfOFSvxfHIHhU+SFzWU7wvqUD2PcfZ1cb/RaKXhqKEa0gjjFP+R3cbZV++VFqrcnzwGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Brk+1Oyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Brk+1Oyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1624FC4CEEB;
	Sat, 20 Sep 2025 12:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758372303;
	bh=7//SMlwTXhVe62hU+pWZv91rJurX6+6BycVrQEBX1z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Brk+1OyqHO06SRGJdwtas7RBQ4V42EeI4rJfHiOQkZB91/H/Crm5XLZUwntzCQRuX
	 EEDYN37FJle4vzpH5SNXScer1lk2IKsvdRtZypOkspNKn7vKfzIdeOXIHK2lOVHUWu
	 R25VRm/Kua8/IrFylXwmLbI4NNcXTZCWsf/9A0jXgmjg1hP33GkYvyH9ZZQ4Am0j/f
	 RqG7Q2bO8GzH4M0CFXdQWrFH7cGVgqsGDOwvaKtKQHeUsrevOILWoakdG0djIpv4v5
	 yP+Z46gnbUoo0Dt9xHpMbHoWSsYYrWV69lwPx/yeNqjmOYZJbutsJifsAGUSycHGHF
	 +tYNkgfc8v/Xg==
Message-ID: <3c7e33b1-1dba-4672-960c-6bcdd32d89b8@kernel.org>
Date: Sat, 20 Sep 2025 14:45:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/19] platform/x86: x86-android-tablets: replace
 bat_swnode with swnode_group
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-13-hansg@kernel.org>
 <CAHp75VcMNe02iCWyD3A4aCXOH4Q6Fm09xNO-OeaaBT4t5BPQPg@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAHp75VcMNe02iCWyD3A4aCXOH4Q6Fm09xNO-OeaaBT4t5BPQPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 20-Sep-25 1:09 PM, Andy Shevchenko wrote:
> On Fri, Sep 19, 2025 at 11:48 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Now that we are using software-nodes are used in more places it is
>> useful to have a more generic mechanism to have the core code register
>> software-nodes.
>>
>> Replace the bat_swnode registration mechanism with a more generic
>> swnode_group registration mechanism.
> 
> ...
> 
>> -       if (bat_swnode)
>> -               software_node_unregister(bat_swnode);
> 
>> +       if (swnode_group)
> 
> Now this check is a dup and hence redundant.

Good point, the same goes for the other 2 already
existing software_node_unregister() calls which pattern
this change is following.

So instead of fixing this in this commit I'm going to
add in a follow-up commit to fix all 3 cases.

> 
>> +               software_node_unregister_node_group(swnode_group);
> 
> ...
> 
>> -       if (dev_info->bat_swnode) {
>> -               ret = software_node_register(dev_info->bat_swnode);
>> +       if (dev_info->swnode_group) {
> 
> Ditto.

Same here, I'll also fix this in a follow-up commit to this patch,
to make the same change to all 3 used swnode-groups in one go.

I'll post a v4 with this changed soon.

Regards,

Hans




> 
>> +               ret = software_node_register_node_group(dev_info->swnode_group);
>>                 if (ret) {
>>                         x86_android_tablet_remove(pdev);
>>                         return ret;
>>                 }
>> -               bat_swnode = dev_info->bat_swnode;
>> +               swnode_group = dev_info->swnode_group;
>>         }
> 
> 

