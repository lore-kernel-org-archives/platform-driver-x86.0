Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EB4436E
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729699981; cv=none; b=s4TbLmJNGFJzj4xkBrCmlt0QMZx2Zll0GZOtz6V9kb293ko65S/RlyPCTkdQWzTYcAD2kVnpjpfPg0Q3aTv5QDmqzeKMUzlMKUnQrGwWvxgWJ6l+uk+YSo132Co9nOWdLZCZbm/I2A/OjmQWqqdfSEncZSyukUN8k0k7RnpGpwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729699981; c=relaxed/simple;
	bh=+k1rdT0gyEt7eOPArM3urxQdaHzG2mNQh78S05Q0+Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWS+LvtxfLhiwte9IVnNqyWo9/OCN+f9N8poJfMqZibj5CmZi7Gx0tjN5wBAuD+GE+Mt5+mJvLb5ic3F6P4XGfEUGi0B2czGG7+uexY5bfKEDg+Xwdo9WwREtFXqj+xr9F5aZW+fvnjPBs/PerJvRA+gN7NHZmR0plnSVnAxm2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXGumLiG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXGumLiG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so69910285e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729699978; x=1730304778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k1rdT0gyEt7eOPArM3urxQdaHzG2mNQh78S05Q0+Oc=;
        b=XXGumLiGjyOLNRx+7AZfT7T8Otsw1sJaes4DAPYmpGA5wA1SnmsKTlEtOFddAolFZ4
         8zPyoDuvuSsiS2Tsc2jgDY3uvI8QNIWT87FRj7d3TmAIw5rAa3/FlrZ0cDw6Udh6lc9m
         bzHMsKeK3dJUA/2XEzpVcVBOEGvLG/M+EikcXJ64IL3Qk7O2Mm84SJ9mdBLCtLoy2lmL
         Azf4hylARKFeql+JOhLwEGUwArNGh1KoBThU7h5LtH7ZxQKGVeoiXMQ3/eksHZ2rW/zL
         3bQLxvuTH2qlc3CJoH1vRPK641SwuHu4H/dMs/kmf7fiTy/riBupgYMorXiM9IiLtB+L
         RHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729699978; x=1730304778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+k1rdT0gyEt7eOPArM3urxQdaHzG2mNQh78S05Q0+Oc=;
        b=b+eYuf/m4srpP6FJW8wy0dYYV9u91PT98oRTw34KqgWTJi12k12SJITv5uBA0wUVNG
         S96wmI4t7DwzwxmyXpP3BnY49MrUsdK5nuAyB4E9dP8m7lmDcdQ39NiA++sBGz32Xodi
         0Af3CYlY9F2LtgVs01FDHvwY5/awJtVewDfZ4XxXqTJfSmWSu/ZuqLiI+W2GH0Mnc9rO
         tc/uyQGpZrxpZZlhNvaKsuVroFxP+dTGzejDptVrSBAJOz90QuRR9HlH0HMDWOwgUbqk
         diLqXNPqWPGP1CpN0Vrb6+vf/NufHU4wRu9xVqpvC981ueCtcMPvDeBLSMyBwRhHqfph
         pN/Q==
X-Gm-Message-State: AOJu0YzzXRaHz6Gu31KoqiRkH1bclXLlZc4KBHsVhfTXUvh4Mt8EBrp3
	OBedpaPRIoUlY9frlU7E628Gi6aRoklNYFIb3N6EOPoEXALFibrPFDEpACwJ6pe137nN6EKAAsd
	ABxvvKnm/sNUYUd8c2ltlPMzNw4k=
X-Google-Smtp-Source: AGHT+IEf+ARK6P3ezrsoUflGJv4B+56lNP5uExiwR2rp3P1Ps/cmuYlwevMQSm3Z3HHNNRo+a3/E5MJzVPfEk7I01Is=
X-Received: by 2002:a5d:4704:0:b0:37d:5496:290c with SMTP id
 ffacd0b85a97d-37efcf051afmr2183378f8f.7.1729699977763; Wed, 23 Oct 2024
 09:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com> <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
 <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com> <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
 <ddd7bf09-31aa-4e4a-93ea-b1336ced8578@amd.com>
In-Reply-To: <ddd7bf09-31aa-4e4a-93ea-b1336ced8578@amd.com>
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Wed, 23 Oct 2024 18:12:45 +0200
Message-ID: <CA+b5WFGDstoJTjgaT+hm4r-78zup1pLa2Ada7PqbTY=wCutSbA@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:34=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 10/23/2024 10:30, Mischa Baars wrote:
> > Hi Mario,
> >
> > The amd-gfx mailing list at freedesktop.org that is? I'll have a look
> > at it, as far as that would make any difference.
>
> I just happen to also contribute to platform-x86 for a few drivers and
> saw this message.
>
> It won't make a difference on the stance, but you would get it in front
> of more people that actually work on amdgpu.

The last messages referring to this problem are from 2021, but it
seems clear that not much can be done until the specs are made
publicly available.

> > But if the official driver is indeed open source as you say, then how
> > would the official driver be able to support HDMI 2.1?
>
> It's not able to.

Ok, I must have misunderstood your colleague at
consumer.techsupport@amd.com, who has problems with his English,
before I start overwriting operating systems to that end :)

> > And do you
> > think this problem will resolve itself in the future or will there
> > never be an open source driver with HDMI 2.1 support?
> >
>
> I certainly don't have a crystal ball, but I try to avoid saying things
> like "never" or "for sure" in non-ephemeral contexts like mailing lists.

I understand. I'll concentrate on different aspects of testing the
connection with this TV, like gdk_monitor_get_description(...) doesn't
return a valid description when the application is started with
GDK_BACKEND=3Dx11. I also have less trivial questions about the ancient
and seemingly long forgotten concept of page flipping. I'll think of
something to do.

Thank you for your help.

Cheerz,
Mischa.
