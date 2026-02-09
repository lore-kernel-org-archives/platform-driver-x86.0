Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE3318ED0
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678786; cv=none; b=LOQjGVNn5JcJUUbdOBLHn/SBMI2fQM2gi5gKL6F/WLMH1Iwq3jhsgrYfAlTt5cyYeqxreYdCPRkOdcyz6ioCUdM1UxpOEVsyrJEbTJ4HCMQ0JZ77+ECcOSN2kFxc4dl+4KFpeyUcIK9LPUMX/EDaZY8pxtmgM/6xnHM7rMXO+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678786; c=relaxed/simple;
	bh=bEn3bCs7IERl2g2DMvwEGa4JrmWIFthXT/poCUy0vzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPdAuXLyo1l11R3NcmC32TkQKiw69h3TTs7YGQS8UeDbAnaAEsnMoNZm37K2sHdxskeUkiGnL0UfpPG3sCXiio9YdJROVJ+oytm2J2hlvALYGLUfyzmgaX9X4G4A2Mt04Ip3pw3RgtCq283Pl1WXstLVdpQYiLqS0dieJe8MivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OX7l5Iel; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OX7l5Iel"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so9108147a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 15:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678784; x=1771283584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZrP/c49+mQywOKmmGVnuDlqWh3A3rvGzFfcv29TlKQ=;
        b=OX7l5IelMoFBpM7RXgG4ulbJaGbjjvNbfN9m+6AL1sJG3RVJY3wL14HLz5DZEreNm2
         tYTlwubE9ndi3mabvf4W3r/VnE1RpK7TjHQdewzzERlCCt0LuqF46/2wnbLZ9/gR7+4e
         Ty9038vezb7F62hIlMbcMX9aVFAvcE03De7KG+QLXVlyQtrL2wQvMWeWMtzqWUN41YlX
         6Sx4ozhfyq1fOLrNBFk3dzk3e4omSK22QLR9lvLp4d2pUDe3uEj6wTwxdwtvGd5mo+b3
         /84VFIOSE8KYE3/OnTfol7RVLKUcXkP3zQPisyp7GQamO7Mx9x7jU+9db/hR8Z/8qqBo
         R/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678784; x=1771283584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZrP/c49+mQywOKmmGVnuDlqWh3A3rvGzFfcv29TlKQ=;
        b=Ps79lbvsqFrllJeMyj2gcrjKSWw5q9B3H6yAEMVib0RH1Pv7hVbX3/TPqihDu071Uc
         oEaZ4jNv+da3HHsO+Kna2hG6+BdIPRuCx1N/aGsFuf+kJ7QaoMihx7n7kFzfspus4f1V
         mDzW4DbRJo+uKN7jtZ00koK3hmlzK7gzxpVKEoi2k0s570rJ71Es8FxGs7u3myJ31BPy
         cnLJ0E0O4h/MjMlx+2z8TLbKwSbkkEFgwkub0fYdwUCGR+ROsERPG0YdZkycpvJUFUZm
         JKhzIaKnkFxExsl6vYYcUxPMWmOJ1k1M7ZFuzGUyCUK9tFLcNxnwSiHfaO6PuQRAtFEz
         JVDA==
X-Forwarded-Encrypted: i=1; AJvYcCUiP8HAP5uHgUxRArKOLbaHUX53G2J+9yxKcAyJ3MRV24tyHUNdgHFaeo3sjgFaBxgz2C2oXM+76TKhoMPscLWh/dnB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73r6qftM18RdIW8VVFdC+cS7i8rAwt5UaCKzKBL5kKOjH39Ij
	6jz26zJEC8zDRckQtHKBcwJzxvUrZNt1TFalYL8PphSqLqShnpJfNflN
X-Gm-Gg: AZuq6aLZmY4MyopZxkr08An4258JFayanCw+l35ACis0lxiJBTis1EeTyzeJISpbV6w
	uJTC7f/sw+zXYLVQKDRUWRxvBx98y6Y9ax2Q7142MVuzo1VADvxHc79lVf03li9aD5La3Hs60k/
	2AnvmkOGfJjbEX/k4o64Zc+5Ww6ebaVYUCaQjf6rd49laYHgLuKRXMhYBUGbcxeup9CBvrqO1tB
	v5zKRnI7nucXav0lWr0jmsPJ/uglh9/Ue4cn1RuN9G4Num4Czrx+tx6manMMOqe6vzT82OEhGuI
	Q+1r9O6oukLc6uDFM/VlgBhx8mbFKYGJ5EQIa9MQNHxFvdvqQlexT+60OE8eCzas8ikZAYuCxVz
	545r73S6ey9RPOF1vmxfSEUmyvGP/av7tflY24zALGrJMO9pEW80nDU/za1iLWlHQuj/8h5sMZ5
	bdJFnt3et349I3UQ==
X-Received: by 2002:a17:907:3d02:b0:b87:2abc:4a2a with SMTP id a640c23a62f3a-b8f510d37f0mr18999466b.1.1770678783563;
        Mon, 09 Feb 2026 15:13:03 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf0fcesm442259866b.46.2026.02.09.15.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:13:03 -0800 (PST)
Date: Tue, 10 Feb 2026 01:13:02 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYpp_u5R9JefpLwG@jekhomev>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <978f0855-7d77-413c-892b-7ca9cb78e9ce@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <978f0855-7d77-413c-892b-7ca9cb78e9ce@kernel.org>

On Mon, Feb 09, 2026 at 03:18:55PM +0100, Hans de Goede wrote:
> On 9-Feb-26 15:00, Hans de Goede wrote:
> 
> ...
> 
> > For the drivers/platform/x86/x86-android-tablets/* I think the following
> > fix is both the easiest as well as the best solution is to modify:
> > 
> > drivers/pinctrl/intel/pinctrl-baytrail.c
> > drivers/pinctrl/intel/pinctrl-cherryview.c 
> > 
> > To register a swnode for each GPIO controller and
> > then EXPORT_SYMBOL_GPL an array of fwnode pointers
> > which can then be used in the PROPERTY_ENTRY_GPIO()
> > entries replacing e.g.:
> > 
> > PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)
> > 
> > with:
> > 
> > PROPERTY_ENTRY_GPIO("reset-gpios", cherryview_gpiochip_fwnodes[1], 53, GPIO_ACTIVE_HIGH)
> > 
> > (these 2 covers pinctrl for the Bay Trail and Cherry Trail x86
> > SoC based Android tablets which x86-android-tablets is for).
> > 
> > This should all be pretty straight forward. Assuming we are allowed
> > to dereference an external symbol for the property initialization
> > if not then this becomes significantly more complex.
> 
> Looking at how the current code works, it does not use an array
> of swnode pointers, it just uses an array of swnodes, and then
> takes the address of the n-th member:
> 
> PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)
> 
> so if we just move the:
> 
> extern const struct software_node baytrail_gpiochip_nodes[];
> extern const struct software_node cherryview_gpiochip_nodes[];
> 
> arrays to the 2 pinctrl drivers and actually associate them
> with / attach them to the GPIO controllers in the pinctrl
> drivers then I think that we will be set for all the references
> to the main SoC GPIO controllers (at the cost of a dependency
> on the pinctrl driver, but that is ok).

OK, but what about additional GPIO chips? For example, on Lenovo YB1-X9*,
sound codec controls additional signals like speaker amplifier
enablling. I did such trick but it looks very... weird: codec device
properties reference fake node for gpiochip which will be created at
driver instantiation (these properties are used by ASoC machine driver
actually):

static const struct property_entry lenovo_yb1_x9x_rt5677_props[] = {
...
	PROPERTY_ENTRY_GPIO("realtek,reset-gpios", &cherryview_gpiochip_nodes[3], 25, GPIO_ACTIVE_LOW),
	PROPERTY_ENTRY_GPIO("realtek,pow-ldo2-gpios", &cherryview_gpiochip_nodes[3], 18, GPIO_ACTIVE_HIGH),
	PROPERTY_ENTRY_GPIO("speaker-enable-gpios", &cherryview_gpiochip_nodes[3], 48, GPIO_ACTIVE_HIGH),
	PROPERTY_ENTRY_GPIO("speaker-enable2-gpios", &lenovo_yb1_rt5677_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
	PROPERTY_ENTRY_GPIO("headphone-enable-gpios", &lenovo_yb1_rt5677_gpiochip_node, 4, GPIO_ACTIVE_HIGH),
	{}
};

static const struct software_node lenovo_yb1_x90_rt5677_node = {
	.properties = lenovo_yb1_x9x_rt5677_props,
};

...
		.board_info = {
			.type = "rt5677",
			.addr = 0x2c,
			.dev_name = "rt5677",
			.swnode = &lenovo_yb1_x90_rt5677_node,
		},
...

https://github.com/jekhor/yogabook-linux-kernel/commit/538313b69483c23afc455571ef638efcea767031#diff-282276fa1330b08656b929c6e956308a122423888b8f07a1d1045e61a813d8c2R159


-- 
Yauhen Kharuzhy
