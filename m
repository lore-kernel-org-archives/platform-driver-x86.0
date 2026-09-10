Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B644F569;
	Thu, 10 Sep 2026 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076010; cv=none; b=qqjM+hqL78pY8YlVD3QWR2EvJJTasmM3ZJy2bwcdXC8o4Xrkgj/JdHS44tv0is6aco7XCKJUQEQ5SN7YXqfkMsSMsdSbyVxsYQx0HnD9H2lkRPNpFE8d6H+eRtiCkWaxTqKuR8obxpgunsyO0Qx+mYJVxF8HyqbVokIHu2OMpJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076010; c=relaxed/simple;
	bh=3f/+NhOOhOjguAVJ5YrM/T0+7rUn8AOexsVT47nwLkQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y1WweLrTYe11FLdPYc1FQyfF5u0I0Kw0nbLSSY0ebfMSFS9YwMN01spmcHxuOTSVcdb/IMGJHe+/U81GSUEak7Q1Ci5lC2v2PUDB7TIMWYIGQyDFL4jBrV2Ug52cQp3llyyPBoVwdHog9E+rxKaM5qSsKIQq785NOhTvMNQpvPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ODLgx6Uc; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ODLgx6Uc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789075999; x=1789335199;
	bh=A3IlrYzmY00CTZvNsB75P4ar/qJNNxSN9EY80mgUNdw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ODLgx6Ucq2iCOGQYrsPDjnR0vYQ3ZZdHGPB5cS4Nc0Xi1lBiSzhkiTnRFScU7iKcf
	 P1WBC8mhOdqwVldMnRTguGAzbYr0JeUh72bTel0PgZ08bFIDJVrerUplyvE8B6huP/
	 CdLmKbCeN9gIyfiLs4DJpBOELqgQZrepjBNJTKDXUJgBpUWdBf6q3Q0xyJ4grb2oaR
	 vSMJ9U/4VOt92mLibtmNscCCPImdnhVNjUY90QQrbEatw+J7rt7LBnp5NUglNzjG61
	 f59mGexuY/Kdj2cCECx/naJ3VJzo5T8fBrLd/HitAddzdQA+CwDl1qVfc71T/aZbqS
	 DiFx83Tfcmq1g==
Date: Thu, 10 Sep 2026 21:33:15 +0000
To: Peter Marshall <pm@petermarshall.ca>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Message-ID: <20260910213308.53429-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5525e97b4c973c6fb6d27c43f43eb2c204de1658
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Following up on the firmware blocker I raised on 7 September, since it is
still the thing that stops anyone but the author from using VD55G0. Relayed
with Peter Marshall's agreement.

Peter sourced the firmware the same way I did for testing: the version 2.11
patch array in Andre Gilerson's out-of-tree VD55G0 driver, which he reports=
 is
identical to the one in ST's standalone driver. He has published the extrac=
ted
blobs for testing at

  https://github.com/petm5/vd55g-firmware

and would prefer submission to linux-firmware over a built-in array, so tha=
t
firmware can be updated independently of the kernel version. I agree that i=
s
the better end state.

Worth adding, because it may lower the bar for getting there: the built-in
arrangement is already in the tree, from ST, for the sibling part.
drivers/media/i2c/vd55g1.c is Copyright (C) 2025 STMicroelectronics SA unde=
r
SPDX-License-Identifier: GPL-2.0, and it carries vd55g1_patch_array[] - 351=
2
bytes, firmware revision 2.9 by its own defines. That file has no
request_firmware path at all; the built-in array is its only mechanism.

Different sensor and a different binary from the VD55G0 one, which measures
6868 bytes at revision 2.11, so it is precedent for the arrangement rather
than for the blob. But it does mean a built-in for VD55G0 would not be aski=
ng
ST for something they have not already done one part number over, whereas
linux-firmware needs an explicit redistribution grant in WHENCE from the
copyright holder.

So the two routes are not equally hard today, and they are not exclusive: a
built-in now and linux-firmware when ST are ready is not a wasted step.

Whether GPL-2.0 on the surrounding code carries the blob with it is a licen=
ce
question and not one I will answer.

Benjamin, Sylvain - this is the one blocker on the series that nobody outsi=
de
ST can clear.

Sergey

