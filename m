Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DB128CF5D
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382812; cv=pass; b=dCa3OWOO7FHASo3OreYtePVBopR3vSA66ldt8J9DoIUc+3S9OvbBW5udUmMTfeCSmwfrOn2eoCK545dj2Vv/tx0iu6mGysVuZYq6MCd/VSE22917azqROu5Ysb6dhlvBexFCGXxvs/D4tp3yOYjfgroWUaTqOZoIS9JOOAji4Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382812; c=relaxed/simple;
	bh=mVxMWetFn7wHYMZOTdurI52wh0zu/kj3fyTO5UelA0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StfnP3ambgw7aV321Q4xi2AeudtdRkAVOCEPXgmekJMXBNiJweuXCp0CyDTA4ejo5LEJcG+2lmgYdAkntrZv2Gx3+8KFNPO7i44DucM/nbez/QzLzhLdrHFbNO6El8eO9yF8YfnQX8jeAxcoeAMy2h6Gih86Qq8yPsojASmlYWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcoOVwCQ; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcoOVwCQ"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a9a2b95b72so2475516a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 17:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790382809; cv=none;
        d=google.com; s=arc-20260327;
        b=rsjEyTiAD+K4uc8t1dEPdptGdYT3mPDVYMmpVVHGfMMBBUVAvLyZ7wlJe8VRp3QH5p
         zKIdE6i5bpo+trNlEQuUUKPVkbTnlFvDqpdvpVosFaKdp71IUHrej+JKoD94vz0QSi93
         CwP5V6UhViVleJnqtBjRSKweV5tINODnak363P7tPQPZvEdnq/ff8ywl8UxSk62k0NRv
         MteninAZOGwtR4+iZpdqvvG13sozhHagQZlvTHOsdL8YMthDu+2xMkdgYSnYP7tPTxId
         d+RS86x9Uwq3AjIw+1qwZ5H9dJklstZmL96+IvzqIL+cBIvkWsj2zwsgosbfIYCy+Xx/
         tNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mVxMWetFn7wHYMZOTdurI52wh0zu/kj3fyTO5UelA0E=;
        fh=8FhIueiaeZZGAVhOekgHmbmbo/Npgbr3iuGW1Yj6FS4=;
        b=b8vvyLmhvOoZGLb146bZPq141/J5h8D1muhauTB83SawRYwMDxEgagZNcFL1OOR1nR
         nP1LI0WbIyjzcZMt/tj2c+sAtSkyLgHFKe3fdQcY9pCIyPi82YktcO7Yk6RV3bm/QIGc
         P2CGPo/O1oG84V/joLUtnQF/SgF4uHoiq7Ku3z7PKlX49U2kzpR/AHxQiVBKvJD0zVAN
         2jePAHRGSibuVsmoNsk2X99wxAqglYPLQPxEmsMb5Aq4sK2rGpZ6/rpKKvnbo85Iyv0b
         ERRDHWISoXiYXRY5QOPJc6k7tGcfxp86i7TJbM7Up987/EjyWY/De7BeO7yyYi714EUB
         qgQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790382809; x=1790987609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVxMWetFn7wHYMZOTdurI52wh0zu/kj3fyTO5UelA0E=;
        b=fcoOVwCQM8RwuRa6WV5AaxjDkchYZ90euGMxSq9O6x0Zn9pfbR65UF8/qtScGS+Vt/
         RwxQwqjWMDQo82Qv/dQoo+LnE0JZJ30n2BMQ+ICPr8vGAwQl9pahcZo0toV2jgCMrWRn
         LWicHgOE9ULsjwp7oRI+iTf6WN0iNm0pbAl0R1TBAANRDORzWefQb58Mc7TTmo0iQGLD
         6RTc1KCFJ92xV3ggb91AADHD8dq+pzvgVC9wpLSz284r+RQw0UVIZfJra0xv3vqR1RWA
         OhO1Q94+h52WkgtI1w/XDua9NAls2cbqakvMisXq/DwIP84mhe5SakpZhVlH3jNemKnh
         fRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382809; x=1790987609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mVxMWetFn7wHYMZOTdurI52wh0zu/kj3fyTO5UelA0E=;
        b=Z6/87uBE4/Jgjlif4SCdT2IHqxsICkVVqP47SnjWDys7HLd40nKXQY01UrV6Kp+lHp
         bo/FBRD7fAFz8V90T/lbxkrD43A4mBFYeEfol0S4nXo2uJ0YugH5XYWfdui4LA/h0KzG
         BVr9h+hysS7QyrqFQzTAZwrYexB1VSZN/LBJFbliyRp9fmhMZ1e3m08ryGLzIQUBsqNu
         dJh9P7rMerAEcLCLNh97JPbSqODd9Fq/vykTKU5904s9hW6F4pHrm1NsAURcOOyPdGXo
         oYHPpTgegRJSlWA4wfYU66ISJoAjyv7lBvwQoJwMyoKmQ/G8kj3qI/RI6TC8IvBuX5zT
         BbTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf3NESzo85+eC8UDON3wQ++gOKuChgcrdbGHVudPaX8j9pnmeJiZkhH6afjDIkaDVYTSD1KmhFcSNU++fAhQc+Akyw@vger.kernel.org
X-Gm-Message-State: AFuF++lxmCAZwZjCBeMkDCP4G5WWWcixiXigNgI9X4MZdTfIaUBCHQgH
	g5pgHaHBPNgomqC7BTZEfnMIOm+IxfXIDqR1NR9CpVXfjY5UhUrhhjGO4HE7mj1JOVyr4m08+Hm
	xytShgF8QV6Ct17qKt+rBK3AJW03bTJ1uSkZhBiY=
X-Gm-Gg: AYBFou1BV502aDAbbCq0MQ9QFoEggNagjF+gPJf8rAT8SrOgWxMc3qu2GtC1EwMVUw6
	AP/kOts/3jY5xAByX4VIRQbJD5a3O7q8wTzHmYTE/nE8pUK/vBHlW5fOLQ05Q1lCwomXuhKTDEP
	vZZ2rl6keTPwDv0wSo/M5k0F2fltwuTuhUsDluzKrXe6o948MMbsl3/b9pYRzVeklq2TgPijQgO
	9J42XdmLWkyi4wT/QxeM7mu+nuB1opKx8lTW3cUALR1EyyvMPfTNXTxlH686kHKkUNGJbVtZ4up
	zZRSypFg+08oo1+qi+JXDT2/P0f+N3VycqLrA5X/aiw6NhIby0AzuJmvGwK1qExqr6Btb829t2u
	BoZY2DOq/W9wKqp8=
X-Received: by 2002:a05:6402:438e:b0:6a9:a2b9:5907 with SMTP id
 4fb4d7f45d1cf-6aac8f40c5cmr5939968a12.4.1790382808799; Fri, 25 Sep 2026
 17:33:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925211635.1422516-1-amad3v@gmail.com> <20260925211635.1422516-3-amad3v@gmail.com>
 <0b2b863f-d12a-4b1f-93a3-45a42f3ef503@gmx.de>
In-Reply-To: <0b2b863f-d12a-4b1f-93a3-45a42f3ef503@gmx.de>
From: Am Dev <amad3v@gmail.com>
Date: Sat, 26 Sep 2026 01:33:16 +0100
X-Gm-Features: AclHuK-7P8_fYd7hP59PmdOe7E2rXevYQIH5oEtq_S2IggwuoZjtBW3VLgWpGgU
Message-ID: <CADfX_O26ViKw2bF-uft-sj26Hi4hDdy4Y+=-dcV+f3s1sQnpLw@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: uniwill-laptop: Add platform profile support
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 00:54, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Nice work, but AFAIK the whole fan control/platform profile complex needs a bit more
> work before we can enable this feature. Can we skip this patch for now?

Sure, I will drop it from v2. When you get to the fan control / platform
profile work, I am happy to test on the Recoil 16.

Thanks,
Mohamed
