Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F0E823DD
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332384; cv=none; b=USjoIhr2QIP+F759LcMdcW9iAxKIUiv9l5tdUQ4OnN98MXcfsdkchWTz5wbQkP5bu+OrTlAvLy92FbhVmo9mdqJGwMoiR9uIazqxZnlgEwjZv8vbd0yW+Rcc6YKBx197hhtOLtG2ZpZJ5K3nHhZWWrGn4j7BPHqD1kJLC6CeJ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332384; c=relaxed/simple;
	bh=3jFxQg0viyc1pmnTof6DlB8OXiYfMsLDFyR45eeG9l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNkHYMsSAy5TZW51HelrudsewKqfEk6BCEJMjgQpd4Ls14IdsZs5xRR36wB7rD45I8TAAWdCNE7hr+5jhv+LAq0NUNdxZ2koGpL3kod2LZSTdgU+6k1+Zxbqpm+fe104TX3JcSrnrztXKbMu5sehN/jqMgsrUs4HtkQ2inWVEvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=cOIiPQ3U; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="cOIiPQ3U"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id E0FECBC16A
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 18:19:40 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 6055FBC10E
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 18:19:40 +0200 (EET)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id AA0AD201F29
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 18:19:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1773332380;
	bh=etzLnRVq/0RraEquEAVm919244oOM6NrKea8ujezE/4=;
	h=Received:From:Subject:To;
	b=cOIiPQ3UtjWx75xoSznSIjfc1PGG22q1g7Kg8F73UvqPNy3Vqvjm8cWUSC0tlGzLN
	 ttYqiVMEvmxL9wvk1inL8wwQuO2D0ascwwVa2+A0BrUqUlD43C5ekaYE8TFSd5s34s
	 TLr8Wsgy9A0d7hVJPmniOaF4FgmVnIlzfrA2XWb+NmsI0H3MBekQODoQce43b4C5lG
	 6zWUynL9vFxhes8w3/pVlwrfKDGiybRrkVzFUY6kpntaq2PKvQR4qNxxKIH7dRieav
	 hOROPLmz69DQYWtgb2UFB8tA7TN/E9POx8rKyk2N1ha/9MCvLzFPZywVk2YHnyza8t
	 A1l8FYTkPEtHg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2aec4a71ef9so4284585ad.3
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 12 Mar 2026 09:19:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0SKoFAl9q9JQeq2wxEg/udT0trdLmqRjb8MtoObNrx254smiwiwbuPZuRR8XzdwYkDo8paC47401vpag8Cq3TuNbV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Cchn/7Wh//9NHqvSMkdUZaK5X4Sb8v66YMFHpripDMZK1sjj
	5rR3KIhxvBakC4P/CEQFhkkNKji3U9lTG2zZHwzpiQo/hcTWJlUV7BTCOTst7Hy5R2YIFBH0ZSJ
	FuLEDAl4iOXM5BRkp14I3V2ad95M+tRU=
X-Received: by 2002:a17:903:41c5:b0:2ae:a95e:fe58 with SMTP id
 d9443c01a7336-2aeca959d3bmr1097675ad.8.1773332378429; Thu, 12 Mar 2026
 09:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-3-lkml@antheas.dev>
 <23ee46ed-6978-40a0-9447-e7f527ec7c11@amd.com>
 <CAGwozwFn0nUHWrF6nmba1N9-jbDx7ZpLRe8GcYJAZsQ1MO0y1w@mail.gmail.com>
 <9a9e441c-850a-44fb-b659-f4bc135beabe@amd.com>
 <CAGwozwE9yn0fQxUPxZa70CyTajjvyWZjRDfWRs15fa_Xtf0sGg@mail.gmail.com>
 <8bdccd48-556e-4b9f-8f90-dfb1ec761073@amd.com>
 <CAGwozwGUPuY9_wH6Bi+eSVm2o=F4Vgdv+URo9aTQ366vwptBOQ@mail.gmail.com>
 <9843a54e-fafc-48cd-b92f-66cff9091848@amd.com>
In-Reply-To: <9843a54e-fafc-48cd-b92f-66cff9091848@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 12 Mar 2026 17:19:27 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFbwb5dWXhSCDEbYz1myaQh_5kKNtqPZL5TE6dPr49PbQ@mail.gmail.com>
X-Gm-Features: AaiRm52f3enTI4Axp-SYbp0mqK5EZhi6mp26OlWLIme1Cu_GZ6EqP6VHcJ1jdYQ
Message-ID: 
 <CAGwozwFbwb5dWXhSCDEbYz1myaQh_5kKNtqPZL5TE6dPr49PbQ@mail.gmail.com>
Subject: Re: [RFC v4 2/4] platform/x86/amd: dptc: Add AMD DPTCi driver
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177333237999.661845.10937168040181990468@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 12 Mar 2026 at 17:06, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
> >>
> >> So please; do not make assumptions based on a lack of hard data.
> >> If you don't have data for multiple years of a system or multiple chips
> >> in the system, leave it off your quirk list.  They can always be added
> >> later when the data is available.
> >
> > Specifically for GPD, the userspace implementation has been tested on
> > all generations. It is fine to choose a (lower) limit that works on
> > all of them. The thermals did not change between generations.
> > Saturation above 20W means that there is little difference between
> > 22W, 25W, 28W, 30W, etc. If there is doubt, going lower is fine. Even
> > if one device can do 5W more it does not matter (but the chassis,
> > battery, and cooler are exactly the same; only the board was revised
> > for the new SoC).
> >
> > 8-20W is the sweet spot for these APUs. 8W and 15W are sane for
> > low-power/balanced. The only question is how close to 30W should be
> > the maximum and where performance should point to. This version does
> > 25W for performance. 20W might be better for daily use until AC/DC
> > detection.
> >
> > We do not need to complicate things. All this driver needs to do is
> > expose a slider from 4-30W. This covers 6800-HX370 for all vendors and
> > matches user expectation. AI Max will need further research as I do
> > not have a lot of data on its performance curve. Ayaneo had some drops
> > between 2022-2023 that had lower TDP limits, but there is less than 1k
> > units in existence.
>
> User expectation and reality aren't necessarily the same.
>
> Performance is tied to a thermal design.  A user might want to run a
> handheld at the max performance, but max performance is not purely a
> function of the APU.
>
> It's a function of the APU + cooling solution + power distribution.
>
> That's why I have been saying there need to be different values for
> different parts, and you can't make assumptions year to year.
>
> Even if the external chassis plastics are identical, a different fan or
> heatpipe might be used and those are non-trivial impacts.
>
> The values used should be calculated by performance measurements of the
> entire solution in a thermal chamber.
>
> I know you're not going to be able to do that, but that's what
> manufacturers /should/ be doing.

Yes. Pretty much. For this class of devices max performance is not
that important. Users value being able to select 18W over 20W because
that means they get an additional 30m of battery life more than say
running at 30W.

So it is not that big of a deal to go a bit lower. 30w vs 20w is
already 15% tops but the resulting dc in is 55W vs 27W. I know that
when it comes to manufacturers, an additional consideration is having
an edge over competition in mainstream benchmarks for max performance,
so aggressive tuning matters. Esp. for laptops.

But mainstream benchmarks reach for the TDP slider now for these
devices so that is off the table. This is because they also want to
account for battery life. "Manufacturer X gets 20% more performance"
is meaningless when you get half the battery. Not only that, but if
the presets are too aggressively tuned, users skip them and use the
slider anyway.

Antheas

