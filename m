Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A215F30F
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817507; cv=none; b=SKFB8mPBHDJ+IHNQnleHIKcuFni+aIWHq3qg2C9z1il0qayeByd9GJql4k26NB0+SN6qUnW2lfTNekIgfXsIuW15KhEG1vxDYUCSsFzrJesOJ3My+EtFA53UeSWvjKco6ifpDZqfBlj0l4HkSMjfVHWow7q2dcbAapIYo5d/cNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817507; c=relaxed/simple;
	bh=F7buDO5ffaX/8zK8H9upLvE2ItSd6WwP23m3zPROfC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O98HIX9PA95MuwXJ627ovYGMzQmpeLwiTa6FRwOoi+DKPd3VB2OvLNRrQ6FynacNbAnVRXYkz1IwA+D6qjMwwJQZzNhxquHavQEnc3jwxEw1/rC5GSQqy1S2IkhlQTBDt8vwxc8m/O517VKeGSgURlqkRPNkdmCxAzHyRHQfUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmxm5Ug+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmxm5Ug+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5785fc9c543so3286024a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716817504; x=1717422304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7buDO5ffaX/8zK8H9upLvE2ItSd6WwP23m3zPROfC4=;
        b=hmxm5Ug+c1/5cdk+ZlVN8nxnuoreYjm0jhgSt2W8LcvPuTQNZqH1bQ+b+cvVXp4U+x
         H6iNFmzXIVvz/cbNs323OsgjgMYtdfJSAe0CGtyMkkwgM70MbW0UhF8UZ6v42VTxrWcG
         MsE4dpoOV8wp1jXTFi4roJAjESkDyZnKQVdEzQDV5DtsUn4qlHsQjkUfPpAmGfQFisPc
         VY01qP0+C4ng00kpmkN+6MNlG/alQQ1Od8qUQbFGohFvmVXt2qLQLqrh0SbTbSzyLLmS
         BOnWzFnH5MZMFEFObM4/H58uZtD0gjhIZVpwQFuad45uRos8HK5HFLA4QC9bHr1ZnhOU
         xSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817504; x=1717422304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7buDO5ffaX/8zK8H9upLvE2ItSd6WwP23m3zPROfC4=;
        b=ivC4lE3uWMFN8CI26fshVdEb5FunIf+UO0bgxJs3D2bQPYV8MY4I0gyYkTPvSBDZuL
         /yTmVwjuwExUXOoIjxL0s0SDbiIAKi8NFnLzM+1nQYpXQysskEBAfwsHlj2EHRcHp7qw
         B28LnVMboF/YBnf+MwxYpHrZSG2VC1dqYNXhdMTm7TyU8pa6GjCc2nnboxdDFn6Qub2x
         UGsGzHWqvbmH8Z1o8fcqS5ADDW4c+zjq0X2/Rs+S965kMyTcAcvErkok+Wla8LM8hNr3
         +N4gwfXcl85uuy/Q59EqeVqNN8pllsqnvid7KdzKGwX5fmuEAb7bpcNDxqUIgnIFraeA
         ecqw==
X-Forwarded-Encrypted: i=1; AJvYcCVsLwFrpxXK51zjYsUx14KRw/3DQNG5b2gUPtpB8hbVCpqrqTM307ueBdfHmk7R2r/9zsofvjpzx1rgtVJMElWIvqpWihOrYzGKgztJHp377B2OXw==
X-Gm-Message-State: AOJu0YweDaloTjrXJdNvnp6683mtwtd2Y49C9fWu5mqr4IMdAgUniF2l
	a9h1KvGI8UsEvo9TGsghQ3vBEDSt4BkwXUoDjU+qoy0YtVDbZlRbrBh7dYz8RDAyXzCgpkGasRe
	I9niT60lgzb6EiYmm/Xkg+fAYFDA=
X-Google-Smtp-Source: AGHT+IGJbWb2d2OnO627/vTM65auXgWKPmbhta5RQQ8Gjb2Gnck52OzJriWGCIs61gjjICLZjKl/6CPdnD9Bj990pM4=
X-Received: by 2002:a17:906:37cb:b0:a61:42ce:bbe4 with SMTP id
 a640c23a62f3a-a62642e92acmr1073816066b.27.1716817503479; Mon, 27 May 2024
 06:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522164807.28936-1-hdegoede@redhat.com> <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
 <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com> <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
 <376bd875-e4ab-403d-9265-e6833ccb31d9@redhat.com> <CAHp75VdTJbZru5M4d81dU2Wbu4=G26OAgVksFF8H8vRBWHeDfw@mail.gmail.com>
 <f6d5675c-7215-45a1-a99b-f811ca0c4e27@gmail.com>
In-Reply-To: <f6d5675c-7215-45a1-a99b-f811ca0c4e27@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 May 2024 16:44:26 +0300
Message-ID: <CAHp75VeVwVpn77-+WMdTNcw2Jt4jiC0jVXhZFfZ=A4A65N8L8Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Gregor Riepl <onitake@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 8:41=E2=80=AFPM Gregor Riepl <onitake@gmail.com> wr=
ote:
>
> >> And the kind of refactoring of next_arg() you are asking for here
> >> is way out of scope,
> >
> > Of course, of course, but why introduce Yet Another Parser to begin wit=
h?
> >
> >> so sorry but I don't plan to change this part
> >> of the patch.
> >
> > This is not good.
> > But I have no power to stop it, while being very sad about this attitud=
e.
>
> Andy, I do agree with you, but what would you suggest we can do about the=
 situation?

Ask for more help. See below as well.

> Write a generic parser that everyone should use from now on, and then mig=
rate all usage to this parser?

Yeah, that's, if you noticed, what I'm doing (see Git history of
lib/*cmdline*, for example and gpio-aggregator.c) and _that's_ why I'm
not happy about the situation. What I'm trying to say is that we need
to change people's mind about double efforts and duplication.

--=20
With Best Regards,
Andy Shevchenko
