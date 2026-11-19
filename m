Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795077632;
	b=3Qzdb9U/MatCvftEOkhAmW0bo7ZV7F12feomzepMqH9kRRpxhfKjvSWwpg4qPZTohzA1
	 8p/YcYQLEt1EtM+ckmDWcnfoIyI/xPghoU2H2UHUKiJPqW/bfcbTGCgQ0yfLQdV0ihQZR
	 YomBwbwv+7N+DAuVMIXGrz1xrEPYzRLna9hJavBo8JjPfvW0f8vmn7ko6PTa+L8MwI8mJ
	 vwxtcL4+C+cGbKi3Z0jDs5cLMg1FF2KBZRfGu2VgIVfiZKb+vSPj2YIPX53OKM3ndRHcR
	 xVEbgPnwRyPJwDSEVp+++rVBKKDb/9rK6cWYct/9PGZIigNswGXMu96gdWPhlRNK6QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=sqUL01pCjVsZgE5NgO65dqvZjXqzWmQl2sBTQQk4L1Q=;
	b=VkgS5bshe4Kz17sXss5ZMHZkuG3Blm7qc/57D7/3kGjN/0NJ1UwuBMsl3fpzYts6bSxa
	 47dt8KBRxzma5GEIKbC9c8j4xnE9hBAgwWxAxf7V9NKjJcwbDau3mh5/FoyaI8kkmUWth
	 JoFiysagPG1mcxY4oTFRIwxMPeao2ZLPi4HVNg7O1QP+Mpbja4poot66BGQiM5ih2Vs7S
	 qx8dlKDJ4rIpjEA0U8mGpzbE7Yw6q7VcjHuxOMsPdQCVRwgXIFDdqZStuN0kWbvUC2PIX
	 8LFn2fmUeXm+nZONy3oUBwztTcTjupKuIPj5MU9QXey1n27EaHHicMe3iy332Hu67Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXlEftI7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAEB60A6F4B
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAEB60A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXlEftI7
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-499f20c7054so1082369fac.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 00:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795077631; cv=none;
        d=google.com; s=arc-20260327;
        b=GmvBo/k+IuHSoccheZ6MgWH8cqEyRX6j+fS4oMhpcSTIcgFdeU64I3xDB8j/lbG5mj
         ZzoIE22CgqAqjji8hVFucO2i0ubtykoeYsp7UlACmS0r47JwVk9qD6EPvAZAO59N0OD7
         Utm/R4ptX8kWzqy4TjrYS4Z/hXPPgVH3ohFtxX4dp3lTT+u0Au360PfgI8Po0CwhmpkE
         E1RyWhjFAwWx9Rfc4ujlXTrDxr860jZQdKR71EGfqM2QIH1KRHPDjoqWzyoruvROoCwW
         gY4igpu/tn80LPlwfM6IOvhJnskEslHeW7q87mUbEV5TcmcX9CtaPDBVf7weK+oHFOvy
         3deA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sqUL01pCjVsZgE5NgO65dqvZjXqzWmQl2sBTQQk4L1Q=;
        fh=bl3oaCkJqJLi1976U6daTIbmpx9cT8+79DLB542x7lw=;
        b=rPkOxp7Cbp9w3e+d38ofpoX2QUdXdG4x79sxIrkFM83Mg+aP+pEBR7KvOAKPasXZb+
         d+j5H3/XFpQabCyyTQKpXtJ5lufxoyypukS8iv4jRE0dmNWknpvNdCP+8TQKb+ZE98kh
         oDbK1HDKoIgbFjpYZa4KY/Ye3qWBpxByBaY6Vb7F2Tn535Qv/zpvQ41/711xcjQzhBVf
         r+/PER9uokDUfMnPTe3tFNIB+0LgqKEt/R7GQAzWPGx6jAjDbkSsP3JNfMiPoMAdri7m
         WrZYstT4TIrWRsR+j6sjHgCjeXFXB9ygKAVVxISeKUgsiwFyzXszStWQupslfQjL4Umx
         sXLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077631; x=1795682431; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqUL01pCjVsZgE5NgO65dqvZjXqzWmQl2sBTQQk4L1Q=;
        b=EXlEftI7AylnU0mzvbH2CEyd8WrKzI79sCxQAkRbtLtGSs5xzV2ZHTS+HKbPGa67h6
         GJ+OLKUlrFhip8oUsYhh0bC2pxmT0uMfTUSZHtBYixP70C7DFhbrFeWL4w8rsycE7I7B
         jhd1Z3BLIUYVEaheoQ37UKVI164o4WP/fX5+4H+b9CwFsSOj6Mn1ZNEEMw3sxJTk9CZZ
         SN2/d2HG8eYhTTDRlsCIDBDttZ9btHjvBqAERrcy1Po4M7mWxdWLsu98chh2uGqNcwuB
         xDm7M1DXAoZY3L3o7RoqKiyCVEl31rpAIr2yRtTqlNGLjZNNveoSwrWqsIQcDWKEdNZy
         w+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077631; x=1795682431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sqUL01pCjVsZgE5NgO65dqvZjXqzWmQl2sBTQQk4L1Q=;
        b=TzcwTMxp+hLtjJARrXJG8A4mGq3fpovwBWbewbazIna9xy2NnoKFNFy/gzJgqy+liG
         a2BZanqnM8WlnN90L3U1cdOweKDG/e8eB4Mpc7ijmhwZ+/1C4RnH4ZOyhygRJma8COD8
         ulivsMgp1wgfo9bfevSseNghoNijX2V51VwhnIzpwLn+fFQ5NZ8n3mjVODC7EVu0ILr4
         9tkPz+l/YsPylbOTwzW+SggvCH2II2Rq7fJuU+nmwRPOh7+UxaIacKNnLVk5vPN1Wuok
         S9BTtLSB9RcR5vIMNgVjozs+Vt+5vnijJb8Zr130mOBduOmimgRpiFDzSsJoa2H8GoJ2
         hxzg==
X-Gm-Message-State: APuU4Z9Tk9MTdU5v3g4Ti9HWUeppoN5CeKkOaB6FjE9x8m4tSdteoDmx
	Aw38XTrMMCPeNT7EKycH/1BdPi+OdmSw9r5EsFnwFuXKi4U2Y/wviRNKf5B1xsaCpWKl+Inbgyi
	X4rSh0ovwUSsZH5QXFYQ+YZXzchNi9yI=
X-Gm-Gg: AYBFou1vLiC7K/JB7xcbG4zinHOMeQGjKJsv4AD1iFlenMpUcxZscwVmPUE4z6UVgsP
	qxrIuqU8jLp8bQ9zuJOItqUaj93Ib+uWZvoWLz4EvDIASjOzdFAqqgPGa2gMLAL13IQs+jPKAEZ
	AdhRY46vhwtQIojTZyFtrp8U+Q20GJ1BvAEZsHm5QfKco7uLJNDcVUga+XvDWOwt5BqRrS8/P/k
	ky7wKWuzGMh9VU55b93aV0hCiV0rk8RG2Cat3FU4W1Q5gJtavv208BiFvbq+1GPTR2pBk/kchyr
	wXpq7YhnPXP+6nosVlI7i/R/3WsW+NZMM+m2OtjV/5LXu/gLuDIQI5t3AnL7IXfHL5qrxVzZ4Uf
	n6nSVSqToperqcBXobqSCYh568ur+dR1A0U8EAp9HtvJX+36gckKAvgBuOfQv834FpTI1WQ==
X-Received: by 2002:a05:6870:e248:b0:499:ac5b:aafa with SMTP id
 586e51a60fabf-4b761bb90a6mr4977818fac.62.1795077631319; Thu, 19 Nov 2026
 00:40:31 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAF1sT3Wp67-+Ah4C2_L=rS_83Pg5vt00TCvHXLKFdzifS=yQcg@mail.gmail.com>
 <41519902-d1bb-4165-975a-aeb23591256e@gmx.de>
In-Reply-To: <41519902-d1bb-4165-975a-aeb23591256e@gmx.de>
From: Vorname Nachname <ivanhoe18109@gmail.com>
Date: Thu, 19 Nov 2026 09:40:19 +0100
X-Gm-Features: AclHuK-TnFgqvalZ2OQ64na1uqYvX2zkaDUXQkGSJHhAaZ2yiPH-_lqxvXFa5M8
Message-ID: <CAF1sT3VDq0BikRfHRe_MCRtSFF7Ab3ufP0z2QFcmB1oYQ-95wA@mail.gmail.com>
Subject: Re: platform/x86: lg-laptop: Add LG Gram 16T90TP to keyboard
 backlight quirk table
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ahoi,

I updated to 7.3.4-300.fc45.x86_64 and I got keyboard backlight with
my LG Gram:)

Thanks

Gabor

Am Di., 17. Nov. 2026 um 23:19 Uhr schrieb Armin Wolf <W_Armin@gmx.de>:
>
> Am 17.11.26 um 20:15 schrieb Vorname Nachname:
> > Hi Armin, hi platform-driver-x86 maintainers,
> >
> > I am using an LG Gram Pro 2-in-1 (model 16T90TP-K.AA78G) on Fedora
> > Workstation
> > (Kernel 7.2.13-200.fc44.x86_64).
> >
> > Just like the 16T90SP model, the keyboard backlight is detected under
> > /sys/class/leds/kbd_backlight (via LGEX0820:00), and changing brightness
> > values
> > updates the sysfs file, but the physical LEDs do not react at all.
> >
> > Could you please add the 16T90TP DMI entry to the new keyboard backlight
> > quirk
> > table in drivers/platform/x86/lg-laptop.c (alongside 16T90SP)?
> >
> > Here are the exact DMI identifiers from /sys/class/dmi/id/:
> >
> > grep . /sys/class/dmi/id/
> > {sys_vendor,product_name,product_family,board_name} 2>/dev/null
> > /sys/class/dmi/id/sys_vendor:LG Electronics
> > /sys/class/dmi/id/product_name:16T90TP-K.AA78G
> > /sys/class/dmi/id/product_family:gram Pro 360
> > /sys/class/dmi/id/board_name:16T90TP
> >
> > If you need any additional ACPI tables, dmesg logs, or testing for a patch,
> > please let me know and I will gladly provide them.
> >
> > Best regards,
> > Gabor
>
> Hi,
>
> please check if kernel 7.3 fixes the keyboard backlight on your model.
> AFAIK there was a commit for a very similar bug report included in 7.3.
>
> Thanks,
> Armin Wolf
