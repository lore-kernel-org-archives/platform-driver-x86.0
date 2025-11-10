Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBB230CD83
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774299; cv=none; b=TPa2xfT3ZyR5KcEiaAgVvCu8oBl+RsIKEu9rKHcP6bbUJLFi3wjQOSHfgIJUpoVfRZio44G0XFJptaKPoQil0WMClEGbZGBDVcqHniJVwoD/y8sX0D9LA9Z8/PKebDubmDTEChrQiH8V9evvRVHK8Enn4egOXj27LQkkP+LnAFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774299; c=relaxed/simple;
	bh=KtbcQuiFp8d7IkC2vqgRHkSHD/7Ct0/C86WkZt3s+bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVB5cwIy1JKRhIbeN6nmHyVy2P5sKJmfxDxcOHzA1BGkc381poFaPLo8wjjoh9vJ8JiXkK20ebefZUmljLUj4RoaA5TRdVAiT2cSGpoMLX/bgWbVGERAg7uuK6oxF40v8fPxHVsIeuetGv6Zw0LWePoQb/gJT5Hz18xvEZckFWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=j/H7FSWq; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="j/H7FSWq"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id D44E45E4B1
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 13:31:29 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 777965E5A1
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 13:31:28 +0200 (EET)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 6FB36200BAA
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 13:31:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762774287;
	bh=IeSnBNotDjw3R7VnmJhVdPttuuVGctIrZk+RSexiM1c=;
	h=Received:From:Subject:To;
	b=j/H7FSWqmVYo+dOsASexO+N1mwvwoUh923MVphpZecZHMa5plAG8OJB2GlvI+GR5v
	 uhN+4V62HZoqr6RMkkG5Ox+JOhw3ieklOb+W8ZTlUxbttlFw0JyrloAmuIGNFHS4vd
	 JwIKcbGTzoHdSxNYTKk9lDkj0LcxutuU46oY1LJKRVgVqOQvc+/94OQak+CbSZUqYy
	 uiGBdRNfCj0kcLrIiyGv51KWIDJcUfXZmD7MMjygmfdX1pq9io6fikd4Sgqf3o2Yho
	 WceHUDETJGpGJ+gFaoSORqDTFoXOmFESSI+GVRH1sMMRxmTBu5PIr4DNMqwHdm32qJ
	 9aSW0I4X0hZKw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37a415a22ecso28034181fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 10 Nov 2025 03:31:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWW2yS5d71nHbu0R9nRkmx6mZtNbOgUG6U1B7eIEnY52r6sV3oJd8Hb8WmMxfrzqaPiQtiYJ1HpxfeRZ5wXr4Lg5fyh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/9RieFhVI8+65eDX/jx0BypyC3ZBlfA7femu0hiX5cJlJYg6H
	hL7bEgWqIiM1ajiqj/RUtkt+xvV4dmehTeICYkAZepCPE6VqZTZ3Vu/rN3zIpsIyqkLTRCxKDET
	zjoeQhlOFp5yMnP13HUpThN/6cdnBPSQ=
X-Google-Smtp-Source: 
 AGHT+IHwlop8iQyLf816B5t3NJ+WnCUY4vjIic/wmY4CcU7fAIzaPagQklkeFNoOWwBy7j0dz/kU76Es7zzx4EJY/P0=
X-Received: by 2002:a05:651c:1307:b0:37a:421c:cc4f with SMTP id
 38308e7fff4ca-37a7b24a069mr13366291fa.16.1762774286862; Mon, 10 Nov 2025
 03:31:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110111253.16204-1-W_Armin@gmx.de>
In-Reply-To: <20251110111253.16204-1-W_Armin@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 10 Nov 2025 12:31:15 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEfSVYVWU86ibQB3Ea3sZT9HagZzhFnfkF5kEmwz1cz3A@mail.gmail.com>
X-Gm-Features: AWmQ_bkyaZ6Slz3nV5eHZccE7lAPxm6A9KqGQn76MiECU2M-muGX1JVUobXSJxI
Message-ID: 
 <CAGwozwEfSVYVWU86ibQB3Ea3sZT9HagZzhFnfkF5kEmwz1cz3A@mail.gmail.com>
Subject: Re: [PATCH 0/2] platform/x86: msi-wmi-platform: Fix autoloading
To: Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176277428768.2201215.746594159317056361@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 10 Nov 2025 at 12:13, Armin Wolf <W_Armin@gmx.de> wrote:
>
> As already noted by Antheas Kapenekakis back in May, the
> msi-wmi-platform driver fails to automatically load on MSI Claw
> devices. Back then i suspected an issue with the device firmware,
> however i just found out that i made a silly mistake when specifying
> the GUID string of the driver, preventing the WMI driver core from
> matching it to its WMI device.

Can you add a closes with a link to that discussion and a reported by?

> Additionally i noticed that said GUID was copied from the Windows
> driver samples, meaning that it might be shared across different
> vendors. Because of this we have to prevent this driver from loading
> on non-MSI devices.
>
> Compile-tested only.

I will try to test this in one to two days and will add a tested by.

Thanks,
Antheas

> Armin Wolf (2):
>   platform/x86: msi-wmi-platform: Only load on MSI devices
>   platform/x86: msi-wmi-platform: Fix typo in WMI GUID
>
>  .../wmi/driver-development-guide.rst          |  1 +
>  drivers/platform/x86/Kconfig                  |  1 +
>  drivers/platform/x86/msi-wmi-platform.c       | 43 ++++++++++++++++++-
>  3 files changed, 43 insertions(+), 2 deletions(-)
>
> --
> 2.39.5
>
>

