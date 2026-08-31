Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CD388E72;
	Mon, 31 Aug 2026 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207690; cv=none; b=CZf7piLY59xXqWRiGDzZmxP2qccn+4Mi8Z/jpUGm/ZmLqs+wlezj7FNc5R4hFnePxInBMuBxKpTCraloH5inTHdrehcUIMapOFZrCDMwWHVwpvkD+sI4Cqz4B1gW/BwHB7D8yzL9TP/xZgCS4cUrAJV5jvkSB222Tipu5xp5B2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207690; c=relaxed/simple;
	bh=hZ0AqvFzH16fA/O4NKp6fuoo5OGWK/AlZ6FXy1B6irw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=O9zSOj5kTpPliShWdcT7zDGn+4kIEKVUiftfVNwcn5Ld+OhzLjLbW21oGTLIvmegOG7xdy/LUVAjclChr7OVf8JypzezM1CCz01y7TO4rKha+gHrRg1a4eWXp2rlsAe4GUsOh+dygIjpmdnQOH3Gc01vV0nmzQ04bYiVJ8DfPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XO8KBSjC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XO8KBSjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4631F00ACA;
	Mon, 31 Aug 2026 20:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207688;
	bh=VwH2OPal8uaVTVgf56AKhbmaK8G6OXpiB1vUr+e+wgU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=XO8KBSjC1RssYTt8Eb246jQ2OQ43kaHHJNsrJOefG40tHNzCecdgidhrPYEsjEf4j
	 w/QD1DaiAr9vbJkS1MfQU5LGpRBCoIiOUgsFQFNyu4dHnt783zrPe7RImJdOw0+yaP
	 OWyZiy0bZSBFF8WsmL3ZTpUnje/EI+9J24qBEq4WFC7RPyLP+ejSBhNrRhTk4oDmyH
	 5GZ3zJCAsA5YF+MimpGWUU6PGl/hXwhoOpz8RFZGL+gShQd1l0LzvYGDt8aohYv64x
	 sTuk+SYZ9yVZA+iL2zLPcgDicaXVQUsrCwRNXsOddjxfCUGtI6GVCgPqeAzAFKZp68
	 ZqCHmfvPxvafw==
Message-ID: <bb044e48-3194-43a2-96b5-612835ad798b@kernel.org>
Date: Mon, 31 Aug 2026 22:21:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
From: Hans de Goede <hansg@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
 <eadd7091-c61e-4fb7-b1a4-cf307108b199@kernel.org>
 <apV3jbqWfNRa8zN2@google.com>
 <43df3632-57b2-49a3-80f4-52704982e2ef@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <43df3632-57b2-49a3-80f4-52704982e2ef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31-Aug-26 22:20, Hans de Goede wrote:
> Hi Dmitry.
> 
> On 31-Aug-26 14:47, Dmitry Torokhov wrote:
>> On Mon, Aug 31, 2026 at 11:42:06AM +0200, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 30-Aug-26 1:15 PM, Dmitry Torokhov wrote:
>>>> When gpiolib dropped name-against-label matching in favor of firmware node
>>>> identity mapping, lookups referencing unattached software nodes (such as
>>>> arizona and gpio_crystalcove in x86-android-tablets) stopped working.
>>>>
>>>> This series fixes the lookups and cleans up redundant software node
>>>> registrations on Lenovo tablets:
>>>> - Point Arizona GPIO property entries directly to the codec device software
>>>>   node, which is attached to the parent device.
>>>> - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
>>>>   during devres action teardown.
>>>> - Generalize gpio_secondary_fwnode_init() to accept a node group argument
>>>>   and use it to attach crystalcove_gpiochip_node as a secondary firmware
>>>>   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
>>>> - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
>>>>   Yoga Tab 2 models where codec software nodes are already registered when
>>>>   attached to their respective devices.
>>>>
>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>
>>> So I've given this a test on a Yoga Tablet 3 (yt3) tablet yesterday and
>>> there everything works.
>>>
>>> Then I also tested this on a Lenovo Yoga Tablet 2 1380 since the YT3 does
>>> not cover the crystal_cove GPIO case and there things do not work.
>>>
>>> It seems that trying to get the crystal_cove GPIOs indefinetely returns
>>> -EPROBE_DEFER. I'll try to debug thus further this evening.
>>
>> I wonder if the patch below will help.
> 
> No that does not fix things since I've crystalcove_gpio builtin (1).

p.s. should have added:

I did find the real problem and posted a follow up patch to be applied
on top of this series fixing things:

https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johannes.goede@oss.qualcomm.com/

Regards,

Hans

