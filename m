Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F72594BA
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jan 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414398; cv=none; b=kPdPVvY53DWlWmGNtdP+o2ixNMQ5UP2j/6XTlw/0jHpB0bsphHRfNKtqZod5OkncMQK854mu4uI0fwgtq0Q/JiLV4PT0zdF1FFqNuwGnH7WV8Npk5yLjaTpb8RMO05FQPzxaDXIOW1xMp4t973LdM82cgI1X5+dT/wUzQn6l19o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414398; c=relaxed/simple;
	bh=Jtkgox9/Pn0+SSwVnw1GbtKwBIkXuQisZ0TE6gNRiL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdB6KOTLELJANmMLXeImUY3PVyL7YoCwVcYrFO7YZk6L2dcM7aDFYl407/BwuPEm6mPLY0nBhjpoDJz7LQGaauU+Vcf6iMiKujSzDZrNeRmbngez7Zyg/HrMkZNARgvfrLn61k+RfsketXDEPbxem2Fxs2aCBhVZdOMEywG4ifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+OhL4Co; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+OhL4Co"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362f61757fso7040735e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jan 2025 01:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736414395; x=1737019195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76gKxHI9JJUP3Qx1H3eml37ViHNe4SXC3moDZ54oDcI=;
        b=U+OhL4CoGjfXeyMMuW/5Usu6PlRjt8xNS8adfkQtd+4ZJs+6FSkaxxka8eA3XHaQ+L
         KE/34TIETnMsvKJrjMJL8sO0PdNyqW+anAYWsLY1zAqleiQTguqQgC9oifGxUPg9NdBd
         CNu9y8KQ+wXMaDo8YU33PQmMReQoNPkbLq1vsNPYw+jXISVhJAwbAkSmYH2iMjW1HXNR
         e4c/hFgB7AqrEp9TohExiu490u+mF97+5uQE/S85L7t4rk70McRzhghU0raCUNXY2qqI
         LzWYTy2g+h2aMmSsMJrufAn1kDBIAxCQ9q3hTskYyh+QaejxqJXCjs4DNLhkMhMwzNrp
         5vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736414395; x=1737019195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76gKxHI9JJUP3Qx1H3eml37ViHNe4SXC3moDZ54oDcI=;
        b=TxAEBeb9iv4TtUeiFza+A/A+Zi6JC10NM4QKarRLx56LdqIU+qWWmTZfqGEFERn0Pf
         tSXhLs8oi46sxpbXudbRlncoHu64wm7kGZN2sllRjTnH1QZW2MHV6irP2OU+VfEFeb6S
         mmY3xvBJQwLud6i9u7/IC00fC2dyzgyhp9Zs8gcomWzrWkABS7OfgnrW97h7MkNvuIPa
         wsJiWKcriiCmfWf2OH0r4/Xs7ylk8X1oCrHQvOSz4TdF/BK0tI7ydqe1wwe9ullcDyJo
         GJqvKAwe3FwD7KqovP7EBl/xHpvdlUhU09Vn3bSTdHPa4G61nSeowU2HnTI9eKXA0Cf3
         fjug==
X-Forwarded-Encrypted: i=1; AJvYcCU9ldG4PwNE8AdutS4XeoHD1l8Vb10wDHh2yY9wGBLxxC6l7dGfnUtqVr5oY/C1HYvsV5lZYihqn7AoS63F+7cVB6a2@vger.kernel.org
X-Gm-Message-State: AOJu0YwFawvmFpugf4hpIneuzRHRqC/V6UjDGQWc6VYJln8tzmTLVWGe
	e9J/wY3N/RPSBtp2ZCf7kh/MQlbgyrr9AJhRzwIEZHFT1qDNa7GZdXZMDd+3tCcSe2TIerHTm4S
	apeMk4xFCd5H8fTFJCuruc36y7xM=
X-Gm-Gg: ASbGncviAgIhET+JTsG3Mb8/1eTXLAGE6xLZN+KwCO3V6FZfahqfHKV93QAW9jyw3Ow
	jKf2482srgdt5+1af5zSLpsEZdNlOw81cYauHnuU=
X-Google-Smtp-Source: AGHT+IFCYXYcm4dlkX6v8QO8Ci/WzRDS/DvKT7D/2shMuQfSja0g90LpmCEzKVe0TXLxY5SR3lTdZ3s5fhQyW9B4w6c=
X-Received: by 2002:a05:600c:6c0b:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-436e2707f07mr46234465e9.26.1736414394922; Thu, 09 Jan 2025
 01:19:54 -0800 (PST)
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
 <98b3392f-2860-4a32-a769-b4dcd3f5dbbe@amd.com> <CA+b5WFGkDJhpRRywQLx2okttXGasBu6K8ScLZyakKrk1+FZWAw@mail.gmail.com>
 <5321c9af-6df7-4bf0-98b2-d6c4b2861374@mailbox.org>
In-Reply-To: <5321c9af-6df7-4bf0-98b2-d6c4b2861374@mailbox.org>
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Thu, 9 Jan 2025 10:19:44 +0100
X-Gm-Features: AbW1kvY5ih317HV1EysU9odFq3nUNHLJ3-uHcKau6uWQLPNehm_B17IbdKyOVMY
Message-ID: <CA+b5WFFkhQUcFO_45_6xmC4fk_GEFqbASt9rhGqBBYsothsHxQ@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 4:30=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> When new specifications are made available it's not like the old one
> suddenly becomes "open", so I don't see any reason that a new
> specification would change anything.

I paid about =E2=82=AC3000 for my new PC, including =E2=82=AC300 for the gr=
aphics card
with HDMI 2.1 output and about =E2=82=AC2000 for my new Samsung OLED TV wit=
h 4
HDMI 2.1 inputs, and now you are telling me that I will not be able to
utilize them fully because the cable specification has not been made
publicly available?

Did someone forget to pay the people that design the cables? Because
that is what it sounds like. Why does Linux stay behind?

On Mon, Jan 6, 2025 at 4:41=E2=80=AFPM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 2024-12-31 13:42, Mischa Baars wrote:
> >
> > In the meantime I also checked the framerate synchronization through
> > glxgears at different resolutions and framerates. This does function
> > as expected. Although I haven't yet inspected the glxgears source
> > codes in detail, the OpenGL double buffering must be functional up to
> > some level. This means that the problem must be confined to GTK and
> > the GtkGLArea widget. Using GDK_BACKEND=3Dx11 I do get a double buffere=
d
> > context, but the default buffer does not alternate between GL_FRONT
> > and GL_BACK.
>
> Yeah, that's not how double-buffering works in GL. The draw buffer is alw=
ays GL_BACK, SwapBuffers doesn't affect that (it just may internally change=
 which actual buffer GL_BACK refers to).
>
> I don't see more context about the issue you're investigating, any pointe=
rs?
>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
