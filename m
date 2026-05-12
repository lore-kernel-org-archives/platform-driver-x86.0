Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2841D2D7812
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599780; cv=pass; b=ZkUp98g6uCngBL19wzr10IXxVIwYnAFAy5MbmTBZCX0J290huEIlu1sqrIORYzWnRIbi6G7m5R/lQYVuC0P6tOsq4jv1n1XAth5BrgDpTIgpHYUTjKhQKzNXn/sFWMEBkkX/RCtPCSfQcphSQa6IqkASzgSyJ4HTnTZdsagPaeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599780; c=relaxed/simple;
	bh=nBOsokuQTzbairGbsW+8mrF8HggOp9/BLLPnZTJwHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXI7iOZ7EQ6mmuAAYTiaqFAaKVjklWYIJDEzsdypS7oh/qe/0X4ltjEDjqcC5zYx26swome1wH4wN8omiEO6VKwHl5eJLZQdY3nuhOly0O5U/2Mk5F5DAU9F+bRjGiJiPTT4cd1pwVuf0neNMyIBQxdNotbZ+fgDLRDJTJsbZJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmhjAiGQ; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmhjAiGQ"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38be5e86918so71419031fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 08:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599775; cv=none;
        d=google.com; s=arc-20240605;
        b=HAuOXPRWSmocIYfN2XcfLnGRoZiTYsuPVvlIOlhoeOU45I+6zQIaOnfvQJy18Pl77V
         hTtc/6kp4g5yXKA7vgwtJbYq8buevik+vYk+8lJ4cBEUdbxF+MV3LpR/46ES1s/Eof9r
         9z0bCFaM5RTdTqAkB8FOY+tacJcoB+VKTvOINgb06NXXGNHDdoM6CDQQWsq+iSzq3K1U
         afPI7KdtMhWrgcSqvZp+jZllvOHZSE5VW2wKbIOSbA56q976a5lozsVf2LAS2qBcNmTT
         Ul/O074WFK++kXtLm3lSVF8ZhhOCPy2CDGis5fJGtqc1syvS04zVfeRIiXWTjeHokv3f
         jOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        fh=ftaXYH/taPAPxQTq0jSV3na0NjsXF1pyfZVWe12aeNo=;
        b=VLwHsjUf0OPshhVqEslUqlF8LmUUo+pThyEpVfFWM5FDqjDNOry1Pwlh9IR4CrZXao
         ptpFgkqhhFwJCKco/qZy3pvManyqEzZnPfuAbP/ySCs24xqjdv+74xMGkMoqLt5w/w4L
         3mBtQVP+bCGufkIREsUW2o1lyAC5QunZ1HjoIT6miOPJJn3avHm14dhqv348DBpl7wl0
         RFQ8tS7ppnfa0Xu83TQJq0nkUwUFTc1vd4wNp6ZwEcRhpFDpRUpnEa10elW8SuXq9v+4
         VpZufStJkwAem8uA/dD9EoOqm8/7xCbOVGl+zbxGlyxyUKPmqrYM81+bfjlkqmom7hYD
         erIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778599775; x=1779204575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        b=lmhjAiGQCgHEWw+c7/vusbnRRTEmWd5mKRYWnFGpPjMi+92f7E1UmqoSaYt3CE3ExB
         3G08pDqoHoST+dNCLHIjkeQsGOb8CgGROp5/xaS6EBUQjpRM63MIXOOw1uL2hdRasQRI
         aaGHo5DvCsdZIvHxTirBWgMahpsyDRXXYAiHEDo3yXKt1urNqx/trlFsGhCZyPOc+uUi
         eg30NdTqqdHkMbwduFBTbX2HAUCFLTnTPOUq+hR38Qtc1I04PhN9ICSTP1m0pGizDTMP
         oeZLKSA+e6d8Vocyxzd9QPs6RC5nl22cjgC7D+fRZEFbI0wfulrxZ5ZYiZMVjqpOvRaH
         Z41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599775; x=1779204575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        b=gGdRWUuE3kvOqmAoQKSeRRGHzVEYRGLUSjc4RZofvX/AN+Imu5OLiBW6o1+MkRhXBr
         iyjPwUtpyODXvwagk+wjw9ejtMSeVHSrsSx/OFoiliicU/4vTRV7eGdFq8TG7O7I863X
         m3X9X535Bh5508paYrgiR9utUHvpcYhShFziomEujdKazwk+ngscJb3UgpqVuPpcQoqn
         2HC8ZwmUEWIgUwRBy3DTswNzaO3CO63qvWiFcIWVzqMR0xfSFVQ6qxlA0MDFs46Q66lh
         RwoUNXclq1W5ACjO4iHuiTUIbEibQZhF2MokbG0zCCvoJlxEewBBDqbd9i/7iIejebMC
         urdg==
X-Forwarded-Encrypted: i=1; AFNElJ+sFxIopCvGY34HKTcU4QAHoz6Eh8VzDBHznnFZ16WarHeZ3lX1PTdc5MD9S7d3QQW3YR7KN/zMEb6vIbwbh2DtOGhk@vger.kernel.org
X-Gm-Message-State: AOJu0YwpA5ViifQi1j/CNGkYs3R6QZCw++FMrmVgEAp2ni8gKe1nnU4Q
	o3UZoRGVyRdj5zktaNGpqy805T83HPGbD3Up/zpYnINwafJitDqggYfhKsqshhLCaOPUm+hHukI
	VS8ETMDp1A7Bm0DY2wTPDIgsOrGnaWOCJRgZS8Dw=
X-Gm-Gg: Acq92OHfja94Kg8X4zRcn0G8LJ9ODieXPwPc3MMAH79CDoLxx6UdoTeJJxD4WYKTCOP
	pMO0CoWg9DnQzUFPwj9dR7o+bRmvl3b2YqX6h+z49zD77esuJCeDQI5JYc7C4ryeyQsVmWFaIi8
	BxEh8bF1x83DuJB9VyYhCayzK8LPmoiHD6G5zpWJZUvhcCxhkWOCkyKvu1a/e/2zLbp1aqqTJYB
	sDC2ZhUqDm6QLNvS6A2UEN7q4qkbYs4wH2PPQ1DdMRY10Qr7P6CdEqmfZjCDBMdrB6iKhvZq1o3
	b4Q/Ub+9adUxF5uAy1OIOYVuoUfr3bEuV5uhHUd9J07CqmN3jPldk3dcQZ26uXzGne2nNIqrbFI
	cbpgBGt36U31XcZ476Q==
X-Received: by 2002:a2e:bc28:0:b0:394:2b8a:234a with SMTP id
 38308e7fff4ca-3942b8a5e7fmr31619441fa.25.1778599775037; Tue, 12 May 2026
 08:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 18:28:58 +0300
X-Gm-Features: AVHnY4L1_zJHNRi354c-jkblkHr8hmHJHYehCTnWbdMU5vf_KkUdHclsjlbuBjY
Message-ID: <CAHp75VcdbpY+DfFh6b61U61X6or0KoVs_akygnAgW27XmmXo2Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] kunit: provide kunit_software_node_register()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 3:00=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Implement a helper for registering kunit test-managed software nodes.

...

> @@ -10,7 +10,8 @@ kunit-objs +=3D                         test.o \
>                                         executor.o \
>                                         attributes.o \
>                                         device.o \
> -                                       platform.o
> +                                       platform.o \
> +                                       fwnode.o

You may put it after device.o, 1 line less to change.

--=20
With Best Regards,
Andy Shevchenko
