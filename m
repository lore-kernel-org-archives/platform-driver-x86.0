Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B553327C866
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770669715; cv=none; b=qOSG5r1Hh/1NC0DOQvIxF/A3ZD/gSbySSxjlzp69Q/UuCsgxvEj/X1lp6p4T0NClym4vaYwZaHwT0ZXoN4GbWnBEL7IvNV0012CgulqjfL8IVk8N3N8+BqSizkfBvLMSJ60LtUaRXek6VMMIPoOeq3eBDnHuc/FtPPnlffhtKZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770669715; c=relaxed/simple;
	bh=8VnnmFo4v2ozCWGQjhBcspwi4Z8D379Y4FnSvsk94rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hem27020V4nk6z1LV4BEt4Th8WYdTGpSGgHuUZTtFCcuGcfEkriaHSBjkLGLaNDKff0tFztxrq0/Ju+is+yps6QNufs+YiBXQ8ejeY4CZTx4xNmXAR4gDIUJ00qFVpT/GWDI7a0EgI5pui+eMFHXmbVZWuMrf/7gRo1uvKRjfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReSsI66M; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReSsI66M"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-124a635476fso146728c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 12:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770669713; x=1771274513; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uVJLP/ujHJ7IHGRccHGEAFM/y6Ph/GoQ20VKKGxTg7o=;
        b=ReSsI66MseXGuZK6Wzq0c7Q8HaSq0eT75f/fHtRhwPr1ayEQ4i2CKXFJonRaUH5jVB
         my9QafZ7os+7ecg2TAnaxeCJzB39EEaKHE3bxhDpzUnAt2JQiBM+c5h+wxsNHTQRKcaH
         uQbo1MFqA+/2l+TfWt+U/XTpHtUCMoVR67l/frtQEdMkMBop8wJFd6oT2oxhg1JmeECL
         IdjO39rO/q0TqAOFIbxMaZ3UtqP1KEcAmBW1mufN8tkIyG6gqEqUOFKGFJwaMU1rEQ9d
         YSXTD/bzD2i//vRTycL4FYGDc2W1mR5QIBBtn7M9/Q2wdo/XuO243zTDkwN/fHcodbwK
         Emhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770669713; x=1771274513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVJLP/ujHJ7IHGRccHGEAFM/y6Ph/GoQ20VKKGxTg7o=;
        b=tViJi+sQjNF3vT4V58r580x2n39cRLAQalt30aCnupNQ5ZNhlBIG/Tyjr59ApwfdFT
         6oRIOz755Npntl6uFbfdYGUYxtMyjLYSMnv4wLENQz+VNzhDhBb9yeeKthfj1UV/05zG
         6RazeFY74WZsBq39t/blHkeEo+mm8OEWKtBQ4W2IUejfPooHaJm/p5uVT7CNu5KHchva
         fGeka8TWedPtFhZLC+OF7eLWKVqMiaxhQvTlnlkcNWCapYpKhsZcgTK5NL/2pZ39NX6Y
         HkPpngh1HAtbFrbSw1AAODh+vuCXpLwvFxaxuPa1teAL9UHV/1pTeZQgJvc/MDaeRrPi
         53zg==
X-Forwarded-Encrypted: i=1; AJvYcCWhGGdTvHKzf3nbPU6ChCTavSx26Xx3TsEVA4i/6oAonea2A/7M/98ieH5Lj4q/ZuKe+CCvHXejhHzU+nitH5rPzBRN@vger.kernel.org
X-Gm-Message-State: AOJu0YwHH9w3DJwc2l/Vk7SoCR3UR8XPQXbKtL21hlizK+ejdjXU5YoN
	n/ldN9LRnxE/T1GSj+8pW+n/zSpujkKOZ/43dfG68ka8Zmum29gtf1Cm
X-Gm-Gg: AZuq6aLhJjcSmbIau2TqadlNL9t6m6HZvvZCr/6DBzIEVhX9ruxqi/UthtJ8jWlnt0O
	hd2JM6uPZqjMnQMVl+UqZNWDjmDp12CLUqT5pp2qeLooEQ8/grqIQc9BZu6yXSTjw0FAuixwKmt
	6nXYgcHPnaUYACqvte7AW8p9Gtn/lpJgfWzrWxsNBbbHywnakGrZccLI/UmKxODTnypzbuWQcsk
	42kdMI3mMsfgYjh4gik0hCs35FR6T3vE6xaK9cIJKH3qyia5NB1mKygy5Jr+2uD4GKuKzgho9su
	azYisCdOpD+7VZxcO8fptpZs1plreVP9MmUumKrOseaX+15jFJYKumTX4sbyOhHkQVpv8zdn6ny
	rNW+l5MpXFD1Zz1M+43Wbr+Toc+zM6b6lXk23cjKphEAQVzr3j8lb2RQHyiOqF0CM6j4MCTiHD+
	S3bJhFC0FSORSawZHzzGxK5jQkS2NxokIg1ZvvXvX99eyzlUdcaeU6
X-Received: by 2002:a05:7022:207:b0:119:e55a:9be7 with SMTP id a92af1059eb24-12703ff497bmr6619486c88.3.1770669712559;
        Mon, 09 Feb 2026 12:41:52 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:616e:78a2:cc03:4be3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855b0f624sm9453009eec.14.2026.02.09.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:41:51 -0800 (PST)
Date: Mon, 9 Feb 2026 12:41:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYpC_XWNXiRmEdzo@google.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>

On Mon, Feb 09, 2026 at 09:24:46PM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 9, 2026 at 6:23 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Mon, Feb 09, 2026 at 10:25:47AM -0600, Bartosz Golaszewski wrote:
> > > On Mon, 9 Feb 2026 15:41:54 +0100, Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> said:
> > > > Hi Bartosz, Hans,
> 
> [snip]
> 
> >
> > If your fwnode pointer is not a compile-time constant (since you have to
> > look it up somehow) you can not make corresponding property entries
> > static constant arrays, and have to build them dynamically (or fix them
> > up in place after doing the lookup).
> >
> 
> Ok, yes, as I described below.
> 
> > >
> > > The device that creates devices not tied to a real OF or ACPI node, is
> > > typically responsible for creating the software nodes for its children. It
> > > can check if given GPIO controller already exists (gpio_device_find_by_label())
> > > and if not - just return -EPROBE_DEFER and not create children. If it does,
> > > then it can pass its fwnode to the children. A bit like so:
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/reset/core.c#n910
> > >
> > > Just with the lookup done by label and not fwnode.
> >
> > As I mentioned another email, in case of old legacy boards you do not
> > really have ACPI or OF nodes. If they were there then we would need to
> > build trees of software nodes, we would simply extend the DTs for them.
> >
> 
> Adding software nodes to providers in that case is quite
> straightforward and the right thing to do. But we're talking about a
> different case: providers with real firmware nodes that we can't
> access until after the tree is parsed. Which happens quite early into
> the boot process. Once done, you could
> of_find_node_by_name/compatible/whatever() and reference it already
> from a software node. You may not really need the device for that. If
> all you care for is a label, then you already have it in the form of
> the device-node label.
> 
> > >
> > > I may have not paid attention to the docs and signed off on it but it doesn't
> > > make it correct. The strength of software nodes is that we have an actual
> > > fwnode link between devices. If we just fake this link, then why are we even
> > > using software nodes at all?
> >
> > To allow drivers drop hard coded platform data and switch to generic
> > device properties. This goes beyond GPIOs.
> >
> 
> Consumers can already use generic gpiod_ interfaces even if their
> GPIOs are set up using lookup tables behind the scenes. There's no
> need for platform data.

But there are other settings that use platform data. For example:

struct gpio_keys_button {
	unsigned int code;
	int gpio;
	int active_low;
	const char *desc;
	unsigned int type;
	int wakeup;
	int wakeup_event_action;
	int debounce_interval;
	bool can_disable;
	int value;
	unsigned int irq;
	unsigned int wakeirq;
};

This describes one gpio-keys button. Besides gpio itself there is code,
type, whether it is a wakeup button, whether it can be disabled, it's
label, etc. Those can be expressed via device properties (in case of
legacy boards via static device properties).

I do not want to have a separate way of configuring GPIOs from the rest
of the properties. This would be very confusing.

> 
> > >
> > > > This is what I wrote to Hans when he raised his concerns:
> > > >
> > > > "
> > > >     I agree it is a bit weird, but this allows to disconnect the board file
> > > >     from the GPIO driver and makes it easier to convert to device tree down
> > > >     the road as it can be done in a piecemeal fashion. If you want fwnode
> > > >     actually attached to the gpiochip then:
> > > >
> > > >     1. You can't really have static/const initializers in most of the cases
> > > >     2. Fishing it out from an unrelated subsystem is much harder than
> > > >     matching on a name.
> > > > "
> > >
> > > Ok but if we match names then we already have a mechanism for that: lookup
> > > tables. I really fail to see how creating software nodes with a specific name
> > > in consumer code is any better.
> >
> > I do not want to have 2 mechanisms, one for GPIOs, and one for
> > everything else. Let's take gpio_keys driver. It uses platform data or
> > device tree properties (generic device properties) to describe the
> > hardware. I want to drop platform data, and I do not want to encumber
> > the driver itself with setting up the board specific lookup tables, I
> 
> Definitely but look at what we're doing now: -  consumers just set up
> GPIOs for themselves using arbitrary strings.

Look _beyond_ GPIOs. There are other properties that also need to be
set. GPIOs should not be special.

> 
> > want the configuration be contained in board files. I also do not want
> > to have to configure all properties but GPIOs through one mechanism
> > (software nodes) and then have an exception for GPIOs to use lookup
> > tables.
> >
> 
> I agree but given that we use software nodes properly and not as a
> placeholder for GPIO chip labels.
> 
> > I understand that matching on firmware node is nice and may even be
> > preferable in some cases, but I think matching on name has its own
> > place given all practicalities.
> >
> 
> Ok, let's start talking solutions. As I said: I'm really surprised
> this only shows up now when that change has been upstream since
> v6.18-rc1. I can conditionally re-enable name matching in
> gpiolib-swnode as a fall-back with the assumption that we'll work
> towards better solutions. I hate it but if it breaks existing users
> then I don't see much choice.

Thank you.

> 
> > >
> > > [snip]
> > >
> > > >
> > > > I think the hardest breakages are here:
> > > >
> > > > arch/arm/mach-omap1/board-nokia770.c
> > > > arch/arm/mach-pxa/gumstix.c
> > > > arch/arm/mach-pxa/spitz.c
> > > > arch/arm/mach-tegra/board-paz00.c
> > > >
> > > > If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as I
> > > > can see it does not even have a fwnode assigned: it either does not have
> > > > parent or its parent is a platform device instantiated by the driver
> > > > itself and does not have a firmware node associated with it.
> > > >
> > >
> > > In that case using software nodes makes absolutely no sense and users should
> > > stick to GPIO lookup tables. The provider does not have an fwnode attached, how
> > > can we just fake it in the consumer?
> >
> > Why not? It allows us to use generic device properties for describing
> > everything that we need.
> >
> 
> Sigh... I'm all for it but we're "faking" a reference as described above.
> 
> > >
> > > I would rather just attach a software node to the omap controller in
> > > arch/arm/mach-omap1/gpio16xx.c and use its address in these board files.
> >
> > That might work, just a bigger change than I wanted to make originally.
> >
> 
> That shouldn't be too big, I may look into it next week, though I
> can't test it. Maybe Mark Brown or Tony Lindgren could.
> 
> > >
> > > > So in the end name matching allows weakly referencing objects elsewhere
> > > > in the kernel for legacy and one-off devices.
> > > >
> > > > Maybe we should allow for both? Do a fwnode lookup and when it fails
> > > > fall back to matching on name?
> > > >
> > >
> > > Isn't it GPIO lookup tables with extra steps and more confusing too? Because
> > > that's how it works in GPIO core: if you can't find anything using the fwnode
> > > lookup, you fall back to comparing names in GPIO lookup tables.
> >
> > What you are missing is that it allows to describe everything, not only
> > GPIOs, through the common mechanism.
> >
> 
> For sure but the GPIO label comparison is very GPIO-centric and
> implemented under drivers/gpio/.
> 
> > >
> > > My point is: it only makes sense to use software nodes if we're creating
> > > links between them. If we fake them and compare their names instead, then
> > > it's just abuse of the API. It says PROPERTY_ENTRY_REF() for a reason: it's
> > > supposed to store an address leading you to the actual device on the other
> > > side.
> >
> > No, it is supposed to store a "reference". It does not have to be a
> > pointer, it is a reference to another object. Could be an IP address or
> > USB port number, or something else that can uniquely identify that
> > object. In DTS it is not a pointer, it is "&node". How it is
> > implemented underneath is an implementation detail.
> >
> 
> This is incorrect. The fwnode reference is resolved - using the
> .get_reference_args() callback - to the contents of struct
> wnode_reference_args where the first member is the address of the
> "referenced" fwnode. Even for software nodes, the
> software_node_ref_args structure expects the address of either a
> software or firmware node and software_node_get_reference_args() will
> fail if it contains neither.
> 
> I added the ability for software nodes to reference "real" firmware
> nodes thinking it would be enough to solve such issues dynamically. I
> see your point about it being more complex than it should. I was
> thinking about proper solutions and thought about a concept of a
> "future_fwnode".
> 
> Something like:
> 
> extern struct fwnode_handle *future_node;
> 
> const struct software_node consumer_node = {
>     PROPERTY_ENTRY_GPIO("reset-gpios", future_node, ...),
> };
> 
> Where future_node initially uses an fwnode implementation returning
> -EPROBE_DEFER until after the devicetree or ACPI was parsed and we can
> then assign it a proper firmware node via some mechanism attaching OF
> or ACPI nodes to the correct consumers (by label or otherwise).

OK, so maybe:

1. Restore the label matching as a fallback for now (keeping the fwnode
   identity mapping as the first choice)
2. Work through cases where we can actually instantiate/locate the
   firmware node, like with omap-gpio (but we will need to see if there
   are linking/loading order issues there)
3. Figure out what to do with the rest (if any)
4. Drop the label matching (or agree to keep it until legacy boards die
   off if #3 fails).

If Arnd removes PXA boards that will help a bunch.

Thanks.

-- 
Dmitry
