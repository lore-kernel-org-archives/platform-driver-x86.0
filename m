Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792679383;
	b=DuzsJ1BGN9cbXvVGTJGRn/tL8fI7q9ZEARa1AWfutELP0w4VTmBz2wk0f09Fo0d5haL9
	 NGYZqCmibXLuCzuBrsvaXJeMjshlsp3GyDDit9gCKuipyU9IK3fS/9wbCJdZ10rvrff2T
	 F6A6NzT2I43gmVYIEKv91AtRUSJTKL+pjN55WDORgcGZLRE5sbPpxMApgxl1BPW1zq/2m
	 1L21Ia6eJjGhm56g0VvRtNM6+R8dOvu1tUF4DRsDoxLq7U5DnqvUnq66Hoez+rPx8aVOG
	 a5yK+lyNAmYX1uiyZCpCrJdoWyQWnkITVHqihjnwzd0q5TeNOwLs2vS1IXLYX4pEOzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
	b=YX4l9vaE2td4L1ltjBqS7U9XV9J+LOsl+OQv5k7l7PHDqaRzo+sN23UOphO1C1NL4Kd8
	 8K3C5Nmg1gQFVzr85NUv+XgGaBfy/UJKcxOYB1h4ODmaMAdRmqIlSPulHpkZ6b2pLhxA5
	 eyZPDMv3bHGSWaHnyHv805Hsx1Ck5qHPbAhjWHp4g2kcc/DkKYxgYZjivN3DCtqVGzclj
	 z+tAi20KsTlCiV6d34lAN5mYFS2Wv/5B68he+ku6V2LTq6Xq54fAGIgGVozAIs8x+U1Wu
	 Zvid3TTjZIadqqrRhUnQD1xz782NCboTNAE0nmi4avTeVMFJcoDboUkDYXF1AFwjzyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EOJ8MQmp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B0606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EOJ8MQmp
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6740e7ae219so1773982d50.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 07:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792679382; cv=none;
        d=google.com; s=arc-20260327;
        b=oD2cZ94sVgmPA/IIEDVtYAkI4XrgkKb0HFuAxt+QrMdcqhoeH4v1v7xX8kipfGapcF
         cJiC7AXLAu+CkailaL/ZJR1uTBl1aTtaxLDsrA5ckPhnGRtgKWiQEDFoITUgR6msItUz
         YXgbjrdJV9xRn+pI0IIEPmgc7N8ACUSC7VfxvfJ8/x8GS+OkgaqGXVr9N8xizAbynqdC
         3cmVt7UsGfJ5ftFBt/jqAHhFdMXR/Js1cOkG9rRSStvQyuCbYsj+aZK40shEOg39GpT/
         Ln+7ppNrQEBJ4zdMxlYE/Qt1ha8lrFXsAbLq7oLw4IVaXoabc5yZB7kHkEE5qFhTPf3Z
         2//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
        fh=2IuiD+OJ4IXgqxDt5WgYhkkwGtM1Tti6w8lCUv1+TUY=;
        b=cqErGp9ImrgmsP6LCLpiU+pvN51LP3y9NE9hyNS2QhMj+zO9TnyuKe1fDLNXzM3U+N
         Ot/2eIm02qROMpvwarEA3jHHRCh1eGl82+SUGVqf2ZzozCVtX0ptobRtfPX/IsMtJ66P
         AupmEiz9lmvoEJtrmnxeBZiMrr4KevTfzdjCNIJXh7n1aCjBOZLtB7o85AoEsviOCcLI
         ljnQ5T91QRVav6+XWEvMqA8ITwgTrYJs0g4lk/O2vAKNKe4l77bTfCfMRCegPgP67zcm
         /3ebA4QPa6NsBZVNv3YiNm5KA6MgMT3/lc7xknl7jwBG1b/1CNsL+FkZjvSkhc6enPzI
         VI/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679382; x=1793284182; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
        b=EOJ8MQmpdq/9nyUC9tbOQb/gZfoDG6g3YzctgYtW7q4ui9s6C8o7KAUPLuREH7hjPo
         YJEaJTt02D8nmzhyuJaLtOHb824GUEvmnL7CACFfWen9eYfrRRJxVceav4ghxnKNnS3V
         PFjqq8muHuP03Wx/AaJcwBoXWJcaF+NTwYRAN46Gef8CLp84zeOR00qRwvmNdnuqGWqA
         tMySzYUx8tr0QuRPfKPjjm8+58YAow2jD2h4PsBgWxd7xeTlkjDkIWMokruDiS0Wc3Tg
         eAMyGsOIuxcm1p7VtImpUt4VaPuxBLaisv7JPnn6Y2mDgtbDwt04CTq5TVFqOGrqKyLw
         DALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679382; x=1793284182;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
        b=dGAEVt7fGLW9Z5So+UvVdh79xcedopbTwkxLGUCt/Y9a3Cs/8bYEdaABga/nI0X35A
         Blgp31ssPMsPQ4eM4zUAs+je4hQOGiTvrreg15YCmCZcnBh/jzotwZX6QdDXs7VGbXg5
         kxneaEzsPtfjkl3p0KAoO8185nBEoHw7Z7Tx+WxmE95DqWl1seCQdpu10D1DqzzxhhOG
         DCj4sZUqd3WtUqNtoZ9X4dMwzFv1SEooWLrsRcYFaRymNmbzeKSNBTuU5wlkZXKSUb0h
         vN6VEcVYMGgSp6MA2JqWja+RQOu2uhWMJTDZYxIt2koo7wIkpAhZSHj+MgGv6qkPxfas
         TSWg==
X-Gm-Message-State: AFq9FYLrFPLOuEJNT+eVG5WUgCH6toW85Hfjph3ohBzyhHiwE9VEUOok
	vPKGSQ74iN8REDKfKntV156eZGE0JaENVdc8D1oyXf1cIpye92NYW1RqaAxPqd2OX3FKMv5eJd1
	aWzubEsDmmizqXM5h60pwSMsugm+pet+6zFQX
X-Gm-Gg: AYBFou2B0nT476M3Mb95SkcZl3WRTqx/iCQymrA7ihrKKZ9vlVGqULLbLVzbQ13HHgo
	BVat5MFIZhdb+uQ5GS7AmxXab/w4+961CJKjZ3hmIg4fFWc8cxTaHRz18wrieJInwE5aoIA0aZt
	TBIrUdCZRRVXurzCyROB3VwOTnqr+VNWDPqhZRLLuvY03I6yoy8II8jCDL6mT70oJhfEFAYAm5e
	XHKpEIaWbGXyO7Z8fHF5uwFYPXDlNe9W1eIuQAE1frSYEn9oFSiTi0PLIF7oqdUG4tIzuASewBC
	2EZDwcRjizMfwLS2ay8CUbkNsHuDuH6pUWmbhZE/uz/ZM16uVmjc7ikIjjX2JOr12stUSb0GKlH
	kTnjnJdi+D7lXmL8wyHDG1YySpXCFXiCxvIO4ZmSxbMM/8tKsIsRGRXP9hphLcOmF4Qw1mttB3p
	6hgqtz
X-Received: by 2002:a05:690e:80a:20b0:676:858d:35d0 with SMTP id
 956f58d0204a3-67a0e4ceba4mr1401129d50.59.1792679381266; Thu, 22 Oct 2026
 07:29:41 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Julien <julien82453@gmail.com>
Date: Thu, 22 Oct 2026 16:29:29 +0200
X-Gm-Features: AclHuK8kn-teVkT41gTygozI5r5_APcWEEF49YpV8Zuy9c-TKU2SyO_VGzaCmjU
Message-ID: <CAJOGg3x1KWjXrMpXoCDEMAV10i4Utk8E+hoJx7UW6Lr3uDkbEA@mail.gmail.com>
Subject: [REGRESSION] hp_bioscfg causes boot failure on model HP Laptop 15-bs1xx
To: platform-driver-x86@vger.kernel.org
Cc: regressions@lists.linux.dev, jorge.lopez2@hp.com
Content-Type: text/plain; charset="UTF-8"

Since commit 467d4afc6caa ("platform/x86: hp-bioscfg: Fix automatic
module loading"), the hp_bioscfg module is automatically loaded on HP
Laptop 15-bs1xx.

This module causes the system to hang during boot. Blacklisting
hp_bioscfg allows the laptop to boot successfully.

Sometimes the screen will go black but there is no kernel panic
screen. When I get to see logs, there are no messages related to
hp-bioscfg. I suspect the system crashes before it can display them
because on a normal boot the next message I would see is "Module
hp_bioscfg is blacklisted".

I think the hp_bioscfg module should be disable on this hp model until
a fix can be found.

#regzbot introduced: 467d4afc6caa
