Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF70274659
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762794189; cv=none; b=qqNtB9oS0sZKFQ345elCuBWidCmcuMZQO7lc4ytUwyMJHQdRuvgnyDJFTbAe+l/4ZmN8Mm4gxkagPfrLC85ZecRDqdasHKY4V/UOFoxSa2CZiYCN/UNwvt2N7XzSyj3IgrFlLcgV6/WWKGMXqZDUysaDQ/Ot9IW2kYg1fD3ia1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762794189; c=relaxed/simple;
	bh=bpUc5IRSgpzDLBnY52fogL2+1joCffP321S3rG3MNoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGFAltJ8iV35c141OLsJDv2VjQfVyR1dPaLdL3Y4xu/H1rddbNCKSxJblq1HQGBmfVOE771j5osDH2JEJL9qtNzix9yrTOt97ymKbQfwdLgd0nFMrT66qCKHMIgNJPCLaGMqs4nMB1W+5Met0jwI+lVILPzKAPk4pge/X6BLfOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=OT+dmYTE; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="OT+dmYTE"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 083A93FB27
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 19:03:02 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 3C4773FAC3
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 19:02:59 +0200 (EET)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7C2E5200823
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 19:02:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762794178;
	bh=12XFEHPdLRiFYWyYcTFu5vWOUn+IAVgXsvoL0hxtf+Y=;
	h=Received:From:Subject:To;
	b=OT+dmYTE7imc8svBrlkpl6R2ry/FULm7m3qhNxllCW+VOFajDT8qC5wrMB1Wel6a6
	 VVkSrHZdoz+CU3pOdIuPTZ3VsO07iXOvKmaLO7Txk1nIRO2F6cYoA/fraFZ/W+ljAv
	 GulYx+pU73FkGnyLsPpsEX/s6fBLZTl8+WVcn/OBj3j6doO3EsQL+0s0fIgoB647LL
	 ba6Lliw8RcByAn6kx8exDlEWPbhBe6Jt4H9Z5Y6iGoYHR8O28awNFOk/UsFFW6gw6g
	 JgMxyzMEBqppBPkqECT1bdhmTx9XUC1nzWImauVif9F42nOJjiXWmcTk9ybfeCA1o+
	 C4vFJCD+O/AcQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.182) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f182.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-37a415a22ecso31894531fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 10 Nov 2025 09:02:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIMuPjYq8u7YHKQbP0qcsPUlG1dW055+Rf9f5BU5g8jJG1oXXuzwDaOtYIQ5Csmt2MujiWUVjk00NhUG4sEi+/E7ED@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJUuCRKh9yz+0elaKH5nixEI8Qw+G++BelY2m2GgqF2pmlW5F
	7+RG5oa5G2zm+G7Ua3qzd8OKGnwvDIMRP2Uyg7RFftxRu+BU8YDJeDns5LnJZ+6KWtgGxRJfldM
	W2VSKsLkfVYa+jcvqqbENmwosF1JCM+c=
X-Google-Smtp-Source: 
 AGHT+IHX191KArmmK3K6jhrf4BcpXpAv4RRw2PR1iGD5WvVgGw4SVp+bxRT0HjwyDMvzvvmV9meSD6pod4PARGoCw7s=
X-Received: by 2002:a2e:8509:0:b0:37a:d20:3215 with SMTP id
 38308e7fff4ca-37a953238bdmr144571fa.6.1762794177957; Mon, 10 Nov 2025
 09:02:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110111253.16204-1-W_Armin@gmx.de>
In-Reply-To: <20251110111253.16204-1-W_Armin@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 10 Nov 2025 18:02:46 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHq45Bj4FgRyrmd4dvLkR_hUGB7wVDUdtttR13sJGHHyw@mail.gmail.com>
X-Gm-Features: AWmQ_bkFjkYivZ-3eYLTyeuQ68uQc5hNIm8qIROiP39Yc_Q9aTdgLJ_pjUHntFo
Message-ID: 
 <CAGwozwHq45Bj4FgRyrmd4dvLkR_hUGB7wVDUdtttR13sJGHHyw@mail.gmail.com>
Subject: Re: [PATCH 0/2] platform/x86: msi-wmi-platform: Fix autoloading
To: Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176279417877.3435267.1097266833356186476@linux3247.grserver.gr>
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
> Additionally i noticed that said GUID was copied from the Windows
> driver samples, meaning that it might be shared across different
> vendors. Because of this we have to prevent this driver from loading
> on non-MSI devices.
>
> Compile-tested only.

Works great. Module loads normally without intervention from userspace.

I could not find an online reference for our discussion so I omit the close tag.

Replying to the cover applies to all patches if my understanding is correct.

Reported-by: Antheas Kapenekakis <lkml@antheas.dev>
Tested-by: Antheas Kapenekakis <lkml@antheas.dev>

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

