Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85301CEE8C
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 16:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700811; cv=none; b=eGpTsVoRKgUfAAOkAu7uvF7ErPD8hkj8Zfnz76ilE9+xqi/8EquaIC32oT4A1Xtepe+h1uL3bX4iWNzPrY9HGKrwV8kxHBXsKwYcYynTMMFYkRqUE3Tuqs++UeTLJWuzBnYfmuOzDg0ht1SGgzob20FT+O1ZEussVUBeNxQYNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700811; c=relaxed/simple;
	bh=7FglZShI6TGOZW/cLwkFwGBQwzJpFHGq0Cg6x1atCwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbyZoi+k3F8CoW73J31NfL9QUuRrwgmwP6ggarXzgJCTNgv1BDEVw2QHfEnsIN51Po1tbImhSoAviejiRXxuq2y9E+DxGhC9PV7T/8lXkOuCIphOwIeniMlFC4NoMd7/J9gaF1YjP6efWmxbsUQ1srw7IoZpnyDMNOaSrdSH07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcdRHbRH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcdRHbRH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431616c23b5so331455e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700808; x=1730305608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FglZShI6TGOZW/cLwkFwGBQwzJpFHGq0Cg6x1atCwI=;
        b=VcdRHbRHPnnzPDzhQl3ycr7sTdcVbiFA5X3k8txqwT1IXkFwtnAAVRwPRyFROrtgR5
         Ri3sFNbU8Y46W1YjU6Xmf5QYUDoGY+/kxQ/foTNromGe2zeECnTVmwq5fYiqmssgPRrE
         wSBuKdMGImE4mE1038+x/aRFfECD6lTIt4QQdjLvCcmdKl1KkInMxOA5FCwBFXkla5bu
         dq+v3CxcLspNmQJwt/9UsyuFSpWkhqFS8eFR3g7pUyb2wV4lweWm2eCc3ePHZ0JUn6d3
         dbQXQLsBGSYXrQAVDqNq1qQBWYUeBLUu8yVvkRCqAjoedmPVVKSakNVL/gDk7QkXhLtR
         Xp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700808; x=1730305608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FglZShI6TGOZW/cLwkFwGBQwzJpFHGq0Cg6x1atCwI=;
        b=SHSGzSK8St5ClykD6v8jtOkjZvSy9weg7PgtkJY6xVlT/bpsdVTcFYXEdIB5VT0Uqy
         AaO7cCAlu3JpVpXR+FNJY6cCGxep5hz1iQlIUMr5l5p+K2bwZu+hP2SQNZ6yyXDK3aBG
         VVPZqL0YHb8I7jHDiWLxxGEgt4Pyet5cKm+e7b1I+S+im0RI3N3IjzEMxONos8RZLO+k
         UtzDpGhx01mm1II0J2L6BuG7yya49b1sIbyMp+hF7dGlXVdo5DppDCX3A5WLNfFS44iC
         mDcGERi9w1O8ZzARe/lK/F7C1zCjUWZZFi2XZKVD/mhoU1iNy91+cD6SbNR8Sx3R9f4F
         CvyA==
X-Gm-Message-State: AOJu0YypW/Lx1j7+yt5omEWjXJm2ul99CXbL1b+f/YzKrIG9L8+atDeN
	7FQr53f2PtH4c5Tg027bi0ZENZnCupA/PHkufLNnnw+Qm85C83Zgi0dESOYjBSCQaHrP/1SZ+Ug
	Lm76DQiWgmvxFSlMqFuLe70IbLx/GtQ==
X-Google-Smtp-Source: AGHT+IH/2qLtECnyC1X3Pghtq0Dt9wH+1g6QGl8+iPyZ/V+FeBFB9qbF/pfppoTCFWjz8VLKZFpouLIZsB7GnoVvQbA=
X-Received: by 2002:a05:600c:3b8f:b0:424:895c:b84b with SMTP id
 5b1f17b1804b1-43184337331mr23291765e9.4.1729700807873; Wed, 23 Oct 2024
 09:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com> <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
 <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com> <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
 <ddd7bf09-31aa-4e4a-93ea-b1336ced8578@amd.com> <CA+b5WFGDstoJTjgaT+hm4r-78zup1pLa2Ada7PqbTY=wCutSbA@mail.gmail.com>
 <98b3392f-2860-4a32-a769-b4dcd3f5dbbe@amd.com>
In-Reply-To: <98b3392f-2860-4a32-a769-b4dcd3f5dbbe@amd.com>
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Wed, 23 Oct 2024 18:26:37 +0200
Message-ID: <CA+b5WFEw+v8D0OO2_S892VTf5uFNZZ56kfKSWtXO94zGcgJRRQ@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll keep that in mind.

Thanks!

On Wed, Oct 23, 2024 at 6:16=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 10/23/2024 11:12, Mischa Baars wrote:
> >> I certainly don't have a crystal ball, but I try to avoid saying thing=
s
> >> like "never" or "for sure" in non-ephemeral contexts like mailing list=
s.
> >
> > I understand. I'll concentrate on different aspects of testing the
> > connection with this TV, like gdk_monitor_get_description(...) doesn't
> > return a valid description when the application is started with
> > GDK_BACKEND=3Dx11. I also have less trivial questions about the ancient
> > and seemingly long forgotten concept of page flipping. I'll think of
> > something to do.
> >
> > Thank you for your help.
> >
>
> OK, If you have more questions about other things that come up along the
> way feel free to raise them on amd-gfx.
>
>
