Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0608209F57
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736503304; cv=none; b=uovEEjfGF8EtMpH6rtOQBuh5yf0edvlp3zmX15ZgGxroQQx+X/7nmFENes0nRH9fmdA1HovWpw3+x8pdziiExNvUei4EGC7Dt8DRoKjX1qcb1go8owjqkivBymuvGsc2iBrUubFyK/5cVW69BfeVMYlIdun6q8feRLbunHUbrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736503304; c=relaxed/simple;
	bh=ltjS9ITrru3VPzU8iMRu0ZlmsppJU3x/QmRbCvj3YcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gohyv0K9FXr5If9ViYlvUtsacQjiajTB82ZMFYtHBpzHR8DCciFUNblHT2WNsE3w3zkIeIW/jgiiEYAoZiZAe7ceUJxDlBXKrNlxooLmTMljci9QLGRQEc4RJtyUnzOr8GqZP+BhhicZ8IUVKiN4mzwNRHa6SMlg0nief8w1J3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOOEUYZg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOOEUYZg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283d48so13928105e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 02:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736503301; x=1737108101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltjS9ITrru3VPzU8iMRu0ZlmsppJU3x/QmRbCvj3YcY=;
        b=dOOEUYZgJRGKGgCFyqBX8ktwpTGdLFguSAQb8jJoPhtxqoPmh6Lefl1c9HwSWd1/vb
         AhQL+m1Oun9d2DICQSa5Rq37Q2IRZ3oHmxnk04hTmi6uZkmizrBLBL8lpg5qNFGy5R/m
         Eek+4dyIT9tm0T5isJQg/n/yZ+YYG/YqXoQZO5l7xD/dE0yyWoxVLCv0E2OeSCCa7IlQ
         LCnjUU6FFy2oQsFGLQIDoKquZjdDO3Amea1A2q/Z6QwyqXFYmxX9UBs+aEMNFB40pLBR
         psEVC05nvlyb3dHHmRCvw0Ckt820ZKwmUnddiyEjHb+7GwdT8cCkEhhB9lZQcBRBzw0E
         Nb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503301; x=1737108101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltjS9ITrru3VPzU8iMRu0ZlmsppJU3x/QmRbCvj3YcY=;
        b=djX9OtG1Dsb980YXRSDWx5EqAmNWSBLbMQzBPfruILnmv+ykS+gLw7UNU+9VUyQ5IV
         CY6Q+Stb5t7wiPoB3IZLOFRWN4zVNUuqAV5H6fiaBITlL29TLJHeT2ycpGrnUcSt9rIV
         ea/WiN4Q2CvAmMRiTr8yAUSU088sRdo3iutXe9GA299JjJ6aUSkxuh9RSr0ZBVLrEIaT
         cyU6I/wrdhn5g6r15KByDsqyS8gNdQ4rEagA7XC7sl6cH4DoriGJ0qrrPaUJMea1uK8S
         5t65Jgj7rH4Vf2l84X/v9VwufRsOzFt+ZfIqM07lhdOeIPyAh3yLdwo+iWn63q/cXfrs
         /iQA==
X-Forwarded-Encrypted: i=1; AJvYcCVi7ilsuQykKc0eKjYGkSdQAlSM2q3BfwwL/t0bT0y7UaAH1PenraF1ZNGQ01dl+ubAcFCN1URPpN60J8OJuH5zxjFj@vger.kernel.org
X-Gm-Message-State: AOJu0YwisvC4mFGb2j3ZnPWBq0rD77YOjrg8n0VISN/6V8GQSgWkbwP3
	vt9dII6DHdff9VgXetyIuJ04Yv0GzhC0dsa3wfHBBJnE9gEOde4ozBKJCIMPNSVe+1rHNioH3MA
	IXjNDGWLGtDTw/pAvzU7Tss/PVVA=
X-Gm-Gg: ASbGnctsTcibMl/tINrdr3p4r7FAVfyOtw7EWkeVJY2oqFUm8epfEk5FIVtKpj49kOd
	B693qqWMiSZw/HIWUDOCD+D5/zvV334yJHipKrm0=
X-Google-Smtp-Source: AGHT+IFg9gh+ZaiDKRtHGI1x3x+Vc7T8yvhFwWXUKy/L3HyuTbzKxNy8RzQkk/QBq/ILWrd53Ddua8VffcxGc1kZXQU=
X-Received: by 2002:a05:600c:3588:b0:434:fdbc:5cf7 with SMTP id
 5b1f17b1804b1-436e26f4aecmr81992755e9.27.1736503300915; Fri, 10 Jan 2025
 02:01:40 -0800 (PST)
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
 <5321c9af-6df7-4bf0-98b2-d6c4b2861374@mailbox.org> <CA+b5WFFkhQUcFO_45_6xmC4fk_GEFqbASt9rhGqBBYsothsHxQ@mail.gmail.com>
 <ea8468ab-430e-4336-b1c5-6f6bc566950b@gmx.de>
In-Reply-To: <ea8468ab-430e-4336-b1c5-6f6bc566950b@gmx.de>
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Fri, 10 Jan 2025 11:01:30 +0100
X-Gm-Features: AbW1kvaVcVVbw5zRAzx8uOOsYdGfQcjkRFsnwDrEDiXOjFPF-L7d5EzYI-55bX8
Message-ID: <CA+b5WFH6e18oJqCOokKpBVBqOdAHCiN5DUUfRz29h2bWLhKx3Q@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 4:08=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:

> Sadly the HDMI forum only provides the HDMI specification under a special=
 license which
> prohibits implementing it in open source drivers.
>
> Since membership inside the HDMI forum costs 15000$ annually, i suspect t=
hat the HDMI forum
> is abusing its power to force people to join (and pay).
>
> I can feel your disappointment, but there is nothing we can do which does=
 not land us in court :(.

Let's hope this will change for the HDMI 2.1 specification when the
HDMI 2.2 specification is released. After all, I already do have a
software driver that supports HDMI upto version 2.0 (September 2013).
It's not like HDMI is entirely unsupported.

Thanks!
