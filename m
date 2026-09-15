Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C041E6D9;
	Tue, 15 Sep 2026 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493785; cv=none; b=BAG0FidBSM0glaoGRBjyLQJLcWfIf2/OFDBpByZexqmheL7Qa2Lyrhrpq8IHz5cIbuiuqvTnYvALzDHrzjEy5nT0GozGKp0nwoXP6GQYLKhD8jfbrPEIQkgQZrOWmNlynDIEWEviqUYDZvLqWoS/dUhEYhbrznQAQt4mNdFTy74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493785; c=relaxed/simple;
	bh=urqgFBe3Wi6DGd08ZgfJUDRP1MbBh8rdERHwKGNysNw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TNcetHATwjcJJ3S/aNnZZdzlX7f/6ZphBB4zpMoMijfz69g0Cs5dnHh5IMlwLo8AUUnNUAUJwCcEVfyH27cgf0zqgO6KxHi2Wv5S19i0a9icusmpeAkW/eByG4td6MniVyqECcnXUj4HkurXSBgIWTMm80AKobGUWXBLpGU48y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ShkluQmz; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ShkluQmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789493774; x=1789752974;
	bh=bYkDKi/DEjIinF9dQE8tfaHzj59gkkksxWlOZrdaq2I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ShkluQmzs1YcjqN489jKeZLwo5KMqYQhDaxwAuCLSfR1BS01Z9XOH2cYubbBU9n2a
	 rP/CrubG9QvxBWXIdy76OjNvRm45DbPZkLC3ogAuwort03NY2rAyNL9ZpTnmatsd0c
	 1+hnieEs42sWflLDwMeJEqq945y2SRaNVeJ4uF7wNo/M6iwU7nLzGS/p6I168dnRzC
	 jn3c/V3Et3V1S9Lge/P79joEBIqx6kFgfNepH8S6z7mauEAuGWcbiuLznTLx57FU5v
	 MGMV5P1VXi87lcnjPcoqYEaE07DAuHLrqLoUubnWB1+AQcnHpyGt98RRR97VraKZP/
	 Vq9ZLT5ueGQtQ==
Date: Tue, 15 Sep 2026 17:36:09 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Peter Marshall <pm@petermarshall.ca>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Message-ID: <20260915173604.65023-1-lsa.uz@pm.me>
In-Reply-To: <1e798c12-2272-471a-9e71-82188439de82@foss.st.com>
References: <20260910213308.53429-1-lsa.uz@pm.me> <1070f707-8a23-419e-a0a2-a6f295ceb5a0@foss.st.com> <20260915100722.38504-1-lsa.uz@pm.me> <1e798c12-2272-471a-9e71-82188439de82@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 368db0238073872b7b836241303c98d2931dc873
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Benjamin,

Thank you - for the explanation, for the link, and for saying where you
stand. All three are worth more than an ack would have been.

Sorry for the slow reply. I spent the hours reading rather than writing: th=
e
repository you pointed at, the two drivers side by side, and the in-tree
binding. The checking changed what I have to say, so it seemed better than
answering quickly. Three things below, separated so you can take whichever =
is
worth your time.

1. The licence question, and my mistake
---------------------------------------

Settled, by your link. vd55g0_patches.h carries
"SPDX-License-Identifier: GPL-2.0" and "Copyright (C) 2024 STMicroelectroni=
cs
SA", with cut1 and cut2 arrays. ST published the firmware itself, two years
ago, under a licence that answers the question I was asking.

There is nothing for anyone to grant, and the right source to take those
bytes from is yours rather than any third-party copy of them.

I should have found that before raising the point twice. Your standalone
driver was named to me in this thread and I did not open it. The blocker I
reported on 7 September is not a blocker and never was.

2. What the work would actually be
----------------------------------

I measured it rather than guessed, so that we are talking about the same
thing:

  - twenty-five LINUX_VERSION_CODE guards, all of the form
    "#if KERNEL_VERSION(x,y,z) > LINUX_VERSION_CODE", about 180 lines to dr=
op
  - s_stream to enable_streams and disable_streams, with vd55g1 in-tree as =
a
    line-by-line reference written by you
  - st,vd55g0.yaml, adapted from the 3.3 KB st,vd55g1.yaml
  - Kconfig, Makefile, MAINTAINERS
  - checkpatch, sparse, builds across configurations, and testing here

That should not take as long as I expected.

3. The question I cannot answer on your behalf
----------------------------------------------

A 2100-line driver arriving beside a 2100-line sibling by the same author
invites "why is this not an extension of vd55g1". If I answer that badly,
the third version is a rewrite in the direction you have already rejected.

Reading the two files I can see arguments for your position. vd55g0 is
monochrome-first, Y8_1X8 and Y10_1X10, where vd55g1 carries the Bayer codes=
.
vd55g0 has real strobe and flash handling that vd55g1 barely touches. The
register namespaces are essentially disjoint.

But those are my inferences from one reading. What I would be repeating to =
a
maintainer is your engineering judgement, and I would rather have it from
you.

So: you offered to elaborate. Please do, if you have the time. Not to
convince me - I have no stake in either shape. It is so that when Sakari or
Hans asks why VD55G0 is not folded into vd55g1, the answer comes from the
person who wrote both parts.

If a separate driver is right, I will start and send you something to look
at. If the two really should converge, that is worth knowing now too, and
Peter's series already points that way.

Sergey

