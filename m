Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF72741B6
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 03:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431339; cv=pass; b=PwIZLkdaySu4TB2+7QaIq9inz5C/x/rlyLB4gwbcvw6CIJtk4nH7JxOGA3nwtiUEYMV/UhsQvzYwjZCIN8xbDTZzuEaivUGS1iZBHmzMO7PYuU1ZhQ1iI3BAWFG30fSG6ctn2qsb+7LhuXYIYO3Cwv7PDPaUSHAZ8Y7ogFGHnXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431339; c=relaxed/simple;
	bh=LPFU61oTqBQe4zEAKUWR6UAJEHJ7Fl8Qnrkmu7wriAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5mFRtcIKwkTwjq6lz5jscJEU77TZpaIkbG0kuyoJ2lrCY5t6r3WsSjhMxVZG2Zbk7uq6D3aHa2xhEhz7PQmvLugi5Hkiflb3JQxNFSNpeUIGlQWEJKmOMjuODyaTnHnz4Est/TvOd2/jvXXuVkg7B9yurncA+feXwtRoGwRBd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2fN53oj; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2fN53oj"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33c2520ad38so5963836eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 20:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791431337; cv=none;
        d=google.com; s=arc-20260327;
        b=p1FECH3UMfIGIeoCv8BJ58+0IHT/xSZMfqbEJqPGyi/gucoyoR+ARAS4YSQtGDigk4
         lVWb3UX1uQBgNBoxLqy6BAlstst8RikCHGU6kuNwBQz/PQVPcTamieRhI1UA0NyJZSPE
         nT9J9lED9MZjdtwDXogscPh1ho5RmiEF6aCSXoz0Xsjr2f8m+vAUoJBhhV0y2+pnDQqW
         8+v5MQp84V4ZVXFyyvZ1CEMnWm4VNYCIAw8CsD9w3gOnwa6PqsAVW587VZKIv6kBETKt
         3t2siY6itpBmJD8nFHpXASYXFOQw3t/R17+heJ5iBq1m3z9GLfGl4Ci7Yz41hFAKZQCA
         UB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c4ttmYSwUBzoQan5NiM6BdFKHOxOFt2+5WQ5DGwkjbg=;
        fh=eDa9GDhtbJ2D3LBEXUXyVlDVRNfnAol0EPW97sOmvy8=;
        b=XIZuoPMOdERPiioP6YRHuUbjDHUcjvw4g+JRL4keZaU7BaM3SP8krqc5o+kYvGbQL1
         1gQ33a3+NgnYgkwti+GnXQxoG4m9+139BOB5PCjJHZqnIWrYEh+jbZ7TG3fYFobtJhqd
         /Rj2QW9Zvw8uVlAzixNa+zIJsmRuRF5J1ukWHJjoGezvZnhHFrLouSLuZl0KSG/YsFIw
         aSbz2BjQ5Vjta3ssJOWZ5NSBWX8he+etCiEGmOkOLboClOAyjYZveTBFLPcU77+1i8ID
         jnBkv/mNLGT7wstH8HGmlJFCZ/HoA0o4RSK+KKF1gFePaKF18VmUZtZHM9Iw6/Xl4RjV
         UbwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791431337; x=1792036137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4ttmYSwUBzoQan5NiM6BdFKHOxOFt2+5WQ5DGwkjbg=;
        b=e2fN53oj5k6mvaYueIEmQHhhoiwmUA1oOpHEWB7EEVGZDBgo4lfAPEVAVrzuJ1f4rT
         ifjGPMRRHyA40jpJ5UgiAV7Rc/175Zrgj3DijVELTQVoZsdGyNpxUO72sG9Wkt/YDBI6
         +oobtdu5U8B2N+72uzaj3Ddv1PxxEubzKI4Gx4k78ntjFz5vKRrEOTcGCVXhQA2Ijz9r
         Eg6t7qplaEpjut72YB6H6kBsx/l0CqY7i9hBnuZxnSVNBnAScoyPyQVDaLLcld1QZr88
         jWblC5BBgXs2qnEdbVR1FefvBRKWe7ADOZjkAZbZcZw96h8ioegB0OSUU5mIDJPCRgy4
         goyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431337; x=1792036137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c4ttmYSwUBzoQan5NiM6BdFKHOxOFt2+5WQ5DGwkjbg=;
        b=bA0kDZKIFVcmCCLgaaPElkMyEmDsw6dID2oMM2s883IyfHHE7jUR66fJPSLSR6zmHl
         hbn/EsZ/bDQjsTFDpJmJnE5PnHDZ64ESRupoSI+vLgZ9UnNr88DZM8Bu1mcYOLRjwSHg
         2pyB6ySF2lSPgNSfcQQY8JtTQWXkSUyb4V3QtUpDhf9r7fXGd8Ba2iD4SHrgL62948O/
         0zsyy0LOXEmZlwSq03SML7m21zthYkMh7yLqvvYn8EtsrvLHoWbYs0DhYcop5ZdoJG4U
         EnTvGHvRGk9y3w8qkvpG+7CpD8wQde5+YdqrWTXvtdY7rRA5pGe/BSsnOhQwYuNKBvtL
         KjNA==
X-Forwarded-Encrypted: i=1; AKwUvBxF3WjVwmcJfPgaI07mrwLusbBrTsdmJPiNdRcvEMdsCClvjLTvyTXSD9uONHLD0qIwPDs2yiGBF8AAkrrcr2d88lZb@vger.kernel.org
X-Gm-Message-State: AFq9FYKqivboDJrf/96QQJ3H2e3/qU1RSV63uqfIk4WXxcxMtHiJv9+R
	R8AmQ+trPZD0c+5Ovmq6is4osm1EtEUnnGeS0H+XiDgJK0MjnZZIIVDf/qUkkPV94TefHJ9qzTO
	tnfqFyWLcKsA2Gu03hpZaFoFGkhb/PDg=
X-Gm-Gg: AYBFou2v0tIOiYMW+yhgyoWh+lc30OeGJbqVLTDVJEr3e+UHPKyY/foMx43UQpvEDr/
	B5QC7+hQPEs4VfaHPCsKC/21VniW8VC3dDrE8wK4PvkRt6720u14HaeT1TylQhHgD/paS/ciRkz
	KMWA6K93F3cQROKZnDxgRZQeQOHXGrXYzUdn3QeOrFQnbU3eYGrngobRYbCFYRjiV0FfiNuykMp
	f1nbdmpn5usi36W8APUt6wbKVF7lyQAQX53Pugzk1OVScDrlKw+u0aLwFdBj4ysyvL+dDvIE5FG
	oiSf+JKJBnwspJtFe2Dq5ZrvM6LYHV9Cl1KOVj5W/wXEYw1OTl6HfsWKTcYsz/7wyprG+NgSMBa
	DvRR3vS2DI/u85tgYE+jFNu+Pv+un5w190vXJaNxm4nS1T4iXRVDMtMl9W27NGHLBU0DfKqqkua
	t5JOw=
X-Received: by 2002:a05:7301:b06:b0:351:515b:4e85 with SMTP id
 5a478bee46e88-3515dd78cacmr4880547eec.16.1791431337244; Wed, 07 Oct 2026
 20:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACiNov445=gavzZY=Yz74HNMUgd2BKoYoazWFDRRsz9uhA_rfA@mail.gmail.com>
 <CACiNov6n4Sr4nkAnTXJ9ZmMz022KebfAM8Hf2JV_EZ+KVa9THg@mail.gmail.com>
In-Reply-To: <CACiNov6n4Sr4nkAnTXJ9ZmMz022KebfAM8Hf2JV_EZ+KVa9THg@mail.gmail.com>
From: Angel <angellindo@gmail.com>
Date: Wed, 7 Oct 2026 22:48:19 -0500
X-Gm-Features: AclHuK9YFkSaq6D3ioA4jsLkW7LOkMEvq6st96fcEJeANLoyJjckzhq-Ds0EBNo
Message-ID: <CACiNov5XvayanL6SED-z1pLY9rMnyVbCdf=RyyhLXzDSLcXuVg@mail.gmail.com>
Subject: Re: [REPORT] Kaby Lake-H (MacBookPro14,3): package C-state stuck at
 PC3 on Linux, macOS reaches PC10
To: linux-pm@vger.kernel.org, rafael@kernel.org, 
	artem.bityutskiy@linux.intel.com
Cc: rajneesh bhardwaj <irenic.rajneesh@gmail.com>, xi.pardee@linux.intel.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Two more data points:

1. Reproduced on a stock distro kernel with nothing else running:
   Arch Linux live ISO, 7.2.2-arch1-1, default cmdline, no out-of-tree
   patches, no desktop, intel_idle. turbostat, 6 x 10 s per stage:
     idle, console on:                        PC3 93-94 %, PC6..PC10
0, PkgWatt 3.8 W
     console blanked:                       PC3 98.8-99.0 %, PC6..PC10 0, 3.5 W
     + amdgpu/snd_hda unbound:   PC3 98.8-99.0 %, PC6..PC10 0, 3.5 W
   Cores sit in C7 99.6 % and GFX RC6 99 %.

2. macOS on the same unit with the same firmware setting I use on
   Linux (gmux forced to the iGPU, gpuswitch 0) reaches PC7 ~95 % at
   ~0.2 W with a USB stick plugged in (PC10 ~80 % with nothing
   plugged). So the forced-iGPU mode is not the cause.

   Earlier I also tried, on Linux, taking all three PEG links down at
   once (Link Disable) and putting both Thunderbolt controllers into
   the same state macOS uses (RTPC(0) + _PS3/PCDA: Gen1, D3hot, power
   GPIOs low). Package power dropped to ~1.7 W but PC6..PC10 stayed 0
   in every case.

Thanks,
Angel Lindo <angellindo@gmail.com>
