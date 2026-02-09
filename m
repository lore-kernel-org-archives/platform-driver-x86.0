Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF625DB1C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648419; cv=none; b=c/Tfrg8+lMnDVcjOWFUgxjTARlTaEShOQenKyO7Vly8SoK3DKs8akuC8cLqIWK9l4z4cg1bukhGEautE8S0OyalMNVxwjeD91eOrko50JVf9wjPsu3pwPny5qwn/EXQIBYLkXL2BlMJd4KPlE/mUSqVtTT66EUirE0n7qvSrDp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648419; c=relaxed/simple;
	bh=g/IegFTnTc0rOPtJkTHPz33+Ct7gpFXjh5a/DHenQw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfRoet4s3WK2MA/h1fFu5Jx9rNB+M2LnrmHyFPnmsmBk/jT+DvurNlvYEy4I8yrO6BbiS2HJvd3MJlgw+ZzFSG9eqxptBL28q4Hz4eDAiyk8IPR5OincUTjdq7MluCx/yTNnPVw83L3ehJIlQ7p+GHqS/yTAcPoMMFDM2AhEHgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJhXOKga; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJhXOKga"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124a95e592fso525072c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770648418; x=1771253218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loGhkNw9hQnX7iCGay6BncEbLnIomhfI/manI8U4kQQ=;
        b=XJhXOKgadGGbhmpmez4bSZbsO00duJyzFw4UkFCoZ+K5nWIA5d3mCGvU3aQfhn6HJx
         a7zmO4DOeKi2taOEh6LDX0oAylfI6wVkVYZW+aUjPW0yaR3XyxExJoNkeUyn5Ycdkb4A
         eLcXNnzB08FQmzJx8j4o/Y7p58JESdL4DrPbSerjqQniZyd6Dqw+bM243+rMdFyvWOW6
         QVl41W35JqvzY4XeZZTq7mZQKUHDFmV0mBjG/vj2sP7UM+Z+uo9rYYqRe+7KIFNN4fQu
         cPNNF9/3WmSgmaFDjen4HgZ6Qq9kYb9ISalBsf8w8Zo7Pt4NTrHvV3mNsYuY6gxkhQhM
         ug4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648418; x=1771253218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loGhkNw9hQnX7iCGay6BncEbLnIomhfI/manI8U4kQQ=;
        b=SllMTFOutYdk+idQ51qewMg58ifcjKSqMFzKyY225Rcjlo/RAJnBDCYw9YFn/90830
         9QtBpsi1lzZyvkChxoIzWIgrWeT6BoZWSJEWviQHYCWic6YP0hqgDMToZ4fdKqQL39sM
         OTZZA6mjzfH7Mh4t3wnILp9ZIh7bw4xbScOFNkrbw6j4yyLIfPdqWGlbFqVMJUH08Gxn
         mJbQe645ePxMMLfsjZytNPtjIhHprqmM+2WpSamMEkkzXugp6SiEu5wFW5CkmZyNRkPQ
         CLbnKur360m1XJ9hxIRBBmfpAx6bQvTCMTAbrrPXjx3AvL6YKYSADBqGG7zDf4i9JuM0
         APgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzWc2/lH7+fzDmXKmmqY5YaenL0MZq2WZ+K92zBRq07fZJcemQe1q2NFWJsoXpqO7R1dlpKgaGzY19dILtv02cq/1m@vger.kernel.org
X-Gm-Message-State: AOJu0YwCXnzjQ+bdV//uP2s/WAIzvv9deRjzUtvgs8JxPEYszxdfSP4a
	bHO+nkrsOjwxbD7w3+WhJgX76FFKjpHhr5E1seZomBrcAOAqtjj/XCsr
X-Gm-Gg: AZuq6aK5nFueSEG3BeY8wef6Kl/JY7y3+YusyL8m/uT4128FwdXSSGWgsLL3YDFmQmx
	oouH9l7khPKtc6qkP93+mnu9QnEKe7BIJVEyhlKSkw4z8iBzKMz1Jg0VaOnSWzNf0MQ9CMlespl
	3wztaPnbNZ5otWVgfLQvg05Kp1J9eTpI6IS+P3WJCepcDsTeHTJzptDqRGICUATpEdl7Tu7GZop
	FZ/b+7KVSc6HpwR90RC5PYLkOFgwk+1wHznapmzQCKEbiZexm0V9PZc1miGTuh7MrxaMyUBKqAU
	WYLCb884NiUPvRPxj2C1YncAUeDztsM4XGr1Gtp4zlQ92Gdbg1yTHGRXpgeZ3FO1DdDDkeybax0
	BcVqDZOwZChBUJZ8LNwhsDEVaJ75WaL5HJCPve8MnZP0sCsCmPMzUOdfcmtbEcd+mzL1lPUJics
	fy8w3dB2mid/GvMfT/yDmkhH3fNhYnev2FJfJGvtpuRh9/I27gdw==
X-Received: by 2002:a05:7022:2484:b0:11b:ca88:c503 with SMTP id a92af1059eb24-1270411beacmr6196648c88.3.1770648418248;
        Mon, 09 Feb 2026 06:46:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b95505b8d2sm4328486eec.6.2026.02.09.06.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:46:57 -0800 (PST)
Date: Mon, 9 Feb 2026 06:46:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYnycxR8nxu85Ivd@google.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>

On Mon, Feb 09, 2026 at 08:36:01AM -0600, Bartosz Golaszewski wrote:
> On Mon, 9 Feb 2026 15:00:40 +0100, Hans de Goede <hansg@kernel.org> said:
> >
> > For the drivers/platform/x86/x86-android-tablets/* I think the following
> > fix is both the easiest as well as the best solution is to modify:
> >
> > drivers/pinctrl/intel/pinctrl-baytrail.c
> > drivers/pinctrl/intel/pinctrl-cherryview.c
> >
> > To register a swnode for each GPIO controller and
> > then EXPORT_SYMBOL_GPL an array of fwnode pointers
> > which can then be used in the PROPERTY_ENTRY_GPIO()
> > entries replacing e.g.:
> >
> > PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)
> >
> > with:
> >
> > PROPERTY_ENTRY_GPIO("reset-gpios", cherryview_gpiochip_fwnodes[1], 53, GPIO_ACTIVE_HIGH)
> >
> > (these 2 covers pinctrl for the Bay Trail and Cherry Trail x86
> > SoC based Android tablets which x86-android-tablets is for).
> >
> > This should all be pretty straight forward. Assuming we are allowed
> > to dereference an external symbol for the property initialization
> > if not then this becomes significantly more complex.
> >
> > I'm not even sure if we need to add swnodes, we can probably
> > just use the existing ACPI fwnodes for matching even and then
> > we just need an array with the ACPI fwnode pointers.
> >
> 
> Yes, we can now reference fwnodes from property entries. The entity that
> creates these devices should be able to retrieve the firmware nodes of
> the GPIO controllers (e.g.: via gpio_device_find_by_label() - finding it by
> labek is what it effectively tried to do now).

How do you do that when your code happens to run first, before the
controller is instantiated? gpio_device_find_by_label() will not
find it, so what will you use as fwnode in that case?

Thanks.

-- 
Dmitry
