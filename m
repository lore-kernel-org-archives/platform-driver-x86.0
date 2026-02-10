Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3E2FB965
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720412; cv=none; b=trEkJqm1lUnvC94NETcG7x9eD5HWWF41JQ0J+jpZ9pDzd6dHyMBO50M/ER4hAWSiZCp6YrmdLEAXgh/UkFm/qVFC5c6bZ16vVHZWIl97Js7imgilMj16VfhYjL+uPjjzpBNv4qFLq03lxESFEkQTfWCHvdpuaCyuqshxfTCb6Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720412; c=relaxed/simple;
	bh=PvvDrKoCm9vCba8nGqCrUkMLcPwd/Iq3zgvWamQuAxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQh7tPT/ZDgZxl2vahH+gd6hS6sHfvqXHR1o/8Sh1cuuoTTGh8jfOguT6IRwRkH2tFdjZA7fSRATnlyMixq+XEHKShHrz2Ex4q6sA3KBOjsYa0AnqMhGtH3ecmQeTxlnC0BleswAAKiQ1L8I3OXxSalAWoyx5fjyX7HgGkyFQ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQD+QlNQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQD+QlNQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E01FC116C6;
	Tue, 10 Feb 2026 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770720411;
	bh=PvvDrKoCm9vCba8nGqCrUkMLcPwd/Iq3zgvWamQuAxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gQD+QlNQeI22PTDmP/Zg4P4MlUxanRDkiM+1zo8ZM5vKe/x04Aek9/9nLQqQ6i1aL
	 KX4ijoRco0oz0qU/YN+OtZ74FvIjruJ4y7qjwSyGfDZxjCbLlNSZtwcTjszzeRrgtD
	 91YtMa4w8LWrm/K/YlFSaB2gw6avnatFBGIdqPeWO2oPWAGVsYpJczukCK672BYeE6
	 37Rm9Ih8fO9nGSYbYqF5N3WUjSvJ5C6jTfUoEmGhRC4Crb8SjNIaLSNKY6ER5m6/l7
	 1JOA3EqAG1Bn2l815Q7xbizLpsj72YWuXKhYPG6uOVpXNcipvkIE+iInnUfUmOvzGn
	 /RP1yQEd0g5mw==
Message-ID: <43eb01af-a1b5-42e7-ac55-53343a630143@kernel.org>
Date: Tue, 10 Feb 2026 11:46:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org> <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <978f0855-7d77-413c-892b-7ca9cb78e9ce@kernel.org> <aYpp_u5R9JefpLwG@jekhomev>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aYpp_u5R9JefpLwG@jekhomev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yauhen,

Thank you for bringing this problem to our attention.

On 10-Feb-26 00:13, Yauhen Kharuzhy wrote:

...

> OK, but what about additional GPIO chips?

You could look those up by label and then manually
attach the swnode to the GPIO-controller device before
using the properties.

But since you are then still doing matching by label that
would be a bit silly and for now at least we are going with
restoring name based GPIO-controller swnode matching as
a fallback:

https://lore.kernel.org/linux-gpio/20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com/

> For example, on Lenovo YB1-X9*,
> sound codec controls additional signals like speaker amplifier
> enablling. I did such trick but it looks very... weird: codec device
> properties reference fake node for gpiochip which will be created at
> driver instantiation (these properties are used by ASoC machine driver
> actually):
> 
> static const struct property_entry lenovo_yb1_x9x_rt5677_props[] = {
> ...
> 	PROPERTY_ENTRY_GPIO("realtek,reset-gpios", &cherryview_gpiochip_nodes[3], 25, GPIO_ACTIVE_LOW),
> 	PROPERTY_ENTRY_GPIO("realtek,pow-ldo2-gpios", &cherryview_gpiochip_nodes[3], 18, GPIO_ACTIVE_HIGH),
> 	PROPERTY_ENTRY_GPIO("speaker-enable-gpios", &cherryview_gpiochip_nodes[3], 48, GPIO_ACTIVE_HIGH),
> 	PROPERTY_ENTRY_GPIO("speaker-enable2-gpios", &lenovo_yb1_rt5677_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
> 	PROPERTY_ENTRY_GPIO("headphone-enable-gpios", &lenovo_yb1_rt5677_gpiochip_node, 4, GPIO_ACTIVE_HIGH),
> 	{}
> };
> 
> static const struct software_node lenovo_yb1_x90_rt5677_node = {
> 	.properties = lenovo_yb1_x9x_rt5677_props,
> };
> 
> ...
> 		.board_info = {
> 			.type = "rt5677",
> 			.addr = 0x2c,
> 			.dev_name = "rt5677",
> 			.swnode = &lenovo_yb1_x90_rt5677_node,
> 		},
> ...
> 
> https://github.com/jekhor/yogabook-linux-kernel/commit/538313b69483c23afc455571ef638efcea767031#diff-282276fa1330b08656b929c6e956308a122423888b8f07a1d1045e61a813d8c2R159

Oh nice you've patches for sound now :)

Is this working ?  Any plans to upstream this ?

Regards,

Hans




