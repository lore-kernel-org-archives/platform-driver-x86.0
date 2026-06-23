Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCF34041E
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782240718; cv=none; b=gFLUTHS+z4yulfEbjyXPh4wp3m0XMZzk0mH9gvjlkZihdwel10y0xFK29nsaV36cGwT201l7zhjPQewDLnaLGy2HuI+n2Z6SP0FIimHAhW/bRHFOYESVX0VjBNdpqXmsdmQQuUdfIVEtbMddLmpt/FJxBtMEMC4bUINRa8l3ubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782240718; c=relaxed/simple;
	bh=idHWBGBFazYbc/UBZuGhNEFnflqTdVi1Q+OhPv3PNXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8LwG57mp2lpkn0gDrDogdgCJ2ESABuRfLfvW6Wft2V+JEAs1/nHOd5dw9Bz29xqDzUWO57uJqAhDvLiLoVxhjIEajTwSXGHfA/0RcWzhIvB3XQ893Y72vw7QGMwowcYYW123d2WNy3ntpbz+tBOhT30eZpE9b29HqKusKbTm2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=O9uTzvt4; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="O9uTzvt4"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso425823a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1782240714; x=1782845514; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh3dKV3N648NqxJDS7iuKVRyX/XkDUz58j40/e5pJI0=;
        b=O9uTzvt4ZR6fGd7aW1RgUEW7DhBM0WIx/ddUwcP//uZFw3oAsqKZFrDz6LuuPfiCix
         yvv1vDCn+6k9N7btP5XfnF9CTQlsGlxQsZVSeah2bwUyd7vjkqu5dUX16qsMkkS0xfDa
         mLBtWJPao7QhMGNx1tUtI0llSRF9h7ANmCU3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782240714; x=1782845514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh3dKV3N648NqxJDS7iuKVRyX/XkDUz58j40/e5pJI0=;
        b=TWiBFiikd8iQjXGin3YY95uiGgB1x64n2KuknyTCgs2ICb+xLVB0VnoZxuP9eELVo9
         iUGcPQ3YRzvGKmjPx1p6wQSmuZqDe92pt2Bua4RI1v2MtLkzgjq9JiultwNrTTHJrc81
         BuYq6CUHXvJT3zzbNlVQk3mKfBuywJXNCuhFgVtVb1jDSWFz8M7q1gA5TgSguCkeojGt
         K3eDwFPZ5WVKjAdZcHcUfIzldeI7R2VJwY+Wtdb9PNExVPF7gqW7ORWdbsmXnmKHSfmm
         1LpGxqiQJfq9eeblhTVa8qo/FecNSmXfdyZF/suAUb+e24gD7/WBWXKcXHum12+6oDCY
         NZHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hGAkopZrYUvEPgj6VR48DY9PaVNjsejjBtJYa0OQnPEsh3fwwSVE8UCpWnIWBhDz/C2tE2dQDaqay9+VBloM2ze4t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6pNYp+ZIjd68JOQN/i+tG9EH+CH4CPQ/fHNVoEt0JArhE8EAN
	xRSW2hmRfFYW+GF1NGv5749pPaGBDTLYL3mSwbBFFfKYXg7sHJ4tZoobAIfJ7sygez5/5aE0TW0
	LuPG4uOI=
X-Gm-Gg: AfdE7clcKlsk/YdM8LZcAD+ysW8s1aQWHhDaiAPI2hKh4VTY58T7TQGl4+Kl7TPB1mV
	AO+i+L94kibJfVf/FtWGzihEfrPMri4CoJzs5RHpip23nxg+elzeItQqkLq78bPGG7spRGwTkA9
	YEZLGLx4yAX2f95LKBE649ODzKoNxotgXNXgNky9KAkTedRxhVRd+R4phrhmn6Van+a3GeqyUVg
	tms2mtm0bZgmOj1F78hEELDUfTF8+0q4ASIJofZjM0XBtX3wSW2wvSTdRjKO/DG+aq2QqhPdw67
	mEb5IpFFDNzBKmplAkXotYEorROt8zWX2L7w1Xyo5RcjX/I95fXCG7j9d/IbuBG8qMaf0of5qO0
	l6Xm4SJvpxrPad1tvUHEE39VJsIame4OyCperfxTH4/xKmuI3frtCXWTXbuAuUYpGGJiG2G/Bad
	xGzfWJJBi8VEWkHsELWqPkvLHt4j0QgyE6m/QjypLcpq77s4ZjTr5plQlJxvm0yA==
X-Received: by 2002:a05:6402:4022:b0:68c:3439:945f with SMTP id 4fb4d7f45d1cf-697d4315887mr2763419a12.12.1782240714184;
        Tue, 23 Jun 2026 11:51:54 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b84eda2sm5160165a12.9.2026.06.23.11.51.53
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 11:51:53 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c074142cf6dso194324766b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 11:51:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/aYOaASOdKZI0kl6BWUomwGbqOtrJzEA7XUNQ/UKyApsoYEcM5eQuaySwxNZB4Giuy+1EjtL5fvbyUwH8Q5rFEzlFV@vger.kernel.org
X-Received: by 2002:a17:907:1c06:b0:beb:d461:7b09 with SMTP id
 a640c23a62f3a-c1030aafb50mr296806766b.11.1782240712916; Tue, 23 Jun 2026
 11:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
 <CAHk-=wi=29jSstqyF8EqRFccWnA=1TfXW_jcURhSd4rJgkSxgQ@mail.gmail.com>
 <CAJZ5v0g8GUJxy3TPfXa=Hjwk2puYKUpAZzdbo35houPEBLs6cA@mail.gmail.com> <60e45b3b-7c47-44bb-ae3f-7b3579633434@oss.qualcomm.com>
In-Reply-To: <60e45b3b-7c47-44bb-ae3f-7b3579633434@oss.qualcomm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Jun 2026 11:51:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWvyjktPv84kkNCwiwQfBT_v7WBJeeEVeCgqepjcSt+w@mail.gmail.com>
X-Gm-Features: AVVi8CfASYQRJ_MD6-GoBwnfrfAZYgBs9-P_DW-c0lw62IJwQGcGfjJefTrXvSc
Message-ID: <CAHk-=wgWvyjktPv84kkNCwiwQfBT_v7WBJeeEVeCgqepjcSt+w@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-1
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2026 at 10:25, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> Yes, sorry for that. I'll take care of not reusing the same function
> name in the future

Note that reusing a name *eventually* is fine - it's not like people
need to try to remember that some name was used in the distant past
and never ever use that name again.

Yes, even that can then obviously cause confusion for stable backports
if somebody is really unlucky and ends up using a function that has
changed meaning over time, but at some point it's just bad luck and
re-using a good name is fine.

So it's just the "don't quickly re-use a name with entirely different
semantics" because that really does end up very confusing.

I entirely understand why the resolution in linux-next ended up being
what it was: Mark clearly just assumed it was the normal kind of
"calling convention changed with new arguments".

Because that "extend the calling convention" thing is pretty common,
and that was my first reaction to the conflict too.

It was only when I looked at it a second time and went "hey, wait a
minute..." that I started looking through the history of that
function. I could _very_ easily have missed it entirely.

Now, things could be even worse: re-using the name for something very
different, and then having the same calling conventions as the old
name for completely new semantics.

Then it would have resulted in a completely silent and very subtle
semantic merge conflict.

So symbol name re-use just needs some care, and some distance in time.
It's not a complete no-no, it just ends up easily causing mistakes.

             Linus
