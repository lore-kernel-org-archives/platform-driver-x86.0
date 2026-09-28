Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE24F93AC
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630810; cv=pass; b=EE7KNP/9zQ0EpnJ9O8Mxp2cujtpyEdmwYEApU1TmXarLJNowev/knYzgKX80+ZjUphscfqhn3NiY17nua/kOEVOxUAnK4cOks5i7cPOppASsCQs3V2u2sG0/+ul6tXVwfaNm7o4tge3CSsyTLqX26Xu4XPJiI4SyrkpxGRfLNRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630810; c=relaxed/simple;
	bh=36c4/nh2QN5FJt39r4MZ1OBS2WNzMmtUQ1xAvY0uwq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuF2igU2dqpURK7Ni16iT3ql2R4GG5N+NPfGzJr3zLuK0laPkNpoz8vxWipS8gLqLcN2XgacTSlI4lJkI9YcXvR9pJJgPcl5ta8xdw3BaHZ10G3A3khEmfBkIzcr/hpHlTqXFQ7r5Er9G2//bL7tsLj8/w3Ki8duyfzrdRW4Ki0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BppG7JaO; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BppG7JaO"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af876539fso377446366b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 14:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790630797; cv=none;
        d=google.com; s=arc-20260327;
        b=HnSZoMRqQdssvUfbcms4rnbAFgGHqDGBr0CUdYr7D3054LatilAkQU79BPKjNsrzMo
         4wOvb4fwEZdHW4EbSQgwtDQqkTGHoBucd1ESWZVaOxXGjTOpCbl0tKt4zAq0OnshKIa0
         rQusuDEolkfvoDOpZAj2gGGaNdwG2FST/8WX2qlfyt4yLQDd7eugNeR//3FMjTFHbomZ
         8FZd3kg7JYuTdAiFKi4Y5MAhYKWy0vgLP5KutVRtLAx+nAmBYW8CkAv4+NAQe+DzcKkU
         y3Uqj1AFMGMgwRLWmo4AF4fJDbENPb4UPDx1bpAiKhMEhExT/rFLlQKL8m03Xx8T8e9m
         q69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FF22kV1FIt0Dfmqc/IkjF4lzpEWQoZDSVBGIa/FDMM8=;
        fh=x1vFS/ca/kG4RD1LdqUeyTsJZc3Awl9MSPMyfbqkNAM=;
        b=WBy/fnbMjdUWRBYYP2wjSPVbgs5NaDo+x7AObNxRaFFyukQdKYcY4Hr0ELmmmCmBDU
         4Cz5kK77sDG6ah23jvYpFvMqGRtwrcHeAbcw11Et6HsiJ5zCXgXc1YlZjgSXlxmhIDSs
         Vs6v33r7iznmMwvEBiVrhdZXnQ1eRxziReeiBAsaeaD+L1SVzI0EzXin0VzewUq1JT/d
         ZvYmTJsm9Y3zQQANKKP/JyTQE7TlWkzMf8xHoV7HFRYzdlYF/CGkN+zpl3ZxlDGJG2HJ
         Js9wSLIVN6hY8gFU3T4oFGpxwJRq+kityhoAO6PSkzxSsDg84+3YSCYFdMvtvBTUEeRz
         K53Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790630797; x=1791235597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FF22kV1FIt0Dfmqc/IkjF4lzpEWQoZDSVBGIa/FDMM8=;
        b=BppG7JaOIy3DBBzo2JOMVh1r7+oGxT4z1utaZDi3nqkqq0tUNZoZRBVDcuGvgzncMo
         h5TcVakx8Ygi9KwyRi4ZbLphuqPYI10H83PrBK0nsBk060Tv3Kh7bm8WXUOn7lDVS3Yf
         NYmVAsGKRRR79eIqrppwhJ0/9WiexWnkg/BzRVtqW30YiFroaBkmMbfSUwsBNKFcrje6
         8+EFtk2sIwUCdFYpFh7N0njOzxuopnYdSFOyoUiicb2R91j7+VTweBETIza3fN50gar6
         kDANSx/QW0UyI2tvM1fbFMO3mcoZs5p/mpv9Gi5G7zGyExg76jwKZbXy/QuR72tYYYME
         LVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630797; x=1791235597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FF22kV1FIt0Dfmqc/IkjF4lzpEWQoZDSVBGIa/FDMM8=;
        b=DWCTqQ4ag5PpXQcBizqelxBiLlAICDArO4yMU0rPn6Jv5OfcI92eBQOo4VEL6iFFS1
         kNrSbzh/uzBP61v6qNC0yCSykpEzX4+tJXLJZVXLtQV6YV4pPEhqJOVUgwyUKHKycKcQ
         hxNTtlFL5Wio0Oi4J1ldWFSxtNKmZGTKMHygyJ41hPGv7b27HsdkPOMLe5vhxnwK1dey
         k6SWK58Mlf8Vpl0wx6WnSwgf71ac0bFBPlFVRfkLavJlF034kQGpRGQkKEcgEswHCWqd
         f11D1RqI4Rg4b5EQSxr0bC1omqTO4A5v/4jGoTZxnJSWhaTBvxFoJ0eTjPY3mKZQm9mu
         puhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzawQS/ltNCvIM79zWPcKrxquBz37Kh+Ja32nI8u7vfnX8On3LLiAwPUcczK0xiXTcwkdiVARIm4tJHGkT6K7OROLxx@vger.kernel.org
X-Gm-Message-State: AFuF++n9KfZiwPrG+pAnelbBIcyBdJySZHQnMoTxHeFLVs6eL5WAkbbs
	CfmHOfTy+ZoFk8oY6OHxp2IsHQ2pMioxXamGfUtt/EDQ2uOQ6PILKsjk8AlW5F9kSRSHNJj8ZYV
	QqZ2eEmmWgenuoQHccICJCH1xPhwhl0M=
X-Gm-Gg: AYBFou1x83IkgdJBCCxL4yE0VS20b/dVGID1laBCgBS4j+HQMD2wPjiobxI8CT0kk6N
	Mdfqmy9yZtRTrJ1XwZ2Zi4z2ziPMksZWmVV2gShY38rn6Bm7OFaSK0oGgIqbN0JdHBiWmP1OUxw
	RLqSLvStnefMKF2R88G9/xzg9PD4yHzLPdt44udtV/+MtuOzmq6SK6x3DDyh+Yz4aaYkFVxl5F7
	blYTNbAADIjfIIvj1MpU5fk6cckMIENq16fweuOySJkFyMKd8BXMmblLlDSMbLwWpksIq7VamEF
	9HVyNifkb/4pnjPU3REHLHtaGUR0lSdBZWbdVTWU1Arr/d54V/19jBaU+Fbb93IKN2Vwhz3lkiP
	oVXaWFiS0dWLxleH8GZVXOxOf0XPbCokZu5rT3Q1CNs03Or+FZwtsIGMLG9fqG8m/xJaUqnF8O+
	MrYi6RoFJxOfmz0pJpTvm/sRsRPkwaGdk4EHmBHKtd
X-Received: by 2002:a05:6938:a085:20b0:c2d:c6e7:9e9f with SMTP id
 a640c23a62f3a-c2dc6e81bddmr310910566b.27.1790630796755; Mon, 28 Sep 2026
 14:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928200318.63383-1-meatuni001@gmail.com> <20260928200318.63383-2-meatuni001@gmail.com>
In-Reply-To: <20260928200318.63383-2-meatuni001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 00:26:00 +0300
X-Gm-Features: AclHuK9aoydHFby8LX8BqY0ekVNNZF7gZBjCzIJJrmWtMkMRg0jStsZZ0Ski8IY
Message-ID: <CAHp75Vd0NF_5nusyoV=25umqUKiNGynCJU1tercwMZ57c_BfRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:03=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> The escape-prescan loop uses 'size' as both loop bound and
> accumulator, so each match extends the bound and reads past src[]:
>
>   for (i =3D 0; i < size; i++)
>       if (src[i] =3D=3D '\\' || ...) size++;
>
> Snapshot the real char count into orig_size and loop against that.
>
> Also fix two adjacent issues: the bounds check omits the 2-byte
> length prefix already consumed, and utf16s_to_utf8s() receives the
> byte count (src_size) instead of the u16-unit count (orig_size).
>
> Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

...

>  int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, =
u32 dst_

>         u16 *src =3D (u16 *)*buffer;
>         u16 src_size;

>

While at it, drop this blank line.

> +       u16 orig_size;
>         u16 size;
>         int i;
>         int conv_dst_size;

--
With Best Regards,
Andy Shevchenko
