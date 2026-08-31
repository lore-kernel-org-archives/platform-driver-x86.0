Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E436E47E;
	Mon, 31 Aug 2026 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207606; cv=none; b=uCzSNJMR36gopirSYdvz3u8mZi6u1qw0hM2BNYXCc1hdLOJW/b/rT5GLp7O8pbK2gPPLWyo5cJL5av19hGARYfFmaeFIcOMYd+nIgh9nWkrf0ANuXo0hMhp+W5av1i6iMqTt3w/tXMm1hlS3L9SnJeFqd7LTtkz5fVM87xoZRTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207606; c=relaxed/simple;
	bh=nQY1ysq7EHs2HMj3xsRXEt80gjE7jTtJ2D2FykqupTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZt2p2zutTFKKZSt+94xx5FwL6gE46UgcRRAitRIIMDBTx+q16tTKliMq9FunEWgkwFhzdszWtwO/Eln7At1WIplxgk9VV2o7l2yXcA6lnqrGuQv/Vpc8crpO+UqTg5cPtQmD8Gwp2PWzLcbmtlIbRa/9WnBhZPgy8VQ8bH9jCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Up7jsjZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Up7jsjZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E941F000E9;
	Mon, 31 Aug 2026 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207605;
	bh=BpFZgBEjda/WueiSWsb5hk3Maiqzc5nPmqth4bQwDfc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Up7jsjZ2AXu86NUc8koSpf+0Ez0bE0OV6daG/3eqc66VoK/gYULTjI1M2CBI9uapF
	 9IEiP1ng9tKHv/+zCaIfk0SiRfdDPOagcLYv73ygEUjW1T69OdsYRKPoMyrFzyoUbW
	 cVd8U8YC1jcjNAKump2y5qFH/ua0BBnkgJ2QniWDpcJqapSTBtQXieY2K7Jo8DfJ55
	 wzbmBtgZ5eBkqJs8reVfJaEwhyouFkeppasZP1+y7Xvni3HV1+5f3G7PC2BcHEm1mq
	 QoL7QSV++MqUg7suk+ztB5bZ7u1A7B9UMC6v7Cyyh5tQXWlLpe0yb53geUsFDfThDy
	 hLst6n0w1qvPg==
Message-ID: <43df3632-57b2-49a3-80f4-52704982e2ef@kernel.org>
Date: Mon, 31 Aug 2026 22:20:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
 <eadd7091-c61e-4fb7-b1a4-cf307108b199@kernel.org>
 <apV3jbqWfNRa8zN2@google.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <apV3jbqWfNRa8zN2@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry.

On 31-Aug-26 14:47, Dmitry Torokhov wrote:
> On Mon, Aug 31, 2026 at 11:42:06AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 30-Aug-26 1:15 PM, Dmitry Torokhov wrote:
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
>> So I've given this a test on a Yoga Tablet 3 (yt3) tablet yesterday and
>> there everything works.
>>
>> Then I also tested this on a Lenovo Yoga Tablet 2 1380 since the YT3 does
>> not cover the crystal_cove GPIO case and there things do not work.
>>
>> It seems that trying to get the crystal_cove GPIOs indefinetely returns
>> -EPROBE_DEFER. I'll try to debug thus further this evening.
> 
> I wonder if the patch below will help.

No that does not fix things since I've crystalcove_gpio builtin (1).

Still a good catch though and worthwhile to send out as a standalone
patch.

Regards,

Hans

1) The i915 driver uses CrystalCove PMIC GPIOs for panel on/off on
some drivers and it cannot handle EPROBE_DEFER gracefully at the point
where it is requesting the GPIOs. So this driver must be builtin for
the i915 driver to work correctly on relevant models.



