Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188E347BC9
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931202; cv=pass; b=o10w07CcsXl2h0HhTOJ+AO5vy+YSAzDy/OdFrM1N245ZHGH6FSBT1Yg2wleUq1015nvQU43H3nVH220DB0E5QcSRMVIiNBsbJ5c8++DwmbdWBG4ARu77K1TvqDwUXAh4jRBpCCI1SDip8tPYuQ69z8s1tveUnk+Q2AaUbj+f0rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931202; c=relaxed/simple;
	bh=aYMwFjk+o0RotH3YSetD1z8LEaseMUMyIAJTQWj/GUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PP5WQlD5A9fK0aoMHiasEM0GgZ2ApFOJ7QX98lPVKrgMxOBYvU9EQJyMIB6rl5TPV3Abmq2Ku9Zh4ntGTW2Yd4CbtVBVxkExPy7elCAT7wwheDLQhBxY09SAmE6ajYI9n9VViiuZxMaAV/qxoTwvscQQl7S7yfbkVi6heNY7tsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4cXL2on; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4cXL2on"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad4d639db3so32583575ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 01:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776931201; cv=none;
        d=google.com; s=arc-20240605;
        b=hQo9wI6OMjZLu2FrhYZImb2J5SIRhtquuEBmCz4SubTpU7rZ50xA19DFlrNDKlArM0
         S6rvK9KwCCyxwWHpYPDg7sEZNFvsKPwwI5sT8MlEXjhOlu1xG2ei8qtQQlneX4hdl4TC
         fWg50jkKZi01EO+teBoFjbBiBVp+f3doq4wqWcY5ZX52mXhn1Hk73Gg90RKDMwmBh8Bn
         ly83tUF6S4z4T1/FIP98SIb0ei6W/1L+HQZJvgYs0W8J/8DQVivk0eriYq8bbHPO1n5e
         S7yDtzWFEnYti+3nlA/hGBetqNK9f/FHGsRhmqyKxuB9SSxU1a7BWopVtV0giYYNrpbO
         yCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aYMwFjk+o0RotH3YSetD1z8LEaseMUMyIAJTQWj/GUs=;
        fh=UJqxjlrRkgDa7dqJ1cdgUP6lhHWrIZm/Eqt69kX4P8g=;
        b=hbg/xujxGrlwTJV5++ilzpYHzwJpehtT5mgVk0QeKO/XU5K7T2/WQrRmz+MuAtUwad
         CzixY9TffQEh1ayaBhl2zpFMGjzwXJb8KhFa5c3/eQTYkztO7wS8w/7it68zDfOzr4vx
         WNoSJX3DkbCBXviXRnYFJxWmISkdRnuFvNAf+yCdbjm+9vWpmQcvWaWRIFi/t5wSzrvJ
         aPkNQ3z8CD5rLb3TQE4Go14MflLhLR60J1xOezVz/OTM0P8rwvpuhxd6RQXiUoohIJ//
         TB+OVy0czJsbHWKiYLLLLyANpnvQrDprGyUtnhOWo/u3vmkMfyEVe+y073GAN1gIR+BQ
         jNTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776931201; x=1777536001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYMwFjk+o0RotH3YSetD1z8LEaseMUMyIAJTQWj/GUs=;
        b=o4cXL2onXny/hbKgaLP/5LuHf8SMFpXkDawJbO5zot2JOqB+Orgz9TYYTLpxLteGd+
         eft5+ag1SAzos9xsZF2tvFcYtfvPLNDuRZAT2ZndmwoLNhtIfezl8VsFWWHxpyMP/7QQ
         n2p8Doibp2rEtDCLKiBiT9DlzYWWVGFJ0bJu0m9L0eGAiYw4+w3bF5y66n02kzoKi4iK
         tQkYmKwkB4toCM8OQy93t0xw12ljBPeES+9hK2qcSPN8KU6gees51cx+D+nS69ctEZiW
         GRTkIih4SvOYUlom2ZjxBqDaROgIceYfPFXAduQLBs7iSd5kxgcN1zOr1CQdeaxDKNjU
         KHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931201; x=1777536001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYMwFjk+o0RotH3YSetD1z8LEaseMUMyIAJTQWj/GUs=;
        b=mFIhDhAiNglGhe1Kq31wL0Q8R0dum5OE6OtDmsvfOCGp3GTR0XlSVVHYjcKCL3vTVm
         jVm0X58E0WdkshcmT3jeQ7QR3QkHPizoUZ+ofP5Fk7vlTI+tHgW3OUOid2F2lBG4S5Y0
         /Y5D147MNKd8rXmyKjgH3zCbQLSIHZMvF6tmFtHQMKZQEs7iIKhgifTNB1onEZdYCB1o
         hspnuXTboPbq9IurSjjavu2FQwCLf3Rk5Azi6hB3a3m06sW5dTYRKM9xY5dGOARBMpNp
         IdYhjlquYyMLcPpddbfCnETwjsK6xcX57EGBVlzI3RSemIEHMMb5F4qSw3qH9H9ORfZK
         BDug==
X-Forwarded-Encrypted: i=1; AFNElJ9m8Wev8g5z1TuOjgxH/gPfCB6BhwuEjhPZD1vzbf6GQXOwXAN61A3r6IavwS9yRvttBi1t9bTnncBKXximsyJT874+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VvjdVrQ5p/qGnENDTvXT445GoKKOnJMNVOPusbZsZkN0OVjs
	9OCalzDI/yTazLK8gzYcNgTbCnq7EyNEGDgs4JECF0cuk7lcUPcrA7W5RpqszQs+ZWLpC1Gp8fl
	yLccb0b/0oK/rthSO61aJAiHCOMESbMA=
X-Gm-Gg: AeBDietEwPbk/4v8ijxWgGL9arjJwV4HauxYwvxAyQMtRwN93QC7CikYly/3FwsxpL8
	d+humUPVWZsH3bdtwtBHEVyJ7oBtyZFlGpocgPYwBry8J689h3yT/NqTLTuOzFEMvdgnR9748SW
	4iR4gw9HP+U7Mr8F1epconE9/IDEcyVBHUnkfBRGwl2B+uarm9BIb7gHL13AyTl1Jm9gK6y/jGb
	F0oAkTHSyEXJ/lry31Z8ejRgZ+g+nCseNgd+cloXxEitFBBCuNLZDL54BCKq1+GMSWCYx/PNeOC
	oxLcrc2Pxlb43Wfq+LGAs0MwouBc
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id
 d9443c01a7336-2b5f9fd21c5mr272633725ad.27.1776931200809; Thu, 23 Apr 2026
 01:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422104227.19969-1-turkoborys@gmail.com> <c0c35d9d-92cf-48e1-8e69-e737e580ab3c@app.fastmail.com>
In-Reply-To: <c0c35d9d-92cf-48e1-8e69-e737e580ab3c@app.fastmail.com>
From: Borys <turkoborys@gmail.com>
Date: Thu, 23 Apr 2026 09:59:48 +0200
X-Gm-Features: AQROBzAD-iGj1TtwldSGbdwVy9k5gJKL9dFsW_hT7J3rJtZRD4fQO36od2iGQkE
Message-ID: <CAEAo-Lig6UGvx=uAYB2XJ4quSjxEE_QzypmsYR_ojV4OODhsng@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: remap "Star with S" key to KEY_DASHBOARD
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	"Derek J . Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Thanks for the detailed feedback and for testing this on your
ThinkPad. I=E2=80=99ve done some further testing on the IdeaPad Gaming 3
(Cinnamon) to address your points and cross-referenced several IdeaPad
manuals.

On this specific hardware, I found that KEY_FAVORITES currently
results in no action at all. It acts as a dead key in the desktop
environment, so the risk of a regression for existing users seems
minimal compared to the benefit of making the key functional.

While the ThinkPad intent might be more flexible, the IdeaPad manuals
(for the Gaming and 5 series, for example) specifically state the key
is intended to "Open an app" or "Open Lenovo Vantage/PC Manager." I
tested KEY_BOOKMARKS as you suggested, but found that browsers like
Firefox "hijack" this key to open a sidebar, which prevents the user
from mapping it to a system tool as the manual intends. Additionally,
in my environment, the system labels this key as "Favorites," which
might be confusing for a "PC Manager" launcher.

In my testing, KEY_CONFIG seems to avoid these conflicts. The system
identifies it as "Tools," which is a perfect semantic match for the
Vantage tools mentioned in the documentation. It isn't intercepted by
browsers and remains fully mappable by the user. Using a neutral key
like KEY_PROG4 would also achieve this same goal of giving the user
full control without default interference.

I=E2=80=99m curious to hear your thoughts on these findings and how we can
best align the driver with the "user-defined" intent described in the
manuals.

Best regards,

Borys
