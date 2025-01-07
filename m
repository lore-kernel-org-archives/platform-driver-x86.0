Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B21D1F3D4C;
	Tue,  7 Jan 2025 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270115; cv=none; b=Curl4VckTy50TTWQmPNmAxHzKy9QG7DaPsGdquhZPO04qy0l0GszXGkKDAKfb/g+eeB6oxsaeVYc79WCmvx+m2xcT0RFhOY6nw8hpdNbNpWMIeGabKc8GCZZvjd7pQ5XDhgyRmYXEJqfyxFGyZSlsDfvrgFYdbRXz3iXod3cqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270115; c=relaxed/simple;
	bh=7GvcBgmCQu8yAzhhjQrKSKMNcd0lBDlK2iTz18DqqdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMfg80Ux5ar4DfUcS5PMRGdeB6jEY6o0yiNW77PbNMM9M0xodRUC/qn9FrBqPtKQjUKfUX80GQHGSxMFN6DF3X73+xiXeTo93N74+t/gFiSny3O8oQz4UabareDGy4SrUGrAzO0FkcCURHHe8cONyvZJgIK5zHBZYrbOw3ABJw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=ITRw6rtn; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="ITRw6rtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1736270108; bh=7GvcBgmCQu8yAzhhjQrKSKMNcd0lBDlK2iTz18DqqdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITRw6rtnyJDsWLCpn/uUsvqJ5gaTgvmlNGJXKSbAsrbnhE//MyvYnXY/QMhxVsdDF
	 3H8VMjLY+Lbe5in3hxpO+v9JgqdH4gK/uCwMCQKi0cnXNAoYFeOi/bvhks3CqPZ3Ln
	 aXq7z3DC1h9zfcdZ6PReyqaQk1vLxQAkal+ho+nY=
Date: Tue, 7 Jan 2025 18:15:07 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <d9c46324-ff88-4ee3-aa9b-a187a2caf22f@t-8ch.de>
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de>
 <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
 <a8011f0f-1d44-42ec-9089-2da31f3852e2@gmx.de>
 <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>

On 2025-01-07 16:09:51+0100, Joshua Grisham wrote:
> Hi again Armin! I think I am finally with you on most of this, I think
> jet lag and general craziness made me a little extra dense for a week
> or two :)
> 
> Den lör 4 jan. 2025 kl 07:28 skrev Armin Wolf <W_Armin@gmx.de>:
> >
> > The reason for the firmware-attribute class original was that driver could export BIOS settings
> > to userspace applications, together with some metadata (min/max values, etc).
> >
> > Because of this the exact meaning of each firmware attribute is usually only known to the user
> > changing those firmware attributes.
> >
> > Your driver is a bit special in that it knows the meaning of each firmware attribute. However
> > you still have to follow the firmware-attribute class ABI since userspace applications do not
> > know this.
> >
> 
> Yes ok, as said, I am with you all now on this I think :)
> 
> As a prototype for v5 I have created a new struct for each "firmware
> attribute" that helps me keep everything linked together with all of
> the different sub attributes for each different "fw attribute"
> including allowing a link back to my samsung_galaxybook instance
> without using the global pointer. At the end of the day, if I wanted
> to avoid using a global pointer, I needed a way to grab the private
> data based on either the kobj or the attr parameters to the show/store
> method of these individual sub attributes within each "firmware
> attribute", so what I have done is added the kobj_attribute as a
> struct member and then manually init+filled this kobj_attributes
> during probe, so I can now grab the parent struct instance using
> container_of() within the show/store functions which then gets me to
> my pointer. I thought about using the kset or something else for this
> but it seemed like kobj_attribute supported being a struct member
> better and gave the least amount of headaches from what I could tell.
> 
> After trying to fight my way through this problem, I have an idea of
> what a better "dream scenario" would for me as a user/consumer of the
> firmware attributes interface -- namely that there is some kind of way
> to register and unregister by "type" (e.g. "I want a new enumeration
> fw attr; here is its parent, its name, and all of the functions for
> show/store of the required attributes, plus a data pointer that I can
> pack together with my attribute/somehow reach within the show/store
> functions"). I have handled a bit of this myself now in the working v5
> of samsung-galaxybook (just a minimal version of what it requires) but
> as said it currently relies on creating the kobj_attributes (at least
> those where I need the pointer) as struct members that I can later use
> with container_of() instead of creating static ones using the various
> __ATTR.. macros.
> 
> Please feel free to say if any of this sounds totally (or partially?)
> off, otherwise I will try to test a bit more, clean up, and work
> through any checkpatch exceptions and get this sent as a v5.

Please take a look at my recent series[0].

It provides an API similar to what you propose.
Currently it does not provide an even higher level API with predefined
structs for enumeration attributes etc. That is intentional for now as
it is also meant to handle custom attribute types.
Nothing would prevent a creation of such a convenience API on top of my
series, however.

We'd need some coordination about landing the different patches,
but that shouldn't really be a problem.

> <snip>

Thomas

[0] https://lore.kernel.org/lkml/20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net/
