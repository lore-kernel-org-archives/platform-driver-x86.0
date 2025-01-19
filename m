Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A7184;
	Sun, 19 Jan 2025 16:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737305595; cv=none; b=Bu56qMKVJ7/HDbxe+mjUWc7s0jGmZmiDgftWLdzasitY8yrEWI6INOvikghugnJf52+U3lm/MuAUH+G85jlPm6QtfAVWZJ4N79kZ5fL4ou5ASUtK+DWvgAPhde230ZbBYRpY+CqZFzF9lwtOQG6d0L57HeqaMsnhwxyqBL28Bp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737305595; c=relaxed/simple;
	bh=CTvVP5/SqrRjLFQyCcmCE3899P58ZN/AQY8kfy5HMC0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=X5ndAptv4vU35TDeCBpgJ7mRcUrADFsHm75fdiksP0RNXympraxvXRluD5VJIP0xatrzQPLkxqVjCXD9Pp66HbjxcB/Kch1mn5y0GnAdPhpW0+hjluBjI0W5udbIF0WeJUOAp1mbWVSgaCpbKEYJd4Q0bHKlHPTB9o+EX4h2bLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBgIdmKK; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBgIdmKK"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f1be1daeso367437985a.0;
        Sun, 19 Jan 2025 08:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737305593; x=1737910393; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygp2+bKvx7zOfOPK1Y2KcJVq5fyTs/KqdjLzWT7IclA=;
        b=LBgIdmKKDO7R7isg8BmfyOL22UOSMTfVwhfH5/1To3YlLMmGnwH89HTU1j9d70guLw
         3ZFDKqJiSiQvkRW6fhOvTM1XCMkdy45jAxML3mouSMRcAZoWtfKlMUL0R2QxmpULYeBf
         hmpji7ZdaH35hz3cyYVLYE9osWOtSsHEwkArb5JmDTD+dFe4NK15dYcSERsXxgqQo3w0
         /019txaTjecb3bBC5QqR/y55pCQb155Jh0KTOOXgRjZZurb9ZK14bn6NNP1yMfwfZUGV
         c4HABI25TcGjReLpcIfKS2173aXmGYwAvhHANqUF7lKJCWb5FaXP8YrW9hqS294mQd3W
         OZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737305593; x=1737910393;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygp2+bKvx7zOfOPK1Y2KcJVq5fyTs/KqdjLzWT7IclA=;
        b=Ych+cjYhkkxMx7wGLShH0+9Ftxy6h5gfC9/U9VAIpKoow1wSid2L5ITGtYqJxw8W4P
         aFPPidxO5EJeM+Z/6BNDDpQ8uyVBe4N7XSss0euNTqyX9ivdnmWga1K5HcS3KQoDMZgM
         r0cNTiIjp4ws3PJeXfzBBgon4WMEq1LKYotxC3YBUQugB/bRGBCSJxCNpxkPPtNK11KL
         U7ZiEmiMQVITLK0ysBj4jTP2oASUFp+z/Xgl84BGJwjPJmebQ8adOee3kEyEfQXeaVFw
         9oLmcfJwIg2Tqruo75cX1fmGsGc5NxeGK87iP9ayLjwhgeNfGnAPYmn2OF1ScDJ8m2wY
         xBUw==
X-Forwarded-Encrypted: i=1; AJvYcCVTgG+PGn5szuL2uCH8sZQSRmpPL71qrScHV7xjMhHg5300uf7tbDEaYI4+1/iAESV7IahmI36dmTW0IYo=@vger.kernel.org, AJvYcCWKrRDgHHehsL7k2szaPvQX7sd9FqUmMZVAYrujs2MpFfmSXLz3+IQkgFIHTRY0dHVSln3jwjhHGr+SIAOOiUYL6NiEgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+BNulA9Rjbho7aV2jcUaSUiy/Enb2H3DlSIAHrO5XTTpa/Re/
	Xe9GMEATvHph2xQu1NJ+Sr6fouw+1MlILAZh3vgVBLguHzTj683X
X-Gm-Gg: ASbGncu/ET9OMXAzlBOba6H9JZZp3xHDTZ7xEoiVEl+cCYym27dhZyH6xBtgT8OYekv
	A1eduHhplAPp7MurlYMTtf0Bi0iy/Xg0HUNsjkkTZ5vB2YWTlKWhysGwFkDKw6s2IZtgnikJpvS
	JS3aWTiG/+pPibykiLtAo8cFGONUrrxil3EADu19a2kViZI+mRPfgvvQNdWIdEAvdMuCmYdEDuT
	Xhkorc5ZWvq52UV1Vmy3ExyHQZz+BX2MigSlzKKQlFQlP2OSHLu6k/Sg9IWcg==
X-Google-Smtp-Source: AGHT+IE7bjNLGo9vldQ9UqUZETnaYSHnOp8uRLw3DyczUuF5Fw8tNeR6pfPu0Ym3XiqQWXTqmyylwQ==
X-Received: by 2002:a05:620a:240f:b0:7b6:da21:752e with SMTP id af79cd13be357-7be631e554emr1846735385a.8.1737305593023;
        Sun, 19 Jan 2025 08:53:13 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f5b3bsm341178485a.115.2025.01.19.08.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 08:53:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jan 2025 11:53:10 -0500
Message-Id: <D767FM2W6WD0.1HEH1GILFN6FA@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <platform-driver-x86@vger.kernel.org>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/14] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <317cb392-019c-45d1-b29f-62c378a1daed@gmx.de>
In-Reply-To: <317cb392-019c-45d1-b29f-62c378a1daed@gmx.de>

On Sat Jan 18, 2025 at 7:09 PM -05, Armin Wolf wrote:
> Am 17.01.25 um 09:13 schrieb Kurt Borja:
>
> > Hello!
> >
> > I rebased these series on top of review-ilpo-next branch to pick up
> > platform_profile latest changes.
>
> So far i am quite pleased with the current state of the patch series. The=
 issues
> i found a relatively minor. I am already looking forward to reviewing the=
 (hopefully
> final) v5 patch series :).

Hi Armin,

Hopefully.

Thank you so much for your work on this :)

>
> Besides that: Did you test this changes on a real Alienware machine?

Yes, this was tested on an Alienware x15 R1. I tested all quirks
including those that are not supported by my machine, of course WMAX
would return err on those.

~ Kurt

>
> Thanks,
> Armin Wolf
>
> > ~ Kurt
> > ---
> > v3->v4:
> >    - First 6 patches are already applied so they are not included
> >
> > [01/14]
> >    - Reordered some lines in alienfx_probe() for aesthetic purposes
> >
> > [10/14]
> >    - Removed pr_fmt from header file
> >
> > [11/14]
> >    - Copy pr_fmt to each linked file
> >
> > v3: https://lore.kernel.org/platform-driver-x86/20250105153019.19206-2-=
kuurtb@gmail.com/
> >
> > Kurt Borja (14):
> >    platform/x86: alienware-wmi: Add a state container for LED control
> >      feature
> >    platform/x86: alienware-wmi: Add WMI Drivers
> >    platform/x86: alienware-wmi: Add a state container for thermal contr=
ol
> >      methods
> >    platform/x86: alienware-wmi: Refactor LED control methods
> >    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp metho=
ds
> >    platform/x86: alienware-wmi: Refactor thermal control methods
> >    platform/x86: alienware-wmi: Split DMI table
> >    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
> >    platform/x86: Rename alienware-wmi.c
> >    platform/x86: Add alienware-wmi.h
> >    platform/x86: Split the alienware-wmi driver
> >    platform/x86: dell: Modify Makefile alignment
> >    platform/x86: Update alienware-wmi config entries
> >    platform/x86: alienware-wmi: Update header and module information
> >
> >   MAINTAINERS                                   |    4 +-
> >   drivers/platform/x86/dell/Kconfig             |   30 +-
> >   drivers/platform/x86/dell/Makefile            |   45 +-
> >   .../platform/x86/dell/alienware-wmi-base.c    |  488 +++++++
> >   .../platform/x86/dell/alienware-wmi-legacy.c  |  100 ++
> >   .../platform/x86/dell/alienware-wmi-wmax.c    |  773 +++++++++++
> >   drivers/platform/x86/dell/alienware-wmi.c     | 1235 ----------------=
-
> >   drivers/platform/x86/dell/alienware-wmi.h     |  102 ++
> >   8 files changed, 1515 insertions(+), 1262 deletions(-)
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
> >   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
> >
> >
> > base-commit: 81e8e5017f5de3cf28004ae2b628629ef4d43635

