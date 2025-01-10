Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A112063E5
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502907; cv=none; b=ezqrMi9uEvMLH88HdtnQ+locZMFmZRUHL/qTj37ZOCPffHnTucErSz8ZRIjK9YY+Uv9Cyggjpu6g67AYEoUIP7C+zYXVeVmAMaZpGt6BfuRUNIO6CZGubeZt96yuRlj4g3i1UJHVN/lOaRTUac9FG/UNDRw57KPegV3kGW7++qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502907; c=relaxed/simple;
	bh=Y02XX4NwyG4kx23VEIn+0qNs3fkEPqpMNd88gxpsaFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7ZFX71mHxijbjklKesGpINGKHLQHzyUyym/O9+L8R36QdywynozkmKRWxt8usXIXtnd5JxX0f2vBuqaxkP/E3q1YwBZTve+71Mnt8/elzM9OyQMy69wrIVvgvOhRsxKm0A4P9Th/kS4edmVlOWxFrNLbJe0syosXWxlT9h911Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8+BGbg4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8+BGbg4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso13390655e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 01:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736502903; x=1737107703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y02XX4NwyG4kx23VEIn+0qNs3fkEPqpMNd88gxpsaFA=;
        b=f8+BGbg4zfx2AKsjih19+ml1GhXpg2Fn5rCPHq0hP2jjEppCy4dPd/GSImhBtFqCDf
         An2Z1QY9TZ9wJvZN+iTaQKOIyphuW6cO2TGjOrkJYKuMPbD1rh2ihncC3S94dgEiqBy3
         1ByypGa/lVcV6apSp5jtojSfX1L7eKw6fgkTHYYq+Xu4j3wD+apD8J10EqDTQpFCGZIo
         +4Lh4Yel9SEpc9XX2pQcfmp//7kbXAjEozZo8a1gm+uR4/q7G0V71MFPT/9ILXn0SrdB
         yYgsUHiDqhvtxm3uKjwPzZIAd+aQDyi9gt8Zl5Wga2I6zFuqjmBPQgkTPSG0j+qoX86A
         DFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502903; x=1737107703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y02XX4NwyG4kx23VEIn+0qNs3fkEPqpMNd88gxpsaFA=;
        b=C/5SYpbofTVAyNnzf3H9K7EbLFhxZnXfIxh6bmVAbwiGz8dyW7Fk0F2iW5ByEqwELl
         pcsNaywwR/6ecZSw8GlodUYPnMziNb6s3T1OhoaAYVm82xfDd9W0VbUI2QP7coAnUOmb
         g/BG3OQumqvNEGoXbt/Bvdrtusu4+KrPHnMfFp4buAmigAsCVX/lH3q5T0H3PunnG5kN
         LaIsKAu9gREwZ7PJA3hk22GmVRfyypCYIuyPyyRNfsVEjoTnLnBdUP48DeOId0jbzj4L
         UvkHeqAqxtTd6rUwqTYxd/AluQitUh2C25+Ec4igt2Yv2DN+iGjHCi1P9+0f4gdrsTSq
         7O8A==
X-Forwarded-Encrypted: i=1; AJvYcCUk6yCs/pa7mlK+Snw3kWSGIGIWv7cXp6ni4kJT6/IyfTtk/IniM8cMFU2afQFg7OnM8IiXDJFh1gWvF+Kc0T2yZ4E4@vger.kernel.org
X-Gm-Message-State: AOJu0YxusDPVUXMoQrGp1ZlQIKBWswA+2SsLe3/aKowhdSbI3oaPyVop
	7SFYp718pUBfk4lFKjVOPtfFob7a29L2oVbUCsSPb2AeDX7OItNSEm7yNQcvdzMmr8W4JE43/lO
	M6/2szLbusl606W2WA2NCeAcb8Ug=
X-Gm-Gg: ASbGncsA4b9tiEcG913yLv8UswPShbxsPJrKxhRT7jJ4S4fqNgQ7IUvDkuX27f+iu6G
	gNirkEqBUaTipUdK2YIcYhRpVH9a3RYt8dlgW7Dc=
X-Google-Smtp-Source: AGHT+IG/7GOBK+8MU2G+ErOBKCON0RsiH/S8nBDyBAE3LpGe8/L6eJPjEKrq6bIbh1PWywDku8cRr370K45OzxIh4QI=
X-Received: by 2002:a05:6000:178a:b0:38a:4184:1529 with SMTP id
 ffacd0b85a97d-38a872d2aa5mr3675859f8f.12.1736502903424; Fri, 10 Jan 2025
 01:55:03 -0800 (PST)
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
 <5321c9af-6df7-4bf0-98b2-d6c4b2861374@mailbox.org> <CA+b5WFEjG1DE1+_gG0qwmEf4nQZFg=9O+rHDJZmiADL5Hi7fbA@mail.gmail.com>
 <7893ceda-5260-46f2-8a87-ffb7734fa99b@mailbox.org>
In-Reply-To: <7893ceda-5260-46f2-8a87-ffb7734fa99b@mailbox.org>
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Fri, 10 Jan 2025 10:54:52 +0100
X-Gm-Features: AbW1kvZhnTpwStWQL3ts9qDTst5Ggw85xlwC-D_96g-nrZxVG5diNnNm8N2g9-4
Message-ID: <CA+b5WFH8hLGEnfhj14E9cfezcXbXZ=OaSf2pOegm5XFhqNTM3A@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: amd-gfx@lists.freedesktop.org, 
	Mario Limonciello <mario.limonciello@amd.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 3:57=E2=80=AFPM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:

> That's much lower level than OpenGL. OpenGL implementations can and do in=
ternally use page flipping under the right circumstances, it cannot be enfo=
rced via OpenGL / GLX / EGL APIs though, it's an implementation detail.

It is indeed low level and somewhat outdated too. The instructions to
read / write these registers are CPL0 nowadays. They weren't back then
:)

> A big point of GL_BACK (and double buffering in general) is that it's not=
 what's currently visible on screen, so there can be no artifacts due to vi=
sible unfinished frame contents.

Great! I suppose it will do.
