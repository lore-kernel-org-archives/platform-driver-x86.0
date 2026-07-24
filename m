Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC823C945A
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910123; cv=pass; b=BtaofD6ubhGuxVvj7aL6TkamuS/hqV5KcKLkgRgj1OXJhmqj4Tmwhd94V8rIv9M1/pHOww7KJWOnSW7co7KS4JPiMmYysKc5ttDrkt1g3dE2Ou3j3i8rZPP0isod1XF1MN2AC9EmHSPt8N8f5cLF/6JXkhuM9aup5ySwQNw4PIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910123; c=relaxed/simple;
	bh=1RwvmSgg0agx/io0A628AzS/QKgMk+l55F/egMR9EqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6FCCyIV45/qfy6Y04iHMsL3YHxpaoLzMs2PExNNWXTCSSRq63gK6Cgka0Sw/CDShCz4Tzvjz92dXWnLZAashFOQaSDYvyoj4H4uvm4zHXLtrCe/uv4PZ1b8BferInUDQ86GdPrU7icIN3GDt0f6ZhtW/WcGNSktrCfT/bfCkeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVk2n/6e; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVk2n/6e"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dbcb505578so6007997b3.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 09:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784910119; cv=none;
        d=google.com; s=arc-20260327;
        b=FHFflzqaBm3IU/815iYWvuCb8sC28Ck1oMiab5Go4GndqSlp2uX4Mmu+70pSC4+/if
         9Oqwbn5X7Hj1GUVNms3vP37vwh0djfd8vnQGZAnU6pp5tVwVQMbPGtBH6CgySRnYLQED
         MhuZkT0LEPaj3jQfGztTdr/yh17aBsCpqD3NU+XTi7jcySnuaaiKg+5NxVq3lECtK24Q
         EMKlbWDL4GjOaD5KIy4Lj4tPgjZzBIDSuvnJl6Dqmlhg6JNWjRk9m1IbEgJr1CrD2m4K
         ZC/stOWfkeF0xYvQdQRRoH9g+zqpnNfJUe+11kDTfZp9YsIvy7lkLWRrFi5BrLdj4XWq
         ZSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNWwh9ggePXAg2gp21+rSSfMTKdKzjfj/8iPBUjyxVs=;
        fh=LXpX5pWPc4Zo1VuiCtsLVJ6Hfw19cBpQhwOkzDXzBiE=;
        b=spfoenv5GD8CDy1VTgRWsAgNCAmJ9oWZ3uslwVXSVFI+IOqaSIVfG2FjSv+AP71wpM
         051Myc5nQMIPwjMgPLZWjLD3pBhMnhNuPrY1oyWxpCp5WRYCJ6i9w7M/NPvKH3N3HLTr
         vfYiU2MGBk3tvgqm6qGOwGVBrvYbyKQuBPY1I5SHnZOGR6RTsN66E14suSsYP9E0CM9g
         iMtDsRk2dZg7lw3U1qB+mova/ZdmF8rXgMit/gMaSRrtlpT4i2hIXrqXSAj9LKJYswTI
         RAM5CH2b//XLwKI7rB6EMEJ2eWk2prt0yX3UOLjuHiX/K4bJ3eWlXnA5YutJseSwk2zC
         6Z+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910119; x=1785514919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNWwh9ggePXAg2gp21+rSSfMTKdKzjfj/8iPBUjyxVs=;
        b=sVk2n/6ePvLlVox5AtoVyHqrQ6hDXEdhJZr2egsxNkLQ4D6TiaigFsLie1vnE86WBW
         k1qeV5SazgQY4pJU2QEuAG9mU2xE64wopWTvq49/zmViSyjb1JDSHTUuQdFNALiWjVTs
         DANW594noPbBR1ambQAMV+fyMcGdouHwrtaggcBUAWVsel/55RBb6HJvrL1l4oglI63l
         7KyRuW2ejqHrP9sqc6t2z3/2LF6/LNGUMuZ3qssMGNYJbbsg4254x4Y0R/docfumIH/A
         rcPy8bn0N60t7Td5nHipNFMcFGBLjg0tf9amXdfQmZc9vaGB5k6EtpfvBCYJDa1GBI1c
         tquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910119; x=1785514919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNWwh9ggePXAg2gp21+rSSfMTKdKzjfj/8iPBUjyxVs=;
        b=QrzcZgvqCCO2KCpiljgUw68ko9/+uHP0Wwq1B5Q49Vuq7qQde1t4By6aH0jM3fUuHg
         RtJ3A5UQBq0rlNuyjmcXkw8tgmI70h+Eqx+DdnByACw3PVkAA+7Df/2jTK4uSu/FCOW9
         j6FcRwxzDLntXwjX36/ncGgxSNvoo7QvMJwzBl+k/JlOZKHK7OpLNoAATudR41AziQWK
         LBIL+FaDlXWY1jkxRwx3F/5XEzCXUZb6uSlEdVA4haqiCQ95RWzqmpwSzxfwfuH6sMN2
         4PI0mZY1Ngq7cCx2j+vRvrxxcmtsTkTBc5Y+Iz+5qZ3Si32xOvMGOoZWLvS2tLnhunwf
         2aaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqhTtfGUppFsnOpN270i28votiM2tiGb3qwRlwhB8ZnpZ99vftKOxHEUfrQZJAQ/lvckiB5iyo7gAcWH3qH4d6XVO+@vger.kernel.org
X-Gm-Message-State: AOJu0Yysvca5FHeS4n9KP45ADZ+yNStamX01H1g5Lb5JCdOkxeBocFOa
	dHPfOx34eqMM0aTEwVBQVONNRj8WIeWmFjg+Jf6i+SgU3eYlVn1XKkDV1tAKNIit7hgMSk0IWS/
	q7aqZyRZ9GHq0I6CXEXiBbR31cu1oJFo=
X-Gm-Gg: AR+sD13FeS60RM/Pb2qD8qeFu1g77LwvyJZrOJOiGwa/oaMFrjYoP50wYwVC9TqsRjE
	t7nnqhsK1G8+B/R2gmB5Y+pMD0EWBLBjxtm6uaa5H3A3R6BE/BHv77BdlLylxb6C98Wk5E0XCT/
	kfp4aEOJVtfRvV7rvWYrmVtLj3FAsLS9vn+dgm17g9iM0Ugr3KUNR6rPerISoyKEeTmrdIAOFxE
	Dkx6URrSRVZOAZyH1zE5t8Pq8zAhUHX9P0UyVGn2/ujcjVfsCMvQLs8IYM=
X-Received: by 2002:a05:690c:6a0c:b0:81e:c436:c530 with SMTP id
 00721157ae682-81f4c1481afmr27727447b3.14.1784910118826; Fri, 24 Jul 2026
 09:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-26-ekffu200098@gmail.com> <339532bc-e6e1-4b40-af18-49153c25ad64@linux.intel.com>
In-Reply-To: <339532bc-e6e1-4b40-af18-49153c25ad64@linux.intel.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sat, 25 Jul 2026 01:21:47 +0900
X-Gm-Features: AUfX_myXe4wcCuL-dtwlwTyzUYkGeItepf6TULe2YNMvpUprdsdtWpgiclKHka0
Message-ID: <CABFDxMGQ7CfSy+xOD1QnjHyBm99z659g5KQgFX0=4eTd7hW_Ww@mail.gmail.com>
Subject: Re: [PATCH 25/36] platform/x86: toshiba_haps: remove conditional
 return with no effect
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Julia.Lawall@inria.fr, Azael Avalos <coproscefalo@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jul 25, 2026 at 12:44=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 24 Jul 2026, Sang-Heon Jeon wrote:
>
> > Both branches of the check return the same value, so the check has
> > no effect. Remove it and return the value directly.
> >
> > This is the result of running the Coccinelle script from
> > scripts/coccinelle/misc/cond_return_no_effect.cocci.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  drivers/platform/x86/toshiba_haps.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86=
/toshiba_haps.c
> > index c6633b74029f..4f62476b8dd1 100644
> > --- a/drivers/platform/x86/toshiba_haps.c
> > +++ b/drivers/platform/x86/toshiba_haps.c
> > @@ -251,11 +251,7 @@ static int toshiba_haps_resume(struct device *devi=
ce)
> >                                           haps->protection_level);
> >
> >       /* Reset the protection on resume */
> > -     ret =3D toshiba_haps_reset_protection(haps->acpi_dev->handle);
> > -     if (ret !=3D 0)
> > -             return ret;
> > -
> > -     return ret;
> > +     return toshiba_haps_reset_protection(haps->acpi_dev->handle);
> >  }
> >  #endif
>
> Sadly this has not seen much testing:
>
>   CC      drivers/platform/x86/toshiba_haps.o
> drivers/platform/x86/toshiba_haps.c: In function =E2=80=98toshiba_haps_re=
sume=E2=80=99:
> drivers/platform/x86/toshiba_haps.c:247:13: error: variable =E2=80=98ret=
=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
>   247 |         int ret;
>       |             ^~~
> cc1: all warnings being treated as errors
> make[5]: *** [scripts/Makefile.build:289:
> drivers/platform/x86/toshiba_haps.o] Error 1
>
> ...I guess you never took the time to look at and understand the
> surrounding code either. :-(

Right, the assignment of toshiba_haps_protection_level() return value
is unnecessary, whether or not this cleanup is applied. I didn't
expect a case like this, so I didn't look at it carefully enough and
missed it. I'll fix it in v2. Sorry for the noise.

> --
>  i.

Best Regards,
Sang-Heon Jeon
