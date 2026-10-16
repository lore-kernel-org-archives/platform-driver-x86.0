Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0022367B8
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149991; cv=pass; b=DX1ji6tE3lQRgaQ+k8r3C/iZeC7StK55IymDiBq3k66H4o+rfWgTv5gRg5uynttPgCY7oJx+yqsHFg/0MWbRzsxg4Vcx8Bu7B5JFBPRgnR2vR1UAwlZbuLxVbHDRO8SghQYhbGJZVD7vkUDXuz5/UsOaRyx4VQlQPJZ7HDUHm9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149991; c=relaxed/simple;
	bh=XlS7TrLkH28aVwkLwKrliIE8aBKOn67dnE3MlIEFULs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kRf7/2fxOsIGm+6RPhOgR1UUdD+nh/rzeEqhpgNJGIuoY/s1YfxY3YskTaBxCLr14On7tHVMo1E0dmNIUw60VcKkzuifR/o2SpVPjIN4bi1wE7ZH35ZIiFnNfJ3L94cwWalUYc2/c7g0tK6wYl8RggtLaZENDJA8ukH7CiZjHyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF9eJDj7; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF9eJDj7"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-701bb8e09c8so188918eaf.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 04:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792149989; cv=none;
        d=google.com; s=arc-20260327;
        b=i6CBNSf174xB75ichQpcfJ+rxI5jAP5P/GXEhl3UKayXgLoI9gPpdeUQAciBXaRFTT
         DRXZno6wzbR32Q8G8MGg07wzQdz8zONo687yE/izjvhn3nDq3POKCzknwGNzBr8KDu7Y
         Gdl2h/YH682TIcWi22r+nh29vwAb8+G8ionySHZDmnwJBtxe32mfebpz3AiUjAXa0KbW
         JoZYGrrzX+M1rjdWnmFF8DXiIl+mgjbPm62yv6kbPvvU96HoOFIgOkfMbWC/zikkBgzO
         i7LH16WKLH02o6jIg0zdlJBDoSbjp+rU/mzoFfEz4KdzoWhSU7WK7pONztVEihr8QrcT
         cqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=s+DsoEL7I9Ydk+TBgC/IJoinOYyf2ePlp63ZVNUDl0s=;
        fh=Zjy4Ofg4aX20RXmXbV1E7W0XnzpInQiuZVfGhTxkLic=;
        b=XDKzHVXekA3SqtRACfuQFjVolLQDktANmrFRZOwduovy+MDJpLh4b633n+tiETDY3r
         rG2L2G51cdrgsQGjE8RX+ZRRLm7/1chKQJDY6pgduCmCaREx8MKFY0SzTqAm16JLW1VU
         HG+uHBuHJdig5ssAtMzbDWC6U7wbOGi62/0XVdOuciyznHcWnaAPsUOkjyF7g5z1VXKm
         YVepvf81vlV1BpXthUiaSD1JQVZzbVW4bQs7/hfHzOG1gefvt1hTx88gwbDu5Bldq2eK
         Ii+7RLvriy5z50s24RXyEty8iEZjYZVjpqruX7Hp1GnoYIZFgcwX78cCDs9+sf1+kHLi
         dN7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149989; x=1792754789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+DsoEL7I9Ydk+TBgC/IJoinOYyf2ePlp63ZVNUDl0s=;
        b=NF9eJDj7QhWbtoIzFkKboF+ldoW+qL7THPae9T3Os10ZzEQwjGLvA0dOXj/wMTTjbe
         UBK8T9P4Av1czz7/HURxrxHMF5N6kCZy30D1EDyh5GyRWdz7nCV+BAGOQPryfAujnb51
         IBfUVaBZTSrd+FbLkyiy7lp40guj97q3qeYYhmRpPFZhvFQYNbA8uTWhGVjgEix4nt6Y
         xqUtM4NyzNbd2RgnPaq4cCHcsHhe9VIDonkKB+YhyaxA2JvUoBgbxdZAF10TZzEiLjhr
         33N6qTw/ElSq5HyR5LB3gg3+lktLKtY2NARq55hTVGj2MWox2LT5M34fI4FcflltuPAk
         UMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149989; x=1792754789;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s+DsoEL7I9Ydk+TBgC/IJoinOYyf2ePlp63ZVNUDl0s=;
        b=0lU8qQ0FH+3aMYJvkchpRIsz8ZejKjOQ6CaaJZxoCCNNbsH1uLT1bDfZpNY+3UXMiP
         O8jDzUPjCJZu6mFhu3Cir6zbU1VLUOOJ5zWTPYIzAp9JtkKUg+hfiVjzy37bYsR25X3y
         JHsB13iEoQ9LH2iVZ4WkeSs6caAXXm7KQYnQONICNlrnBRPiVPq+O7c099zyGgANi1Lb
         Imwp11dJV7eF9ZYqzUEMqEAZceA8Oj1zEjYBe4kJ8GrcXdBnskFUqVdc4TIeaTZYHIlJ
         J4VI2ZxUav3oUky0V1bce3EurH2IwASv+3zgjSVj5HGCQj1M/049Nni+O8miweQD87M7
         oQOA==
X-Gm-Message-State: AFq9FYIuq9ehn/3YBWzOi64MopbpcFI15kq2YXLJ8Itp7LM8PLBgKex/
	66LQ1g9Cfw0PBukdDBesQeMrmRa9WXOEouS/K17yVTvHm5yPkpdDndmQ2oO61toG/mHj1mR1nIj
	GfJX8yreYTNq60mkQeP74cwrjA/1QnLc=
X-Gm-Gg: AYBFou1s4gBaMGPKZs+0IJ1OFWonqDF0T/rg9aHJwA6CviH5Ydz8Upy1FY20NE9vxW4
	axOCYz6lzpMokdRpGzNNvlxU1/k2qP47VWlt0fvgXYUjbgCZkSlqXAbTMks6qn3Sq5lkB7jwIoS
	ogQ0MEexn/ej1hUWyTEzsb21u8NR/cZVZW1RJsaKIi9jZDs8J/iXF5M3QsdPlmFl37JEJXRuZ/6
	7q7nsLRPB+INivJ2EHhV2x1WyKZSZqxz8tttnQmbuvp54pn8IonoIDsTss+46pPp7E4pLy1J15p
	R9AECGQIbEv7sSIDAv2w9P+QCEDG9vkHX+RKpNKEhDSKYfyD4I9oLbBsU5Es4lI30ZPYxRYLQt2
	Whdnwe8GyTQiyyrJFEDoTLXOARoTbWgt3gtRxmnndmG6kcU42cU5UT+eDwPD18sFjnmHnLWeXME
	NyiWSarfq2MNhNc8DXUXdbR/Jup+FJD2Wj/9YWDWhPHENPvVLSqpq0nsqB7xKZzsYZGwBt
X-Received: by 2002:a05:6820:8119:b0:6dd:bc51:888d with SMTP id
 006d021491bc7-6ef10e7928fmr16126990eaf.87.1792149988717; Fri, 16 Oct 2026
 04:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Saatvik Sharma <saatvik333sharma@gmail.com>
Date: Fri, 16 Oct 2026 16:56:17 +0530
X-Gm-Features: AclHuK9rlZQkSehiJTz66X01TCg5EWA-invPQcCMfiiC1iAw2Kg0dfdf-DR-Ng4
Message-ID: <CALeJObvxQ3b-s6MGGBKSz-d7EeByy4wh7raKBEFYZg6bXq4ytQ@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: hp-bioscfg: fix 16-byte heap overflow
 for empty auth token
To: meatuni001@gmail.com
Cc: platform-driver-x86@vger.kernel.org, jorge.lopez2@hp.com, 
	ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Muhammad, Ilpo and Jorge,

I tested the v4 empty-authentication buffer fix on this machine:

  HP ZBook Firefly 16 inch G11 Mobile Workstation PC
  Board: 8CD1
  BIOS: W70 Ver. 01.10.00
  Kernel: 6.18.55-2-cachyos-lts

Before the fix, writing 4 to the hp-bioscfg "Customized Fan Control
Options" attribute failed with EINVAL. The kernel logged:

  hp_bioscfg: Returned error 0x4, "Invalid command type"

I rebuilt hp-bioscfg from v6.18.55 with the v4 change, removing the
empty-string early return in hp_calculate_security_buffer(), and loaded
it on the same kernel. Writes to 4 and then 15 succeeded, with matching
current_value readback and pending_reboot=0.

This confirms the BIOS-setting write failure is fixed on this hardware.
Fan RPM and persistence across reboot have not been verified.

Tested-by: Saatvik Sharma <saatvik333sharma@gmail.com>

Please keep this fix on track for stable kernels, including 6.18.y.

Patch tested:
https://lore.kernel.org/platform-driver-x86/20260919060037.84602-1-meatuni001@gmail.com/

Thanks,
Saatvik
