Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF4919D89D
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737139898; cv=none; b=LXtqo0Wu62fQXPwJGFT7q50DMRVYZrHlhXN/dx/seE1klY+wPLk9+W6klvOGU/78FwIBQOm2e2GUGNuQihX6dryxUMKKRmT6cXBKbx8DlPfildAvFdZEDnmLrAA21hxJYP5ZfHvPs1Z24/XAwmBYc0oe8U8nYO2ODEuimovlgnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737139898; c=relaxed/simple;
	bh=63oQQxY/MpymRNbUhYXPXyF/qG8UEq+u6welNVeL7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGOYbAzxVq40361HCpUAWr0pRjMksAJv0DnpwzXh9leOuCFRjQDYwam/qhKgHSMq6j4vmb1BwBm/DNPg7MnXATQeLBi0Ig5d554mFIMkcILkhPWyZYxG94mZ6VzognBDN89c0KCg1kCdDt4KWdgI5C1ZtVasOEu+36pb7ylZxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHyKzDvX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHyKzDvX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21634338cfdso63534925ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139896; x=1737744696; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJnUm75dejSN/6mc27eu3sAz3ycEZFrcttPEgvCpPUU=;
        b=OHyKzDvXSYcqGPXKvRQi1fJAwt/EFCvbJTh0GVG+u+A+ki2vs7v6A6ECB/k3BEdCxt
         eunBumpD+IWb3MZEqe0O0mwWsq3lfQY/PfELTGkMxGKpJk/vkGl4479r1lK4mKtx9W6R
         /gNsFdg52WrmqPVj5por8r4Awgz+6JMfKYXJxmh9XfrmPCGBYXSclsuxZHVARaD+63hR
         dxvUbvIFaGaUBfkmwNlZN0d9PKa5iTJqnoVF4K2Eufm+2T6POaiDytw923yoTC1GrZfC
         qyOZ+Y/Pu4NxMhtoZnOe5L7Mako9dZDbmJP6RegE2mFU6OgGlK6kfmKnRWeWiy6mHAO8
         v77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139896; x=1737744696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJnUm75dejSN/6mc27eu3sAz3ycEZFrcttPEgvCpPUU=;
        b=bBzRYbX28WWc5eGPxYarNNGXJF+sNtv6L+wIeDZVtN/EZWDeGSdKJTcyz0lrlzVKI5
         Y4DpHzA1lEy7zSOL+zTksBJYGwaxKF4EufNyV5aITeN2BYisV/7T7BcLF62i3M6mT3yb
         vWZp1KfmIv7jNNpNCWB1WPqG6kIIe9eI8hSD9lKwxwjh/8fqbElZ0D/oBRxXS0+av89J
         DEBxtqUPbkqr/DzBju7VpBlr+ChU9Wy608Eq1TVhfW7msbSj+JEpdswKo6DcgsXmF98F
         Fya7jtjgDM9M3tBre8zXptCyJwPkG8BQpurxUyc7NAKzzB6jI0fdPKJnXT7+f7GSM/7m
         nH+w==
X-Forwarded-Encrypted: i=1; AJvYcCWjBJdsmjzfuJ+nsVsYYDbYMBVolyRiyPbtavU3ZA5dvQ5WwDCRH+04Y40zEbQ03/A104M3L8UwdIZkTikluv452zp1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9lBL/tec0TiWKNEWVjn2hfx3Xz1I+36ctnV8Qt1pbi18ieKJv
	9+/OYbdrUbzdvzF0+7pR9BuinRkZB+QBNeKhAZ0UJhVlS+u9wz7bYNA2JvyNNkY=
X-Gm-Gg: ASbGnct6Zy+1+sJVp4Ay8q12XtsH5C7YZb8n42PjQ/avE7asr9ROFaZPCsOIMwpBW6x
	YAiDij7ZwWmB+orD1VrIaD0uB2yoSkL3WJt/aeo54hbQuz3G4Y88h62qvMqa/PyI0teB9lj7FUQ
	05nhBe5DFzQEm04v/CJWTO9wGBX1zz+OTJ6LuJS7zmD8HpkB2HtEtV99cruQytWkaZYo4hEzEaD
	EYsFsGYRu2q2I/PcBoHdcYdFprFoFLgPtZULhpFGfiOy5PMdjuZ62av1ViguBXmun4=
X-Google-Smtp-Source: AGHT+IHAMMaVqNcFCXbKt00mWYx1k7svFgamyQ2Dz/JB/xO8/9ZEEOBHGqEWFQrgSEj7qYC2klESaA==
X-Received: by 2002:a05:6a00:92a0:b0:725:936d:4187 with SMTP id d2e1a72fcca58-72dafb70078mr5639127b3a.17.1737139895655;
        Fri, 17 Jan 2025 10:51:35 -0800 (PST)
Received: from localhost ([2804:14c:79:808f:eedf:d2f1:c86f:35be])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba5340asm2215085b3a.150.2025.01.17.10.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:51:34 -0800 (PST)
Date: Fri, 17 Jan 2025 15:51:29 -0300
From: Matheus Polkorny <mpolkorny@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: hdegoede@redhat.com, ike.pan@canonical.com, mpolkorny@gmail.com, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Remove unnecessary braces
Message-ID: <6kfrdsmmydquamnxczwdcz22auaklzywtqytz72okysgw5bdpr@o7f3yybzmp6q>
Reply-To: 546c64e6-8914-11a8-7808-3de820f883a0@linux.intel.com
References: <20250115221751.233111-1-mpolkorny@gmail.com>
 <546c64e6-8914-11a8-7808-3de820f883a0@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ys6ld46vplmpylih"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <546c64e6-8914-11a8-7808-3de820f883a0@linux.intel.com>


--ys6ld46vplmpylih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 25/01/17 06:40, Ilpo Järvinen wrote:
> On Wed, 15 Jan 2025, Matheus Polkorny wrote:
> 
> > Address checkpatch warning: "braces {} are not necessary
> > for any arm of this statement" in ideapad-laptop.c:1858
> > 
> > Signed-off-by: Matheus Polkorny <mpolkorny@gmail.com>
> 
> This too is lacking the correct prefixes in the subject.
> 
> Please don't use "fix" for non-fixes such as this (in the subject).
> "prefixes: Remove unnecessary braces" works as a good replacement.
> 
> Checkpatch is useful too for many things but running it over the codebase 
> existing within the tree may return "issues" / "warnings" which are of 
> minor importance such as this. While I can take this patch once the 
> prefixes are corrected, I hope you don't end up spending most of your time 
> on trivial changes such as this as in large numbers they will likely start 
> to become a burden.
> 
> If checkpatch, on the other hand, finds a real logic problem or 
> something that is truly misleading (e.g. misleading indentation), such 
> patches would be much preferred over this kind of changes. So please don't 
> take the above as "never use checkpatch for the in-tree code".
> 
> > ---
> >  drivers/platform/x86/ideapad-laptop.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > index e980dd18e5f6..408e7d1cfcb0 100644
> > --- a/drivers/platform/x86/ideapad-laptop.c
> > +++ b/drivers/platform/x86/ideapad-laptop.c
> > @@ -1633,11 +1633,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> >  	if (WARN_ON(priv->kbd_bl.initialized))
> >  		return -EEXIST;
> >  
> > -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
> > +	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
> >  		priv->kbd_bl.led.max_brightness = 2;
> > -	} else {
> > +	else
> >  		priv->kbd_bl.led.max_brightness = 1;
> > -	}
> >  
> >  	brightness = ideapad_kbd_bl_brightness_get(priv);
> >  	if (brightness < 0)
> > 
> 
> -- 
>  i.
> 

Hi, thanks for the feedback.

I’ve updated the commit with the correct prefix as you suggested.

Thanks again for the guidance.

--ys6ld46vplmpylih
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="platform-x86-Remove-unnecessary-braces.patch"

From 793892900d9d3795db82afb5cbe411dbdd1890c4 Mon Sep 17 00:00:00 2001
From: Matheus Polkorny <mpolkorny@gmail.com>
Date: Fri, 17 Jan 2025 14:47:59 -0300
Subject: [PATCH v2] platform/x86: Remove unnecessary braces

Reported by checkpatch.pl

Signed-off-by: Matheus Polkorny <mpolkorny@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index e980dd18e5f6..408e7d1cfcb0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1633,11 +1633,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
-	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
+	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
 		priv->kbd_bl.led.max_brightness = 2;
-	} else {
+	else
 		priv->kbd_bl.led.max_brightness = 1;
-	}
 
 	brightness = ideapad_kbd_bl_brightness_get(priv);
 	if (brightness < 0)
-- 
2.45.2


--ys6ld46vplmpylih--
