Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CB32E73E
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429537; cv=none; b=BM5ZR3Jqgf0PFNu118Jhq4Vr8bcaJDMIiJbxOctE2m7ZJ9EuCJHVa0UET9rpW1MeOBCElHaDVjTsuAbBj3/+K4gpXSQtQaAHyx5KfplKgk2V/AXEuAZivHGlgRII8G+LQQzXfJ3aOV9nLorQRiOujLla/pqG5Z6PojsMhSnkEBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429537; c=relaxed/simple;
	bh=RtE5OXzl9gAXuNGY1zAB5yc7ANJZpFXg10AgE3yzthU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMg/6iFZlPYjUX5jh0BWptj7O5Za90diYk3E3AjOgJpJ9qRTw4Blre8Qtcy7Cn2figQEfMf4YLo4Ctc1tcflP5DNUnFG0eOdM0lC9qqMo8crjwp+d+mi3uRBIMBMeZLpRpWXWRTbW+De3FMBu8JpUFh7GTaeJyg6nWKYF6goAQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pfg+KVAl; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pfg+KVAl"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca913a601fbso1658228a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429536; x=1786034336; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BjKUgTxXBjM8CTczXKH9p5sagunRH1DdVr4Fm3Tif9U=;
        b=Pfg+KVAlstVEvbZNGLyTeKSmGXlsA1/XesPlvYISrB9FJ58iq1LKA5+JWyGOVptXgt
         25G9QYdRQAytZSjcL+fYeRiLQ0Neqbm2cuB0LyeNHRmO/RZfkj5F1CSvVKeGHULMXceL
         QFRIlYnz/V5vg8CtJ3BOHcYKpK6CqbmI4D2S+fYP+Nd6NTEVb9m3sMtqoYL+GekKzvDw
         r0eGASrrFoNCrqWTDC7riKQ1FnCHT8BmDQEIVMSKbPuyJOmSWp7nW0XO5YAHt+7n5xBU
         EmvS+laSJmOwHG3gEkobNg6EM//p6iKijnoB7wxS0zRgqIsMdOFT+UMwJE0ZbXIz8bqK
         zs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429536; x=1786034336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BjKUgTxXBjM8CTczXKH9p5sagunRH1DdVr4Fm3Tif9U=;
        b=X3wfsRmfZKOHfBVGFci1Kj40OZIeOzYi4iQ20WgqRXxsYb98AiLLM6apXvwJ9+QbAg
         7e9qL0pnfXGwGwJwFU0WFQAX87TZ8ORrAOfTn5cCsOFBGFl8E2cygVXBst3ENb/cc+oY
         aFLZjYg47T8TvBXiIJaDerLDy8KOnwMr1AKUpiaw5sqyh7d+ZDFBdtHMe4Kdk1hd+iy5
         S0/hLsAZ/kNutazu/ZFhKj+q7Rs5E8MD9PUUXUEx8da3qfpqG2ufxHpFPtgfk9N4PO1t
         pqdR4wILzZfqB7pQvACVMkxRmhTg6YaG0ESQGurRuMCYW1XRACeMaYf7+4HcJXl64QNI
         rInA==
X-Forwarded-Encrypted: i=1; AHgh+RqD4D4sQPpU/1zlGCjoYLrhmqfJqO/64lrT/5uCKQ/RqjyaHtmuJj4iwUGrAToUYyqgnHR7tPHYc/M9wHa03xZTzyRm@vger.kernel.org
X-Gm-Message-State: AOJu0YyOpobJtaDHlwrWyba4iTpgDQw/f5BnjFsS/9i/6476BmQc96kj
	I99gE/MybnYOJNUXG8zEO9dviEy6GzzhZVcg/AlM5aXZMpQWXaFUUN2C
X-Gm-Gg: AR+sD10Co6ZSOxArmo5ajeHQyCEFny1/CivNXhYIstZAeunAH8WiNiVvyzm1exrHh77
	msmFa/irrWW7l+JM71xMSFFjwfWe22DoYS11Ylzmu9Dfv7vzFVMJlp7+pDrU0I7FPitzIjiJd5k
	qF1+pbFkTBHLxBWWsD1tqSZNjzwate0Vx96c0pUnQD7UnIPgT6ac/Ry5z2qGJSSPCApDfY6+5X0
	MVHsEWTEmCfRpTMGwW3mb0m1JkimiA1j5rWiRZvBCBcbVVxgUQ3rjEm6iuGK1ysiuLK0a5o8Xh0
	MbRithDNvMjbojcDCR9n9QKivUUMR95sYORFYxkk9GVOeq1sxpSMYr4JPcJjnUQzgx8gLU5rAYd
	4gqIuksJ9UweY8WHZv4YpnidnZBUOG0pa9zkXwOXga1N0YOVc9E2fakyZqxTjyzoUNcHYY9n/Mt
	lvPCPThS12bO3h7f7U4c0KMZQt+bq5PGVLvjTtUhP0WTu5Axb+KyUsEgwIr+w6X1E=
X-Received: by 2002:a05:6a20:2449:b0:3c4:2a97:fd2 with SMTP id adf61e73a8af0-3c900a07ee1mr3326479637.67.1785429535963;
        Thu, 30 Jul 2026 09:38:55 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb83459f6sm2404300a12.14.2026.07.30.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:38:55 -0700 (PDT)
Date: Thu, 30 Jul 2026 22:08:54 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: "David E . Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/ABI: intel_pmt: fix 'threashold' spelling
Message-ID: <amt-HvGSTKCYCwt3@acer-nitro-anv15-41>
References: <20260726063734.19944-1-shaikhkamal2012@gmail.com>
 <3391ce45-1f3b-a6b9-92c8-2b94a801c6d9@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3391ce45-1f3b-a6b9-92c8-2b94a801c6d9@linux.intel.com>

On Mon, Jul 27, 2026 at 12:12:40PM +0300, Ilpo Järvinen wrote:
> On Sun, 26 Jul 2026, shaikh.kamal wrote:
> 
> > Fix spelling error reported by codespell: threashold -> threshold.
> > No functional change.
> > 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> 
> Does your name contain . ??
No, Shaikh Kamaluddin, I have corrected the same in patch v2 [1]
[1] https://lore.kernel.org/all/20260730162929.16377-1-shaikhkamal2012@gmail.com/
> 
> For more information about signing off you change, please see 
> Documentation/process/submitting-patches.rst
> 
> > ---
> >  Documentation/ABI/testing/sysfs-class-intel_pmt-features | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt-features b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
> > index cddb30e5bdf6..476ba070fb1e 100644
> > --- a/Documentation/ABI/testing/sysfs-class-intel_pmt-features
> > +++ b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
> > @@ -121,7 +121,7 @@ Example 'caps' content for the 'tracing' feature:
> >  	watcher                                  Available: Yes
> >  	crashlog                                 Available: No
> >  	streaming                                Available: No
> > -	threashold                               Available: No
> > +	threshold                               Available: No
> 
> I think that anyone can see what's wrong with that alignment. Perhaps you 
> didn't even look but sent the patch blindly!?! :-/
> 
> Please read through your own changes to avoid a reviewer having to point 
> out trivial things like this to you. It wastes everyone's time (including 
> yours) to send obviously half-baked patches to review. :-(
> 
Sorry I will take care these.

Thanks,
Shaikh Kamaluddin
> -- 
>  i.
> 
