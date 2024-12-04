Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB21C3C01
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339626; cv=none; b=qmlM/d1JBAy1a9aRl2sm8PiXrl9/cbNI9yzxOcHXJpetZFhhsNkdUR7qv7bY0ZH+UkIuEGZCvRJwHB3VJlTFl/uW9tUg5esjIlvcPktfnUfvQQgVefiph2PHnpaQ0L2Ze3P2ANBNJgDq10eNJtcs6oG5T0VkKkFTgyALpSedRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339626; c=relaxed/simple;
	bh=UWtC4sQPq4mDct17MPG6dh8QDLKGYB2wuVmKY+1H/NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icY7fyCSvw3ZRZ+FbQc1hwa8uJbLl8Y7fn/o7l+ZHCAUCNEyx7nIWtskKOgq99SwGvW0hLy6NqD7fFMnmgAUqIemPHY055+ER9ruj7mGvELjPUze4YeyfPPeAj5SGHd3VhrV0RKK2GKFOaca22D0JUMjsZgBhY2kjWUt22MR3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qx7B6Ltc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qx7B6Ltc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so14726266b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 11:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733339623; x=1733944423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWtC4sQPq4mDct17MPG6dh8QDLKGYB2wuVmKY+1H/NU=;
        b=Qx7B6Ltc/dmkESjwolKX9yPRAzLMkeeNfUDNH5UirOLD53wq7MYHq0164QJPUNM+O0
         7rfjVDMSkeBssIlFCevcEt9OK6JTeo2Nr/cws4LDhObabK0K6IG6O3VDAo1iRVObRFcW
         CSn+guTODPrkoVDS80X51ir9xS5TO2xaPoppwZGOT7sg4i8PZuxCsLdrHfxkr0fCOpnU
         im+3ehgXPLZlKMfO3UmVjBAE0/E95vkqCp1zHKInV3sHRwoO+8sP4qq924R5d17jPnV9
         NxumNqwVV+CnKfJgSRT0wLx21aThZsUxPmWm4W/HSDIDSHBEtojvDU9B5OxzVce08h7T
         eMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339623; x=1733944423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWtC4sQPq4mDct17MPG6dh8QDLKGYB2wuVmKY+1H/NU=;
        b=rpH2ffql1atQVJg2IJD1QPl1WAKRGFEtJAZJIDmZ6D/VGn3RF2We+VPF0PbnIOn0y7
         GViEiGoQEClQC7M8q0dB3VHl7NNcdTw/Y4BaBzXjh1a7vuBSSwxNDMNWVHZ1+tqo4lGo
         Ki9tV6em6nzNPEoiC3ujEF++eMLLYtLXb7NcdW2Vjt/tBpvYCjcjeJ44K8pstypi0WOh
         k8femxfWjm1UxGRUMi5BX52vNfwai4VnQg8rf1pPLhi4/ONEMr+Kid5sNhwHdLy4R4xe
         Yq/VJZYu9bX71fTjET110iujB87AjvQ5A3mCzb15e/76+XjkTpgMHbQuEW0UahGt3lha
         Lkgg==
X-Forwarded-Encrypted: i=1; AJvYcCXKh4eD11OgVdXT+nxBWHc23Jafv4D7HPwFIZF7icBvjL3fjZR1bluuO14wNd5lucDzSvEIfPfAccpaJo6hZtgHoMjR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo2c45UAMp6muiHj+qvmIq7ZqEePTOqwsU0IU88m9ZpEUCHEjj
	iYyjFfNgqcUvDjWmsGHkPwgZAt8AzyoPhC0mFV8nJDNaYkpMaG0+r/Grm8arYLUurN3M6W6/aCp
	kVn91AyAFjjLN6JiITmT6X6A3+OSd2Co4
X-Gm-Gg: ASbGnct+aGkTye1zefeyg1ynZrFUltCzgK/hq89u66otdPtQP8vKhoEPg1FUs2NQrpx
	tWafzcx4BAe2UmBXo55CZ2mZQrm/i5CU=
X-Google-Smtp-Source: AGHT+IFK0I78q+TOVqsd98PfQmZm4vGBGeIZq6it/toi9NAFp+IO7wVe+1+iCGYqIShabNY/3SUQaJSZDAZmkk2K4hg=
X-Received: by 2002:a17:906:7951:b0:a99:89e9:a43d with SMTP id
 a640c23a62f3a-aa6018d88aamr583852766b.39.1733339622919; Wed, 04 Dec 2024
 11:13:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204143807.32966-1-hdegoede@redhat.com>
In-Reply-To: <20241204143807.32966-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Dec 2024 21:13:06 +0200
Message-ID: <CAHp75Vfw-_d1HB3-AKUnk6m-OdTGc7vcCictwkubg88wDuO2sg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel: int0002_vgpio: Make the irqchip immutable
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 4:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips:
>
> gpio gpiochip4: (INT0002 Virtual GPIO): not an immutable chip, please con=
sider fixing it!
>
> Fix this by making the irqchip in the int0002_vgpio driver immutable.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
