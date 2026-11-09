Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208446;
	b=oGi4WqhSX2e3sJcQGSOPt6uoQxNHWxfIKTjHSbEcNWzb1bsuqXAIpp9/p1+A/K6mZf4C
	 qjN8cr6eTkT+yAQvy3TJ3QaIOIzmBRYcmWCuOxF9dfg6SoXpsRiBXsIr+bQhTpzyXAx6x
	 Th7SHNcuymL3ag+eZP0umalDJQqRSrjY+RqDmIs7zdCMqo2BIn2g9gLqIKJcWGTJXsZpr
	 DWa0wMakH5LuCn+9xiVS8PkFBKEoUOdcLmnFhkk++h//wWOJq02seLnZ7UpOFS6XRw/4c
	 icLiW4NXShUbSsHY2UnpU+Sw6O3Peqc5LwS6Ws/lyr1RtcITH8dcF9JPkp9Gb1JkK/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
	b=bWpCAx4nh6dJagWJMYNMvEyem7UePv91D0HRASaM4o/n76oQERQiB/ZvC/lm27U8jpqW
	 xe2iksK76yNpvekXtn5ehCyLbcxlJJR5LPECW0zyyVLIW7zhxv2ROnt6KRBqsMDZ94+uQ
	 o9Nzvv4ushv60NKfnLIsEnWh+5HkIWJF4tZfsFVmOv3VQEluDGbTnb+3giDYTpobKPaTs
	 sNEzlQdqYuAmXKHLTLpdbSpktZor2K0FQZUuYU5UIqjl7ZkywCLSVgmx8GLFYm5TiSFcj
	 UWWGP2ydVHQZG/nvMxAHh3NalJAcwtPjvk3XxQ9D+oVHRg3spYHg4IUXrgGnwYyFnZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iutm2nf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696A606A322
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 07:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0696A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iutm2nf7
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b335ef6441so3343917b3.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 23:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208445; cv=none;
        d=google.com; s=arc-20260327;
        b=GamiZ0UooK1WV6fRrJdsVosjWn0f3C5v7MXvhj4JeE1YwrNIZ9txcL7LR2sh0fnqqP
         RZWket0UPkRJXzK68Olz9zaHdFTBSot/FgmJLl9NW42Fm2HLETQME44zY2uURjFZXbDM
         su7EW5/94o4qXcV4bVjFIL+Dd/DDiNJ8ST6oJ7O8dqUg5/zJEsh/QH8nS/sjLNZNNz22
         fr9XjoTzgo2YOhJ/vj8WfuQVriHy/M81ywhBqeQHZMqpAzm6GwDk+ZW8MG7RqdXez/FT
         j3Yj53MADPiJqzYv907QjypJh0WLiGGpKMdrIMgKRslvlzW5pawJNfnsOGeL+NT0n+G4
         EnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
        fh=rJxeYFIS+SLBhabO45Vjjh864i7r9iv7VUcngAX5BW8=;
        b=MjXmLmpecBSq4Ttp2Q/UWlf5nORawSLdtehthvkXVA36qwQGUcFJwu0Jw5F8J4Y0xU
         2RJeyVLxHYQODLzqr7PuQ55OuIZtlvovH4I0NLct8kDGqH8tT49BzRJWEMNFAYv+FR4P
         jPlYAgC1rwNxzeymK/ZmjQ4sGayCLEv6YxqhLs/gBlQTFwgtuS5K9CeMithaX2dpJjpB
         UIRNwUbTvWUX8Lu/k9xDUxx7u0MwQCla1q0tSiCCBGxjoXZszs2mKOFhvlYLFU1RuP0e
         Vfx0r4I7vTHF0+EmYgm5/abvmwCyi0VbmB69o4qMDDa2MaadaQZXKOaqtqL2P3qwjH7w
         csDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208445; x=1794813245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
        b=Iutm2nf7MPuCjo82TeOmREBZHH665Hyf8H1vg8zjwCkCU9R8CUDUuGfOsoae4Q1+0a
         7TLbhra20Hwu6gbjIXPxuChjIBOX1xldHXFIQGNMcKvNz4sbPa68A9QYt7cVqzrqmn69
         gkl8PpyMylrGSzra7OYHsDtZaC5VRZM8j58aOrZ1VRjxvbvljaHSO1O7yeVcyvaEB0rC
         TIoo56EhZlkdiL5Rx7y8IrDmMIkRzDt5978PzF0F/kIUPq+l1Q44Ga8TgJbfSatCIkD/
         4YoE5tjE3HuTxyhRcNrgKEIGCujPrrwfj+EODdqiJMBFpGyieePrfWF9HovTLwtBmQv4
         0EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208445; x=1794813245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
        b=06BXFFJrFmpO4lQI9AAO77tZmh716hIHNm9ITTDOJU1LmMLx4pW+AvD6BDJUZYeY2O
         iwAB2sfcz5FiEby1RgnZHOCZ0zHbzCfH/M/RVM6RrueCAK3m58qGivcaW9w9USHOOfka
         UwjHU/gOe+4g9y2DjHD/8X83MQ3f9L5PqH5Fv4PrTaZLs00ht5av4K6PRZrEaIHk+BdY
         tm/LFa+ooRXULmAr+lAxLcSWrixYUy94Py7MZcKL9rmloNmfasUUSgPMTuAQPjMTc0f/
         qCPvqoVTj9m7B918C3Xd6X50+9Gj5YhYw84TX16jYblUrQu9nxhTF6DPqFLAiGTtFv9q
         Lu9g==
X-Forwarded-Encrypted: i=1; AL+hErERKEU6c3CqBulJ0Y6aCBN4onJi8A0uOdQoVo/Rr2223WbQPdGYVYvz2f1brQpPjMoFs+yijo74j10oKfapTxmCtAEV@vger.kernel.org
X-Gm-Message-State: APuU4Z/1yqCeFubgssY0gdtK22HV7dYqgtHUgpTFzW/mRIxJQ7G0r6fw
	NpJLclFN89lGVG4fh5q0bSyjv6s1dJ6WbEQDO9+jVSpG4P5AE8LmaL4RyS+CBTg4CfTDjh9qFD0
	mPGsIqel1mwLKyvEhZhXjtj8Lv25Q98k=
X-Gm-Gg: AYBFou2sD+BC1OYE3EZZu49fj5B9T+3ALBzJOur5vi67wBYPO/Dpk50xKXmVvCRdr6t
	URF6P4JpdwsyL2OHs/j3y9SSukP1vhmyWR4+zCox6CdbwwxV/if3nM4KIXCsD5sjYmnzO+pjivR
	EaYCJaHk5doiwEaY3khMH8kuwAo3irccD/QTlNQ0JCBkv9PBtMLRhteOQ2Dkh5CzX83ybIQgIp/
	GpPSoi/kEOjGhY9ifaNRbF7MmV4HJNRdnSG6aWAQwvul0UVSoIh8zFzHjZ/i1ngEEWVDqUzkPe8
	FBxVl5LsfDFL3Ot6quAnsrb3UIXvSl44s+0MwADYU01BGXbDEItEK8LhZVnSAsSkRXR3D1ueKcU
	FUS0mXpB+FHb7GKG7yClAfEqwS/EBzspNc1k/Qld1AIBlplEKzYCFByPzJKVozEkT1ISHpAlZv/
	UuwETGrMxc6lpEWn2lwozL2Je4Goef3u6i0Z+loKr3odY7gOFRGAa3IDIXj/REHiNrCwVQd8ja/
	sjWtk7v6n4qT5r1sJPuGSEJgJb/zd00iQ07WaaiuTiZ8FsgYa8v4amRqa8QWQ==
X-Received: by 2002:a05:690c:e3ee:b0:8b0:6866:c5b6 with SMTP id
 00721157ae682-8b36c906f40mr15532137b3.9.1794208444824; Sun, 08 Nov 2026
 23:14:04 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com> <20261108213656.13031-2-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261108213656.13031-2-antoniovazquezblanco@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:13:28 +0200
X-Gm-Features: AclHuK8MaFKzfCmypbKM_T55grhYANqfvZn7avQ_UIhgQgnEJ2s3PDOHcaKYoRo
Message-ID: <CAHp75VcOOwr37SyOgyYnRu2Gc_FoyAzmmt+qk5cnN=9LF2Xvqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Input: soc_button_array - support AMD variant
 Surface devices
To: =?UTF-8?Q?Antonio_V=C3=A1zquez_Blanco?= <antoniovazquezblanco@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Chen Yu <yu.c.chen@intel.com>, Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:37=E2=80=AFPM Antonio V=C3=A1zquez Blanco
<antoniovazquezblanco@gmail.com> wrote:
>
> From: Sachi King <nakato@nakato.io>
>
> The power button on the AMD variants of the Surface Laptop 3 and 4 uses
> the same MSHW0040 device ID as the 5th and later generations of Surface
> devices, so soc_button_array matches it. The device check then rejects
> it, and surfacepro3_button binds instead, which is the wrong driver.
>
> soc_device_check_MSHW0040() evaluates function 2 of the MSHW0040 _DSM,
> the OEM Platform Revision, and treats a returned 0 as proof that the
> _DSM is not there. That is wrong: 0 is a valid revision. The AMD
> variants implement the function and return 0, so the check rejects
> exactly the devices it is meant to accept.
>
> What separates the two groups is whether the device implements that
> function at all, which function 0 of the same _DSM advertises. Of the 32
> Surface models carrying MSHW0040 in the ACPI dumps at [1]:
>
>   fn 0 mask   fn 2 advertised   models
>   no _DSM     no                Surface Pro 4
>   0x03        no                Surface Book 1
>   0x05        yes               Surface Laptop 1, 2
>   0x0d        yes               Surface Book 2, Laptop SE, Studio 2
>   0x0f        yes               the remaining 25
>
> Only two models do not advertise it, and they are exactly the two that
> need surfacepro3_button: the Surface Pro 4, whose MSHW0040 device
> carries no _DSM at all, and the Surface Book 1, whose _DSM advertises
> functions 0 and 1 only, function 1 there being dGPU base attach
> handling.
>
> Use acpi_check_dsm() to make the decision, and keep evaluating the
> revision afterwards so that it remains available through dev_dbg().

> [1] https://github.com/linux-surface/acpidumps

Make it a Link tag in a form of
Link: $URL [1]


> Fixes: c394159310d0 ("Input: soc_button_array - add support for newer sur=
face devices")
> Link: https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io=
/

This tag is not referred in the text, make sure you have somewhere the
reference to [2] and mark it so here
Link: $URL [2]
(or drop completely)

> Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Sachi King <nakato@nakato.io>

--=20
With Best Regards,
Andy Shevchenko
