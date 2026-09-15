Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CD7412BF8
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466866; cv=none; b=B7lBIWemo6RCYBJFEDfbmCiq8omjiviFE+Dd9ct91NC0sgtKZ9qAOqfomQFNU4w152DRkQYMdERtTJWNMYMvH1gKrz+MOF6y/i/PTOJNI7H6omRj+FoMo8yrmT5XH/lgSk4w6BtRd181erlLvSqHRMZIcFJCovaNudNICZTEJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466866; c=relaxed/simple;
	bh=D1+wF3tc72/Ft+9Jnmi7RfbDB3LK4H+2mjkVDvdKxQ4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rob3wsJlmT4qtilKD/mr55WGnQpC7Xb4a5Sf+Dh4CvoZj7ZNyshU/TXoN4hOrxO1zm74GGzJY0fYbgF3EedZP4dEFAsd/oW6sc/iZLYWXxs9/1To7OrjrbvC3MA7vVHVCFDA/UMDVTpgWdumCIbhXzZ4X+UMLhxHK5iNlKH95ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KzDt78EW; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KzDt78EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789466859; x=1789726059;
	bh=KvN0WtVDmz8KmooGIfjf37wi8q69l1XGO+yuAjSlKAw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KzDt78EWmDEORf3n0EMJMWTrMmKhqtSPFrvTUo/tU9pzKku0oA5AkwSUuIiSk8QVv
	 tcqkhK4NA4MoXYFh6nys9MEn0+OZ/FcYHVw8IL4B9wdg/krF212YaNggdb4Wrqx/An
	 rzoaO33hmNlBsYFgx7PNjIqZQM1hKuSWoi50VjpMK3SratMuD4mTE3cdD7Hdgay2RS
	 SZQpwv6wo35Dt4aNpQ359BZ3Vc46Le1APQIh44llsZ/8ojvXz6skFBh/yfjzfIV2gd
	 Wzh/+aDKco9aw12EesxTc2v0WoVS0UX9XZAnTBjcsxMeDw9LvhzeMt7b8TvyJXSich
	 yJo1ROJFJSZGw==
Date: Tue, 15 Sep 2026 10:07:33 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Peter Marshall <pm@petermarshall.ca>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Message-ID: <20260915100722.38504-1-lsa.uz@pm.me>
In-Reply-To: <1070f707-8a23-419e-a0a2-a6f295ceb5a0@foss.st.com>
References: <20260910213308.53429-1-lsa.uz@pm.me> <1070f707-8a23-419e-a0a2-a6f295ceb5a0@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 507a9e05b502dfdab6bda6049da2741f8b2f394e
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Benjamin,

First, an apology: I wrote that badly. Reading it back I can see it lands a=
s
a request to move vd55g1 to request_firmware, and it was never meant as one=
.
You have had to defend a position I was not attacking, and that is my fault
rather than yours.

What I meant, and should have written: the VD55G0 firmware has to reach use=
rs
somehow, and I do not mind which of the two mechanisms carries it. Your thr=
ee
reasons settle the mechanism for me - built in, and no more about it. Peter
preferred linux-firmware and I relayed that with his agreement; whether you=
r
answer changes his view is his to say, not mine.

> I'm not sure I get you. Is this a licence problem of some sort ? Could
> you rephrase ?

Yes, and it is not about the API at all. It is about who may put ST's
firmware into the kernel tree.

vd55g1.c raises no question. ST holds the copyright and ST put its own arra=
y
in its own file, GPL-2.0, 3512 bytes, no request_firmware path anywhere.
Nothing had to be granted, by anyone, to anyone.

VD55G0 is not in that position today. The bytes this series would carry wer=
e
extracted from a third-party out-of-tree driver, by people who are not ST.
That is the same question whether they land as a C array or as a file in
linux-firmware - the mechanism does not change who owns them. linux-firmwar=
e
only makes it audible, because WHENCE asks for the grant out loud, where a
built-in array lets the same question pass without being asked.

So there are three routes, and only one of them is clean:

  built in, sent by someone outside ST - which is the series as it stands.
  Works technically. Leaves the provenance question unasked rather than
  answered.

  linux-firmware - needs an explicit grant from ST in WHENCE, and you have
  now ruled out the API change it would require. So: closed.

  ST upstreams VD55G0 itself, with its own array, exactly as you did for
  vd55g1. Nobody outside ST has to ask for anything, because nothing is bei=
ng
  redistributed by anyone who does not own it.

> By the way we didn't upstream the vd55g0 because it requires a bit of
> cleaning, but this is something that could also be done.

That is the one I would hope for, and it is worth more than getting my own
machine working. It is the only route that ends the question rather than
moving it. And it puts VD55G0 on the same footing as its sibling, rather th=
an
leaving it the part with an awkward history.

If the cleaning is what stands in the way, say what would help and I will d=
o
what I can. I cannot clean code I do not have. I can carry the mechanical
half of it - checkpatch and sparse, builds across configurations, dt-bindin=
g
checks, a review pass. And I can test on hardware you may not have: a Surfa=
ce
Pro 11 where the VD55G0 is the face-unlock sensor, so it is exercised by
something real rather than by a capture tool. Peter's series in this thread
already does a good deal of the genericising, if any of it is useful as a
starting point.

Whether GPL-2.0 on the surrounding code carries a blob with it is still a
licence question, and still not one I will answer.

Sergey

