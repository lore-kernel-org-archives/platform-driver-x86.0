Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455217C9BB
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 03:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725851128; cv=none; b=i/XsvZMdIxUdMB1Pml/k2gqOdTpUXKQM5SiHli1n46OyJxAK56YbCBWmUuW5zQAjQFXwPMWfwqcDulwmuS1oPl+vP6mFPShHm7VF/UCQXp7uz8Md2TTPch3yuS+5YEBSOylAV57O8EzXMzF7WOfysoV0Yv3WOIi3QlhVZwkyoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725851128; c=relaxed/simple;
	bh=uibYA0DDhkVGM1oULcHE7FcHV+h/M6ULLQSMEo15LJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2xTUaxzIFcF58QX482m3eoy2N66v/6eacILmaT2sxxR6vCHSXMVvIcGhQkCmrg/TiMAWLEKFx8Pof++kc63Fuf8g7T6PCd5i930XbfDumYC2d8V9xJd45ILXqjkLamqxmptir5srPx53BNZLt/s2HPeDN5bmfclnHqGWxxurdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=hmd0NIx5; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="hmd0NIx5"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 408783F2F1
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 03:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725851119;
	bh=GjcxPsYBfm9i0vtMaX4QCNll1ePzYeiDXIPkGdzVHmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hmd0NIx5RyRHlKqj9LfPffk54BYtAhkjYnwfWVoesEPrro9ig+RnT6yfPktUsLruH
	 ReEOvtbH273NhMTk9dfYXbroOfMTEE0Hm3XbIOMNgl1Sq0rcy/XUfwRpAMuUTyNGla
	 WPtQU57xjEpdc+RjNg/IFtLZx1J9y5hB6pBYECpL/SDtNY29nXaacbicIb7mUKRupG
	 fpGD1NqJ53MJoIs9dfS5cbM36W/MDRo7H2MeIHRSdDd1cQOxsUJ5kkpzUxhk45WoID
	 FAr/nSyXzQfm7TkxEHVlSm7eIw8wscJWr8iq9z1f8FOC4eN3w84dRvpANDM1Xgufl9
	 cjcgFsHemLtJA==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8d26b5857cso129575766b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Sep 2024 20:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725851118; x=1726455918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjcxPsYBfm9i0vtMaX4QCNll1ePzYeiDXIPkGdzVHmU=;
        b=kTbG2gh/D40L4ZAH28k5ZwoJ0bB13VlEyuxba48ujOQUg8ua/rbqWtm57EWF2+Nfje
         K8qF3yxZXu5gMUn/vjKmhru/M1P84EvT2cfvHCAMoKNwftIml6VhdYBtyDy52IwObyPv
         tTkG+/zQkgNfQEFSuTc/rKfAFRMCcPq3/mGL44blbm7kRZG3Pe8lPyrnAoiHaBr49FGA
         rmd0XHXK6Fe/ezaJZOwO+lnDnsVVDjhSRF+PA9a6K2QZyYHeA8AOG/T+hYl/PiU5XUc9
         hknA82CPsWeIcaBARbRqr6Qoi3s6jcwN9tTTxXZPD3nRRsqu2DFGIB+flWa8AJCOBw4G
         wb/w==
X-Forwarded-Encrypted: i=1; AJvYcCVhhFecD/UEgbGDftUZuTCIrz9n14kkZ5NNVMBZa5+r1kQT0aSmtrzEH3Sue60VwzykRHVgc356E2tX0+1MhwDSL6es@vger.kernel.org
X-Gm-Message-State: AOJu0YzdWTsxYHDMOxNNY/pyjxGAAwE7095M3RY1mWCgABQBQpWxtiLF
	h+z7SQlCY/8bH4RbGAraieKzUz4GEkilOlkwbcq5+1MdfAHYwzVx9iffVUjP0PxbtNsxEvjGKS6
	EDubvQna9oGOays9Rn6EeTwlt4r6cYzYjruCKn+/HPIu5NiQ/0BxE1WNIrNZlBgd77Hy88vGo7W
	88acdaexeqHz4GNdCygm+VZzD1yYzvsu8AShYDTOoHzOnLSnUmv6u5+ZN6BjJZKZ6M2VYTxw==
X-Received: by 2002:a17:907:8686:b0:a8a:66b6:58d with SMTP id a640c23a62f3a-a8d1c4d7913mr662531766b.41.1725851118548;
        Sun, 08 Sep 2024 20:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuG/c1pV3OAm6nu2vGlRvKv9U2b23ZY+JOWpXPKoYpNvuHAMLNmrC0KbsLPzB4znzP3SjrhcsA8LUxfwmEUvU=
X-Received: by 2002:a17:907:8686:b0:a8a:66b6:58d with SMTP id
 a640c23a62f3a-a8d1c4d7913mr662529366b.41.1725851117993; Sun, 08 Sep 2024
 20:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906053047.459036-1-kai.heng.feng@canonical.com> <d8600868-6e4b-45ab-b328-852b6ac8ecb5@rowland.harvard.edu>
In-Reply-To: <d8600868-6e4b-45ab-b328-852b6ac8ecb5@rowland.harvard.edu>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 9 Sep 2024 11:05:05 +0800
Message-ID: <CAAd53p4i1zzW2DsVfirjXVsQX0AgXy1XbzWaM-ziWmAmp8J1=A@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne 440
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org, 
	jorge.lopez2@hp.com, acelan.kao@canonical.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 10:22=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Sep 06, 2024 at 01:30:47PM +0800, Kai-Heng Feng wrote:
> > The HP ProOne 440 has a power saving design that when the display is
> > off, it also cuts the USB touchscreen device's power off.
> >
> > This can cause system early wakeup because cutting the power off the
> > touchscreen device creates a disconnect event and prevent the system
> > from suspending:
>
> Is the touchscreen device connected directly to the root hub?  If it is
> then it looks like there's a separate bug here, which needs to be fixed.
>
> > [  445.814574] hub 2-0:1.0: hub_suspend
> > [  445.814652] usb usb2: bus suspend, wakeup 0
>
> Since the wakeup flag is set to 0, the root hub should not generate a
> wakeup request when a port-status-change event happens.

The disconnect event itself should not generate a wake request, but
the interrupt itself still needs to be handled.

>
> > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, p=
ortsc: 0x202a0
> > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
>
> But it did.  This appears to be a bug in one of the xhci-hcd suspend
> routines.

So should the xhci-hcd delay all interrupt handling after system resume?

>
> Alternatively, if the touchscreen device is connected to an intermediate
> hub then that intermediate hub should not be allowed to generate wakeup
> events.  That's determined by userspace, though, not by the kernel.

It's connected to roothub.

Kai-Heng

>
> Alan Stern
