Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757C3CB576
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165970; cv=none; b=g6S94hOgXhiroJpY2ynZqe9QB4EDlXoNUkq9OFF8vnaZsPbs4L4aFYr+snFcuxtF3HQrVciGVkfIweY0ZHxmD+lLsp0qGdZdhAiRVcZo8XykmjJdgEkbWAmAuuTGFe2k0Wo/iGhzvmd9Mo1qBX+Yx36WckL5j2gbnivp2WgLWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165970; c=relaxed/simple;
	bh=w9WAfMO62KaSIQ4FSv/LvqoWsJqWbpE6qJZuCdVkpEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqohCRyF54Rj9g+Z7pA0NgqHsoo61t//j3VYJqgRAFRzXzpWU1BvrL/iiKETHuHhoOmCIaONK5CSJAzQv0ty7SlHGguYgsLpyZs3Hl1sWvG7hdJyszNq7LIRf2gWKgU2ibHz9TvQwieGn7wGlhreS8crwCX3LRUgYY4VOUfRhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dj520m4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dj520m4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F2E1F00ADE
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165968;
	bh=w9WAfMO62KaSIQ4FSv/LvqoWsJqWbpE6qJZuCdVkpEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dj520m4sDXuN2ZUjsI3xclFQ/ULDjRxbVzlF29Q2/HwJceoy9tm0v4WKAqrTGmGXH
	 5+dU8Z+eqfsGubg4PuHHva143JsBCFvMC/C7lvjorx0+zg1YwfGBlNZtV71Uy5tXb5
	 4WqZfscXttpiv8Y9ET7whscHkRvsJ82OVgC3+vD2i13EDWRfhfo8lrlTLGkF0M/ZUx
	 OHsENpt43F664g8By8SOv8rSYQ43HDUDVgQxOmuwdjX0wXn73SQQQK8RLhVBJTvT++
	 JKoQunbC6vkMwbx00QyJZw3D4VarEj3iT/9RlGeRkyWK2xGs3nauyQL+ZueSa8Zbhm
	 K2hy+bJAjdUHg==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b1afdf98dfso769129eaf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 01:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpaPcMp8zXEra0jypOdhTM/pACd8jKYuJxOKcfE7Dcm0bA5zDqenNXptzTQS4BNwhmYHcmZlMCcV+WD4jvfFxmVNYnT@vger.kernel.org
X-Gm-Message-State: AFuF++knD3sKI31xdrfkanMf6TTmizRAee8vSNSNw6vFlhgOH41N2p4c
	BucE3uDUK6VdvPO1d2NMCEn6AxIORdNg7lm7MEBsA+dzlit7b++R2N0D7icRxapDTCqtKSwj5VF
	irHLOkd0mu7MMOCTUdOXfnRHP4U4bLLE=
X-Received: by 2002:a05:6820:160c:b0:6ac:a5a3:460f with SMTP id
 006d021491bc7-6b1c66c65b3mr24359353eaf.25.1788165968060; Mon, 31 Aug 2026
 01:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 10:45:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLmWzq6dLDk_+M1=eDdWBr_2NLVzuH4rD_PoWb4PQSJU0Q@mail.gmail.com>
X-Gm-Features: AcwNN1UyfF1wOJXNewWMGP-rey5joMPtpUxQtZUzgQ_w0ELEb95diWV6mxlBXqw
Message-ID: <CAD++jLmWzq6dLDk_+M1=eDdWBr_2NLVzuH4rD_PoWb4PQSJU0Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 1:15=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> When gpiolib dropped name-against-label matching in favor of firmware nod=
e
> identity mapping, lookups referencing unattached software nodes (such as
> arizona and gpio_crystalcove in x86-android-tablets) stopped working.

Ooops.

The series look good to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
