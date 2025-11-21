Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3202E6CD2
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747514; cv=none; b=tPv4OpyP/iwUNufBwZIFt0yCBGDOPe7Zjv48gmGxLDYJ3GgQxfzs7E99yxn/GtYi3rDTIVX3GJsNE/PGRVogHlAPwXdvddRm3s21RsfnV6EB2NudNuycMnmKVNMh570Zrc208bSoeCOJoQVbo2wOziF45OEZkzb03oMzCLrHmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747514; c=relaxed/simple;
	bh=j79W1XyLkc2cQk8yvBCv0HIy2fTbW2KPf6ds/HaH9yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUq2UGFnVndAhg7bkm1/cbE1BgZzOWTKKuvPATmo4LO6FGYfac2ZeME+Fpj7qfirhHFZBB/c3yKCXrcYydYX/TMSz7kAYBiSDNZB0IrKBJGtZ7xIae6eMeQ3hk+WuuIZpDRtDS9T0CNVmRn4fn5mb3WOD8m3WVACDO+5nHomFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oIPkldrw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oIPkldrw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32a5494dso1335429f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 09:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763747511; x=1764352311; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgij7jlSeeNtSVewK3YJWmAW8IZcuGiNJDGAyt5nnbA=;
        b=oIPkldrwA7J8tXjqkEwMEfPt+f1aVS5opjvxUeTcYyTx+QBqh3Tgf3dHugPBvfBEmR
         11YH2l4w6xlksauIZCW2ZqbYch6hKqt/WN8cQoMX4YyGKehCfZjWpr1cXYw79XSnSwrH
         kN10cIN8nyLe12S8miEmdYOvNkPpiQmXBXstkqukP5eIdLRLofehPbq2driyxTUx+PV4
         Akf+t+mrAiEsLMvUswey39E2q34pJvQbZ1k8ATqE8P/dReuxrNMux6CRIyBm0gNlFIcO
         jOrwjb9c9Bc+r3vPxhBvxpric9O0eCPICDKdgGumybO8F5sOgdNiw+01xBRjJfpgu3PA
         lB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747511; x=1764352311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgij7jlSeeNtSVewK3YJWmAW8IZcuGiNJDGAyt5nnbA=;
        b=c1aeFRkNRJN/D1go4FWHSdNFA6cGBqocFX4gl9rnN8kPlobiWLg7WJ0o6T4WeXncA2
         emWHmMmigpE4h/9Adb70Bk+rOZuc14lU4CqvOOFVI9BBU+56GmIi796iSs88qPMUH0h5
         6JBYyWrwg7x6D4T8oJk3GxfVibf6ArjZ+1XD80LVZYOuD1SSC+TGlFHaCFXt6MmS/8HN
         M5XnncDxuljamFT/hdf0vi7tcBDJG2dIIbTPfXKw50NAVZ2fGqR2uAXlQmrPrIlTkUNY
         jiXbvK9uR3tYwBD+aQVbRIBWvlAW9iK9cuGMxySY2eLFrRs44ZLB5BNp6Sb6sCagoWuG
         X7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPTdUTW5TIQ5mJfRdvo9HIeKhwEMKlGetDLeRFR4nMIJFr/aGte63BkCNU9RKRegY211wWnKsYRJPB2WpYJTokXh8@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2o6dYchFHyFbL4+vPcmAuS3uAfkFvwX0lAHkn3oq3drqFeUA
	j/I/nDecds8ydsLkp3WK1e4BCDJDhXaaL/rlyflxMgs+YBYXmLZOxleykMT7XBvC98E=
X-Gm-Gg: ASbGncuMyZxKFJlafXVau0kGIHLkg91iEBVFt6thDD9f2kfJzr3C8GA+8w89QOUxEY8
	qrM4owDYypqUH3cE60QwxXFDn+rdGVwRXO2TvZo7l/bTZjQf5jVyCKqSVBBtb/tLmGw5C+Syq97
	qxwc25XnZs9MMgHDbO9IrfxHFxv3qrTe0HYoMlX43jIjBygcvAwrr2qc2PGNLnXo44HJvmq6CQf
	A+asgxfKS6BDZPL7A8aLrDnCLOi8U6ogBKXHv14RJQGZSJICBBbWYEXzxQJD+weS2mKnjdL9auD
	Wk8Q5sgc9TMEdJyrWV5mP20ErG+qvnuaEhvPPAC7ZmndjQWzONnIyKXe8Czv4u21H2yAZ41o1IY
	2CddlqAgHlPbJUDRIG5p9/vi1PaZi0bXQxOb8w0wFZMevD6Zn2qlGNML86/0YuedkE6MfHQVbcA
	5Ot9pK9PzfpomBbrT0
X-Google-Smtp-Source: AGHT+IED4J1eKGNDzGdZCS5b8bNqyTBjdzOFb1dzYZ1eI+fVN1oo8ZfJwofBTEhCKrfZm3+XkNeYXw==
X-Received: by 2002:a05:6000:40cc:b0:42b:3cd2:e9bb with SMTP id ffacd0b85a97d-42cc1d2e29dmr3229968f8f.32.1763747511226;
        Fri, 21 Nov 2025 09:51:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fd8baesm12240013f8f.39.2025.11.21.09.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:51:50 -0800 (PST)
Date: Fri, 21 Nov 2025 20:51:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>, Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel: punit_ipc: fix memory corruption
Message-ID: <aSCmsyhV-aPu1WVW@stanley.mountain>
References: <aSBqXtt8hJb7WYIc@stanley.mountain>
 <c5867aff-4b9a-9cf4-98ab-2e00df9aa4f4@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5867aff-4b9a-9cf4-98ab-2e00df9aa4f4@linux.intel.com>

On Fri, Nov 21, 2025 at 07:27:54PM +0200, Ilpo Järvinen wrote:
> On Fri, 21 Nov 2025, Dan Carpenter wrote:
> 
> > This passes a stack address to the IRQ handler, "&punit_ipcdev" vs
> 
> This first part I don't get, why you think &punit_ipcdev is a stack 
> address? The punit_ipcdev variable is defined in the global scope:
> 
> static IPC_DEV *punit_ipcdev;

Ah, right.  Sorry.  I thought it was a local variable.

Yeah.  Let me resend this.

regards,
dan carpenter

