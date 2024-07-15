Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32E18E777
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721052899; cv=none; b=Ku2I5HVfij69wLdboMVGO+SFM8EhOizHAFn4SJCaJT4lvPLCqc8luj7xsA0/Fcu1upBsizKqo9ivC0YtRsaE4bedsAOZS/umtoL26mqdv4V7Tq1RvRuQB4+A4k+w/m0wxmKaRgx+WGE53gBkZygTWxm+ockXFwAeq6UOy12fM3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721052899; c=relaxed/simple;
	bh=PYdFvIN/t/QII3FMH7NPnQRSSlHxToHEXKzIGk3YxYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ak9fs7r2HhjszDjOMFAup445cp3JVxsohR11dDH4Phcxg9RmMEaygC1C0+q6VFhYCZscM23eTvn/abhROFbttvQoaAK4sQfu7NNBYFR9jctbaGP6F2+rimZAATOpUZ15HFTFRkdb334TABF05p5ar3pACiX6c8FlZqBtR4mvVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mraL2h87; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mraL2h87"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42660b8dd27so29226925e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052896; x=1721657696; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qgiSYy3i4APvcvJICUk8KksbWYEgdz68cMCbthcBmfY=;
        b=mraL2h87mvzkzy1lIUEcgItXC+g7xHMEN0NDEo/jPO5gJHz6JwQUgCBR5z4p1dP5xo
         MyQN5/ZfX5bzVY/oiPqsJzu3rsjY7L6JOlL8Z21JsDh092gSfbOs2LoQIsWHje8YDx9G
         InON2nxpZAWT551YbIR67nC/soYnvaHo2lyjVAm9HfF6V4S3BlnEQtjcwpSUDFNsxTUZ
         qd0GgARtItoDGFwlX0sMQi8FVOmdaZYf09aJGvbYR4ukFaqHMsz6+xJ0WBdt0G0Knjek
         ZPqVgR0iPUIGkhb2h2dvszAVq6+wRqs0tlYH6RINx/oEcEbHs1D/HqmKY1Dm4It6kJkO
         sNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052896; x=1721657696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgiSYy3i4APvcvJICUk8KksbWYEgdz68cMCbthcBmfY=;
        b=R6Gn8pRQyizYTEWZ4UNsX2+BSIl+zzbv25IAAoSVcc9TY122CFfgHZY2aPiCScbfVM
         AnqUBM/1z1S6U4igIX4ZRLF5BO5QLniauzQ242i6DX9CflAVDbUi/3loI3fYvfRsD3zf
         JGTLKU6sbfMJVMLPynQs70vGVmCQbLXUyCEJ6lwurn4eld219HW+ewEs8H60Wu6uXEjb
         /5rGkoTYkxmzt43KRhtZFReYCUn8iEUupxQYB2U3fkpm259VOPqQMErkjZ1xz+yB79h8
         DDWjWccX0IulpIuXcM52xzUXkjGym2SV97p6+i1BNoRaNWMwWDkaVpJZh9IvTK1hcZHL
         I3/g==
X-Forwarded-Encrypted: i=1; AJvYcCUhTBZUojScH0N91nAAe7jnOFZV4Q22nDSe23A6dtgnAEHunbuCaMiY3qdy5W0t35jPUH7rLt4mFgeChR4RGmideAANP/KFfUA9nuwygQ+2dcYnng==
X-Gm-Message-State: AOJu0YxOkv16olRjfAsOUbLb/qlPJ0xtkp2wbBExQgO0cyBYJK4DxK5+
	incTLr5kGBgezFtAfoaLDw2UY7tzAqqr3y05ynWDj2xU/I7+5rXll2qllg==
X-Google-Smtp-Source: AGHT+IFKyq2DEWDIqyse8iACKHJG+bzXKHl8A2zq36gjZkw/CpEhxyHXCCtFL/MTzYG1UNji9ChAig==
X-Received: by 2002:a05:600c:3013:b0:426:6320:225e with SMTP id 5b1f17b1804b1-426707ce47fmr134368085e9.6.1721052896179;
        Mon, 15 Jul 2024 07:14:56 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e7749esm89668805e9.2.2024.07.15.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:14:55 -0700 (PDT)
Date: Mon, 15 Jul 2024 16:14:54 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de, hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: Fix implementation of the
 platform_profile_omen_get function
Message-ID: <ZpUu3o1j8FQyfWnA@alexis-pc>
References: <ZpFnV8w1558BW7iZ@alexis-pc>
 <d616eb65-dd32-faff-2fb9-686305c1810b@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d616eb65-dd32-faff-2fb9-686305c1810b@linux.intel.com>

Hi Ilpo,

On Mon, Jul 15, 2024 at 12:39:22PM +0300, Ilpo Järvinen wrote:
> 
> I took this patch but there were a number of issues with it I had to fix:
> 

Thanks a lot for your attention to detail. As you can probably tell,
it's my first time doing this kind of bug-fixing submission, so I apologize for
that. I'll try to be more careful in the future. :]

Don't hesitate to let me do the fixes myself next time -- you certainly have
better things to do than fixing this kind of stuff, and this will help me
remember how things are supposed to be done. :]

Still, I'm very thankful for your help.

Hope you have a great afternoon!

Alexis
