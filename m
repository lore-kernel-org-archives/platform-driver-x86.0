Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3115189902;
	Fri,  3 Jan 2025 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735933986; cv=none; b=rWXMQ8G24dUaCVUsiTU6cPgsGyBS6ALPJIc41jQ2EWtZj62eb/9H44tL2n3hejaByY91C1AMbEl8cdL1lLnF4D3rY6zT4UL1FBVmF2jrWZiSDGfbtf6VI7W5KZtDVRrk3yPNGAz3WAMjHtIF9rCJbh/TrQJROEfU3s2G2DuT5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735933986; c=relaxed/simple;
	bh=NyRCBxInAIMeApyCkpI0Qk6QrUcI/YiW35pTSbFR4Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEY86AwnK5W1pCKWhzk9/FjtpLDKiybmGpJR2efdDG9fqOXwVeUcy3Cgnjo/A4phU58BCDKyj9IRSrVaB4v2R6Uy8PCULho9Uc9jYyN0hQd37Wmi69zfalFX8qdDR9fpLo7KXD3nsQWzfB8rbCzaBAEY9m1A+SA5UELL6rT4jVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lhu70h16; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lhu70h16"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so15860728a91.0;
        Fri, 03 Jan 2025 11:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735933984; x=1736538784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NyRCBxInAIMeApyCkpI0Qk6QrUcI/YiW35pTSbFR4Xs=;
        b=Lhu70h16H6Kn92yQfA05fH551uP5S1dGNB2JsX9qazaoOd3Lvu3o0HZZdTAHIMjg75
         dIYfr5xAQ/JjWCXJSJrObXU5snUeUvZUw4y6nUeeD4RjWFQZWpU0XxGLe8SuYEkexYUE
         UN/zfBGN46UJ5TM3wFte/3qspHumkMXIZvuYZsQik25iJv5SgPUPEEf6ySb3gWed1feZ
         C1cADeJXsOZE3pnuNiafhCY8HN0N5iSr4LWJ3GyMKpwySU5q8iecqWhGN4Vpd9JZN3A5
         SXoPYgmeh1J23tumbQ+/VHIwAs07jDY1gP1XN438DOw+brMIIIJtIKrL+JQA6A5rizCV
         0+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735933984; x=1736538784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyRCBxInAIMeApyCkpI0Qk6QrUcI/YiW35pTSbFR4Xs=;
        b=sz54RgxaF1UsGlCZMpI6PoWTK83XzB1VNXsWMoONL/oU0zmEDj8d4GkH6nUhbLV+xU
         L9qoIRkgPO365NPLUUEN8MRVDItwPS3lPfReR8XeblraxhtJPI+FbGjTdH7YD4xCZmfz
         CPc2haOa6CEcbMxQMe4KyAPJDjXU78VXxr0y9MfnZNqSzjNoGSNmWsyx2SuGaKVNp9t6
         l3ijESSQakSlrESWEOB3CCk4tjTF+wqQXWWdCc/lsA/glCsDvciNeoq1/oEr+QrBaBw/
         gk4iwVBh84Nnm9J6qWE3F5QyThoGnZ1GwVNNjZGHe+Ewd8LYkSO9a3Ddj1ytWLKSYZd4
         FaYA==
X-Forwarded-Encrypted: i=1; AJvYcCVeLFaq5zbOO0+a/TuKNOnDkeFzebNLULRIeYGDnHm2bV4I7DPlojKaJXI+T8+UR2b+oze/NgntG0jakx4=@vger.kernel.org, AJvYcCXmJ4Y06EHBiRdN8XXCOCVqfJPDE0rYIZTcKNuqti9gGCLnK4ZDmksvzBFy2l/49WtfvEzYCx43VYW7EBrHkWzjd0kXdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qSmLT2D+PiAVaXkP3k3p7/T+2oYI9VU9GoFj31SnW2CX9KCe
	KrW3IWzicEFpFzW/8h/ro51gR3a20kT8sNwusYSI+jkuB0EpbyTlXMfWaWqvBJhmN5bcGc+gWao
	jShyDd40pQDRuXkV8a9bqIabnRE8=
X-Gm-Gg: ASbGncuRoqPmBJZQKKYDeMXZjL2a+c9ByN3Ph7mEUv/2Twy4J8aywibcWCP+v14HHSc
	7IzgttaXB1y5Zf4egJgpMEOG/5iUMEetDI4kqB8hFOTcmkOXbeV/YwhUV39jv2JwVt5Mzzx0L
X-Google-Smtp-Source: AGHT+IHZubrkOGX8r3lPYW1ICE2iMxSM/lvrUr/2b5hvoq3VUYvsSHMCxVk/bpkV+PYcs2XD810NOCPbNq/DYOWVt/o=
X-Received: by 2002:a17:90a:f945:b0:2ef:949c:6f6b with SMTP id
 98e67ed59e1d1-2f4437bf688mr83343757a91.13.1735933983907; Fri, 03 Jan 2025
 11:53:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231140442.10076-1-hridesh699@gmail.com> <12ce2a4d-6a27-471e-b330-996753ff1bfb@gmx.de>
 <CALiyAon3r=VXFNZw7is4VWZoRnFFbrUUvLB9XeW+xkMLjXDyRA@mail.gmail.com> <tftomtw456sevajiid76bgenmxl2s5ycv4sckfgl7mdjbs5hxb@5vs36lxjtaxc>
In-Reply-To: <tftomtw456sevajiid76bgenmxl2s5ycv4sckfgl7mdjbs5hxb@5vs36lxjtaxc>
From: Hridesh MG <hridesh699@gmail.com>
Date: Sat, 4 Jan 2025 01:22:27 +0530
Message-ID: <CALiyAokg_-Mc2R_OL03AF32=EPcFS1+RYoA9G6r8iJj9ZEMtmA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
To: Kurt Borja <kuurtb@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, onenowy@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Do you perhaps know if users expect a thermal profile change on AC
> connect/disconnect events on Windows? This would solve this discussion
> [1].
Yep, there is a profile change on AC disconnect on Windows.
Specifically, it forces the balanced platform profile and returns to
the last active profile on replugging (the UI disallows changing of
profiles when disconnected but it is possible via WMI)

> From my testing, what I've found out is that even if we don't handle
> on_AC, the profile is still set but the hardware will not put the
> changes into effect until we plug in AC.
I did some more testing and I was a bit mistaken in the way it works.
While the system is unplugged it will still apply the three different
profiles (as evident by the differing fan speeds) but the CPU will
aggressively throttle under stress, placing an upper limit on the
maximum clock rate, this limit is lifted upon plugging in AC.

--
Thanks,
Hridesh MG
