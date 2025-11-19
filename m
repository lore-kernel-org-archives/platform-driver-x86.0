Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD34322C9A
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537396; cv=none; b=F3nq7G+gUO7oCxg5EVHjZb2Q+RJswq0n6SVn/YUosRsb7gv6X6W3IT7yiizYWIPuxpMuXMT0LlWyG+Ll2nxuwZb6C1bGRlAMClEW1XnvWHzOOI163irn9WJkXKb0UTyGPDx+vXdzSSr7+GgkGqvkHY5ACr8msOVKbqMi2ZJaZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537396; c=relaxed/simple;
	bh=+x0dUrenumZ0Aa4scDAS4MJoWOK7CsOZz8OM7C6cxKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kStfMDyWH/CHpOOvH6qL0EtFsPxCiYwuFo0EmO5HlD0SVQzxYjmL9Lq1xHmxWjbosVX/O6kTUDZFG0YNugTwFmU2Dahio/5/268en+ZqQoCGfVBbct2XOj9O+W7N7n0Q8D3qK5x0FveJFVqU4lordfAbaz4/rAL22rVRcMDoQm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wCirnxAo; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wCirnxAo"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957db5bdedso6000553e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 23:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763537392; x=1764142192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x0dUrenumZ0Aa4scDAS4MJoWOK7CsOZz8OM7C6cxKo=;
        b=wCirnxAoCRbW/A/hLi1roGd2K0NC2ZgtVnHovjh8p/izvaIgjXUJo7EQb4TDip8yT4
         scsTieTaQHfBiegmUicqUGIzKAsE6YZqe0uODlZ3tJuYdwofUvmfc2bWI5zNlYpVlHcX
         ShbZJr2m09h3tP+n/qD64G9yj921PFzH5qur85NmbeJtzXPoI8FfKrfVi9PZQnI+epxq
         08oXeEsQzVt+XLmtqGWLwWxlUBslVJqM/ThGWyBKt5vSBsdhmbHwOVKPICepqD6dCMG3
         zd+r7vuvQlzco4nvwXQbm60ew4kePf18laTCItPCsvaoqlHi+28nI1UFGS4lcSPKJGzv
         5Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537392; x=1764142192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+x0dUrenumZ0Aa4scDAS4MJoWOK7CsOZz8OM7C6cxKo=;
        b=MKdytKybGl4cDrumSgpLDyOJrL+7EX0Ts9On/RuTkWygunmDXrY6l3TLec7yxWpC2Y
         I5gCoodimMrm2TcoGkYUFd04Cef5c6IPr1nY9ps/vF1ve1gzYMqmXSZvMS08DzrJpdd+
         KYrJsR0VNYlXgl2coit2VOrCZZgWbXVhUqqEv2tQeYLGAGcQh8jnvkvnL9bGWB+VId7A
         DTaSmyMr5SiLfiEpmWr0E7+b+HPXTHBnH9TDYsInqsQDsJaKK4edo3MKub8feQXdoTuN
         m5H3JzK00dRcQ/7je5QeRjwIT8N1FxbIDs/tpK4rtM9lipxWj5yefyIGprClZbuJrTWm
         lPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLpNQGPpbOYZv91O1J9mczYhDwAEHLPyIzbRXY84ZHTC80dFShVbzgAuZwz0j/Y72OAttf/ed4JdJm8UKmVfzmnRvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmeO43z/FU5bRADbElR51FnqdoQ7ARlmFdLAOBjg2lV+ERMo/
	g6MADL0zaaxDta8fJRJoicXr7XqX1zqAyuv3gfNpD1zUzI3QGRoEHNqMeDmIW7AXc5iIqINyqJC
	/fIu6Gi5BvEibcfMkc8XCS3S8bHtENIW7aWCtOm8yFg==
X-Gm-Gg: ASbGnct6VlY6WtMHpXk1tushn4R6ps+aqJ7PvdDc3h6VN5BIILH9q312dQPVg803fDd
	j4RaIxxq+Q8aNLVoqEwk4s2v0ngJP6dgLTr3jthr/q6BuMY39SfA4WjIBDgx2jAVGHuHbtQ1vb+
	tJAguFa5gJdAasD4e60v++vxDKqFWx2jwzpOtd8oIr1Lo4dlDcGkiDosnLbCnkyZNVR4EIOA48T
	/B0oQWxiDlsijM9zFXqMyqw8130Mv6CIj4BAo8ToiPzpXOJPcoMoFOIQywKHri0m/Wo1Vt+MmEU
	4U8wKLu3Wdeo9BqIAvGxabzKot8=
X-Google-Smtp-Source: AGHT+IGCXomYNdi6CNzjGIUnxDGEZ04I7YljUtIzzVstmjRa9/Iq1zUEHk5Dyz+5zPtmVbowf3ej/MMTa2u10vG0OfQ=
X-Received: by 2002:a05:6512:b26:b0:594:37bc:7b3e with SMTP id
 2adb3069b0e04-59604e3f4efmr609160e87.33.1763537392350; Tue, 18 Nov 2025
 23:29:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112034040.457801-1-raag.jadav@intel.com> <CAMRc=MfYZq8vKxb736RRc17Ufu1A+6YDMuKDSME3Ly73y1ZRvw@mail.gmail.com>
 <aR1mWeLBlahs6RG-@black.igk.intel.com>
In-Reply-To: <aR1mWeLBlahs6RG-@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 08:29:38 +0100
X-Gm-Features: AWmQ_bkZoulpMAAbqEl3nxDO6Rzv18u54YV8pIOrtIad2H30_1u5suuqPGo8RKY
Message-ID: <CAMRc=MfNY0RH4a-9PFvxuhYA3jSp3hfLkR6PvH5NqRKTd2ixoA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Introduce Intel Elkhart Lake PSE I/O
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 7:40=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> On Wed, Nov 12, 2025 at 04:14:11PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > When this goes into the x86 tree, can you make it available on an
> > immutable branch for me to pull into the GPIO tree? Either just patch
> > 1/2 or both of them with my Ack.
>
> Anything I can do to move this forward?
>
> Raag

With an Ack from Ilpo I can take it through my tree.

Bart
