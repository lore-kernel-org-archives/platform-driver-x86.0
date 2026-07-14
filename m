Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422CB342524
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 03:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784000693; cv=pass; b=kMNJdA2sQX45RxKZr2dGTQ5CuBmheK0VWi8F+imww+omj97CenHJxu8quNv6BXvyk/Lhbcce/GVV2t3kzRgObD66zJFwhZ3zy8fCyTSV5drAkrFZDLmc3Gq4oB/VGdHNYfnvAtAIVLEX1MzZYhWcMONs0RPUSqHBVXzbDlVksIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784000693; c=relaxed/simple;
	bh=S30/b2ZV0yovuoFAAkr8nIHsa1mh8oFG4t5ofhM6ksY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhWKhDYsaFHFWfdDy+gaTpPORwVlwAHkXxIhR0JPl1GDLyHl3xlPFP7DeJ18G6nOaiXD2a10raruIamksZBpI4P8jVMu/6NK/pf8DXoQA8hjDvAgOqkQ5SLc0w1164QY3asqlXuZr6UHGchNgedrqTv3OSYxQ+D3/cplkbmUj9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnahSndV; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnahSndV"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c83acb86eso6159491fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 20:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784000690; cv=none;
        d=google.com; s=arc-20260327;
        b=kAweelNY3vBzPiG6Ry7IqPO+l9HnAvDyCGAFQnSMi4pGtn69PAB/vEy2pLn2kv00W0
         GdP94SWWdcXlIL8p1tvxCnOz2AZITZ09pMzfkqhaygczWxWiauIjwW9hrQ+NUGJDX8oZ
         VFPGbD3ZfcceNWVUM/PH9e/MtngQKY5iblrLldykja/McCnF/1U8L92lpYfvztqpdvDW
         27OdVO0pwU/NIJPI2owZ7bLBw1/6HojJntTfRxhJhX1/Xt2PpfT5qTa7EdXAfQ0dYb07
         uU8BvZrE68HDJrbefezBfLSm8tE1oqr60NviNCGY/78TDn8MDdagd2+kN8QLGPdVisaD
         nEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DdxhKCtHHL4au/QT2rW+2BixUXKkoNizAUMNiL/0+zI=;
        fh=yZqVeKkw/mc2nimEzP+25ytn2Vry1Ve7DfR+M2RjxCU=;
        b=f4teXxkAOzUUejIqSdo/md7sfxNnMz1Db3iMIilvhn7i5ex6Ww3nHzZcDbWE7sHWXe
         wcJw38qVHyahAzEAiqiI1J/loDrZprPdfSl4WA3+hBppXyltNmgn43xmLYOdpuW6pTIY
         zP+Pe7hNlLZFYks46Jp2I2+1r9neuEFh7oTkw7ai21fQicVWF53BEPq2bOlr3rNXnsra
         gXJvZkmifHv4IEoBQ1cUdLknJyIVCru6Gq1amkV3Zo/vIkEd0etgM77xT/9WXYA/CPQR
         yHGA/PgGFO7qRo916MExrLPybHGuMpcf/GB0OC3HnfyDA0Q3AgY5RP2+OlQ4wpz5aj0G
         ZXhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784000690; x=1784605490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DdxhKCtHHL4au/QT2rW+2BixUXKkoNizAUMNiL/0+zI=;
        b=bnahSndVj0vcIgJDjCgAU/CEJfl8EwMJtS5ncNej523BTbP0ZkHV2PkuuXv+l8zdri
         POSkRjrTUEzlCn9Aa28nBhvDRc6xtPezkDqefARmfSQJiIbbChsAF30ToRH75OKQbQ88
         cXmhIRI9VvQ+Vf/pzYK3OFNVDqypZK/uOQU8ekMRABiOdFItP+8RBD0ldm7O4AzMqeP7
         k2RM4NlhwGXrzW8qzIroPqCDJ67e53+1IWa6zP5YimR2BhnsaSotRTX3cFCTYP3MwJ7c
         ofUOsW+xch4fZikIp9H6bvhYbjtHvkVTL6Wy2eRFTRtIrJOSp7Ws2ds4EN87uoIxLBNF
         7KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784000690; x=1784605490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdxhKCtHHL4au/QT2rW+2BixUXKkoNizAUMNiL/0+zI=;
        b=B72GyieT00iP/N6+A249o1Rxqb80LfOtp/ZypKV9vBd90mlc2u7S5sncdbpbqf8S79
         7p5xOtK1u3qDM3nAtqVKUycQ0vtkqBmfVceOu8Mk1pGJJaT7tVm4XEqEidD6Ste8xH9B
         YcSlxFo0m5DdxTJvoFgZsgk7+0GjDz3XHRdcqazOsXygfeEPbP+KRIgMRwk4Ghxumg1V
         rFGQP8nOaEEkcbNjkesN+j7klJEBujPL87kJLN8MvCuHi4KFkY/3Y/9cw/dBCUyzDWEH
         CmQQw+ybDyg5wUJZtcMjbWgMjE2k1JsE0nNp1tvKZZ70gRhRVFT/GYIQjSW5wiNB6YQ5
         qyjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXQBDKzcJh+Om4sZ7SlxUCYqSYK9v3K9WKqZl/of66F+dRSbcutC6XaApfGnAg7p6XNypepQHKmTretVv9j99z4uq/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcx4Ac/L8huQxwA8p5rCMzJUetcY1ErasWpbt/HCIxwbeVuW3F
	G0NycIBJrzIC2pKjH2E2B16W+6EHPSAHf7nOBAaqU3MapMNGjUJv067ijTvr8lKo1K/c3G89bKa
	bUX0Zz6u0dvAmuECn3diH91WBbUh1cJlG1izQMCqkwA==
X-Gm-Gg: AfdE7ck4B3iqTyG78EwFaXO5eqt76ng0z9RXZ9P2mP0kAE1WUq68r+oR8N2OlCwOlsZ
	eICYF3Utl7PmgdCvUBMy5+P11bpT/Hk/1Uc5ySnFIB5bQXMABMQklr0x6yxPzKz4mTNq0XV4pPX
	MaGhtXjpzP8tTaaKT+yLpgk5tjPLSuA9drGEb4V2/UqI1p0JSmoz9VxN6VJwAr39x60tLfrLBWJ
	GhnsfjgiH8tGO4y7iBDfSHzvfIQI4iN8GKFEgbokdb3L3cWHFSNVmMkT1dgOakPajaPArNMIkc=
X-Received: by 2002:a2e:808f:0:b0:39c:6eaa:da85 with SMTP id
 38308e7fff4ca-39caa879118mr17381451fa.26.1784000690199; Mon, 13 Jul 2026
 20:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711062249.503264-1-vishnuocv@gmail.com> <142193d8-3860-4d9d-acc8-5b6a0569321a@liuxiaozhen.dev>
 <960dff77-b5da-59c5-bc61-c1a72b2748e7@linux.intel.com>
In-Reply-To: <960dff77-b5da-59c5-bc61-c1a72b2748e7@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 14 Jul 2026 12:44:11 +0900
X-Gm-Features: AVVi8CfseroMYu_hx33yWa7fWM0oTluqsrJ9rmiyd9uFtx93ZC1kIaSVoVP4_fI
Message-ID: <CABxCQKttBSR2LvghVwMSTVBwYFieCVXc=O64+Ya=xOAB=fdBgw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix USB-C Security probe
 failure on unsupported platforms
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Oliver Lin <oliver@liuxiaozhen.dev>, platform-driver-x86@vger.kernel.org, 
	linux-acpi@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, vsankar@lenovo.com, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

Thanks for the quick follow=E2=80=91up.
Sorry for the wrong email address.

Thanks a lot for the testing.
The other errors you encounter seem to be coming from the think-lmi driver.
I will note this down and discuss it with Mark internally.

Ilpo,
Thanks for the quick follow up.
Sure, I=E2=80=99ll send a v2 of the patch with Oliver=E2=80=99s corrected e=
mail
address and include his Tested-by tag from the follow-up message. I=E2=80=
=99ll
get that out shortly.

Thank you.

Vishnu


On Mon, Jul 13, 2026 at 8:17=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sun, 12 Jul 2026, Oliver Lin wrote:
>
> > Hello Vishnu,
> >
> > It looks like my email address was recorded incorrectly. My address is:
> >
> >      oliver@liuxiaozhen.dev
> >
> > I'm currently testing this patch and will report back once the testing
> > is complete.
>
> Hi Vishnu,
>
> To make things easier for me (and me less likely to forget while
> applying), could you please send v2 with corrected email + the tested by
> from the other email.
>
> --
>  i.



--=20

Regards,

      Vishnu Sankar
