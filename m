Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935735F8B9
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 22:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778106561; cv=none; b=gUX3dqdwU3DbH8gU+7ggcmpyEGya//QLnB3ee4ghlI5l7186SgISZPUr6cmEelkpWqLV8xWYFcvB3U5HFkNyiS00biIcdma6ghkTMYv1Ht0sFMp+LKkZxRNd+fnSR7E3dKG3uWhhDLenNhQuzMv/DYXszfClGeEtitZkDP1gN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778106561; c=relaxed/simple;
	bh=syHQKK4JsopphANV2TJCiSQfgqrFLsrE9ai51BVRsqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+8PPsn159KC9k6NcEXSS7DIiNMV9xcVYhk88JCZCRyLY9Mp/STS01MfzslU9RExxec6A3pbe78MBKBjgcafGKqiycXI6qbyUkWtYZjW3x4pOkTFubTBKCfPZShqWbkzZcSCvHFVe6HSNjWcKqsiL7A+nFl8CgfjdTd+XIi2Aho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJtVLbGu; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJtVLbGu"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1305908ae11so607115c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2026 15:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778106559; x=1778711359; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMIEh35SlEQ8+Qq02/gMzNeoy3M8HhQBITtq8cOI3uQ=;
        b=ZJtVLbGuXWCRoC6tULr6g4dr848oyrFnV9zc1bp58SeYmURSu3//b0A+H+Zoiwcitk
         CiXkFDAJCUToOGvMZS9vEzyymnaOr7636u5A8r6TZUr+ISNFS96ncoFHwH+pyE62gh1p
         rcZtuJiULwuZ4KLJNeFh9paie2AG0bysHLrqkJ1B3sHhCEjW9u6ct6QVDwwLAIG23jZ7
         3yS7zkWip/ZOl8uTmXy5tnRo1ZZTV0gpRzoTHC8IiBlWskpU7u5XOLvohXMKqxrfkGDC
         ynGhrfQawr4ICs3nIuQPsq5afcWbDSMZlwqEgRr43Y22hHaTmQ7i01js7Zw1YRBW/KPt
         B2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778106559; x=1778711359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMIEh35SlEQ8+Qq02/gMzNeoy3M8HhQBITtq8cOI3uQ=;
        b=StSwSjRIN6NMrsSN9nPRUQXwjaDzC9gGZu0yjQ9blFt63K17VapUhS6JYjMlJy3pm7
         AROxRgVdvXtwxJzcZ7ba89mDyhjcAGUz7MHuViw0pR+WzLrFe6lfdS6cyCBtUjIfgdaR
         x4i48N7I3ZVcYyB9bVJHegmCx57tqsoeA9VVAWWgKNV3GmECjQLJsoD+IgmQwUZo7WyF
         ZlfUMr5LSImKcYF7JVUlw+6DGVrIBglSccHwm9HgW3Lfbd16EixAQAWIKL69WH2CgJrI
         jE7cPkhFNUKNZ7wyLalIXhtoLbJiomDMFxx3Xukjs9iwh6w2zTLlHmLIGj34jf15XHdz
         7XUQ==
X-Forwarded-Encrypted: i=1; AFNElJ++Fa7sXFjh+WEGFlyWNgX7OhhGi1LYQ1UhO9hMm109NxI7U7X5M7scTWqPoeJYtOf4Qs53g8ItT4dPAEVghYntsiNC@vger.kernel.org
X-Gm-Message-State: AOJu0YwSS9mmEuaBSjW6Y+SMJ8zV6prMabRnNn0r+dEDzgpPWNRTaHzC
	/R51K37JaVhDbago+7FHOOTxFQo35eHPL5ADl925Wt9TvFx+BDHIvMtQwiV41HrF
X-Gm-Gg: AeBDievULjHPxp9qpaZeTG/DPQwFz22VAYd8c1KBg3a5RTAFgqBqXvpyEj/y76VsB8f
	QA8PlCTqJj2mkfMgsjuDUBXyn7CpIesEHdVMQYlRe1rpBlKMgiOPZRcFVROeFH1HHHzNbWmau3h
	Nm+AUikqziiHLyXyTTXyEHOf10zfeHdkrOjlUe7hwbqqRkpSBmlkN1HEj7RbKVw4AAKlXU1+l2B
	FXEGtml2Yrr09YzOn5Ik6w7hRRTmLPheCf5liF5VS+jNSYOUGAC/0eGtNrHGQcE09MYibdFFsqa
	CcTlOvzFlqBlgtqx1/4RmO4fVVNBXQSZnHIwFnZChwdryKBoq/l9/yVFGrF3KE6kGSwgODcgeu3
	lZ+Hv7bzedfjN7Lo5qL1kEaNbLNUYE1fgiLnt9rrdSh1h1+eBqsrc9uBpDBqgDgZ7kSlkP62b44
	ZNz59htsschsgHzLiqFVBGEZeDD0zpJX0yqEGdNK4248nEhzIVr1QCK9RXfVU=
X-Received: by 2002:a05:7022:221a:b0:12d:f0e8:9696 with SMTP id a92af1059eb24-131852d2559mr2462701c88.4.1778106559293;
        Wed, 06 May 2026 15:29:19 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:8c1b:a86c:e959:dc9e:d86c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec591fsm5267732eec.1.2026.05.06.15.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 15:29:18 -0700 (PDT)
Date: Wed, 6 May 2026 19:29:16 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix camera key led on Zenbook
 S14
Message-ID: <afvAvE-yhB6L53H8@djouze-zen>
References: <adg6GzkykThAB_4u@djouze-zen>
 <ce2a2f37-ad8a-647c-0db8-83f6efd99f12@linux.intel.com>
 <afFAvIbAS6ue3ZaF@djouze-zen>
 <cd3fc0ef-c15a-8f41-9162-c042daa44969@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd3fc0ef-c15a-8f41-9162-c042daa44969@linux.intel.com>

On Wed, May 06, 2026 at 04:18:39PM +0300, Ilpo Järvinen wrote:
> 
> So if I understood you correctly with LED_NEG (unknown if it's just on 
> your device or generally with it),
> 
> This doesn't work: set
> This works: set+get

Yes, that is correct.

> The extra get shouldn't be that harmful so doing that always if 
> CAMERA_LED_NEG is being used is okay at least with me (make sure to add 
> add a comment though so it can be known later why it's there even 10 
> years from now).

Ok! Once again, thanks for the direction. I'll work on this as soon as I
can and then send a v3.

Best Regards,
José Rodrigues
