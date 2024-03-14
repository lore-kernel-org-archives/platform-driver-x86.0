Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE81E480
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Mar 2024 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710441431; cv=none; b=VHGargbSUEj3DjhvYctVDEO/xba8czgvrMQDm5q5Wdhssg3jyEKZBriC3fNKIGFElhWoSuqvcygK7dLnhQkQXq2apkZ9RnPWD9eRrSg3jxG4EbLf/XDrPxPUlLm8z323ylB86qYGiUsQ2SvdaP8FkUaHEOhJuOmdOL45dKQT55s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710441431; c=relaxed/simple;
	bh=5zX85xcBrLUKqCQn8fjjnIh2KmQKXlgJU7872McN3CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxH+5ONIGDP1pIG42QmVaEJlSbEVYNZl8gfRZS85M+TaLUC1cFog0uhIH90+jQ3mqnAnYGYoXHNBMRxVQxC2m/PD/CmXNWhZwOrNR0iFRQz/21cijjyq/YiMJ8y6FX5atFH4X8htF3DHH2865nJYL6s8RqfP8YQL9ktOq1QNgLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a7rXWeEC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a7rXWeEC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a46807a7d3fso22130266b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Mar 2024 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1710441428; x=1711046228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAnheW04vNnoWidpA9IFyeuIfxk0TvWztCoAISzqkS4=;
        b=a7rXWeECkGjoGcG7BuycvlcIvIqCR7UBJADH2iIwe0ImNCtuzwR42T15E1qrmnaZrB
         PZtFBeVq/GRVZsu2gem+VVx9CrNcTI0XbMET+JRKomI6dBt8l06Nl8GLsrR43tADTgDH
         235CsFIWP4G4zzSYBcAO641GsFB2df/gLsSFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710441428; x=1711046228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAnheW04vNnoWidpA9IFyeuIfxk0TvWztCoAISzqkS4=;
        b=mkaQ4Tul2k38uDicehquTit0cRwVMCwcrmBTrBPBxhPq0o52n4hX95lCjHFtMOSBXX
         0xr0zWMQL8RhZJn767DFK8A9bGhhSalaqFQunVgQ55wPp8jONzyPzFXT8QiceG+dbXDb
         ybR4WjvsMkXNNTP+XrwQA3hRWJBxlZDBeBIPrZkt6FN18UeDfSv0bUaWtYw26cSCNQ7E
         VuyCfCWdBc0IDd3XIwYT20Kb2Q9lFYjiiLFzSV+mDkedY9ZJRbh2IKfKnnQ7cHuafASR
         dlV/aURsTvFTNDqrixi26XeS7NQxv+q2iKDKL2Rubb9hjJWblop6XvQm8k+SYsVSs91d
         Dcag==
X-Forwarded-Encrypted: i=1; AJvYcCUzKcNjLLpotlhyjAbIc9fsUId2LC0TCiwreL0LpDB6Af3YILphS0fcb/XHrrCiAucsTc6368H27Jf2onezZkYZBW8ksAvN87EYcW2E/z4WOlYwow==
X-Gm-Message-State: AOJu0YwlMPPAtBJCUeGsETYNkEGGUZHfXEo2TzgA30ruRCYR/sX0tilh
	gZ30Sf2MLKPeNDz7zXMrqDBGBtgu07G77Kvf7NBMkHh0pIGZW1jouhxqh1ENlS92LUnUzsNvc/j
	WEe0Vjw==
X-Google-Smtp-Source: AGHT+IG5Iy0VkW5p6tt/gY77xfm4bjLiEMKqI3csnI8Bn/cd/4sO8FG+VbayK5udmChhAGSiOVR8fg==
X-Received: by 2002:a17:906:578f:b0:a46:7d45:6904 with SMTP id k15-20020a170906578f00b00a467d456904mr655691ejq.26.1710441427743;
        Thu, 14 Mar 2024 11:37:07 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id en2-20020a17090728c200b00a4674ad8ab9sm710633ejc.211.2024.03.14.11.37.07
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 11:37:07 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so3960667a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Mar 2024 11:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXH5PqnqgAoYsdLJlb5BfieRRlaVkRJskI8NDkqNNBwotlVsrjcJmaMxdUydrR+OjyKdHTypGo3Q6pGET69uj8rQMN6ouFYPMWOZYHTxj23cfLMDQ==
X-Received: by 2002:a17:906:6ca:b0:a46:6884:ebc3 with SMTP id
 v10-20020a17090606ca00b00a466884ebc3mr3214948ejb.35.1710441426999; Thu, 14
 Mar 2024 11:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <65f2d9d4.050a0220.b240.7bddSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <65f2d9d4.050a0220.b240.7bddSMTPIN_ADDED_BROKEN@mx.google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Mar 2024 11:36:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgy=53GsFDEJsq+6Gd6eotxw=2rh_gVvL+3zPpmrOc=_A@mail.gmail.com>
Message-ID: <CAHk-=wgy=53GsFDEJsq+6Gd6eotxw=2rh_gVvL+3zPpmrOc=_A@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.9-1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Mar 2024 at 04:04, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Here is the main PDx86 PR for v6.9.

So I've obviously pulled this, and pr-tracker-bot already replied to
that effect.

However, it turns out that the pr-tracker-bot reply didn't thread
correctly for me, and I looked into why.

Your SMTP setup is oddly broken. It looks like your original email was
sent with a bogus Message-ID.

So in my headers, I see how gmail has added a properly formatted Message-ID=
:

  <65f2d9d4.050a0220.b240.7bddSMTPIN_ADDED_BROKEN@mx.google.com>

and lists your original broken one as

  <4844b67c9b1feca386eb739a4592bdbf.Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>>

which indeed is completely wrong.

I have no idea how you managed that, since your headers don't actually
seem to specify the MUA you used. But whatever it was, it's very very
mis-configured.

The pr-tracker-bot reply does have that original Message-ID in its
threading notes:

  In-Reply-To: <4844b67c9b1feca386eb739a4592bdbf.Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>>
  References: <4844b67c9b1feca386eb739a4592bdbf.Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>>

but it doesn't thread for me because the message-id from the original
email got rewritten as something valid.

Can you please look into fixing whatever MUA you used for sending that
pull request?

This is obviously not a deal breaker, but it's odd.

              Linus
