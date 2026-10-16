Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DAE53E30F
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170267; cv=pass; b=ucVN3Pw/IZyndgSyaP8qY6R2c0LVzOe1hruPaEoB8uzv94MxhJedB2xcBIKhQXGrIuNsjv8rvDmJp0Du6+C5awQDEoG+LOWxOb8+7RnP4YmuBQU5CS1TPelkFwy8J5qGOfCpSB9um4iVrySWdcJYUwsh+gC2UWysIHjYWRknpE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170267; c=relaxed/simple;
	bh=gukvw137Tc5v8YNIKZfQF3zggLjApXVNAOx8tztyb0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/Eo+WncJShWwdt9ns/3d/HurpLSIVY3JyBqbRfaS3s3gJ+Qsprt6wFGfnMsFrWoGeKAK74v5bx4HPF5CGPljpAT/eJ/T8jqWxjKrUNc/8gOjoPKDblgih8KaqRiyibInHCb3iqHJx2411oIeOpvO1fQkeHQfa72dvNzgnWctL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfflGzOY; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfflGzOY"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso21976166b.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 10:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792170264; cv=none;
        d=google.com; s=arc-20260327;
        b=p7gCgu6MUw9DnPfhuznaZlhDxBCMIO2MGCYg+kAzP7FRatC66xudSQJTfnTXgyF43i
         lKVfL/hUOgXe9GIRgibnzgIRCQMaeGaKjZ1iVeDRqMgtu5ekOhcmm8yOGgdrf3Lq6GVw
         GWL5FX6cBaXkKcuQBjkfFDGUtsQbKTPxXdjJMOTmFeBWtc/1inf/lOT6DZj7N3TnNp6g
         hyfHwNgBJGL2MfXsJYe0q/QW5QlE3pWG/pzsd1oQDqlf78+4p9UZVKgTpNR+Ikfkm4Jn
         M+0cxqUeoRa2kuBU0gFQmGqkJgAhWQoVy7vdlCl0cZVTveuKPRENctzD9zRL+LQOJdp+
         0a3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3nq2M2zdxjUhEkBFo/wkCmYTA/LTHy8Z+3UOk5RQris=;
        fh=YzK97LzHzJcOJqZvNnKuAXxi2PWmHI12ucr/j7HMU14=;
        b=eBU40t6CLsDmX3datoG4dwXqoaCcrdhoGg9j9My03nnwYUKJtSJ0YGp3sn7di7iBjG
         /G7Z/CdpIspADSUMb5NgpYtu4XOP5AkYG9iEtc4nAkZaQCsmxstyXVcdvvkFQH2FIJq/
         F5MuqEPg+IgpJ/51wWZgMIOWe5xFztiAOM9lbOuDTYWgulFenUzs9SMAqJh/2OIPiOtd
         KJ5PeiWP8RbN/O5ckDhm4ZUICRDyhGeh2mlixvaaq1D8tYIUfY6rkkJNRsCa18Ko5pa8
         /SVfRQicbdbGMcinrtitATo/xIAmlObrMQQ6+dgenH+3IUwAquwB3ZKLFFLjZvttu3hZ
         CX+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170264; x=1792775064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3nq2M2zdxjUhEkBFo/wkCmYTA/LTHy8Z+3UOk5RQris=;
        b=OfflGzOY5X/kInmu/Xqh0fIC+zI8O3ojCVT6UmunAI23cuG+VgnYVOnOuI7th+O+yS
         VT7xDBt1sRj9rsXSlguE8oaD9D4+d1Nl+zpcSKf7HF3C6CUXAsR4JGKPhyJo1440EX9Q
         Ru7GzV8U+Jo6Hz3Tu97zWDlbGbIcdx/pLHlI5/v6rh5uMxqm4LYfazdwZeAm57PUBoQT
         ESuAHAQInk6DMah6gFFoDJ7y7k8v+XQ0yRezpGeE3sVRP9kHLb/1rLutcu4ZB62fn0Pw
         yJD+VAkDy5KJAvDfkmMsSvFsn9HNnRK/5MDyjPv64JDfiQ0bMZmJTr5ot/vhOt3XCNBF
         EPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170264; x=1792775064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nq2M2zdxjUhEkBFo/wkCmYTA/LTHy8Z+3UOk5RQris=;
        b=MqLy2ErK14aWkPjRf+W120mzu/J8yEmM3GR0K7QFW1n6R8GQe4iOhJWc/B4nKlN4dk
         w49Z6/QbF6Wwv9KpdokcW5n9ImU0dCqGUzgkRTWEIn8x/4C/5DsLj+XTOfSLtwNxidlv
         HfKTHNbRiBg8LF6k6Qf8ftCfDY+oN7DSk22peeqDKlELCXgJ/lxIW52AGmgGIAot+N/V
         JXl3y/nhW9RXFmaVK4l1lxPVAaTqrAQ+pIa5MZ5VchSGcHc0081sg1Yx7fSJnq65uMRm
         xvHxHXvm3v2ox1QaClseavaLd/tHvDfsTe+qFJMP5xxdVgLkifF8nAYPnMbRln+dnaRt
         AMjw==
X-Gm-Message-State: AFq9FYL9ESkwLjZN6tJPrlBz0e0FeT3trrA1Wl7yb1mPLK6GRDdn6NTc
	CCGBLqgDDWF2MrbeWw5B4yCS3smK6KWyCNPlghwfUm/FLWntkbbobXxGJhz/3HBSUTMGIQ6XEDi
	tmoxsbkTosYtxU8ugPrSD5zAVVoAKvyE=
X-Gm-Gg: AYBFou161jgVw5MKK+M7IK0WdbcyIMIiShWxTyjUSOLx18MjeO3fm9IMMWXvLjnN2wg
	mG5zwfaQfFthFU1ueH168PhfO0tEIQwUOHAxbFCD1rSTYS/qu+UBdApdrEDaHMD7/OnAXA3eQC8
	1jLOvH8FeQqP7OUF0ISy78DVARSOKO8sbCPcX/z8eC8KfF4j0S5V/nIcfpMxAEemCYdXwadNVM0
	oTUtjIce3f/qNs3wUpJ5FJxIGqjqSu9TrA11gGb/d8Kc0+e8NHKm/GL2czESIfG1oT/HFmM25s5
	meXaTQzdqYF7GxbwjmzgyYxDbs/j/EnZrMC2EXqA6Ro0MyoGPLpmDF7uHd4OPBgkycocaJBj9yu
	MOtGu6IwJHe5VZmEYwcfy+H9tUa9e2b6Qjf3chpg=
X-Received: by 2002:a17:906:c142:b0:c2a:34fe:ea4d with SMTP id
 a640c23a62f3a-c419e639b87mr40098166b.25.1792170264288; Fri, 16 Oct 2026
 10:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALeJObvxQ3b-s6MGGBKSz-d7EeByy4wh7raKBEFYZg6bXq4ytQ@mail.gmail.com>
In-Reply-To: <CALeJObvxQ3b-s6MGGBKSz-d7EeByy4wh7raKBEFYZg6bXq4ytQ@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 16 Oct 2026 22:04:12 +0500
X-Gm-Features: AclHuK-O3QGVATFlYGfsS6SEptvh6nF7Tic-5KTWxTOwmcMAjlMwm-5k9VkgQgk
Message-ID: <CADqcGBmGUNgLRALGAS8LTU469vc+yD-xS444rdTNo+g5KPm17Q@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: hp-bioscfg: fix 16-byte heap overflow
 for empty auth token
To: Saatvik Sharma <saatvik333sharma@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jorge.lopez2@hp.com, 
	ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Saatvik,

Thank you for testing this on the ZBook Firefly 16 G11 and for the
detailed results.

This was applied by Ilpo on 5 Oct as 67e222d412cc, so there is no v5
of this patch. The commit has Fixes: b2715aa2e135 and Cc: stable, so
it will be considered for stable trees, 6.18.y included, once it
reaches mainline.

Thanks,
Muhammad

On Fri, Oct 16, 2026 at 4:26=E2=80=AFPM Saatvik Sharma
<saatvik333sharma@gmail.com> wrote:
>
> Hi Muhammad, Ilpo and Jorge,
>
> I tested the v4 empty-authentication buffer fix on this machine:
>
>   HP ZBook Firefly 16 inch G11 Mobile Workstation PC
>   Board: 8CD1
>   BIOS: W70 Ver. 01.10.00
>   Kernel: 6.18.55-2-cachyos-lts
>
> Before the fix, writing 4 to the hp-bioscfg "Customized Fan Control
> Options" attribute failed with EINVAL. The kernel logged:
>
>   hp_bioscfg: Returned error 0x4, "Invalid command type"
>
> I rebuilt hp-bioscfg from v6.18.55 with the v4 change, removing the
> empty-string early return in hp_calculate_security_buffer(), and loaded
> it on the same kernel. Writes to 4 and then 15 succeeded, with matching
> current_value readback and pending_reboot=3D0.
>
> This confirms the BIOS-setting write failure is fixed on this hardware.
> Fan RPM and persistence across reboot have not been verified.
>
> Tested-by: Saatvik Sharma <saatvik333sharma@gmail.com>
>
> Please keep this fix on track for stable kernels, including 6.18.y.
>
> Patch tested:
> https://lore.kernel.org/platform-driver-x86/20260919060037.84602-1-meatun=
i001@gmail.com/
>
> Thanks,
> Saatvik
