Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792656551;
	b=ip2aJ7t0VoTPrIxEntIRy7Tp5RzAXdv92Rh9jXYhsGfV1rLRpz8Tax9LQ0J3ytyDQHU4
	 hUk8Loa44hjFEMnN7iH4pl6InsV+m94CsvD8ivp4le0Khb5Z3wbQhIG4Y0QgkYK8zvsVI
	 VktbZJSJbhJYYPT1sLRTNnezRSUNtQs6XgsokOnVE4flNojPbe6DjkUdTsuh9aO3ZcUIE
	 RnZqlt/C+jL/6zXVGaDC9Re/siFISEM9jRYCkX7Au8T6u0j4datwHK24jj5uD1tTWLHXB
	 rwFf08NdJjgL171cqdvgVWtXeG81wTisfq6vIDc5Gpuztq7yFraShKzHP1MrpOw9Orw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
	b=49X2ZwyujPnqA+78Y8Oq93YWE1LXoPbB8XZDgotkzilnNIr/98IhQ98pnrp3KVwwuyhO
	 vDxTieHEZQCo0JHrDgAYMU6wXPJQmfUhsiaB3nx7or9Ims6GQTXaoKr+4jBJEgClkxhvO
	 uLfSlrGe0y6w97nIE9+B/LnKI/szoHsovUSo8labv+Pc2vDiJJ6L4T8XdQrmkrYr43c9P
	 OcN0luH5nNjNPCfFUSrO+9nkpzLqGUIirXvpJpjoUPTqAL81uejKjtniuT4gb+ypPlNAY
	 epMytaKdJGF3Xbr4aY4ubPyKYCJHbEQgZr9Ffy7yWbi/65BiMz2bGFf9YiJQp21zGng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VfRNQHp5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E64606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 08:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E64606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VfRNQHp5
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0dba37a7fso12928017b3.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 01:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792656550; cv=none;
        d=google.com; s=arc-20260327;
        b=Vu2M0BS84DONNMuhu86WxBS9i7rCvTqc1/1O5P+wwXhAwcivM3P6sbREzQc6s7gwbG
         YlwnR2j1FK8/e/2GW3bQBLJ7HXDyRySd7J3i2XH2+02gLQErzDnyFI6i20kKDXNn1qcq
         adku+sLX4Xbi7xmEBGsCszWJgtH6JKmfQ1BPDC1E7ownXCm2vfvFvoupjz64VJHLPE/c
         uGixBmho56u6cXlrpNBawl2nYUCW04YdXbSjkyGI55MssZCK54ETK3szC4FRR+ilE5WL
         E44gx2lsNpKGPAmy612gefAZKeTeKiEziAzgLCxcMin1A9grPU4H0qU4A9WM7dPq5fos
         4jkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
        fh=9I4JZvEYrkWOZtvUi6FZry173OdauvDTUhf5f6auuIQ=;
        b=WH93wrbDmrYkWx2KcFzyW5uUylWLtt8Qk2Rm9naMbYm6VUvOpnw6MjjLsg2/SYPfMC
         MbQvJvcSFeUIaVDoFtfa3PyWOu4LXqh18whQrl2l7BvcuUKPQmklyjE0VqGVOjbU2zKY
         /mBu9hCjbwKw5cXKLiwXerZEj/hbtsWSe5keDRpbJUHjCC+JlLDMW4OwoSRMNEIt5Xbq
         v+xDoWpCxCxIilZv2NaUkx04AWLQeY+IiMvujTTPDniLuY2r+0XPsgP7wMbilbM4jrt5
         kzvw34sEad/OiYJi3IzoSi+3eTdHb7+69RR4hjFl5wg73g5aq74a7jUW46FVRbqzjfK7
         KUTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792656550; x=1793261350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
        b=VfRNQHp5if8VikXzhQfah2ZGZ1S7U9iP1ObuDvAPt4QZc/aIsrmEDXb2YTKXxXZ+zY
         K8NraqGWjrTMqOlIZO4064Cgsq3PEFGMqjY+TE8RAi9O5R/oaO3vSNd/OuhBiYFvElez
         qiXDJAY26G13ZCHGO6FK0lgMdWUp1eNEFb53uyPCUnTBGn6M56uL8drC9NDpUgsBZab5
         7FEMhbYPUyp4GALIrgPQ6HTPl7+HqSaOxT7qqbcP6k1+oibbBwq/k4tIUBQ28gSV80G2
         piH7oX/gqM3iVH5bIGTLCqEP8GgC9v6xtABhacsg+kMpf1cEaq6Mf7g9Ka1wRENIs0Fp
         oCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656550; x=1793261350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQKsyW+wOzCAT9wP2NPBkWImj5fvxFpGVwFKrnGegPo=;
        b=J+riv1BRcD/UxQutuAeeq5LYbZ8KgO599/X+cRstU/hcrun308DzKxT+9TbKDyi5za
         fNCo4bWo2VsTnQDlK2rPhWykz/FgnwMTv2Ql/SDgDTuivSyv3nYLlf7N+GHJa7Is/ynS
         wuT6Q5eIyh0xBXChLp4daE//cEJKBuoaIhdLixie7BDvWF8y2GBx0G2yBVwYbfnDljAJ
         wkRS1yzeHIsRZ58THCPlxEQZ+4yrpDAwE5ygmUoWlXDXHIhTlo8yk1xDliAnl0ADgMPT
         DlsF02hhmeKXKee/GTWsjCJhxeJvrsSGxQ66jgRip35T08BbTJIzmFg9HI52RvPdFZQj
         PN+A==
X-Forwarded-Encrypted: i=1; AKwUvBx75qTcauT02YbJCs02+yXBxQVxfQIGkXBHr/OwraNbqxPIjNf7EZkq5tFL4xPJr80GhvC+J4DLOiynxqiKXEjYIyEe@vger.kernel.org
X-Gm-Message-State: AFq9FYKVB65R0as0V2W9Yjl+osFLjfwMIEgmSLZNdde1kQ3PmcwgkimC
	V0CK6WwdyJC/eN0Krm4xfxaiA3jxUGkLPnAMWRW9S5JXgVKrfcoEOlHrSe9XPWFhfIqGcaC+7ZP
	HNtwDEHDgtgF9wCTsp56ov4eazynugJY=
X-Gm-Gg: AYBFou2KPMj1fn4xRDIVzMteO/aETzTRBov95X9kFinexdKTn1i4b0jRsapmS6B12j/
	hoZQSbO8hVB1wuT4AhjTsCbKMG/DaITSTcJrw4q97ByJ1HpxA9F9agsD74y3hnGXJv56/lWuBR2
	lvKfAzSCcozDqrXivZ0zs2aiJtIhKUu9SwRbqMVRFI2qjp7/l1QQ5h589KpEobeVfHeGehrnVOC
	2MTRuuIkCotYaBMz7n/tTiCh8zO2gfbIzIvwJNlZtSgGGGhcpNY/R94m8wrtOJ5ek2lfM+Xr5K1
	9rfuvFaFcjSjg9YX6qVsXbu9DEzh+Y0Crij9VHvinvz+Iapom8VaAsqbwXsov+9Ho6h3eQyLT1K
	rjtyPMcRamSMq8e/SmQHqsO2qfb2cJ029KJvOOg==
X-Received: by 2002:a05:690c:ec4:b0:8ac:d426:105a with SMTP id
 00721157ae682-8b1340353e8mr29410497b3.39.1792656550133; Thu, 22 Oct 2026
 01:09:10 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
 <bacdb44f-a4ab-4d55-a312-5648515f41ac@leemhuis.info>
In-Reply-To: <bacdb44f-a4ab-4d55-a312-5648515f41ac@leemhuis.info>
From: Serhiy Shliapuhin <shlyapugin@gmail.com>
Date: Thu, 22 Oct 2026 11:08:54 +0300
X-Gm-Features: AclHuK8idyuC9LagaU6kDmr1ij-CZ-3aFF9JVXtlpeAml0OsDKGnSO5Eh8miFRg
Message-ID: <CADGd8gF9DxnDVZxbsARCNkXXp7_aWfWOkyAN_Y8v65TtKW3zNg@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "qby140326@gmail.com" <qby140326@gmail.com>, platform-driver-x86@vger.kernel.org, 
	ilpo.jarvinen@linux.intel.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can you avoid it by blacklisting bitland-mifs-wmi?

Yes. With bitland-mifs-wmi blacklisted no platform_profile handler is
registered, and power-profiles-daemon switches all three profiles via
intel_pstate EPP again, same as before the driver was added.

The same can be achieved by running power-profiles-daemon
with --block-driver=3Dplatform_profile, which is what I use now.

> And does it still happen with vanilla 7.3? 7.0 is long EOL upstream
> (and 7.2 soon, too).

Yes, it is reproducible with vanilla 7.3-rc3 (Ubuntu mainline build,
no distro patches; newer mainline builds are not available yet -
bitland-mifs-wmi.c has not changed since 2026-07-03 anyway).

  $ uname -r
  7.3.0-070300rc3-generic
  $ cat /sys/class/platform-profile/platform-profile-0/name
  bitland-mifs-wmi

  low-power             -> accepted, reads back "balanced"
  balanced-performance  -> -EOPNOTSUPP, stays "balanced"
  performance           -> -EOPNOTSUPP, stays "balanced"

Understood regarding 7.0; I only mentioned it as the last kernel
where profile switching worked on this machine, before
bitland-mifs-wmi was added.

Thanks,
Serhiy Shliapuhin

On Wed, Oct 21, 2026 at 5:56=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/20/26 07:12, Serhiy Shliapuhin wrote:
> >
> > On my RedmiBook Pro 15 (2021) none of the platform profiles exposed
> > by bitland-mifs-wmi can actually be selected. "performance" and
> > "balanced-performance" are always rejected with -EOPNOTSUPP, even
> > while the laptop is charging, and "low-power" is accepted but has no
> > effect. As a result power-profiles-daemon can only stay in Balanced.
> >
> > This is a regression. With Ubuntu kernel 7.0.0-38-generic [...]
>
> Can you avoid it by blacklisting bitland-mifs-wmi? And does it still
> happen with vanilla 7.3? 7.0 is long EOL upstream (and 7.2 soon, too).
>
> Ciao, Thorsten
>
>
