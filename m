Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70762AEE9
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Dec 2024 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735648972; cv=none; b=gwkgxdR6NUt9rg41SCf0wlJNpZJVijEeA8WmF2ihQRAIpIKXD6Q/P7mQWaJuH7p8Y2R2Zo+2DM5/a+T3BHU0IL48uMzZxfrqCYR0PkW27qfeum4YsFi2siBHl8x2AXzkG7T76d06d0NOMYqO3RgyH/d94hwnM1vyqllj8PgInAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735648972; c=relaxed/simple;
	bh=JzR5Q8hqCauRZLsysEvoLuXhgbLUKt8HPQwaPffhcWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8Ebg6k52d3m5aXZ3edIlsRtjOd+ymUKPfjhMlXEbJpf8BRAEnp727qEwkpfpYwUvruDSWrwbQynHErB+P99i0n0ehG7SGTrhBkQ5mc2E4saCS2YBye6TzV9/6T+CCTOnlBKr6T5smgLo0AVDWUdpHMrS90VdCvtXZg/X+f1gAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3ccJLMi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3ccJLMi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43675b1155bso85732565e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Dec 2024 04:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735648969; x=1736253769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzR5Q8hqCauRZLsysEvoLuXhgbLUKt8HPQwaPffhcWM=;
        b=C3ccJLMirFsMvp6gxGlqp+ylkEUIxGB8xo00iqsqdiy3tle5rXpRrH0u4Xr8VJjpcA
         EP2c8UJYpvf1cCcGoRrGhc30+RQZJ81Wjwkhyps4XcO68Waz3ZYBrM8q466ZxwM7Hktw
         q4ZGZ9BIKkcEqARFJtjRJEia9Rr0o1E2JYx818kpnjOe2AmYFlHHiHSDgtg59bm/sI6h
         0vckCj1tRCjTugStE+wuqnRqVxhZ1FhzQb3cxT3eXoBoPu1Jh4h8fw4N9xT9KzAYR1lC
         CNK28fGosBXuA50RGdAipBbYLw6JYhgRbDB87yazErJp4FHT1FWaGBUknnaXuiscHLfP
         m9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735648969; x=1736253769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzR5Q8hqCauRZLsysEvoLuXhgbLUKt8HPQwaPffhcWM=;
        b=oL0QDze1dln1b8AL0D7i5w7M9LFJbXvCDau7aXA7ysqUTmbVLd2lMhs2onSLZst6qK
         VyiL/xzHPGihp9pq+UzDXw2Ey7uct1a4wEj6jHAuW0BGD/3fEBCumBa7FrGFJoHPaltK
         AkLdk4fGSPgJnlzpHWxdnwr8BZVLOdT/EHoRwtc58MXQBAHGlyoXpVj0ZISU1Bcrk+rH
         eE/xKOmxsSLrSmInl9uAOCJ/V7v5OxU5ykRAHWZ8RXmunCfME2VIV7ZCJV91Z2ApEmDP
         qa6LSFkl6EGN/7XlUxJdLHY5bt18opFYyhojiBUZGvZTCqzpjIVR6uKvlX/EFPeh5WAc
         hziA==
X-Forwarded-Encrypted: i=1; AJvYcCU31ucW35oZi6L+6csNgUD2YU/gk8QmeP752bhVG0wWiNO8sp5mERxIYT/kaMKn2ebntZg+L0lxiy3Qf+VK/3lSjExE@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5TJvqhAMOLvPJ16m3wRylu7kCEK8+4Cxq3k/g4+WYBlyqmKy
	trUnwGxLkiWkC5+9DqGjSTaMmDXN7yyjZwzvgrIlTDz2qvRD6zCALoYuiKAPGk5et7n7qzE6Btw
	vDya7dNiuMqyX37Tx+M8xwecmIes=
X-Gm-Gg: ASbGncsKDwcQAA5RznkVkU/joAoy17ZWcJwbU37MHdstp4yG8sozIaHJjL1AlC9YB0p
	W+Im9IHK/oJWZiAvmbjBQHzee4GErY+Y4R3r8ZEI=
X-Google-Smtp-Source: AGHT+IEhI0zKiijGjDOL8Lq1FoSUbtMIi/uYosF6aP4slKVZRNJ75Q+DdZqAvLabX4qNNqZjg9fb0pABQK125+hzCxs=
X-Received: by 2002:a5d:5e09:0:b0:385:f72a:a3b0 with SMTP id
 ffacd0b85a97d-38a223fd417mr41474396f8f.55.1735648968961; Tue, 31 Dec 2024
 04:42:48 -0800 (PST)
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
Date: Tue, 31 Dec 2024 13:42:38 +0100
Message-ID: <CA+b5WFGkDJhpRRywQLx2okttXGasBu6K8ScLZyakKrk1+FZWAw@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

Although unconfirmed by their website, the rumour goes that the HDMI
Forum will release a 2.2 specification somewhere in Januari. Do you
think that an open source 2.1 implementation will be allowed soon
after?

In the meantime I also checked the framerate synchronization through
glxgears at different resolutions and framerates. This does function
as expected. Although I haven't yet inspected the glxgears source
codes in detail, the OpenGL double buffering must be functional up to
some level. This means that the problem must be confined to GTK and
the GtkGLArea widget. Using GDK_BACKEND=3Dx11 I do get a double buffered
context, but the default buffer does not alternate between GL_FRONT
and GL_BACK.

Enjoy new year's eve!

Regards,
Mischa.

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
