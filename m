Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10555326D62
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234891; cv=none; b=MY6EWqFspc3gK8QgmUixFv8jwYw7H5bazaskTCfyvXeSNHI9GKDH8IKMWJ5d3LPoCTt22iFgwZpipEnZEQo1nk7iT8YYOLrH57bMvi9i55fRKc4zjCG4SNcpsrAaTvan1HF7pUt/a6spntwmybO2rnc0MZOvmN6AdwLD4YtOBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234891; c=relaxed/simple;
	bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNUKZ9Vm4oTs2zKtUpnPhOCKMsEqVbu3e1YTIH04CEmQKb1b83jrePJ+1AqdwYBEZegkRsvoJWPyurG2/1BgBMrS50sHmw5PpvEf5QXhbdEEhiB7FSznfPn1NYNiVlgJMHABORIvrF76j603piUto3vyyJhPoY5gbOt0uNHk+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WYFUaeHT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WYFUaeHT"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59583505988so825241e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 01:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764234887; x=1764839687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
        b=WYFUaeHTCcZh99fNLyg4ZjCVWMHQInJ4eA1K7+hq/WQJjQDsK/MkEK+wSVvyqeuXla
         KQa1t3ugiAEhdhvw5FvDcYQF8hkf+S9JRACEIlFnj3VNJmxNFmVmloBvRI9XUUrMNNfO
         NmPNMA4MP0Rw/2YFqK6ctPM4s19cMSCQdeQgtQMihpOQsIDy96B/KeuwAEo1tirvPgTB
         pAev8SvLVNCUeU227JfrXqZ9bW0ISv9TY3tN8kx3JZMvbUwnG4hz8CC8GNCYSqsMUPVm
         4p4cqX3cEnv8LNJgZ6I2AGQm235EbNo/jgAtE2WSpViVqhBgk85pcb+xn31/dvq+fQgL
         1yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234887; x=1764839687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
        b=sqaExZwuL87+b6aNParM0fkLAMu1JRrENTpmk/D7S4BfxqjxI4IpJ7rJoFrc1g1Ncy
         nknMfgfGPGGfAqWPHdHGHnlVRnMGnifjuTMJ/6z9bwP9qSlLPfOChsK/ZvXF5feQRVsh
         OE2AWN2Z6QIqUbLkAaZ8BESzZoG6na8LxC+I/HxjoLPg6+V/lzLhsWL5Pb+B5ieDeLaI
         UmPzH8spdciafRLBDQQsTyVw3MkB9ZLE9XitKS+q0kD6diuVQ9WFhbbtRn270VURpNbz
         bc8RUYkyX/1xDO6+wb19BKc9g9w6yMZDgarXrK3x5TBpWbCbc1mfEQHWGWNGRtXuFJiG
         RBQA==
X-Forwarded-Encrypted: i=1; AJvYcCVr14ef7eRwnvBcPz+yyyvzHJivfhyoMdpfnPdQUYJU9FZTdH2Kq2E7apSUXuY9qCwE/mBp3HakyDTvN452xP9EvqM6@vger.kernel.org
X-Gm-Message-State: AOJu0YzUTOKG1MTC1nkkGNHcEh5rJ1eAZm4Q4Yq+Kyirc/0uFtOIBvY8
	IABY95Otm9dzsxU1oa3mK0pmmdFaCa4bcjrQpWKb7NAh9unUyk/9EnyxDbiCn2/ww+o4qsUX+bw
	mJFgOU4EeOVlF2gqM+8yvmS4dg+4O+tJftI4ZRjdkGQ==
X-Gm-Gg: ASbGncvGdZKnW1Datp47oLZlnZ46sRRqV9PZRyG9X+PltvmjINxb/fIQUF4jbftfAlR
	9GsGZkg8UvEfvJ3nUc7TvnyAXf4XsizsyEGPGn7sK6ibzr/+pWKAEk0jwMF0O3s0Gcu9p6mvKNE
	inlAflalu00D0ZhnAg/yPcXn08FjXsovwIy0EiwOP5fUrd6jEhQoiwmF07bmcTTdTGv8xNk+8J9
	En9y62dvCiJ+XA+n6cV/PB+to7L8hiiTqPNpFNDcGR9AsjPuJcNp0yCCQ0A0JPtE1auNf3XIfQI
	IRFtaqE0FGeNLNCYaETvHL6dakk=
X-Google-Smtp-Source: AGHT+IEbc2TbO/tYVAauVYSWlsGPpU9aKscxV4CCCOtz2gTp8D6aQtAJcJ71cXNyLsAVeBjOKBJwqCStf35Mbf46OXA=
X-Received: by 2002:a05:6512:8010:20b0:596:9ebf:25a2 with SMTP id
 2adb3069b0e04-5969ebf25d0mr6811454e87.19.1764234887164; Thu, 27 Nov 2025
 01:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-3-32826de07cc5@oss.qualcomm.com>
In-Reply-To: <20251125-pci-m2-e-v2-3-32826de07cc5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Nov 2025 10:14:35 +0100
X-Gm-Features: AWmQ_bkMx1pQI7KIzXZheaED5_3WOsSVYkYxsGF26N74WOl7tj2ktgI1roknym0
Message-ID: <CAMRc=Mc_=F3HiKCVh26RtJ-8vcFWbdRRFS5R8tJa7320W-Tcig@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] serdev: Allow passing the serdev device name to serdev_device_add()
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:45=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Instead of always setting the serdev device name from 'struct device' nam=
e,
> allow the callers to pass an optional name and set it as the serdev devic=
e
> name.
>
> This will be used by the future callers passing the serdev device ID as t=
he
> name.
>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---

Instead of modifying the existing callers with an unneeded argument,
I'd suggest adding a new call - serdev_device_add_full() or something
like that - that takes more arguments and make the existing function
wrap it.

Bart
