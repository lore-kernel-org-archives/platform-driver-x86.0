Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F99303C8D
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718031; cv=none; b=By6RIPwfhyZ0L9eocOq8xMwaNpI6zynX8C9pf5c4zpw3rirF+Swg9msdvwykoP4DT4ZQXzCiSdq8zAUvvdd1R0gyOn/qNSOngpqvA6JtCNzwGK57YPc3VsB1rRG9Qf60py76HsU2Z9xsETf/AdozsdDrbY+tt3pr6uyqwF7MhPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718031; c=relaxed/simple;
	bh=wSXND9Mzzzv6AKNal40JGhqkoUZKxKU4k6agDL9RM1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evpnUroz3k+tEB5N1oxsqscueG2XfJwuKhw+QAEw/XKGSwujb0FqouG2vUbGaXvdN1igLoF51Ex2waq8OtZf3GxQYjmzpPzJXGO0Q8d5NmarEFLc8NTUU+ytC1JnfWwFqQKx6E6Nlu4jnPn7/XA3aEzaBRxZXchETqDvh2yNv3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NytbhHQq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NytbhHQq"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-affc2eb83c5so311778966b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Sep 2025 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756718028; x=1757322828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSXND9Mzzzv6AKNal40JGhqkoUZKxKU4k6agDL9RM1A=;
        b=NytbhHQqZndoJjjTfs2tGDS6cPIXhzkbpy4AWzEMhttlmnY6OiodK7Mli6Ai8vVFow
         H2xcH9myOO8LkAUNTo6S31HCEbnB+5G3XrKLUznMrJd/c/fdVi6zYzBYvc+apCNYutzy
         Q7MOtg0Of5QmEdrbULpfOMnL1c0fJ2eC5xXz49krm8m9HJrhQ4bPoaN8XDjQwCH2oPT1
         ffwprSZOWw2e1RulTkGMqv9892S3YhZzO+S//tH3dJkE2IL82ywjtoJygHqkgMRvQbmz
         bfq84KqwIntCJo6t8gJZjHEuQj7o6SsBX/d1R2Ptp9gp3XcwqWTwxwgVcFU3j4/JucaR
         LG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718028; x=1757322828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSXND9Mzzzv6AKNal40JGhqkoUZKxKU4k6agDL9RM1A=;
        b=cu4toLMRVkyXGLiX5RQ8HzwHzSdu5CI7OXo0voEJRtqRdcE4IkcCtW2LCvReYuqJ9C
         w141GLGeTaKeQyKIg0uK/npMo9/VWYf/TaldDENNyvIi1l8H7rlc7ExZ3JBD4C6Lxsbw
         Z/FwMHy43p1znw4GK9PXv108bMbwz/0VyhMGEhasGK+1sXEB3OpVFOlrlcphafK1ILMR
         owOij2+Godslas2G9qUbMoVqFnWPe+cZP/DCyHBGPg4nELqJLLUWH+KOrBKTe/I4t7b1
         CsETPt3wwDJ0tlrIR0tC9RyzrCCN4JF7S0RT2+klV3IX01oa4fVz9f4qkXimZu5doOuR
         DmNw==
X-Forwarded-Encrypted: i=1; AJvYcCUNprR37KrifnkchDtrHbnPG9y/FHGtGNeGqONlhc7KHCKsV2HT7dZfEMXhS2RnA30KlJJC5rwyPJV5epHIiVtkznM2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BHCI4mUIQmmb6wwl0QZ5X8c39IF4GjBm0UppIZwMSodv+zTZ
	2rSac+U6lT9vj+ro2Iyqd71Mydz0/1p9e7g2x8Rlr8Lgih7vdUqFuKQXRumjryOmTBwfk0GBYdt
	J5PKZ+XetOtUZ+xojdOzp1smlnK61Fpk=
X-Gm-Gg: ASbGncsqeBj9mho6k415YFLaYm2RipOrhhQv2+2/96zELs8Ze8k3Fb72v7hVHu0m+1m
	r4P2ygqrOZoDV6q3Jciw1apP36x5ya16Iky8vsZmZsaetp5cZPIj9lRTnn2EjgBu3M9grN8Mvds
	BsbPnpty+2UzfaWzLkW3IXgDC+JS3tpYt7MC4ZauQtAPa6SuhGuAGXi0qi+95wvLLY4p4i+HeTy
	2+ToUVWB+T8HmUt5AZh
X-Google-Smtp-Source: AGHT+IGKzU/Qu8oWqZyjPmHjYRgdP3F7jO5h2HM/vL8SzLp9FSu8wVYC2JORN0Hj5G5vGAhsqQfF22GMBGwOV6hxUOM=
X-Received: by 2002:a17:907:9301:b0:afe:b878:a164 with SMTP id
 a640c23a62f3a-b01d9772bd0mr693556966b.50.1756718028220; Mon, 01 Sep 2025
 02:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831105315.15349-1-hansg@kernel.org> <20250831105315.15349-2-hansg@kernel.org>
In-Reply-To: <20250831105315.15349-2-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 1 Sep 2025 12:13:10 +0300
X-Gm-Features: Ac12FXyhMM4x_CwXMI2s9Ys5BZN_GNBs1keXVfpZqwPvgkJ0dWirmqVEEUbCSyg
Message-ID: <CAHp75VeJutOpvhh5-97RS73GMrJB5HyNggLtVjw9d3RM8Y_WEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add support for
 Acer A1-840 tablet
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 1:53=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> From: Hans de Goede <hdegoede@redhat.com>
>
> Add support for the Acer Iconia One 8 A1-840 (non FHD version) tablet.
>
> This tablet has the usual issues for tablets shipped with Android as
> factory OS. The DSDT is broken in various ways, so i2c_clients for
> various devices as well as the INT3496 platform-device for OTG extcon
> handling need to be instantiated manually by x86-android-tablets.
>
> This table is special in that it is the first time a Bay Trail device
> has been found to use the Dollar Cove TI PMIC and the first time that
> the PMIC's Coulomb Counter is used as fuel-gauge.
>
> So far this PMIC has only been used together with Cherry Trail SoCs
> and always in combination with a separate full-featured fuel-gauge IC.

Indeed, an interesting combination. Perhaps due to some cost savings on the=
 BoM.

...

Both patches LGTM, but I have a question. Do you plan to move to
software nodes for the GPIOs, so Dmitry will have less work to convert
them? If so, perhaps it should be a patch in the middle to convert the
new file to use swnode, or the precursor that converts the whole
driver beforehand. What do you think?


--=20
With Best Regards,
Andy Shevchenko
