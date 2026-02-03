Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B66211A14
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 19:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147834; cv=none; b=cOPtlOayCnYe1LTv7PrtDf9O/9QuC0AocNBqv5UKOVzvGiV0BOzO5x+XJqOjm4ty/y8YAL92BS+oI3tKsR5QCi/E9XfI29Ke3z0ey1fqj8uGxQxK/4obCf2Duvoem3Q773mu5nRUK5o2oTIXcpEFq0jwGpimADnMU7MH/BcChH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147834; c=relaxed/simple;
	bh=UoFSioLitnHuRrSGCfl7jjU9SrC5zgzLa8LMucWUI6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/JvcXnZ6u8kep3q6bZFcRQWkqWy3i17lSylCltZ9Tg573mBQrOfAwwro3TRceMoNJ2rzO5qTKKw/FkS1HSy3Mjtdmp4HtAr2mg0+p6YayhhZJ3A2stOBYnrUVY2h3s30v25V1gTehMAryO14m149Sed6psHKxriI+bwYzaM64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=YqHE/Hly; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="YqHE/Hly"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 9446FBC21B
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 21:36:28 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id AD0A7BC1FE
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 21:36:27 +0200 (EET)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 1EF931FE228
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 21:36:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1770147387;
	bh=YlqcaSjFlLaM8gAdzcP53QKLQL+UdR9S5xJYuu6DuP4=;
	h=Received:From:Subject:To;
	b=YqHE/Hlyg4iZ4udR2iQQL6RyKMvLxNjX5Htq3ofRG8Ijhn8MRk5ZcHYTzofwz2uB2
	 gfCrvWGCcvcwSue+riw/WGGO4YOAp889BIylLFdZMen262qSNyVpC7sAhVLnvHbmqJ
	 C0thIMHCrVWpfb3+Rw5iz7rnLJELGepqqf6heTL9LwSvi+0xVBKnaOnG6QCIWH7pU4
	 37iDqvlTU1a+LajAqdYeEzG4dOPaKHUzt0wwM1p55UgVnsQJmskPuLpXmP/MMO4IRO
	 tDenbWN1/nrjrArm1Awejk4wKcWGZvWzwsYiovPrpLOf90vKUf4QAi+bhs1s5/Me7U
	 RpstZZ5unp/nA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.53) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f53.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-59deec3d8dcso7837544e87.3
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 03 Feb 2026 11:36:27 -0800 (PST)
X-Gm-Message-State: AOJu0YzN2fSxyXd/CfTiJzD2VNPdJH5FwKaVHY73K/EEuP1zggVBtaAe
	8dWnhgZo+4yjy/Cg2QxXFN1GnYBH7yYC4mftt+5xTFjJMl+kWxk14+m+TRyyMTRxJj8meQ4HMda
	/y+ctU4606sleq6OPm+9AvosOSfa/gc8=
X-Received: by 2002:a05:6512:3f02:b0:59d:e018:563d with SMTP id
 2adb3069b0e04-59e38c3a12amr135069e87.37.1770147386479; Tue, 03 Feb 2026
 11:36:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122075044.5070-1-lkml@antheas.dev>
 <92095q4o-n2o1-p4or-n238-o1ro83616o37@xreary.bet>
In-Reply-To: <92095q4o-n2o1-p4or-n238-o1ro83616o37@xreary.bet>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 3 Feb 2026 20:36:14 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEtW4+ke4p-o0+92Qv-03pkVTMt3UUAJfH_o69376pJog@mail.gmail.com>
X-Gm-Features: AZwV_Qhn91Fx9V3WzMCK1WJhnlL5RM3aiYiO3xOwZch_fy2lM0-m23bHdNkja4o
Message-ID: 
 <CAGwozwEtW4+ke4p-o0+92Qv-03pkVTMt3UUAJfH_o69376pJog@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Jiri Kosina <jikos@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177014738733.331514.11903455037650252883@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 3 Feb 2026 at 20:06, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 22 Jan 2026, Antheas Kapenekakis wrote:
>
> > This is a two part series which does the following:
> >   - Clean-up init sequence
> >   - Unify backlight handling to happen under asus-wmi so that all Aura
> >     devices have synced brightness controls and the backlight button works
> >     properly when it is on a USB laptop keyboard instead of one w/ WMI.
> >
> > For more context, see cover letter of V1. Since V5, I removed some patches
> > to make this easier to merge.
>
> So I see (because of the conflicts in linux-next :) ) that this is now
> sitting in kernel/git/pdx86/platform-drivers-x86.git with Ack from
> Benjamin.
>
> Where did this Ack happen? I don't see it neither in my inbox, nor at
> 20260122075044.5070-1-lkml@antheas.dev

Mmmm. From my part Benjamin's acks came on V10[1]. I think that series
was for kernel 6.19 originally.

I b4 to develop the next version so they were carried.

Antheas

[1] https://lore.kernel.org/lkml/20251122110032.4274-1-lkml@antheas.dev/

> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
>

