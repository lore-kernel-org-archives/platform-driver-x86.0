Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F472914
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697442; cv=none; b=Nnc/KktYfao2x2t3z/bxkoUuU5d8xBnvEYW+H8+OOW+1nfC/Qs2NsR/JmEOKzMsdVTbtFXGoywEXipI6yAfESP0c2MoBFvTmBwH+xKTxPAvMRtLrpTzxkEwvM6zE+WaNWPz1YrtA5/YvjVnTnvIGe0fKGpi+bK/CncIb4D8jFGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697442; c=relaxed/simple;
	bh=sC8x0Vh5+EU/KVgYg2lo27b0LbtsNFhmD2spiHamiKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0buIv6aqXpLndBuWuxSCy3hsnaDtPvVxd4RuLLnr0yYYeVvUWd9nUikIMQcqFPWm5jTiZjV6JM4qqFgoEPGX4Jk1mEN58tHcpa0X+6qs8Kkhyt/d6hkl8X325nzWPTy13u4SakjmqqHyGh1fS9RB6g5GFZcbBf31e6hfIlY0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZxzOr5C; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZxzOr5C"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314a26002bso76514175e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729697439; x=1730302239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhSsNOPw5KnwXuPT3GrKHrfK1jdRJy2yUr/9KwvzMhg=;
        b=HZxzOr5Cvhf4weCoI+1jWZNpfK7RZqSqnypmIDqMqJqxEOAwW4ujT4+y0vwdY1A7+d
         /gb7wHxfK5wwpSl2iggFaNnKTMaozevOtGr2QMz85PaBGVgG97Lq3R+oMI0jsLVzn2Ps
         cxLa5DIXqBBaG1e2FJCyLwX5jIroXoFEqsS/DXdG31NG3r2w11M+Xh91JTe26N6iKEkr
         VSLufNBBniP4HV0RpZhR4r1TeBW96SMeUGpnVlQSJ37AAcGHu/lYrfjmGaXa0Ac6xhNM
         GPhqAIty1txcXzEXr7nA6pcYNcDdWTQA2ZdldHSna8ZO5SPaq5/ygNwZ8tLkm7aqQ2cb
         mMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697439; x=1730302239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhSsNOPw5KnwXuPT3GrKHrfK1jdRJy2yUr/9KwvzMhg=;
        b=IadEUW1KJrDq/wNuBPWa1Tr4Jnmx4bgBvmde73hB7v3kDa8GlRt31OstWeCOoK3GJU
         T5ly3e5hf9orMyJqj2UGOGNVFw2fEvz3njJCqlcMtjg4m3p32Vzu7wfcmPdUIMfw89bG
         lz5QTMOEqwt3GJThouOXsKoaTc3v3Ougr8IjU+inFfarW0dol1v69zPOcgrwQ9zvXWts
         ME0bmM9msDTt7cRNlcmiR4vA7CWhvmwo9/d01+PCe++RsFjedofAjujejHpjbUPDQco3
         Eg8le93bHZ9ehL2+v/OuQlKFthTg4tSYObw2zTeb21okYU7vJ7Jt01vyd2epEcHsp2wO
         Xosw==
X-Gm-Message-State: AOJu0Yw7bK/yOCKVI1dGJnnSQJ9VXl9WJUt7l43uo4ws09qKbg4kkEza
	oU7izacyuht15dCFkqqeDSUNzybgdsu0ZGvUK1PyaaBDv6p1W46V36U6KZvATW2svR5o+ZPtjSi
	84Sz7l8Wwz83+CacuQ7se6paHrBM9Dg==
X-Google-Smtp-Source: AGHT+IF5B/oHX/45Pwmw2jS970bvkqS/q/nJkYYLVJcaGv3ZbuOaFaPPTLAmLIRX+gPTDaJJUmo6Q4xmGuZWQaXX4zM=
X-Received: by 2002:a05:600c:354e:b0:430:52ec:1e2b with SMTP id
 5b1f17b1804b1-431841a2d77mr27494215e9.29.1729697438325; Wed, 23 Oct 2024
 08:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com> <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
 <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com>
In-Reply-To: <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com>
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Wed, 23 Oct 2024 17:30:27 +0200
Message-ID: <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

The amd-gfx mailing list at freedesktop.org that is? I'll have a look
at it, as far as that would make any difference.

But if the official driver is indeed open source as you say, then how
would the official driver be able to support HDMI 2.1? And do you
think this problem will resolve itself in the future or will there
never be an open source driver with HDMI 2.1 support?

Kind regards,
Mischa.

On Wed, Oct 23, 2024 at 5:18=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 10/23/2024 10:12, Mischa Baars wrote:
> > Hi Mario,
> >
> > Why would this be the wrong mailing list?
>
> The correct list would be the amd-gfx mailing list.
>
> >
> > I understood it exactly as the article tells us: there is an issue
> > with the HDMI 2.1 specifications and its intellectual property that
> > prevents the driver from being implemented as an open source driver in
> > its entirety, but that certain aspects could be implemented closed
> > source through the firmware.
> >
> > What's holding the kernel driver developers / AMD back to take this roa=
d?
>
> The architecture of amdgpu can't support it.  The applicable code needs
> to be open source.
>
> >
> > Kind regards,
> > Mischa.
> >
> > On Wed, 23 Oct 2024, 15:12 Mario Limonciello, <mario.limonciello@amd.co=
m> wrote:
> >>
> >> On 10/23/2024 03:36, Mischa Baars wrote:
> >>> Hi,
> >>>
> >>> I recently purchased a new television that is capable of 4k@120Hz
> >>> resolution and refresh rate, but when connected with the proper cable=
s
> >>> to an AMD Radeon RX 6500 XT that does support HDMI 2.1, the maximum
> >>> resolution and refresh rate I get is 4k@60Hz.
> >>>
> >>> I've 'spoken' to AMD about this, and all they do is recommend
> >>> switching to Red Hat / Suse / Ubuntu and using the official closed
> >>> source AMD drivers. If it is supposed to work after that, remains
> >>> unclear.
> >>>
> >>> Did someone get the desired 4k@120Hz / HDMI 2.1 resolution and refres=
h
> >>> rate to work using the in-kernel amdgpu driver? If not, why does it
> >>> not work or when will it work? I have other vendors with other
> >>> hardware that have different restraints on the number of operating
> >>> systems that I can use, and they do not go well together.
> >>>
> >>> Kind regards,
> >>> Michael J. Baars, the Netherlands.
> >>>
> >>
> >> Hi,
> >>
> >> Your inquiry has come to the wrong mailing list, but I would mention a
> >> few things because I happen to be subscribed here too.
> >>
> >> 1) AMD doesn't have a closed source driver.  AMD has a packaged driver
> >> that is a DKMS package for use in older kernels before support has
> >> landed upstream.  With all AMD products on the market right now there =
is
> >> support in mainline kernel and with most products in LTS kernel too.
> >>
> >> 2) HDMI 2.1 covered in the past, and AMD's hands are tied.  Here's som=
e
> >> recent press on it.
> >>
> >> https://www.tomshardware.com/pc-components/gpus/hdmi-forum-rejects-amd=
s-hdmi-21-open-source-driver
>
