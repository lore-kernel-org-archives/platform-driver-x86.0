Received: from relay14.grserver.gr (relay14.grserver.gr [46.224.16.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A009A278E63
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.224.16.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989749; cv=none; b=Qxf8JVbJQwC7j3U7PxLWYfcoxVm/EZCqdCfT7NiOPEJZjYpyrPCWTjUF9iamS5Lu2AAIhbEptsZaFmipm5Uh5FGNKEIu09gSBz/Qg8W89llkjcvZxOCfWt9uAYO0LftWZcbMyJ/wjFJKydF4j5HG9uintStSHberE53wAcBRPIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989749; c=relaxed/simple;
	bh=Cjg9r3WZ/i7ppJWoMpiePl6JCsg0XryGZ5ebTtSLeR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFptiLWPOUQRt8RPDnTO+PKmr05Ci44eLOfhQNLN1Ok+E6OI+M8Int3fZ7g0Jl2Tvbk9Fo+7HEnmUkZPzQwrragI67ZwCXCVrgOCq3Pq5nxd2NwLaOlKOveKJv651IN0vcFbxVlgnQrkNSu8XBuHjPM0iCuawE46M+zffSvgUUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Y5j3EZRQ; arc=none smtp.client-ip=46.224.16.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Y5j3EZRQ"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id B2E0243F78
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 23:22:25 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 06A7643F4A
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 23:22:25 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7CA86201CB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 01:22:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762989744;
	bh=Cjg9r3WZ/i7ppJWoMpiePl6JCsg0XryGZ5ebTtSLeR4=;
	h=Received:From:Subject:To;
	b=Y5j3EZRQ4lLoKc3T0VuYpI+xpz4M0VNMFi/qLHsKJajCINA1Z8tlp/jf7aijjcmJW
	 q3GRHRsyPTH8XiIBz5h0lsR+Rqsq+iNlbFFBcvySsZlJqTHFXVF2gzRLvFmpLthz2i
	 nb3KU5vuSjx7UDiMF5zneciZSs696YEEoKwF2z5D0rIeg/NHFP9Hg/PslYNLRpydCF
	 8g26gnqot3NWEE+HA3LrTgf/FEIlUDRL2yvyk2AVNQAJrXZlQwvNDp1UZKU7UhIBHS
	 fgTRHV1EeeliOoM1bnAO644YHBcCujbK/rhJza3DWkh9e23dUzHwnKm2uyvHEQAtFH
	 ys6bu1MA5lCwQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37a49389deeso1489191fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 12 Nov 2025 15:22:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUM3ouphnh2otD6ZCEm8oIJ/aRnUEVKjkZurcKCWd6LEcQdhVGiabm3h6POuCVs+cEGtWPBfSELaiJS+q9hfCPfhJW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qcoGueOLFawgSCmCnNkN/Eeervmsse5SFPJ5LCRU3AKzvFdo
	FPM+Res1zIVrn4f3hzwqlJW9nKnglU5wGDvM6wd7rUSoxzNnFfVPK5pUkNP5oyDTXUoeV2FaQAt
	K10UkKnQXLmyJvJb2bQFNyA0Na1bnTBw=
X-Google-Smtp-Source: 
 AGHT+IFzo0UQ2X0XeTaQ/vFn5AfS3fybl/9nUp79VKRGvV+mQFMkl4jU4PPuHpP24Q+67epYQDDJ2v60oWc39pMohd8=
X-Received: by 2002:a2e:9e52:0:b0:36b:be8:a4f with SMTP id
 38308e7fff4ca-37b8c423d26mr9334121fa.37.1762989743900;
 Wed, 12 Nov 2025 15:22:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
 <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
 <74f91d3c-6494-4754-a10f-4d8c1d45f7ff@gmail.com>
 <CAGwozwEKqqJxxmtjJhy2MzNVhmBTMmy8xG5TZGkKJqJCgK=X5w@mail.gmail.com>
In-Reply-To: 
 <CAGwozwEKqqJxxmtjJhy2MzNVhmBTMmy8xG5TZGkKJqJCgK=X5w@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 13 Nov 2025 00:22:12 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwH4_5LnJ4kt-sbdwzL5Ezt74ddPOpGqvTvKiiVzkorSMQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnGc0vo3CyW2S_WuAXCYSRAPV4hs0Z0cxqv3HZyCqIFThkvFCBngajNLCw
Message-ID: 
 <CAGwozwH4_5LnJ4kt-sbdwzL5Ezt74ddPOpGqvTvKiiVzkorSMQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Denis Benato <benato.denis96@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176298974469.3888705.11505698685419990609@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 12 Nov 2025 at 23:08, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> snip
> > > Sure, sorry if it came out this way. Dennis had two comments on the V7
> > > version of the series.
> > >
> > > The first one was that asusctl has a hang bug, which he hasn't had
> > > time to look into yet. This should have been fixed by dropping the
> > > HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was a
> > > bit of a NOOP that does not need to be added in the future.
> > So it is supposed to not regress it now, correct?

I missed this. Spaces. Yes, quirk input per app created around 3 more
input devices per USB device, plus the dynamic lighting one, so you
went from 2 to 6, and there seems to be an issue with asusctl and a
large number of event devices, that caused some intermittent freezing
when the user typed on certain keyboards. I removed it. Although, not
a problem with the kernel itself, per say.

Antheas

> > > The second is he is concerned with dropping the 0x5d/0x5e inits. Luke
> > > said (back in March) that it is fine to drop 0x5e because it is only
> > > > snip
> > >>>>
> >

