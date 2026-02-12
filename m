Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357521E0AD
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915039; cv=none; b=hDlo2vysosp4E8Eb5Iz6uh3LrUxaIb/Fve3JXRq11SjvX6B1IwUNtZxOXa8wLFqQP+pFMUh+likKUn789g7toYkbtVxWr/rVYbB5kve8KCScFBmu++7ofmovg8QwJe4IioPBOyDQjp+qao+71fM6CK0RMBaeOKXW2jars7DEZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915039; c=relaxed/simple;
	bh=7i0ajd3oC1OyG0QPmRct++q3tuYP0ZxM55YslR6rhdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/12E8v70E9p5VgAOoVVAFXzYFcJIq/tmWSRbAIcQJpOfn372A5T6/kOZ/RHSEAligoS4c2LaivqklyoHv4PFczpyc0Rt+ucO29vo7BWNwNfFB/seObR9zFm+CgaFFfV1jZjUrFZ+MAWlue+H+NTMuhYvvl9jUx4sOasfnwxEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxKef861; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxKef861"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12713e56abdso9914c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 08:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915037; x=1771519837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I2f1HmUO9NqaBZFhnOPfdRxqdXOTDosyomrnU1z1Efc=;
        b=gxKef861eyWfpHsV5wgFbzbIZIMkGzhMrg4ZWhWQ5iPV7KKsbkU0VqCyDizzOixbLR
         nZH7EgJVpSTLanCy/vdo9T7QaGlIsRPKgCB4aW7DkWvNESuvfk1/A82btQR05Oyyi+ob
         ZJYX++u5j/2HZEDYjCQpn08PjPrfIRcVMva74UN0ulYbRM6rcrWSwlVInInO5oCr+vyl
         oOVxInoEKZ1/l2CUcx+Pvf+KTRJXtr762mjCyouerrZv+QIv8q2tbeGylfgSTODglEVu
         0fl30LTtt+/HaAhVaSM3k1h8PXxuVrtv49dyJ07kfPa+sldU/fTAIVVlP27J8ckzWasZ
         X6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915037; x=1771519837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2f1HmUO9NqaBZFhnOPfdRxqdXOTDosyomrnU1z1Efc=;
        b=iMiDSje+o7/8B9byP24zearWsffbcaBz6tKEODqNsc+djDtvZG+Au2XaWgj465nMk2
         Mc+0/uDFXEUibWgZJjA5ZpVR90VED1ifUfGK9SFF9D4huJMu+82AnNhRvse4JOSdpAii
         ZB780z/YsgIE2XvXJFgGCkwis7Mv+wE9TaUMgVt6Mm5okfwhTlfXy2yU0pg6GeMWLfbD
         GNaPZazy6R7on3nVjLotCvz/8vZrlS0dj5iaLcTrONnOev/nyFRO98KBrZSG/Z09qDk5
         ktMH6BABF/eIVt7l/qWpJfMZ/K0TOn7Nlc3h98yNw2PspSRq83LYB8BwSUDQ3HkWRG3q
         eNLg==
X-Forwarded-Encrypted: i=1; AJvYcCXwpvWcgjAG/EsqVBjoeoroppMaxt52NvBL5dORy+n5Qtd8GWneoN+vvWgsDZrAyOBtnWj8+FfprO3QJm4kK39JAUbu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2eSdy9OOyytbEkjMsTrUm5TVtD8NfHb9odVN5q6lfHWMskLCf
	RhSFMVr2RvjrV8MhzeLaMhFPU1aTfxXsvcYPgcQGQrPrVr7yfnDMfH9w
X-Gm-Gg: AZuq6aLKzONpggajk4WuTegU8swjV/5xhioG4TmWaGukWSC2pBl2zVeNq6JmhRL3rwK
	WE6i/KcDiyNUU09Q49HcbGBTHdgvehC4kWl3QWU0PRMynjDpPxwD0qYZeC2WYv1z7WSgOiT4v+i
	9ySVvQM5wR+lvD+CWXRWQUyc8efslqJg98p1ijDgdoaBHJTWBgFnkt5xNSn5REl9z1ZNTIw5Nsu
	yABXGLrhoSho6MklCqKJvo+VhKbEkLQkT3qCbVmni86cCuqt23Q/SypV00GmEntbDuycgIg4t8n
	sV2Qr1bYRcbQn4hYAhTr32nJrEMzow79UYFMph6EsqqrnkvfZrwLqjLuWa6sCiVBbvVt8Ixsz0E
	GeOgxqoXLZ5vGNxBPw95Y8vz/GQG6Y963obIxYLtOvK+81UtDDf0MYdUuttG2VPyWCrrJVovSMV
	FDM+NNTITGQ0lCagjqOrpT/Ed4oGKCBUglFDroPgWWxiZA4pvvYSRgNcPmZ3xpnt0=
X-Received: by 2002:a05:7022:50f:b0:119:e569:f86c with SMTP id a92af1059eb24-1272fd7a9d8mr1229694c88.9.1770915036860;
        Thu, 12 Feb 2026 08:50:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6f3256sm5556347c88.14.2026.02.12.08.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 08:50:36 -0800 (PST)
Date: Thu, 12 Feb 2026 08:50:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY4EqvRduJnlg3iC@google.com>
References: <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com>
 <aY318Dg9gMU1KFvx@google.com>
 <aY38A8MbctpAgDqS@smile.fi.intel.com>
 <aY38ZBTfbf9a7Unw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY38ZBTfbf9a7Unw@smile.fi.intel.com>

On Thu, Feb 12, 2026 at 06:14:28PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 12, 2026 at 06:12:56PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 12, 2026 at 07:49:31AM -0800, Dmitry Torokhov wrote:
> > > On Thu, Feb 12, 2026 at 12:28:41PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Feb 12, 2026 at 02:01:02AM -0800, Bartosz Golaszewski wrote:
> > > > > On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> said:
> 
> ...
> 
> > > > > +const struct software_node lpc_ich_gpio_swnode = { };
> > > > 
> > > > (With name, please!)
> > > 
> > > That we could match against... /duck
> > 
> > :-)
> > No, it's for the /sys/kernel/software_nodes/ to help with debugging, et cetera.
> 
> OTOH, if there are more than one of a such controllers in the system...
> And it can be found by reading the links that one of them related to
> a certain GPIO device. So no insisting on this.

If there are multiple such controllers we cannot use a static software
node anyway as it should not be shared between them.

Thanks.

-- 
Dmitry
