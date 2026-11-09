Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208512;
	b=ep0DLBazR2f0xFmISr/swqF/YsIdsoxidfs4d4rqXx1ZiJAEPguRPS+gGZenI4d2IABE
	 nJ5JQwgDieX85XzAHUdUjzIHz1QQ4lLzVurnZyy85JFlF0lwJLCJVW6aqkjOwe72mqUoG
	 Z8TpjJHLFiRI/UeiAGzjwBI2odr77QnB9jah8AWwKESFONQis4wu0VuFDj12RBGVC64TJ
	 D1L6yoRsFSd9KNUBaSrKB6icBG9E3SYibw9Eo1PjNhr4lqLnEZH40P0z44NHHx8BNCzpX
	 FQwiSYOpRBALl3HJOEPWQbk6XpY8dcsIvZmi12oH4ODCfOUL52rMI2dg4UvUIAXcldw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
	b=aJtZJp2rdPDGd+ldhJ5XnseC3v18LV+OpRL2m6H2pSRvy5Q9Q53qBaYT9bu35iViZUAf
	 5NReUkeMTUPaWO7usLSi0R/ck2bjAhV2BRvXL7GPnQ20WTV1g15Q3hgBuzzXNhoHNhmBK
	 I0PHIp+0tPJZxW21XuFjKhLfzoxw8G1mdFaKKZ8dWw0jAEfWdcTT5wIRKr5FCEVHvPMVH
	 gAWc/x/ywIQe5PFoveCUw0TBw0JpKnOg0VuMt5f599smMNneNnVpnY57Yig1HTkd4Am6K
	 3+SOQ3NymaDC/Y3GRqsTUE2Yhyu3ACHeVaU9C3LCyqQiVaH/PFcmxj8nCcRPvCO2V1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csU26nM3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F35606A32A
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 07:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F35606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csU26nM3
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b331cad3cfso3356427b3.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 23:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208511; cv=none;
        d=google.com; s=arc-20260327;
        b=HljWl6Q4+WOEtADU750MOfgPGiryj7gALD3Cqzz+9c522zUx/h7Et20dAuB501I4TJ
         eYgX1myHPbaCnpn9hf3dWoi2r1oHlHD98u98utlPU5Bd+cpbKBHpxDs4fUXEpbCSeiYE
         V0F5J6LATCED9ws7z+u/6wBG5LREx7rHjYVCR3LqHSzdExruOOqxByyji2nKU86SRzLl
         NLC0+7percOQ4+NRHMme699/jOa2K/NGP/nw5kcCaLN9luciHY9cEsVLBjNWk5sgVsCx
         I5UpF2osaIgpXXdK+XA41/8uuSpOlol9bAi2XDpJZUHQe9QvcAHLDdHOAvuGfaQdx4OY
         P9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
        fh=9hP/ZKGmdq4qNTUgMgfeGaAulDjfLgEWIYG1F/hjMvs=;
        b=qlfDmiXFjl+1OJfzyFkpzskAvKdC/STfTilKYX6iv4JDZR4as42lOclwfUMaOnoOvv
         S2DL8gubjgZJExcLjsTJIk3iQWXduqj80hfkL+3+1yuwfeIBiKWOYnOGdt9zqxJDvbi4
         tWN3jkyp+CLOzAIrW0c41kB/BCfokZ1M+s1BnrAs9drsM36d+7jMJwqqYIoGN6LL2xPN
         fJVeesAcPO6mwJhnUVxCfRny2QQRZZpwrxRO8YFZnh7JPrtu41vAI9xpB4oBAQEFCsEx
         SrSL2rk+bRin+YkLWFHnHT1I2lv7UQyJO08AUO+zI5BNHE4X8pYzYs3AHodYF1WKnKlN
         sgWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208511; x=1794813311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
        b=csU26nM3k4fPR6c+45FXgNSnRd6mcGiFaUu5fBYpJCB35zLotT2fORe0o7XeUCLaY/
         hjVDjwdD4kDmKRqzjXaYFFBeZ5XabH172MZi+LniP7uqs7p9+8Sho2n/M//EeF2v+Z0Z
         bIF2rTnHM52w4rZ8UxueOZN/q3swm//FfuG3oAXlS5lfeHcFWFpPrLhH+FMQCJh9n98Q
         g1fMq00h5DXiDnowP5J2Cysl3dMXpGL3+AmNLAcUnzIALcCARYG/n5E+0yNkz4QouzUr
         akOFfvi4XQndFgLZBxT/3aR2OWfzVUkGzg5mR5kAq34rjnqlsOPJKhfC/MfQwatFvjmA
         7HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208511; x=1794813311;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
        b=lA0V9R+GCg4Uv0zuYwnJ+6AcKhNwkYWpvziLOhkan2M2h5nRkLR9XgQ1/2XxNEEeXF
         G3cmlzSODjBi9ymXFvpwnOXCsGJ52fTUnnwfRXDtm5lVs1emJOjdFHlQAC6Q2FuGxahe
         3FCcVU+k899AWiZuRq5u8J2rXfWVanerNRvXjhY1rcQc60YDhdTMhgFtxvgbVBuz1QEj
         GiUZgDN7Haoh4Jtx0xva/wnVPvKt0/lLvTTwIGwexY82Sju1goiQATaJZhUQe1lKfaRI
         l+81sVCAXS8m4sfjgTCjSOiZ0Oe7XpLHpvUTTB1DAYQyA063eBX1IvbcVC4y7c4zulWV
         Uing==
X-Forwarded-Encrypted: i=1; AL+hErEf1ZO8d5drF/IQXRy21gGmTA551x4DihJBCGX7nbmOZH+ItERYotDLGfYcCCZTbSgBnOlItygBg0NpmeBbTjynbo05@vger.kernel.org
X-Gm-Message-State: APuU4Z8chziT5DeTpbbtTQ6n5jYFKFlHS3grtQnJiRKdykK7GsI6+Yiu
	H66V5wzLm6RreHPZMQeagHLZTlf6a/8525+2HUvlDmpgl7PznfxMi0ilwdodqLVr1J6X+1FlE1A
	bs2sDIrK8mCDdnrz/n8ZDEF+AcoKR0YQ=
X-Gm-Gg: AYBFou2hQUIpYImGncais70T0BYu1WJedW50LKB+DyST7Eg0vzK6LcyeL8LPg0RzapN
	oODbyRY7TMljYQt9vg0Kn+xZM24rXLqH2RdDPZr8Qvn92g9VP2qX6n+uCC6NYnGXxogbh03mx/B
	q9FV7UL/WX/n90PplYwIaruP4/nK3NWxrsZuUlc/rNl5ynLQEsC3v4paH7kfVfc3ggolLOBU2yO
	DxSBhEREcph8IpEDGUpeO9XlUXDnMxhceAH3APTAnGM5fs98Mwk34CszC82t4gcNsorboi3F4eo
	XVW+8y/Ij0TNjfoba0EGkQku0hg+kiHKg4sdnsSpkKq96a/GXeHUEFOOeuRUDgIheZXzlIIzfGa
	CmzNGAgQjZoR2AaRP8Q8aoHfyKi0hnmZ2+Qe3KrWOOhw7VxR395kRvWUWURXG1P6gvvOwGXof9u
	vYbi5PHXiyvh8j0mhOa6Ia61iw0KQlHHmdqj7js34bmRZINfTNOAS7pDhi5vRFC/gUcQXKFh/tJ
	5sBDrKs4eQyv19PL7oT0EDVcd62Dah5JE+bp13wo7lT+ubhQZXp9JDvs3j0rQ==
X-Received: by 2002:a05:690c:a4cd:10b0:8b3:6430:6728 with SMTP id
 00721157ae682-8b36cb77a09mr16346547b3.53.1794208510681; Sun, 08 Nov 2026
 23:15:10 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com> <20261108213656.13031-3-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261108213656.13031-3-antoniovazquezblanco@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:14:34 +0200
X-Gm-Features: AclHuK-MowMPC7nsIXdyGu4QxS5XFSL9LJIdTkFEgLEwFauodytJ5sllsbRZ9KE
Message-ID: <CAHp75VfuW1Xz=UeEqCUtnwQF0+auziyTa4nyhHWSa6=QuZMV-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/surface: surfacepro3_button: don't load
 on amd variant
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
> surfacepro3_button binds to MSHW0040 on the AMD variants of the Surface
> Laptop 3 and 4, where soc_button_array is the right driver.
>
> surface_button_check_MSHW0040() evaluates function 2 of the MSHW0040
> _DSM, the OEM Platform Revision, and binds when the result is 0,
> assuming that only a failed evaluation yields 0. The AMD variants
> implement that function and legitimately return 0, so this driver binds
> there as well.
>
> Decide instead on whether the device implements the function at all,
> which function 0 of the same _DSM advertises and acpi_check_dsm()
> reports. Of the 32 Surface models carrying MSHW0040 in the ACPI dumps at
> [1], only two do not advertise it, and they are exactly the two this
> driver is for: the Surface Pro 4, whose MSHW0040 device carries no _DSM,
> and the Surface Book 1, whose _DSM advertises functions 0 and 1 only.
>
> The driver currently reaches the right answer on the Surface Book 1 by
> accident rather than by that test. Function 2 is not implemented there,
> so the _DSM falls through to a trailing Return (Buffer), and
> acpi_evaluate_dsm_typed() rejects the type and returns NULL rather than
> an integer. The revision is left at 0 and the driver binds.
>
> Keep evaluating the revision when it is advertised, so that it remains
> available through dev_dbg().

> [1] https://github.com/linux-surface/acpidumps
>
> Fixes: 64dd243d7356 ("platform/x86: surfacepro3_button: Fix device check"=
)
> Link: https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io=
/
> Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Sachi King <nakato@nakato.io>

Same comments to the tag block and the commit message as per previous patch=
.

--=20
With Best Regards,
Andy Shevchenko
