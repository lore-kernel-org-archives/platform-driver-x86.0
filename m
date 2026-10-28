Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210855;
	b=ABRSb88qcxkDWAakxuB44CdDalv598metijgV4HM+fuwcranuUzcV2VtCsR9+Lu6SA7E
	 BKj2CksEZddXD+UZ/ZxjUk8DDheAToC2q8cNhr9+2VmXgQxpy5aLNc5NSVKlWYFEUDU0x
	 ZHShh1W1uAuh2cI8pwGB4yg0oC+uTae7Xl2OdTPwe9oDb0gGmstGPYbmzKiSWMrBoRCwq
	 mfsWGBA91qEF84co2FUhx0ZbhH47feQXZIiVOxeSJj/1iBAop7b4WfeAIrkCGFcv7Dopa
	 19JR5kfoWtCvCjr8AAlBlySS0T4e97WWMrRFnqnizt9+qCdhv8spqUAGyQ2OM0FjPkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2OL11FRKL8kHfKZ5ZhNZS3nh+yPIRxt+OMgWHODiXUA=;
	b=UrUV5UMym5UnvxXgo0s9HJo43lrvAVsKUt+r49ZxzmQFZEvkHnt4dO/sGE2kbr2lDDHJ
	 SlBwbSrW9ks3UKiazmUWc9ocA3B5600oQXvdJ5fi1YxGAIzaDoJd5nPlJmvk+OUzPkMKD
	 P/pYVr99owpR8cl3nG3ghz4tkzY2AXl/DA1ZHg/0PszPWlxDj6SXwpp/SYw+UMnYZWRFo
	 8xTz2eXQPnwcVR8ENd2LCXRiSfe5W3OVMa1Dm6s0d9MgN8nxfy8UC5adjr1wtGb1NkaY7
	 SRph/lBm5ElPNs7e1pUSPWLWPNm2fSLX3TmTaHCtVCDIciNvnXwYeSyDYjehpO36Onw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dV4VSp1S;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D7606A32E
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 18:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640D7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dV4VSp1S
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so1634623a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793210853; x=1793815653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2OL11FRKL8kHfKZ5ZhNZS3nh+yPIRxt+OMgWHODiXUA=;
        b=dV4VSp1SPDVPe0ga/si07+VoR33MajaUOVkEvYA6dEpx7jlrDMriVDFIVcYynrUHMH
         sHKbf3zT9awIOicfd+9ZFSRyBTPNaohJ2L1oMjIDnLyNEdi2gzJ1x5AHtlQdkd3tXDp8
         gGKBHpj9dDeaGrA2SKbAYpassyZRVQtsLQa+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210853; x=1793815653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OL11FRKL8kHfKZ5ZhNZS3nh+yPIRxt+OMgWHODiXUA=;
        b=TVngZ4ptbqxwCPvLYxT2m5+/FHxRwDqTYH4JIPEfjwtM/jir6bnPJWpDX5Wc7XNveu
         84+LD9qjdDg3pKnXCGKY0Vzze2Fyj4mfNArGipky3XbMOcILWgbeLBUK7c+H3KevB7jf
         LVAbwqUQKFhMST9//268FA2Suy8Y7QxUpsLgF4Xuq8RpB/aNKGEKdIgShq18jWEK2ket
         xGAzzBbEtKdk1CxzmGb/ZWZ+xMbCJ4vh/P+7TL617vqcwZQR+KGTaT4iO1OnoA1cfgGE
         a5WCBSebeXlm1Vxt84sQKrB+xSt4AdjXjNHpfxBpfBA41cR+8KzQXmpHvMoO3f6nWMKF
         m6Lg==
X-Forwarded-Encrypted: i=1; AKwUvBybsUnKAuNHdijbR06n3hI4ofbbE4Fn0LfjqIToKua8h2fxfKKj770f8GnQZ2bT3YubHkZebAJWcqhCOUHTwFmLwNtd@vger.kernel.org
X-Gm-Message-State: AFq9FYK/9AyD9/UhkSuOOk9P39PHzVJXJxTUttZmJlPdG1AVMv+P156Y
	gZjsgcUMkDur3X9YYRc95kKbaPFJc/Px3Yfqn/mBXilViJdanNHvNgn8dryn2equTKWSWK+CyLI
	e7S7Lho0=
X-Gm-Gg: AYBFou0YHLhyWzijYEc4HvR28jVidDSwOPFZMZp4MgRYAZQBbspRZKm8NQp6S9NLYPT
	YK8rwGymTLQLvg3BavLIwWeIxFXNduI63cfAmIqhCGTcSyfShpmbTNLB0vbbOph8QeIXKY0jo7I
	tAGcbWb/WImHR2nICHnJq2wqh+1Gco1V7ObIj8pLwAc6xownF3KddqUyhkKmmIxH/dgzxzUSX2k
	1TPsTdDs7gepJAlYAb4yKXlvOrMv0q8yXkEW9Ax2Gc7iUie9AXigbkZgGoBsrDo3/iJ4B6XHiFh
	Yrlo9fpXljGsy3ffxWMwCzlFjC5vxF/aBvrZPYaj14d7h0dlFPZNhsXccWLrB8OXss1YS+bNtW+
	qdUuWDDgFjFWq+zdvDDvbbYFtYvLFS3OqIODTxuOOizJc/v28pvlAUacGXGJLHT0FdEyQrlsl/a
	CUMFVTrkr4Nj4aNmTAs7BlVHDZDRIlR3f2XTh468RfNqSZMKiChGazjSn1pQibFQnORixvRTPEa
	ZrD4XgKzbC+Ib0cKWsn7IRyEoByxSs7BBbiZgywMbAa29jOSfgJOMFjQKaVm1e9YrR2kdMsi//w
	u0rdotWB1PR97/s5z/9Z+AOihGnJfXvZWhN+2ObesPw6UqZlowTvlrKQ0vs0FwZVMsgCcVyHUHX
	fr68=
X-Received: by 2002:a17:907:72cd:b0:c32:3da2:69bf with SMTP id a640c23a62f3a-c49bdf3280cmr278932166b.30.1793210852439;
        Wed, 28 Oct 2026 11:07:32 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm640341966b.31.2026.10.28.11.07.32
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 11:07:32 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3fd91337baso212360266b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 11:07:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycL8wYm7zhWjNCrEOAfqDxvoeTvP9+7cLipkwsrd3bReUYHPnlj/tUIohREU104+8sAvVg1yCJi5A5Dm0AaPpyJX+V@vger.kernel.org
X-Received: by 2002:a17:907:9489:b0:c3e:e677:563a with SMTP id
 a640c23a62f3a-c49bdf8c4e2mr280067566b.47.1793210851782; Wed, 28 Oct 2026
 11:07:31 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pdx86-pr-20261028113441-148823082@linux.intel.com>
In-Reply-To: <pdx86-pr-20261028113441-148823082@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Oct 2026 08:07:14 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com>
X-Gm-Features: AclHuK9F2Tw59uoogHDfU2jp4E90qH2bThLgxFDfqQXF6CsV40i-lIh8iIXt2xY
Message-ID: <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Oct 2026 at 23:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Highlights:

Please, people - give a *summary*.

Not 150 lines that just re-organizes the shortlog with some editing.

It's not a "Highlight" if it just repeats every small detail. That's
just a "list". And it certainly isn't informative.

I - and others who read merge commits - want to know the big picture.
Not every driver detail. If I wanted to know the exact details of what
happened in some particular driver, I would be reading the commits for
that driver. That's not what the merge is about. The merge is about
bigger issues than to see things like this:

    - intel/pmt:
       - Block mmap when read_telem() callback is present

and that's just one example of a *lot* of "this is not a big picture
issue, it's a small detail in one particular driver".

I suspect one thing that is actually a "bigger picture" issue is that

 - ACPI: video: Remove CONFIG_X86 dependency as WMI now supports non-X86
               archs

which is something that people might find interesting in general.

On the whole, I think 90% of that list should have been written along
the lines of

 "Usual updates for laptop quirks from HP, ASUS, Acer and Dell:
    - new model names and recent CPU support
    - more special button / function key handling
    - battery and hardware monitoring quirks"

or something.

Please *help* me write usable merge messages that are actually
informative and not just a "data dump". For the data dump, we have the
details in the git history.

                Linus
