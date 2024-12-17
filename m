Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458EF1D89EC
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 20:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468813; cv=none; b=Usz5zOd8eoMR0xrA9LmcZ6HEkVe8862gsvQe57+CK6R5d3cchIYVTlLIkkWOJ6Xc+VmVitNdP8Sq7SkSiiruKhP7BOi9lXK7M921IDdalv1L/u+BfME5tUcLtWhAH/7UVcM68pdwUAQBybts/5lP7Jah9uMHbusRALQalEI+nsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468813; c=relaxed/simple;
	bh=UftAGcyQW07L9iT+wACgIeE0/QoMS6Z9ayW/9+3yt4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6+EnBrRtK9uAnY4bCOHMou9N6Mxb0Laxe6o72EmYPbCMLSSTDsvb7hp3qzoG+CzcnZBVHBhnGZeVxu16maai5DlcqXwTa6jdtDP9KApbybSvO66kxYWK7qk11doZAaWfjMBea0AvSYEcVKKxuEgRqdt6EsNp8uY37j+Pbd8iOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0CwEnLA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0CwEnLA"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-825c6570a80so124115a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 12:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734468811; x=1735073611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NfAtutkgifxAJTrBZnBQ88lyQS163jUKOHHeeEGNgE=;
        b=R0CwEnLApOlxbXq2BxH56ERpc7ajENR/oPKQn+JX82txt2hPYBeX/H4oFRaEypfpb4
         4vfz/jFoBcNqqBpvDX4qOdhsLTFaXhfa1JFW19v3MOGpXrbC3W28maYH8o53bjhQWQ7o
         1lWxB4PNbZ/HIXbsf10W5TqEO3jfmT9efz0gR5ioIF/KS1fdnlqnGWd4GDfET663uv79
         h7oUBrvxeVNHHwtz//ovdciGoMkirwBIknwA09bH92XhDJ1gjmC3dF/DjBtSCXirSoxO
         GwSrDQUFg1z2xdc1R8rjofUYsc3Rzg/ONWTEsn3kwhjc3RxzpH1uyfxUkq8xeLByhhnU
         JpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468811; x=1735073611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NfAtutkgifxAJTrBZnBQ88lyQS163jUKOHHeeEGNgE=;
        b=N75SUQ+15gA8MJ90fQyk+Gwi9TOQoAn66LWNIaScFsTcd2Gg898nocYc6RRIPCDamX
         Bky6PSpLAMLsluBv7EfN/zPkx0jJxS1v2uU7FB+QpVdqoplKfuZPtpIelVPgQ7uhkaao
         /DFurnb7jXc6xsQkhFKYGz10hRQSSa6DgJNiTOErx8FWAT7eLtT1AhR1o/oTo4g6j3lZ
         w2e2QjqI8+ayAK+Fa3vZFkIIv9PqJnxhUZw0Q7BL37520M1Y5sFOeKuOybYrqeUaYHTV
         otqjgn7t/Z+J9W0TRrKh938+0kHJPi8I96Ru7F0S0zF+BaLecnQb1v1EKlxCXnLPDA0w
         cOAA==
X-Gm-Message-State: AOJu0Yw5zBJAdqMsYf2bUpaXUsVSdyG253PIbIB0NtFSOJe8XmWeyK2h
	Xqrk0XUamTEgBQtdX9LyLg1MLQmgKOD6kjRwrJ0x4/N6QHlVwGV0wAooLL6OSZV2kEGdgxF/1gP
	W3RhRbmxMetXKtvLCg7bYnOfZkS6dGxFK
X-Gm-Gg: ASbGncso1xE9aG4fO53FEiU3ldrtxFD2srXcslL7V4KjJXPg6WCwUTy84rtY482gDVP
	z5Xmgw05/RiFstGd0EsNvceyIbF2vPzH9vuvv9PgGrjUZ/C+s3I5qwkOwlP7LImCG928ApA==
X-Google-Smtp-Source: AGHT+IFssIcPNc9uhwKJE4SQJLIbh+/PP76Hv1Wioajwt1j7swubwpyyW3UXYX+a6vn1pPbg92eXRCt+MHsIH1+T4Us=
X-Received: by 2002:a17:90b:3811:b0:2ee:599e:f411 with SMTP id
 98e67ed59e1d1-2f2e937d25dmr389076a91.34.1734468811416; Tue, 17 Dec 2024
 12:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de> <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de> <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
In-Reply-To: <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 18 Dec 2024 02:22:54 +0530
Message-ID: <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 1:42=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>> I'm guessing this means that I will have to learn ACPI and how linux
>> implements it if i wish to debug this issue.
> Actually i think you need to look into the Windows application and check =
if they call a
> WMI method during initialization to enable this event. On the Linux side =
this event should
> be supported if received.
That makes sense, I will try this out soon.

> Then i suggest you install thermald so that the platform profile fully wo=
rks.
Wow, that actually fixed it! Throttles just like windows now, thanks a lot!

> Also can you tell me what special OC calls are necessary on your machine?=
 I know of another user
> which might suffer from the same problem.
Yep, there's only one call - SetGamingMiscSetting (Method ID: 21)

Inputs:
Performance - 0x40B (OC)
Default - 0x10B
Quiet -  0xB (Nvidia Whisper)
