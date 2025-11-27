Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5531028314A
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251247; cv=none; b=Ps/2o2EccEbxAKmxntf+1vTtyQ4AOczQvE+TSGmdJAnp/zRPNMQW4UfdbvYAtDwHURXjgk9WVuFRdtWPaov6DzdU5jzT28+ZT9eMUoyQGY/9Xhctmyfom/JjX5aWZaXouZzTG/ipAoPjgI8NV9OHco1zklMjDUAa5meVZxVml3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251247; c=relaxed/simple;
	bh=27yd/l6012XaQH/g8Ixa+D6cMcVdfn8d9/IVn2JOVCI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm6KFixQnxaDe7yxwqjmykf6mBkIQR9d4wX5UZotPqN6NhdEtv0uUah8EDjMYHykr0qwkRaDeCmQeTsYF6wUPnKm1b/Ge8y7hackMtqnlQNLakToamx+bqk0DiFwLt9qi8KiGLA5ZC84QuYBctlzdWSZesUjd1VM32RBhILhIRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mqi7wt8o; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mqi7wt8o"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so883753e87.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 05:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764251243; x=1764856043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27yd/l6012XaQH/g8Ixa+D6cMcVdfn8d9/IVn2JOVCI=;
        b=Mqi7wt8oNrr+2+e4XNhQBFHjbbJlNk2prXtZZdeiWDpubDuSNPjtqVuc6fFI7gQTNW
         vlhDRF8Ikv07ZhquMqzkqlRbUqUBvhhznOF0yf+VzMxYMKnOLOCd6txDRXhkTGnAwFfn
         9q/AFxkcnrl71n9rhoZuu/08jdMh/RFnG0Cl63G8H+FblB9m8ujHai9LfGR+WngJj2Dd
         TjMLWQA1KgMyWpako1U/QHpPDjlp8y4V15h620/0cvt4YsBCRXEygHzP/Lbbhj6NIsYB
         DsZitljR6hDpZnbRH3U5UlgO5Ha0pWvDDCPBmOt/Z+Dos4I7Or/n2AinAFdgzuAfJvVY
         hiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251243; x=1764856043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27yd/l6012XaQH/g8Ixa+D6cMcVdfn8d9/IVn2JOVCI=;
        b=s40Oq/QBaBUC3BQZAXQk+Q9F8hDTFOV4BqtZMWXxytOsx3mOCvhG/jbMPFoc0tSLNN
         3pVtF/5PB+ur7NbUzPkW2kZi1xQSvK8IOAfkC16S1dVT3t6qA5W/wKECK1pIK9nQw3/L
         i2uMNrBYRddU+j3e9DoBLbDHyXY036aL44vc73Zp+ZcoGfwbb+Uttnt2mYzvKJTKXM1f
         Lp0t6uK6KNkz3pyQQif0uImaALMLqvVSavg6Vs0wqgVqm8h3ZlxBhVveck2lNaueifuw
         cY5DDEaP5DPPY7aTJ+M22M0QG+lUk7OfI7JHGEEOm6Wg/rKcr/CAvYrThNI5FLkRhiZP
         qh8A==
X-Forwarded-Encrypted: i=1; AJvYcCWls1uEuHrlU+t2z19ceDewfnU+fdK51kJmLKoALVI9Hzmc13HpFz5K+yS0cxBQ59nlbmzqjrG60qjdlenAScYmgt4g@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0VdfIFd3gM8UutffmGXu5WbUqo3GxXTLOuUVIeYbVD0RhQ+n
	VUvKwSaPsDWaZh7nnG3QiqjFfhBc8fMtQbQoMHn9AS1s1qyHYUPBzRVZZyy2Q0SWh2Fvy0I6Hdq
	89q8oCRSaMn5tcpgh7DPqChipT7XCtIoFkgivTnvz/A==
X-Gm-Gg: ASbGnct817dZQVEd95cDOxCwfn9vgUtvUC0SVZgAXkNJ5Mb9240ittXqjWbyN99ez2T
	qxy59kSCLP8EEWL+E2kObRRgKgVBXuxcpXnBecRFCLozmCBQZ+np28P70Rs4LiSJJoo8LTXGRIA
	H7lDHPWrx3bvBiGrGrPjPhO+R1b8toYeloEs/tWJvTom9CmQpEuGZFL72CE4wre66RPsR+f+V3Y
	6kO6WUAj7MPYrLKJgpRpvjIvOINQmVXwS1MMPrrtXL1rLt3GL7WVG67P1uuhhNd3wBlkzjkXKzZ
	bHd9w9qbBQTkHqiTa/mlKRZ7OjA=
X-Google-Smtp-Source: AGHT+IHIByvzTN9XhwquV0dZ7CSOzT2wtZW2aRAexw9uGkGjWx9uXnsQQnkc0lHm6G8MnJ63g3o+AbKWIIpqZ/ETI6E=
X-Received: by 2002:a05:6512:2354:b0:594:36b3:d1f9 with SMTP id
 2adb3069b0e04-596a3ec4221mr8118131e87.25.1764251243268; Thu, 27 Nov 2025
 05:47:23 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 08:47:21 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 08:47:21 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-1-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-1-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 08:47:21 -0500
X-Gm-Features: AWmQ_blvAAM2uq578ciPVCG4M9rg3fVM1qAGhRvJTTtDZYm9qOnYz1mkG_i5iVY
Message-ID: <CAMRc=Me+mWYaa4ZKTmch-NtuvP-2ifbY1Zwi9E9KMyUgFSt0fA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] serdev: Convert to_serdev_*() helpers to macros
 and use container_of_const()
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, 
	Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Nov 2025 15:45:05 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> If these helpers receive the 'const struct device' pointer, then the cons=
t
> qualifier will get dropped, leading to below warning:
>
> warning: passing argument 1 of =E2=80=98to_serdev_device_driver=E2=80=99 =
discards 'const'
> qualifier from pointer target type [-Wdiscarded-qualifiers]
>
> This is not an issue as of now, but with the future commits adding serdev
> device based driver matching, this warning will get triggered. Hence,
> convert these helpers to macros so that the qualifier get preserved and
> also use container_of_const() as container_of() is deprecated.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
