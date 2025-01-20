Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA2155A52;
	Mon, 20 Jan 2025 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737404411; cv=none; b=rLAR62esArMuH38w4VPfRItPFtEClT4A8c/kK1mk4oMDvhy2NMI6YRQGc8Rb2YHjD3Zttfg9xjPA3B8dRLDcf0A2T3GtMfX2jej5Roc+aiqrtiVQ57r6c4WPZHX3CDzQewuw1mC2soQrbm0WqdY+rRRwZhMgJA+Y5P9QPoCs1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737404411; c=relaxed/simple;
	bh=wnjTVXKVgAgHzcCPkmuKtlgtqTSjVW38KNmJkYUscfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyB3MFF6DK+3MssgS3MUoOyKQxbTNNJyFH7CjYp/M8DdBZAqDtlbMZHVpaCLv8DJBcADA7+usin3k2ESswr2iNZm6VXrHP8NWDsovBJS+IwFk+Y3a01giqIdAiCXJy2Hkl39vqH8Oy0NLIj5RUm+cedMQQBcFLadkqeJQQc9VGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu; spf=pass smtp.mailfrom=astier.eu; dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b=F5PIGdvL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DPTZBQUd; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astier.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b="F5PIGdvL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DPTZBQUd"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C04F4138085E;
	Mon, 20 Jan 2025 15:20:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 20 Jan 2025 15:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=astier.eu; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1737404407; x=1737490807; bh=Q/imr5kl1X
	yf4oGBvpL921kQl31u9g6v9LH+4QIERAQ=; b=F5PIGdvLCmi6u54ltf6BYsWJpn
	c+UD//gAEMk3Zaj/S/8pF84pe10cebmYWly631C4wQLM+07GMgLoXsO9aXnMBzhl
	0WeOeQKfXcecWL8FpyauBsqs25MUWWd7WN8ihZXC89JEh28qbujtBhtgZYBdz8sa
	mFdwRzRBotresnPI6iLZ7DH1/T7U5bT3l/FNG8fvmspo0IYmUOkVfBvz1q0adnq1
	6/3GqOLY5fxyFK7jaCtXhS6sMoBZIxb83+NbEBIK6F56T89gEx/0D9PRZ7cWuWTV
	LDsCTmvUfUap8Q8uT+cfCcgpwbIyIQg058TW2cwSSxM12bkFO0dAWDOUTQXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1737404407; x=1737490807; bh=Q/imr5kl1Xyf4oGBvpL921kQl31u9g6v9LH
	+4QIERAQ=; b=DPTZBQUd+xu6iu8kJlJRFrP/Wt7oFbJ+4GR7ZrdsdYPjvK9izqV
	YpB7AdVqdyh5zEQIOD5DKYfQpXolLiS8ReqRdNvUEWFsj92y1zB/0hocmHtl4KrG
	pNDOJ81L3+NJ1oFgMj1OQWVh6X9EtHBB910zdj8xbo3gaFqskGAH/YU0ZhA5lee2
	CBGdh1M2FfyvSHgNW7o7EgiJI233y/iI6Ze5v0wV15BR7yc/v2f1UXLzJPvfuMB6
	/JtKiuln3t0ZTve3xG8ZGj+jQI68jEE3bhC+d+8w/nqL/TwF6HAJCAaw57mvXl0T
	JtBJyDPWDhHY6S5SwsLZcfZ9ga+Od/V0ACw==
X-ME-Sender: <xms:96-OZ5qEkstndOGUI2i2f2nTPBg-krquQ3zyRIMhzktHyTsMkK5FFw>
    <xme:96-OZ7rtcmKhU5QBFvGuD2IeowNhyc3dHVH7MpgcgAa3bDy720EOQIPu2b9dodERb
    TEKbOpx4KVDbt0fVf4>
X-ME-Received: <xmr:96-OZ2OsXJcrJ3wUQNGNvtFbx0Kk-1sgLu2GILNkg6WPvD3kIZzLJO5XObdvWz7KDG0E2L6ZW7T7cVuvcDc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeetnhhishhsvgcutehsthhivghruceorghnihhsshgvsegrshhtihgvrh
    drvghuqeenucggtffrrghtthgvrhhnpeelhfejhfdvleeukeehfeetgffhjeffgfeuvdfg
    gfeuheeigfegveejkeeiteejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrnhhishhsvgesrghsthhivghrrdgvuhdpnhgspghrtghpthht
    ohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhithhhuhdrjhhoshgvph
    hhsehinhhtvghlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdq
    giekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhhohhkrdhr
    rghjrdhlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihrdhluhgtkh
    esihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgt
    ohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlh
    drtghomh
X-ME-Proxy: <xmx:96-OZ07Efb9m8640y_1IL4IfULzlKINRh8INzsFeL7--vQQHZ1S-yQ>
    <xmx:96-OZ45tFl9w1Ni2Js29inSTzqoDniNgBttJZIE1fLHK1wzIVs-7Gg>
    <xmx:96-OZ8jVyEb2sOHM_qvrONHQeQoiMr05rYtDUWBNCrnaToIkUGd3Rw>
    <xmx:96-OZ65HkorGFuU3tnLnQ5COcVXGh0LZBXBnmTf0jX7lmBpAcQuXZQ>
    <xmx:96-OZ3Zau0_lOqG5R79UqvanuK5sVjjC6qQJ7_1P9Hy2-b9peEUknaF4>
Feedback-ID: iccec46d4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jan 2025 15:20:06 -0500 (EST)
Date: Mon, 20 Jan 2025 21:20:02 +0100
From: Anisse Astier <anisse@astier.eu>
To: "Joseph, Jithu" <jithu.joseph@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashok Raj <ashok.raj.linux@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo J??rvinen <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation to match
 current availability of firmware images
Message-ID: <Z46vUgFJv6o-tNLq@kanto>
References: <20250102194358.33029-1-anisse@astier.eu>
 <eeb29cef-fb07-4bf9-9728-346a697ceff1@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeb29cef-fb07-4bf9-9728-346a697ceff1@intel.com>

Hi Jithu,

On Thu, Jan 02, 2025 at 01:40:23PM -0800, Joseph, Jithu wrote:
> 
> 
> On 1/2/2025 11:43 AM, Anisse Astier wrote:
> > I realize Intel had a few troubled years, and that having this feature
> > in the kernel must be quite helpful to some users. But right now, it
> > cannot be used unless one has a commercial relationship with Intel.
> > 
> > I am not advocating for the removal of this driver; this is just an
> > update of the documentation to show that the publication of the firmware
> > images necessary to use the driver might have fallen through the cracks,
> > and might not happen soon.
> 
> Thanks for bringing this up ... apologies for the delay in making the images publicly available.
> We have reached out to internal teams to speed this up.
> 
> I will update the the documentation (or respond here) when I have more info
> 
> In the meantime, I am okay with updating the documentation  to reflect the current state of image availability
> 
> 
> Thanks
> Jithu

Did you get any update?

Do you think this doc patch could be queued for 6.14 or 6.15 ?

Kind regards,

Anisse
