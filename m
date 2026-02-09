Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A951E28312F
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646739; cv=none; b=HOBlc/6pHm5xANZ6q8Y3ewP9MsPTRJs1Va2aC/QnGuXhYnkT03HX+IlJEc+iZZVID8qIgWDgqs8OHysUgnx0B8Dwpm4WorAQnpUecSqJgNcCro5YeUMjw2u2gLR1PjaIJapvb3yX2ly/Jq/+t6pZvnJl4k81o6gYA1SLut8BQF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646739; c=relaxed/simple;
	bh=X8A/1ObMQjMECimsP9deovajRseSVMNHPR1G/aT/Snw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cdzFdHX8dtUlmfucXjYOMrdxAyD/SOAIBNm8VLXP7G0svPNr8Ndpot2U6iPvUNkLQzPZAPUoACk/KgMIm3J1TqsIEo/D3feos1o5eOHqylVuWTw/JbivhB5XAYV4XRY9X3/Wkj0qxqOOWZQFNtA0n4eV1DCKVzioiRzYD2aW8RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scP4RI32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scP4RI32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A321AC116C6;
	Mon,  9 Feb 2026 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770646739;
	bh=X8A/1ObMQjMECimsP9deovajRseSVMNHPR1G/aT/Snw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=scP4RI32n1i4x3Ms4oR9ylENwVuVbw0msjxo4dNlFaPdzCJlbUjAsG3tf8pBRnzWS
	 hVQ60NDqgYma1dwOQt5Wfadt2TR2O4GQyiNFJ7E8hpVUBZj6ELsALbPbq/IKvp2bsg
	 GDcFJVlJrWCH+xWB+i0mWPT6Sdg5jaU0bIzdswynwpDCCVu+vOt5t2waqu+ZWbt5og
	 PPE0VEsP3+Y8BB8xCu5sIgu1pWFf3eVCKnRFzXqIOHFRy5cme3XQEXKsiVi1BtNpH/
	 z4lKVydMeJxrg3SL5mlurZh3aUUKgmMdnIU966ESiDdIaBkFJgfvILTt92f/vMemYs
	 FadFYnfEJ5XNg==
Message-ID: <978f0855-7d77-413c-892b-7ca9cb78e9ce@kernel.org>
Date: Mon, 9 Feb 2026 15:18:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
From: Hans de Goede <hansg@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, platform-driver-x86@vger.kernel.org,
 Yauhen Kharuzhy <jekhor@gmail.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org> <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9-Feb-26 15:00, Hans de Goede wrote:

...

> For the drivers/platform/x86/x86-android-tablets/* I think the following
> fix is both the easiest as well as the best solution is to modify:
> 
> drivers/pinctrl/intel/pinctrl-baytrail.c
> drivers/pinctrl/intel/pinctrl-cherryview.c 
> 
> To register a swnode for each GPIO controller and
> then EXPORT_SYMBOL_GPL an array of fwnode pointers
> which can then be used in the PROPERTY_ENTRY_GPIO()
> entries replacing e.g.:
> 
> PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)
> 
> with:
> 
> PROPERTY_ENTRY_GPIO("reset-gpios", cherryview_gpiochip_fwnodes[1], 53, GPIO_ACTIVE_HIGH)
> 
> (these 2 covers pinctrl for the Bay Trail and Cherry Trail x86
> SoC based Android tablets which x86-android-tablets is for).
> 
> This should all be pretty straight forward. Assuming we are allowed
> to dereference an external symbol for the property initialization
> if not then this becomes significantly more complex.

Looking at how the current code works, it does not use an array
of swnode pointers, it just uses an array of swnodes, and then
takes the address of the n-th member:

PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)

so if we just move the:

extern const struct software_node baytrail_gpiochip_nodes[];
extern const struct software_node cherryview_gpiochip_nodes[];

arrays to the 2 pinctrl drivers and actually associate them
with / attach them to the GPIO controllers in the pinctrl
drivers then I think that we will be set for all the references
to the main SoC GPIO controllers (at the cost of a dependency
on the pinctrl driver, but that is ok).

That just leaves the non main SoC GPIOs used in combination
with the WM5102 codec and as mentioned I think for those it
would be best to just switch back to GPIO lookups by reverting:

[PATCH v4 10/20] platform/x86: x86-android-tablets: remove support for GPIO lookup tables
[PATCH v4 07/20] platform/x86: x86-android-tablets: convert wm1502

Regards,

Hans


