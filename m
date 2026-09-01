Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867C4078FC;
	Tue,  1 Sep 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268309; cv=none; b=YlyxchXA9WgM+sQ4/tKMi3H6IWSXjn1wGMSh83ws3dkPARp0iwDoT6boMSMhPMfZ4G1zrVJEy0+8eMy25+VdflQWKoMFMJP6KUPwDC37ZnldcbuL8slEWT2T49wYicDtOJr0DbSufM6B5ZAgQu4gR0oWQskU7VQaN1RmAiNTJkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268309; c=relaxed/simple;
	bh=uzmKfGOpC1yygBuFet+Ziubz2Qep8w+tFC9X9YVlIRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJPu0zX3EI/6BDnnnyXtJkRZcYsvs15amTbnXbOlQGGn/v2TJUqkyvCF8o1Dx+wXTwQZqqChqUNPRQTPIaD/SGaI5LNI/9ykoRIgNup80yG3d++O5wWSpTHGmyluyMkvqN2Y7GAVXaBRfrtcCbZ7gfUj4P3gMU6FhfhrkGuMRw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvEwq2jw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvEwq2jw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF03D1F00A3D;
	Tue,  1 Sep 2026 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268307;
	bh=B6lNRBavBduwwSNc/AwTwjdflDdDBVupiYBf7ApdEFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fvEwq2jwVchhTYp5L4oYa2o6SAhC30pD+YDCTAqNZNmj1b+LNHPtl92hP+JP/+Kj6
	 CHHmMOKvvoVHNnBlfzWvtBgxuwrwwwRgcVyK12b8hWx4qNW1mlO/gE9aHVMloQDwTq
	 gGZB69YK+DUaDyMVu0NwF7PI+cV7UI/M5b+jTbn9vcdwgY+LFYykLzpxX/DfMPlnuM
	 NuHb3Hi3mj0K1IQzA9kAkan2tYtqtXXp277ED7zoZJfEZ7aY8yuirnkHvRO1gwRfYp
	 DgUTibJ52FSWMcJ+BHLgit9nANPAZ8iUpoG1eA4wSXm7lVLKmKq6tw4wDike0fONPD
	 bINNdw1Z5tQKg==
Message-ID: <ab77b204-834a-4b99-a571-0e721f241c2b@kernel.org>
Date: Tue, 1 Sep 2026 15:11:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
 <5f5b802d-b0a4-493a-9816-e9bd91fd94df@kernel.org>
 <apXlqKuqhlBkSgpf@google.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <apXlqKuqhlBkSgpf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Aug-26 22:37, Dmitry Torokhov wrote:
> On Mon, Aug 31, 2026 at 10:17:41PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 30-Aug-26 13:15, Dmitry Torokhov wrote:
>>> When gpiolib dropped name-against-label matching in favor of firmware node
>>> identity mapping, lookups referencing unattached software nodes (such as
>>> arizona and gpio_crystalcove in x86-android-tablets) stopped working.
>>>
>>> This series fixes the lookups and cleans up redundant software node
>>> registrations on Lenovo tablets:
>>> - Point Arizona GPIO property entries directly to the codec device software
>>>   node, which is attached to the parent device.
>>> - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
>>>   during devres action teardown.
>>> - Generalize gpio_secondary_fwnode_init() to accept a node group argument
>>>   and use it to attach crystalcove_gpiochip_node as a secondary firmware
>>>   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
>>> - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
>>>   Yoga Tab 2 models where codec software nodes are already registered when
>>>   attached to their respective devices.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>> My initial testing report of success on the Yoga Tab 3 was a false negative
>> caused by me still running the older kernel.
>>
>> There was a generic bug in the new gpio_secondary_fwnode_init() helper
>> which was causing all GPIO lookups for PROPERTY_ENTRY_GPIO() properties
>> in the x86-android-tablets code to fail.
>>
>> I've send out a patch fixing this:
>>
>> https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johannes.goede@oss.qualcomm.com/
>>
>> Note that patch applies *on top of* this series.
>>
>> With that patch everything works fine on both a "Yoga Tablet 2 1380" as
>> well as on a "Yoga Tab 3" which covers all types of GPIOS (BYT SoC,
>> CHT SoC, CrystalCove PMIC, Arizona codec) used in the x86-android-tablets
>> code.
>>
>> And the changes from this series look good to me too:
>>
>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # Yoga tab 2 1380, yt3
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Will you apply everything yourself or will you let Ilpo do this?

Ilpo is doing 99% of the pdx86 maintainer work these days, with me just
hanging around as backup.

So I think it is easier if Ilpo just applies this series himself.

Ilpo: Note these are fixes (+ related cleanups) for a regression
in 7.3-rc1 so these need to go to the fixes branch.

And fixing the regression then requires this fix to be added on top:

https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johannes.goede@oss.qualcomm.com/

Note the order matters (to avoid conflicts) first this series,
them my fix on top.

Regards,

Hans


