Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B163DDAED
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 22:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497219; cv=pass; b=MCeKvGlsQK7O7elEnD9RisbhKlZ05JiLd6Yj4tY+tDgh2YbZY71ELaFBpq4kZX7owyO6+H3Kbix9ZPYkJitPsF/lZAf84zkNL06uyK+TudDEB7e4SkXuKuhbE0VzWlqE4s6wPAvKwha4JMGJqaZ31qhTRq7CTPQ6m7r03d9J2Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497219; c=relaxed/simple;
	bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJ+luEzugLwTE4eVEoaZTRUlbuOPEtrLQPlZIQJq982nXBIDW6OOEoV3IWmwq+QUxIKWAoGT0SGLofNehXO7xZ02fdC68o4OPxPWmRzhpl8zAMAijfXGxLuMzyQ2klP3ou6616V9T/27U2bSqhO+2t71Y41r4pKqWaMAe12DL/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1vkKEqe; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1vkKEqe"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5253712c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 15:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791497217; cv=none;
        d=google.com; s=arc-20260327;
        b=XUHaLRb+1qaO2LhsZ/LDnbnMeTnngSfRkjy1OIygCNS92CJUVR983EPsyfFXcPRutz
         na1sFQE10GH3iKREz7/Lvnt5zMWXBthPNKe5As0dtP+iteRtCfgFzq1JXwrvV9VANbWs
         U0Lav2NUclxT7Jy4a8Ae3rAKUtQNv7WHcfsEU0/7cTbZ3Eo//5ZhFJ4XdsDt9kOHT3ol
         EHWOd1vWLApLc5AB9agb0fW4xxjNZCm9dmuiy3YVcbWLVQY1RSjkah7/MhEKeOXL93wB
         iob2jU3d2ay8rK42lhB8ovgiShwoARYtgu2bw2vsa5XEdOFHjXonw/w6kw1r8nd604TI
         u7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
        fh=4CURK3yYFl2FGJmpTaID3yj+oeQVKGo2LQOk/d7qQIQ=;
        b=Lv7/Vgct5ckPMfUFe+5PQeGNypwWLHdPIRUgkYn5w5K+nCeUYGCmwSxd04GDf9Pect
         96Cw17hWFRx2MAIMBSd7YvE13mhbwZ5d9vJj00wWwlXSTQMOv1inXbtVSqiMBqvohc/I
         hctkHEcU6qIxAMxcbkpEkxL+h2zlt34+DoVXubVyYocY/yRH8pX5M3Xu9nlJnztN46Fd
         Fv+r0NAeU6wfRFitAdGsRBdBiytAg0BUhCWf7/ELx6WJfT1T4Xgdb8fmje4a+/6mWV2c
         ndAggaP7Yi8Y7POVh5CD37kgP73o53z5jDOj5mriFuIWoVum64o7Qd0y8zLSwFDWsRMK
         iROg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791497217; x=1792102017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
        b=f1vkKEqet1+Rex5d2zo08YKGXcgamUj+Np1KqHjJ7UGhYY5vJUB08C+55i+THsyfaA
         6b/dTbqZN5yhbPuMDtZAd+k1r9ZxnAB7o0TGkW89nqziQ30QnJj0UQKLBmAkvLxRUW07
         rhmUHMHFNU4GLvn0ioeBc7j7MAe9IxYO2oPNh5a58kCjym5M2itxBvs6G+2Acq4WgGgb
         KSZY3QYTroABtUCBiUqYNazDEb3omGBdbiAi5THDwdNqriWcU+kVb2jFJf9T7hMEz3jT
         GZXVmlKInkwautUf76S0mxvBerrdVm+qUkjC+PL4m2bBP17icBlxN30qJt0uuQgV5PsU
         GWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497217; x=1792102017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
        b=JmaTO9TZtgb8p2xmlzZMa8dOxM5w+rGGDdYEH4ThIzbrEe4gSZrPFJXer9LDsxf9gO
         biT7wZffTvavOAtPKyvL+P6X0YSsLeRC+FL2ViTAr9TV1K6ZDylaCJ3e8QFEWyZF+76w
         sZTsJRtRDF0M6BNlCAlun1cSF9LgvCjoju7ox1AywmwyKGxvJH748geG+k989l9D1DCf
         YM4V5yxCLMV0MgBLHw3kceOt0nEQj67PqYGgHb/3WLQs+19jznM/oTosAbGDpGfQTyQ5
         uAoVjBJoCq1PdZgcBxKEl64HAEdsfPoopQAg+iv+Qf2UNkFP5cvzbWFds3dYrXAUu0yo
         tIbA==
X-Forwarded-Encrypted: i=1; AKwUvBwbaS3o5pLnTK4ccQnBA7YZK+2c7ItGaqDaty6FCZb7XJzssM0In6KiWLWIpfWxS+pmA9hCPNFbOkV/t6Sl4wollBE2@vger.kernel.org
X-Gm-Message-State: AFuF++lPp425zcjXGzwEnayHMuRQMSNFZQYXMDLkPlGHjLBa9gIQ8cbS
	Quo/Ty7NjDF4yQd6VsjFQBZkRV6weI59ZnvnrN4H6TrabA5N/3bIazQTsfCh+zdGFTFTga4itZ9
	gNbKGDAVV4J2f8z8Wa+JJFb0eQAQv68Q=
X-Gm-Gg: AYBFou3Ey6RbU2BqpP7CERwn6SX3f0feTPl9zwCZSewMRqYMLj5tQNuqinLutiBe7T9
	6PT4MJqxQO/kaiotSAp6UPmK9w2ce1LEfdXX3Xo3OBsmn6jH9oYfeqV7kQTDSE0sV2Crtmra8D7
	HNAzcHDZF2bYJKm8gZGTZntwkiCrhA4gr+GPB7QOB8hqmqqcwUaJ6MaGnVMtMzkSMJmcj5EhqSr
	Oay80NRPU1LYHn3AxCTbGDXuMqm2NG7TZjmPNZKLKglN2M+oxIiVHL1TPzYQ0myqRgUUnsZ6yjY
	XF+lA3efUehvZpioQIhEdSizsgOPLzLu96zoZ0vQAnm6ILU5a4Lydbw0NBhYqIfWTPCYibdySZB
	WvZB1aw1qWXqrFLvwqpj4ZGn2EULMaXhQjOVbGCGun68ASwCj7A==
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id
 a92af1059eb24-16208be0009mr8318995c88.41.1791497216698; Thu, 08 Oct 2026
 15:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com> <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
 <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com> <20261008-tm2307-tm2309-entry-uselessfire@gmail.com>
In-Reply-To: <20261008-tm2307-tm2309-entry-uselessfire@gmail.com>
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Fri, 9 Oct 2026 00:06:44 +0200
X-Gm-Features: AclHuK_7edxLVp0ZmePKHkxTrJkoL11PIOzToLsoDZnlHxm62_q336927ucqfRY
Message-ID: <CAObHBTys45jfPro1PhNBgYVzM7mozMScE56k9Mt9mirmEuCCrA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: Anton Karasev <uselessfire@gmail.com>
Cc: qby140326@gmail.com, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	W_Armin@gmx.de, ilya.gladyshev@linux.dev, kento@kekto.ru, 
	ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com, 
	btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com, i@rsplwe.com, 
	bozhenpeng93@gmail.com, martiya.ar@gmail.com, aleksejirlik@gmail.com, 
	zsanya322@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Anton,

Ran your questions on my TM2307 (kernel 7.2.9, for-next plus Chris's
GET-only change).

On battery the driver refuses balanced-performance and performance, like
you said. But if I write the mode straight to QFAN, both 3 and 4 stick on
battery without complaint. So same as your TM2309 - the firmware is fine
with it and these boards don't really need the capability check.

Fn+K only ever goes 1 -> 3 -> 2. I pressed it around twenty times while
watching QFAN and it never landed on 4. So I agree with your mapping:
performance should be Turbo (3), and full speed should be max-power so
nobody gets it by accident from the desktop slider.

You're right about the suspend problem too. My patch didn't handle a
stale 0 at all, so it would have broken suspend the same way it did on
the TM2426. Reading 0 as balanced makes sense. Thanks for catching that.

kb_mode reads back -EIO here on for-next, so your patch should hide it on
this board as well. I haven't built your patch yet though, so that's just
the precondition - happy to test it properly if another report helps.

Command 0x10 looks the same as yours: subcommand 1 reads SOH1 and 2 is
bit 0 of LONL at 0xA4. The only difference is that subcommand 3 compares
ADPW against 100 instead of 140. That looks like the most this board can
take over USB-C: ADPW reads 100 with the stock 100 W charger on either
port, still 100 with a 160 W one, and 0 on battery. The ports report USB
PD 2.0, so no EPR. My limit is off (LONL 0, AFBC 100), SOH1 100.

One more thing, since you use thermald: with int3400_thermal loaded,
thermald --adaptive sets the MMIO PL1 from the GDDV table here too (about
25/50/90 W), but the CPU still drew 27 W because the MSR PL1 stayed at
28 W. Restarting thermald puts it back to 28 W; profile changes don't.
With it opened after thermald starts, sustained load settles around 56 W
at 101 C, and balanced at 45 W. Does your MSR PL1 also read 28 W after
thermald starts?

Happy to do the joint TM2307/TM2309 entry with you once Chris's series is
out - either way round is fine. I'll put my Tested-by on Chris's thread
rather than here.

Thanks,
Milos
