Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59E3C140F
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284275; cv=pass; b=eqtP+RMskUWcZr33Jfs/SJg6QdI11sFzktN9SCRy9WT+5qG6dr+fJsWzSpJwr/knM74v3vOc5ab4wTReRnH/HVG1TRg+Ud9lHsbk4zmQegrg1dkbgngbFFIO6U7NKpk1AcSi8TYLEXVlmc7r0zjebi1S61hltQsjVC4gTnHATBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284275; c=relaxed/simple;
	bh=iOiSE0D9ee7Sm/e28AHjuVIIq7sS/74BRRRrRqGlNiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBIhgO8rpbZUfHn1lChtE87S2uzh9/TZ+MKUIJwMaXbcO/WkdHdTa6iHb3ns0S423LrGkogLSZ9ltC06kzC/kdQPKtGViuFx/U6nua4N+l92ZI7+TF7G2SVDn6Jl0/3Cll85T9b2Jy3pUvTpoo7ArIfxtVfb3pkFBJFj6QJhuXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCDqI4N6; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCDqI4N6"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so529454466b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 09:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774284272; cv=none;
        d=google.com; s=arc-20240605;
        b=DAerJFngujVY1Hs1uXliSyeBTUb89/6Vta7ju7s6fLtUNrIpP/L6/Iu+EsQN0aDbWf
         bcZlDIK+s+76L+gpKkBDvo8NLPdIjKNfl30ALvaSti+S7bTPOHawJr1LuqgMzbSSHjAN
         h8MyGMHpz5Ir0ExJfW0F+yzFYOgKzJqyqMzNpjxxEUps+Hc0b2UtmLLTz47rlMtPbjG+
         xCOMuUGTXya6PhQLhX3NaYWg9h1yISiXgLbqkkczbuxPkH3SNz6sm5a6wmmrBovIfy+q
         Rdsvn/pn2gbXCIrZzU+5vwlG6KHwLAljTQOACLtwn8AiCDm7EbTETYoYMAuFPPd97blo
         1+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=19KOfsfsCHLU/Bj+wS4J+CsWCEDhPuzySwigX2HhnlU=;
        fh=157iCyTY3hDIIpZeMZP9NtscOBTtHGWZ8gc2TzQshZQ=;
        b=IrhuVftdWsGi6azqA0G45fQJOBlwACtRLpT67s1LfRFQ0/zZICO4ut7ps/DzRMdYco
         +qqTPHp84hfxBUnCXaAJeMLsp70SRx27ngSJB3VSne5N2s53PyJn1lSjYwqMSstXNwb0
         GvTJG94zBk/qaayHkBO2WMZdTPvFg5HYdHRJ4pUxJJaSef0z9TZBx7bWeeGWfhOa+i1C
         KJmHY7YdIx/CCPdQgH8pu4yzzHxbr8nWHy2Tlwv+U2FnwGmx53C7XDq2Eoy8jkI7xcLV
         wEIEWE4wb/5I/ppC17NtibNtT6F1fo0KWc6Oc+LEdqF4MEtvh49S/VUtnUxBYcqoJOma
         cGPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774284272; x=1774889072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19KOfsfsCHLU/Bj+wS4J+CsWCEDhPuzySwigX2HhnlU=;
        b=XCDqI4N6zID5YG7R4FZcVOJBqFixoYyBdAT6LzNJGr6R4aF6lcVBwCM5UAvsqLt1Jv
         qAhMfJzBQ2X8vMpclW3X+ULVWeeYdmtJ/j5XDsdxaJariGZxM9DaiLSa2+aXiaCGbt8M
         cNPBpRvQPEMxzyNayjgVlIiYEtZY4R7dNjeOLccOinU9BTiEHVJdGY+c9iMv8dHSiH5b
         y9f+uGDYv/4DDYf9hQalzzCbJjNtgt1cNajZ/0xdcCVtpDzMvxM68ePpPmE490OaOf4s
         IaOrFRqCzlP2WeWI6TqoPsBtqOiq5T7iEz9MkU0HD1em8Iz1AyQSob7jdvBGx9ze3eKH
         8XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284272; x=1774889072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19KOfsfsCHLU/Bj+wS4J+CsWCEDhPuzySwigX2HhnlU=;
        b=iGKkZFuPwZjJn/lsLzz9HS5IIbDt5KkCacwcaQxcZudt1ZIEWqUct/sTtTXlMveuoe
         0yJQbxogve+peSammfV/3tnpieHk7EAh6KVjx6S7SmnZgl1O9iZrgCYCGm02TiM96Huk
         ou/Co5NXsz7RZX9LHreTVrVpX9FZftzZ+HfwW5ZgaTADaQNvl9lsz9Vcjucmp5/1MBIl
         e6jOSSBiwCSVZuGEnXIY0DCJ6kdW6DjxHMD2i5mZsEw2t9ApUTKWzuybXWWvuggAQMEV
         57AxuoX69pvlPkhsWz+H1uqWVOMwEqRYH1MyczHh644nPNnDzOdHQFChb8ONKSXTm6CJ
         c/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU3DadHSU5hA7qjlmD/umyAWbpDGDj7d7Va8Z8vJ3dtzmg1klHdNLy3yrhLLspzNx/EcMoVNlAKZFxWOfKUk9vLW1Wp@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3c5UvOmJlR6Fdumb0Ml2RGDh9Dg7mCqRijLLb6d3gTjy1+5e
	5xF4Bh6Ej/dN8wgFbH5eCuAFb459JGlBASyksGlBeW9J/AY+AQmrUFiNTuIZupleBoGsI6geIrS
	N3uwrHMj60EmfBXO+QwW4Tz7dkrBlJd4=
X-Gm-Gg: ATEYQzyJP1hqdNZ8JhlE9++5geYqchVHDNz4Fwn5vgC+mT54UV81BqKozZv6ybgLoHS
	gA4VT2HoKgULiPeWvJb+yQYQUGT5xP77XzE4fGwjflnJBYzrdZIT5l+qKgPmeFf2nMn22LBvoKr
	xlP4yNUCkvUXwwS6DjzDh7acou2aYDky9C0xjqbtNmTMnNOwhY/JG8tYZndVROJoT9CUHXnTzYM
	hqNDl8NrtHJljvxN7t70ZSo1KZyCszZh+yW4+OvkPIkVz0FQ5TIOIxPX2ALW2n0D5OM21LQ7cK6
	inteaiJjmI/s5kk9n7Lu6E+Yr+uNKzTDUHitDhzdcNE9avIqB2zQOVsWJcOMae/cSgHFWnduvhn
	XcGbhew==
X-Received: by 2002:a17:907:3309:b0:b97:9099:7b3 with SMTP id
 a640c23a62f3a-b982f3d8245mr684159966b.44.1774284271978; Mon, 23 Mar 2026
 09:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320004928.29914-1-rosenp@gmail.com> <202603201131.55E516E@keescook>
 <CAKxU2N9fqr8XunsR+=-P8AngLbUbphTq6aFnEJ_yEGhue9d2wA@mail.gmail.com> <17effdb3-7406-d280-8d9a-e699e54dadef@linux.intel.com>
In-Reply-To: <17effdb3-7406-d280-8d9a-e699e54dadef@linux.intel.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 23 Mar 2026 09:44:20 -0700
X-Gm-Features: AQROBzB9FeU8sgsyfu2mFaEm3_sHqNI3RC4CCQ5eSEbjea3JoaWfhkweU9_cTVI
Message-ID: <CAKxU2N9apKwzwvRdLhcuSTNz4iVh4aVXUHnUV-nkr=LnEPHYjA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: simplify allocation of sinf
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:13=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 20 Mar 2026, Rosen Penev wrote:
> > On Fri, Mar 20, 2026 at 11:32=E2=80=AFAM Kees Cook <kees@kernel.org> wr=
ote:
> > >
> > > On Thu, Mar 19, 2026 at 05:49:28PM -0700, Rosen Penev wrote:
> > > > Change to a flexible array member to allocate once instead of twice=
.
> > > >
> > > > Allows using __counted_by for extra runtime analysis. Move the coun=
ting
> > > > variable assignment to right after allocation as required by
> > > > __counted_by.
> > > >
> > > > Remove + 1 to allocation. It's already done in the previous line.
> > >
> > > Are you sure this is an accidental +1? I see the "num_sifr++" that
> > > happens earlier, but it's not immediately clear why either that or th=
e
> > > +1 in the original allocation are needed. I'd like to understand why
> > > either/both are/aren't needed.
>
> There's a comment right before the increment:
>
>         /*
>          * Some DSDT-s have an off-by-one bug where the SINF package coun=
t is
>          * one higher than the SQTY reported value, allocate 1 entry extr=
a.
>          */
>         num_sifr++;
>
> ..l.which comes from 33297cef3101 ("platform/x86: panasonic-laptop:
> Allocate 1 entry extra in the sinf array").
>
> So I don't know why you said it's not clear why it's there.
>
> > Looks like a rebasing mistake to me honestly.
>
> In which commit?
None in particular. Probably just a mistake.
>
>
> --
>  i.
