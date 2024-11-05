Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F216762D2
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794931; cv=none; b=JdYAIh7+lVNFwtJLBllc0cJA2LYt2fUeSAgQ3pUQqJJgQ7HdShJ72nIgChihdfAmRhn68vpAhzO0oQQiHfhvwoqU4S8D45/vPG9c7Vcm7dCX3iffPPPmZynoIXDPcnAEFUNZiTOAoEi1J6lX9+QHzBgBtPxj+0k2/XgNdI/zrmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794931; c=relaxed/simple;
	bh=9DKcCOa7oIMbooogyifx0Itw/j7UK1kfPoNtcA8XYWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTMAzH6dzt2PiZjv1hopUs3Pa0+uX7v/Hfn5kVXYdTqIRDZ7Uf+OP5il4KMxjl4wEb1mlCALAX0K/H8qns1NRBjr5EV0kKAS55thP2ZyC4zA/xrroudFi7O8wOojW2sipOU8AqrOZz+SSjl5Sn4wiehANskgHalq86XCFP4V0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq0kRY9b; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq0kRY9b"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso705436466b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Nov 2024 00:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730794929; x=1731399729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DKcCOa7oIMbooogyifx0Itw/j7UK1kfPoNtcA8XYWs=;
        b=Hq0kRY9bQx4lMfvQuOLN9lcBe9e98/vT51TbQXUISkd2kJe+nKkCWBAxWKT6Jf2YtA
         bN8WODAiOroZmIX1ccp6D6j2TZFyJ9MVA2ix2DHhqPTDbD6GXCDcnkVhp9DTUP/TMCfy
         rNmzJ6zaQyTyo+CtwqViGsU63t4qsQsA/e9V6Egn0tjcCasP+vIDnVvTIOtuPGfXINqH
         x7rGCIKLkKJA+i59Zk/aFlC71TWql1k2tUACOtO7PVGaIHKzr53JaUWJIfi+7Brhbith
         A/7yva9gzLiQbrUVcCLYKdUSVXA4TykRVyjr9LQjxErQjkHvGktyL5sg/LR8SP32F2xW
         OsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794929; x=1731399729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DKcCOa7oIMbooogyifx0Itw/j7UK1kfPoNtcA8XYWs=;
        b=iQtCy2qUG9o42ZTkWlPrlcNeVv1g3e/sm3bMZmbCw47V3f8IfrzrGLdSXByQ6rMLgy
         W7+6GpE/R9vToP67ONvTbAwtjn0KZzNygUhW/lYzaA/gPz70WpZttqlL+qE87rqGt5jL
         CHuUPrZfd56HXUdXPnw2rJDrxvn2e9ty9d4xjSTcPWVk1oXZxiNlOHX755eTxHb04GrQ
         6tXfcUfqTc8BIrsmNhDioFLhKVJGLK+Rt4WaWo8gQqo799N1o2Ea4RtAZaRVNH5G2yKM
         PWFxL/bZWjdsrCY1WrcEDuzLHTC60UHLlXco38mUpUNIFU97ZLObOs6YYmF5y70nsacc
         r9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXYn0OUNxhUDyGVIwSg9+WVEW2BFhDbbAyvt2Km9gKRPY2nA6/a3v2pCSj3tNnlDIWUWWDzG7GNT0wKRWx9kWnT5Bwb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ke7nECc/vaA2f2Z9XOhH2krro5hACgkYbsiWnI07uqqwWeeM
	IkPvLpJQ9SXxf9t+HQ/gdU8HxpYHObawlpnU9ImDJCTM7H/6o+RYJoszKmMxAODhx1i0omsekwK
	lIEbuRc2XEjl6U9i9mfpwevxhESE=
X-Google-Smtp-Source: AGHT+IGjC/GvGVqGGhbpw9SBw5zbQk7pBqbSU/8QZTP1Xagy9zpTRG0C560QEtHoNKFFEFXAaEncMuvpSWSBwgmBzjs=
X-Received: by 2002:a17:907:7216:b0:a99:ef65:58d0 with SMTP id
 a640c23a62f3a-a9de6440cbbmr3580282166b.65.1730794928372; Tue, 05 Nov 2024
 00:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104200848.58693-1-hdegoede@redhat.com> <20241104200848.58693-2-hdegoede@redhat.com>
In-Reply-To: <20241104200848.58693-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Nov 2024 10:21:32 +0200
Message-ID: <CAHp75Vc7TAQBwPejkCEggcxd43fZyC_GqNHyrZSpjcQJYAQeGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: x86-android-tablets: Add
 get_i2c_adap_by_handle() helper
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Add get_i2c_adap_by_handle() helper function, this is a preparation patch
> for adding support for getting i2c_adapter-s by PCI parent devname().

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
