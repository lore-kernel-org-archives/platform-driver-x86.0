Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB493B961B
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257196; cv=pass; b=CJMw0ibssZBqbzImOouH5LF6rOTGrm2+Ap8PUOHv4rBCGhlCi+wPmntaSmOzMPGgaVqcDRDHeudlNitWlKJldpsi3Wo+DaODHW8wLVK/XGCV1e3T9Dl3FP08jUvia6iTVVUbjF0MtsypIOz1Iv9Whm6JIBwrBPlqr/pCkKLQ7qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257196; c=relaxed/simple;
	bh=KK/6HWZ+d5OiLSob8WEPa6l+Oq0ZCC5OK2DI+kb6CZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWkhdMirRtyklddxrKGyzEk++FhjkpDxgJ+lk4JmgiG3lurqM2kpIznanloWsiSpc4ChdelnQVRtlif9XsTDLkN03C8oaLCzdsY1xozvlHSlNA4DL3Faz31b2r+GXodjD6Nia6mIur9STs1YsatuYE8ammB3p2ujpoMl/bM+MZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com; spf=pass smtp.mailfrom=miget.com; dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b=OqO/8WI5; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b="OqO/8WI5"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53ec2cc397aso336784b6e.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 10:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792257193; cv=none;
        d=google.com; s=arc-20260327;
        b=kFUYh25FTqSp3yqHnGJQgcgIi+aqw3BIM7KbR1CX16OMg+B0Dl+TyooUaK1EZX+Y+I
         qf1LuCxnOf6YcPeP4uBlXg2YSk+h9SZKGed1kIhv1i8XyZN7U26TvY4pfSPJdwC5jSRR
         yUePuMzmjkjFQZF+o4+HiJxBqhkeflMZVxv9pGzPCnMNhjvwMtlNneDcQ6qlDVNpYGUP
         znt0U2IPn17bDj4l5faJsclNMhBbceCsU0V2fwIybaBw4tfvGfh9FYMzcVaZcz3LqgEp
         fa/XjMLTLHyQvg8DAssRpwIwO0qk2OTZM56rHOOqKoO6ORuCEn9tR33+p58iNfLmPflc
         NAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T/Y1OukdaSXyrw1Zr7uqBLhMe38c1BeQbrBUuBsxqXM=;
        fh=35irA5FIabnWTt9MLvp6vkf8qHVG7l66aYlY9Uc1DkQ=;
        b=DhEGE+qJtOtJ5wnhAKoQJ0kAKXAegFwG1XKaEZ/+lB1Rai4+40/NRJfD6mzId7V0Rq
         7mv/S0WibZtUfDR6E6oIYMz2YtphdNj8tyMt3HshPkL0tadNKRbbhe+0PFjgD6pIRe9l
         gWVuoZcTmlsT4dIjSOVcyTBEm4N+fLhai2aeiRbbZ6ZdiQfg8SpFKY8yKPGlG6GIezI0
         1N8r6kjwsgUA1xGHIKdgdHub5RH+qa7xw3CGFSrWUAU+F1p3ip0eS+ubOPoFP9oW771f
         AW6tv2mmfLGjZP1LQRohnoCcGZJuzDRisqSIrdApUyIA+zYyqqhr3XXBE5GsAJp27hkf
         mFUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792257193; x=1792861993; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/Y1OukdaSXyrw1Zr7uqBLhMe38c1BeQbrBUuBsxqXM=;
        b=OqO/8WI5GvGBz44FQK8uD6EkxMQBvkkzL7guD7yF1rU1SLJ4LGbRGqaj4sqCkLbXQM
         AGLJwdJpGz7EkNUsNGbTUDHB/nqISts9tNVxe0W2gG6B5+DIV/GrJAQLdtjmuKTrEsEc
         f1YIKAvrttmxODmBAoVxKV6ORrB2+SxkHRW2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257193; x=1792861993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T/Y1OukdaSXyrw1Zr7uqBLhMe38c1BeQbrBUuBsxqXM=;
        b=h5EOMvLiZbQldF65JQl5XwhTuN9u9GTdGEMghsZzGJ1Cc8uS8XD2YMWWkxD7SH9gse
         MQqJ+rZbfwZ/V+D0w7h/ltS0oNAXtQ8/8jxFR4U3C/bBnws9qP0fngp8qv/wY7tT9DmO
         vuBX3lntuxFAf5nrfJP25DmINQPPfE0xA97lY1J3F1pQqjhGZ/aAcSdiFkWE+iSHwKRb
         ERsuBSxC7vKz5XtuHPsaFY69m8OAdmwiIUtleESSIFDtxznHTn2UKt0SBrod/AurVNmQ
         UbGVl1IzLy7MfsOgOp7S+NTvW0oBsC9z/lEGWrqwr7LME7Ep1eVjEHko2ci67bD7SMSO
         yP1w==
X-Forwarded-Encrypted: i=1; AKwUvBwqDyVfvByy9s6fA036vOCVXa18B0X7xlQtVFehzSF14sZUKRLF57d9PVLES2V8mlNmRa149ZCaobgeoJC0wl5uITVI@vger.kernel.org
X-Gm-Message-State: AFq9FYLO/DuyRq4yn8sqe79D5vPeYVMH6sUOxsxpyGzMcUhqWSp0Yk0C
	kwwAfnLuqMrwy/XAKUgTe6KYVhVQbt9Z+irrGzn9y9uPhLyTRzSaF+8/A6uyLVtPakxTMDP1z1E
	1D0MAbPP3W2rAXggqswfDB1j9UnVIVchCyx2Fx9szzA==
X-Gm-Gg: AYBFou01t4oY7Zbu/qWmPBPXv/4FV0GxOxU+nF/D5+kSFWdVxTdLCSnCNCcap6BfLTk
	KvUAGyl+u0VlyY3jz6r2Ug0V05NUWp4biHqJiSsWt/LOmg8OMk0xngq0eZ3KbSXEAxxQfgvJVp6
	sjmp57Lj7ThcTcKE7gzaKoo2oH5jz0pBACi30APBmGGRy3g/HEtiLaZsmddjymNt/Q4X9WuMv4U
	vpraPYmrIXXhYfEvc4g2x7f/qk95fh88+GbhM05ZVx82gKnz7tjeD4DSoLnc4156pJ15YXE2b9K
	fGwBazl9+HqnMIGkEUOXUCAz2jtbSNu70bAzPJF7bO6z2KkL5j5Acdvtb0YOM1oo1DzgrVhjnDY
	LbzmnnVmvydIi
X-Received: by 2002:a05:6808:3010:b0:4d6:93e2:5bc1 with SMTP id
 5614622812f47-53cd2a5cfe9mr2177806b6e.66.1792257188784; Sat, 17 Oct 2026
 10:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
 <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
 <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com> <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
In-Reply-To: <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Sat, 17 Oct 2026 19:12:57 +0200
X-Gm-Features: AclHuK8n5EfYY9SaP2lrJrOiRKsWmEW7O5PHGE7-d40srHBfuwEOIDu2OL5plDM
Message-ID: <CAAcRvKPfrFUS7vC-F+seSJyMAWfK36S-_UoQXzRy3R_udpVJPg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: TuteMthCD <matias.civadda2342001@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>, kento@kekto.ru
Content-Type: text/plain; charset="UTF-8"

Hi,

Following up with test results. I tested v12 on the Xiaomi Book Pro
14 (TM2424, BIOS XMAPT4B0P0909), applied on pdx86 for-next and loaded
as a module on v7.3-rc5, with a local TM2424 entry: 0x02, 0x0a
(no_set), 0x03, 0x09 and 0x04, plus skip_ac_type_check and
accept_zero_function. All four profiles apply on AC and PL1 follows,
and pm_test=devices suspend/resume is clean on AC and on battery.
Without the entry, GET fails with -EINVAL and every SET with -ENOMSG,
as expected.

Mingyou, two more things:

1. In 6/6 only -EOPNOTSUPP falls back to balanced. Without the entry
above, restoring the profile fails with -ENOMSG and the resume
callback returns it:

    bitland_mifs_wmi_resume [bitland_mifs_wmi] returns -42
    PM: failed to resume: error -42

A failed restore leaves the machine usable, so I think resume should
warn and return 0 for any error after trying the fallback. The same
goes for suspend: bitland_mifs_wmi_suspend() still returns the
laptop_profile_get() error, which aborts system suspend on any model
whose firmware reports a value missing from its table. That is what my
earlier "Don't abort suspend when platform profile access fails" patch
was about, and it could be folded into 6/6.

2. With skip_ac_type_check, bitland_pp_check_capability() still
refuses balanced-performance and performance without a power supply.
On BIOS 0909 the firmware runs 0x04 on battery (PL1 58 W), so this
blocks a mode that works here. Kento reported that BIOS 0707 NACKs
0x04 on battery, which bitland_mifs_wmi_call() already turns into an
error. Could skip_ac_type_check skip the power supply check as well
and leave the decision to the firmware? Kento, would that be a problem
on 0A0A?

Thanks,
Chris
