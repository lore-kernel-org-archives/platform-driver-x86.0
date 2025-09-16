Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439CC2DEA6F
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006718; cv=none; b=uO5kbZIUHqVjiNtp1kNcP0SluuW2Wa4TXY9XI1Tz7uPt1QbtCs//lrMSF93RUCi9zhhdNCPx6Hg09m0Sb7235kGwYuBB947ynviUNW1fk7n3eoBMLf+RyhdcmhxJLCPMi19/L9SMRpl8Qr1unHg23HJPb1a5wLPDQr938AqaXxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006718; c=relaxed/simple;
	bh=RLN2/Kx+hclrsVDTsKQ7T1yBif3GmgeX9Bf4yGmzA7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYjxw4Ef1mmf++cwBPnJ9Z2kF7Tm1SvdeK4KDtPyrizv/ymaXFLnoJsnFSclZZGC2cXo3Q9IxvhaFL9KgK2Dvbb4IL8lyrtGEF0rRTVugBO/2EMjVYxImk6Mi6nCYyiEtI3ZKkBNnVBH0AiuYDVDUucKsIbE5bds+HhJyDOwCyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ROdtBSPt; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ROdtBSPt"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 040DC5E830
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:11:55 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id CE18C5E824
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:11:52 +0300 (EEST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id BA7F21FF5F5
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:11:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1758006712;
	bh=qhrfos9DlfkA+8VzXIFUX1eZ5x3lG8SvCX1WRL3Yib8=;
	h=Received:From:Subject:To;
	b=ROdtBSPtWmZTz2yulqowLvnJIzv/9Qswj4VBmmBrpiN9ayJo+Pl1vRMYM4eMnENMF
	 M3hu9R5k5exzD3gGwVWGyvqXdGvam7rd6lAcStDSey1GcQwCrBo/a9UHtqg97NLNpH
	 TRhTZnB9cRB1/KzkJoOb5UVIlWwZpBlyaUkKhSdQhEffXfHDCqCLE4eIsVNulFMkpG
	 HM3MRm3SQc8A/C6QI+p8t6P6U29ZJzw9LEZVXaAUc8Dg56IQXZGADBuZEmDkcsHGE5
	 f/Tnpl9ml68OBHJ6ZDOIeuDo0WaOpfrzU58VE3OIVYIJr1dKvCeZY+UhkHKjrJgbx+
	 DgTBb2n6o2oZA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.182) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f182.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-34fed7add35so37705721fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 16 Sep 2025 00:11:51 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx3ZU5yhWpAZd9bk17+VyD4Url52xa3wZKPOVH7K/0Qh7ZUomjW
	6EPAFpDFI9irsBB9At342S/ASS74Erv0M36Y5/KKr8BULBN5rzM+tj71CH88gGnbwGpJF8cfXcK
	Z1VNiNjDmF5sX0BagM2bFqToGaDf23nY=
X-Google-Smtp-Source: 
 AGHT+IHUkjwA7AqppSkVwjzQG4+MEShAyfXtgefJlYo52g1SBxegMidiHpm1VukWPM3nwLW2P2hYL9u0k9WXh5iiIc4=
X-Received: by 2002:a05:651c:4350:20b0:336:6b46:f30d with SMTP id
 38308e7fff4ca-3513aeb2e8bmr47910461fa.11.1758006711182; Tue, 16 Sep 2025
 00:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>
 <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
 <10020-68c90c80-d-4ac6c580@106290038> <1df-68c90d00-19-25b5f500@10458736>
In-Reply-To: <1df-68c90d00-19-25b5f500@10458736>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 16 Sep 2025 09:11:40 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEwenJcPkGohLGmeb+dWHyitddUqz7Vm3W6vGCwo6osUg@mail.gmail.com>
X-Gm-Features: AS18NWDk2-aJVm3uKL-IBTXnf_rjozS3RRVZUx7QRkEPP7XqkHjYdYBdWd2xkGw
Message-ID: 
 <CAGwozwEwenJcPkGohLGmeb+dWHyitddUqz7Vm3W6vGCwo6osUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Remove extra keys from
 ignore_key_wlan quirk
To: Rahul Chandra <rahul@chandra.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <175800671199.2894818.8391902638504554165@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 16 Sept 2025 at 09:08, Rahul Chandra <rahul@chandra.net> wrote:
>
> On Tuesday, September 16, 2025 03:06 EDT, "Rahul Chandra" <rahul@chandra.net> wrote:
>
> > On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > > On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra.net> wrote:
> > > >
> > > > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <rahul@chandra.net> wrote:
> > > >
> > > > > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > > >
> > > > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wrote:
> > > > > > >
> > > > > > > Added some cc's
> > > > > > >
> > > > > > > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is the same on the MA)
> > > > > >
> > > > > > I must have mistakenly thought that the important code on both devices
> > > > > > is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
> > > > > > both. Can you verify which codes are used on the Duo?
> > > > > >
> > > > > weird,
> > > > > scankey -s reports
> > > > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set but I'm confused on the other 2 codes. the WLAN quirk definitely worked before (I submitted the patch for it for the CA)
> > > >
> > > > It's for keyboard detach/retach, both attaching and re-attaching report the same code.
> > >
> > > Use evtest to find the MSC code that is used.
> >
> > Hmm it is sending 5E... But it is still activating and deactivating and reactivating airplane mode (WLAN)
> >
> > Event: time 1758006247.925931, type 4 (EV_MSC), code 4 (MSC_SCAN), value 5e
> > Event: time 1758006247.925931, type 1 (EV_KEY), code 238 (KEY_WLAN), value 1
> > Event: time 1758006247.925931, -------------- SYN_REPORT ------------
> > Event: time 1758006247.925937, type 1 (EV_KEY), code 238 (KEY_WLAN), value 0
> > Event: time 1758006247.925937, -------------- SYN_REPORT ------------
> > Event: time 1758006255.123129, type 4 (EV_MSC), code 4 (MSC_SCAN), value 5e
> > Event: time 1758006255.123129, type 1 (EV_KEY), code 238 (KEY_WLAN), value 1
> > Event: time 1758006255.123129, -------------- SYN_REPORT ------------
>
>
> Sorry I'm dumb yes 5E is a new code forgot we had 5F currently, guess we should add 5E then, can you write up the patch or should I?

Cleanest patch is a revert of "Remove extra keys from ignore_key_wlan
quirk". Should work for both -next and stable. I can write a patch and
add a ReportedBy for you. I will make sure to list 0x5E as the keycode
used on the Duo. It is not ideal those three keycodes are grouped
together, but it should be fine for now.

Antheas

>
>
> --
> Rahul
>
>

