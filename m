Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE478F4A
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455186; cv=none; b=S2wL1hxW2wVTHwH0VUEJD3vIOAKLCpheJHsOeE3T8MLCoi2YFhJj1AELZf/JYi3pr3Vyn4N7dF8s3Sa1FKQv+fm8km//3MSCNzIyHJNUknbAwhTtRdd4IwoDBJCgYi1i7PxOAMlG5M8ipv3X4dDuw9UWdXTXXm037+4iWq7fiBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455186; c=relaxed/simple;
	bh=6J9UZnwKIHi+c7Lpa7JS3AXdqehj/zGe/QOPOVLoal8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nveq2g5y0YEZmDHpKqOwVPLBA8P1U2ToQPgbVwikKsX+KDcKQDIHWEwv1+QrKjVXbMSwKOgrKgNCC0ClzvKL3J4UHUqhEWxD7TTJPp/KgINk6O+PX9CLEzuMOFuEEZGxQhgwOJTkibDvBDR5o4pllL87d/MzzKOQYC0adDdzoJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Of7WruNf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Of7WruNf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6129ff08877so5233347a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753455183; x=1754059983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzzp/mJEyVcRtCJyO8UIBzb6TfivbZHBCpXa8SRCEXU=;
        b=Of7WruNfCzDrBLiKgJssIoYFDoJ7MIjQFRV0vVc6xZBN9bElqLs5FcfXUBRkf+xiMi
         hkKjPcjQmqsSO13ayyWtehZc8+zOxhJrllFRWwGJzn6ymBCoyJsyT+u5UQDUQ2hBLuUV
         gMTB+H+bAlwZUQ/qZLmJ87C824pNxEbto7bGGFLC+fjRsqnFvheeQ0OMv7vraXApOuq7
         Bxb9axPZdrPZ5/KiYK6nut0raj2am81SVTG8B4qe3YH+AaTtkYJ2/PMHM6uuMRYwejyD
         ETIBE1OBaxPghkmvqby0O6DQqOuWngAZC22Q0oWUe6X+Njrh6vij1oWWMHlG5aHCqmWX
         5TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455183; x=1754059983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lzzp/mJEyVcRtCJyO8UIBzb6TfivbZHBCpXa8SRCEXU=;
        b=D/CMeAr3mDszH5RwNgZsaAMHOOZ3JkiYeYZ99fHj/a1GJejYVkA5Hes5w5q7+wQUIz
         k6jWn/xB1L5vaKxpxfhr8vmbWlnHtDdzzrYDKhpBpES3YQyEwWDrPSi4FD0y1YZs8XFj
         mBAPoz9zEpLxBdgC0h01KjgOsGaTQe6sATcb2HBdjfo6D/IG1P2y3BZW4YG63/v2yNOp
         /GktM8163pxLWEuyux2kvcTEhhl8nMJ+nmBQNaI4NJAVu1OOG3reOrAgc08KPlXOd0tJ
         EsAYMtuL6j5M9w6Md3Zfp+wgLK/CiiBtcwOhoqRijUem5cAKSGE5z1OcND6dB3ko3iVW
         g2bA==
X-Forwarded-Encrypted: i=1; AJvYcCVmUwd69ohyeU/SU4t+JgGDpNZY7S2IIir3z3JL8FRE7dpV8gMrlbJdmCPXG5/vJPcpN6RCHHaPm4NndJuuwm/2kIql@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6xGO73Z98LxWyM2dq9v43X5SwCj+r0JPJjYseMHIapoacU+S
	HggRSLwAF4mW5CoFl3XAelIzmNtYGUevRX+gImx9iPcrfwYuRG3J8iB9EMRb1S/Yx5Muk+a3bOY
	CB4ZrEVhxQRP2t4/tgvqrvzavh2GmbQQJjAUVgCU=
X-Gm-Gg: ASbGncvVru7VG/8AWFVYaNEVJPrbcSBKvaAWX9FUrEZUAghxCSGVXumgtLL47Gv+Jhx
	O18ww65CYof2sVFYbzqxdqkBixiRgJ00MV9YCUReCg1CjgALrjLBoj0X6vxZ+pfSqoeHHsV+3HL
	sWMZ2O127MASU091aPJhPU8N0fYtRa7hqM/9Ugf4kiudJEWmGQmpUsxXkYb3h2NOvNDvZSuNBHo
	qYEwJDZYg==
X-Google-Smtp-Source: AGHT+IHu9Tscu24OYxvnaTd32di5parb/p8I8Hss1nyflVH64t5cJZWMLk7S/Ip50uL7MTqDQ6M/ymRhw7tAnlCXAUE=
X-Received: by 2002:a17:907:d9f:b0:ae3:5185:5416 with SMTP id
 a640c23a62f3a-af61ce93589mr325246066b.13.1753455182998; Fri, 25 Jul 2025
 07:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725144444.210043-1-hansg@kernel.org> <20250725144444.210043-3-hansg@kernel.org>
In-Reply-To: <20250725144444.210043-3-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Jul 2025 16:52:26 +0200
X-Gm-Features: Ac12FXxqyD3rVokLGUqQGpEobMTaGDS7bRE_md7pnSLbzQMc9QWadlsLFvdqRdA
Message-ID: <CAHp75Vf7yoLYNTQxgJFbA2FT2dqVJ5BBF0w-uTJsYooON7LqXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: Increase ov08x40 handshake
 GPIO delay to 45 ms
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 4:44=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> On HP laptops with an ov08x40 sensor the 25 ms delay coming from Intel's
> out of tree drivers is not enough. Testing has confirmed that 45 ms does
> work.
>
> Add a quirk to the int3472_gpio_map[] to increase the delay to 45 ms to f=
ix
> probing of the ov08x40 sensor failing on these laptops.
>
> Note this only impacts laptops which actually use an ov08x40 sensor with
> a handshake GPIO.

...

> +       /*
> +        * ov08x40 sensor with a handshake pin needs a 45 ms delay on som=
e HP laptops
> +        * https://bugzilla.redhat.com/show_bug.cgi?id=3D2333331
> +        */
> +       { "OVTI08F4", INT3472_GPIO_TYPE_HANDSHAKE, INT3472_GPIO_TYPE_HAND=
SHAKE,
> +         false, "dvdd", 45 * USEC_PER_MSEC },
>  };

My gut feeling is that this might be needed for most of the cameras
with the handshake signal. Do you have ones that work without this
delay?

--=20
With Best Regards,
Andy Shevchenko
