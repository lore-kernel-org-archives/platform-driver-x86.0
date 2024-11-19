Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C4938DFC
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Nov 2024 04:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731990591; cv=none; b=giYvoxVDgZ837AICtntx0PxMYp6DrMMNRYGCuxBgCaXXJJDEZaQrtALYzK4yO7nNjTfnqdOnuMh6hBuu+O+5WJPdUri+RYbpYxjLrtiyGoZrrxLACP1GW2s+YW5aMwvFhPts4R9cyBYi16fQ89OwPLygjyYWoxULqXe59SVtJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731990591; c=relaxed/simple;
	bh=UhqGBMBWZRX0Z0h99docoTlKD5birArhTVtFz/6I8Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doy4bvIr1goVP9qjZQbIqFry0y1RFd7t4RVNxp2QL3Sc7/RhwRkC+pu4anu/7KTsFWMDiEIKPRttSFbJqM0ksPIhMPwHZ7Q0vLJZ5cQcmgw9Pbip8gn96cjAx4JY3SyertQEDbPsUxkAPx85ENZ9gz4CEPkgVfQHp1okzd/848A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwoZX7Mf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwoZX7Mf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7f8095a200eso3512286a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 20:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731990590; x=1732595390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alaITwKRRNbWJbHT4BcwHX77qJRNBncn4HJr7ODgzJU=;
        b=WwoZX7MfEqlTtKvnokl1SKIIoB0k8HPxj1vAJ4zv+m/dKQt+8HLs/Ykc9XS5CojnIl
         EcN65SDmZGCBG8TRPLqbSzN7PVzZAP9yp9nuY2sn2pXSomQ/HMaeN6/fyYV506zVZSRp
         LA+FjMrlfFBj/9ETSXMkXmRzEv13tQ/j8nCG6XgxoZVeeVhTDVqBG8N+yxa3kl1eK9jL
         17EN4gdIsXsmoy4WzqM2EpNl/e94eeZAt/lmYA05wL7PTt6wQqEbYkP3gJbCP6OGXiLN
         ZBzsPTcRRD3a+v8mzQeuYXVmuLlMmgbvpo/pxHAn+1nJ2BxxsQYqemlzJM+ybWD3K3Ty
         WDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731990590; x=1732595390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alaITwKRRNbWJbHT4BcwHX77qJRNBncn4HJr7ODgzJU=;
        b=NLTouPWckaI6/CmeR4zQxLpmttIZ5H5FYgYAht4bvAh4uuKMRUen5Rbs7WvhKX6ZxJ
         6FoQxNWxokBo7jmZbS/n0y3wWnYI+0zZzHLjp0B1w06wIGVR2XmqmKsvIcRLOWJmd9nG
         YJOlsVtap/pSpjdwcjlqMVVdQQghzZPd494djaOW8CNy6/srPKtAZFmulQbbvtocmgL4
         QLYB4F1ifm+ITQfPpW66Fdggzturn+aZJ6IX55GxUefI9ZJ2COTgB7bXua22mp/CPogZ
         G/rd0TFRMId582ffjcU/cSIDAnbjVQOiHFjd5Ky9Gc6RNOwk22qLSuD1pX/gutvp3rCH
         PAiA==
X-Gm-Message-State: AOJu0Yzy3XoEDrim8ifIgg5qY6RBP8L7ttO7AK7dZZDuZUW5zhkdMcRe
	4Ww577ji1XNMDJI1hbq0B9wvqLVyJa1sYPjXCkSmUxEFAdALlq7djLVqqwi7
X-Google-Smtp-Source: AGHT+IGPMsiLZKPlQ21pdX0g3cPsx5xptoViXSZLeRLSXJk/C5j0/hkwEFTuXtDHVEMiPBto2bsRcg==
X-Received: by 2002:a05:6a20:565b:b0:1d7:86c:189e with SMTP id adf61e73a8af0-1dcc0e844e6mr2034428637.12.1731990589505;
        Mon, 18 Nov 2024 20:29:49 -0800 (PST)
Received: from alphacentauri (host95.181-12-202.telecom.net.ar. [181.12.202.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c2dd8dsm6775112a12.25.2024.11.18.20.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 20:29:49 -0800 (PST)
Date: Tue, 19 Nov 2024 01:29:46 -0300
From: Kurt Borja <kuurtb@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	w_armin@gmx.de, Dell Client Kernel <Dell.Client.Kernel@dell.com>
Subject: Re: alienware-wmi rework RFC
Message-ID: <uyzgfmsbd6dkeyx76fmstqpauj4ulnz2eqbww6dz7fwjxwxer6@vwuebqbtl5e5>
References: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
 <bf238c08-1f49-4e16-b9ee-1d1a5e0b9763@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf238c08-1f49-4e16-b9ee-1d1a5e0b9763@amd.com>

On Mon, Nov 18, 2024 at 09:54:25PM -0600, Mario Limonciello wrote:
> Loop Dell Client Kernel M/B for any comments.
> 
> On 11/18/2024 21:47, Kurt Borja wrote:
> > Hi!
> > 
> > I'm planning on migrating the alienware-wmi driver to the new WMI
> > interface, as it's currently using the deprecated one.
> 
> 🎉
> 
> > My plan is to:
> > 
> > rename alienware-wmi.c -> alienware-wmi-base.c
> > create alienware-wmi.h
> > create alienware-wmi-legacy
> > create alienware-wmi-wmax
> > 
> > The last two files would not be independent modules, just includes for
> > the base module. The base module would be in charge of initializing the
> > platform driver plus the correct wmi_driver backend, but the wmi probes
> > would register the platform device. This would be very similar to what
> > other dell drivers already do. Aditionally I want to migrate everything
> > to the state container design pattern.
> > 
> > I would do this in such a way that the legacy and new code would be
> > completely independent of each other (i.e. different state containters,
> > dmi checks, etc).
> 
> As the original author of this driver when I was at Dell I'll add some
> comments.
> 
> The 'legacy' code was very narrowly focused for supporting a handful of
> hardware specifically for lighting control.  One was the original Alienware
> steam machine, and then a few generations of the X51.
> 
> I don't know how much of the driver continues to work on hardware since
> then.  Maybe Dell guys I added to CC can comment on how much of this has
> stuck around over the years and keeps working.

My guess is that none of it works on new models. The LEGACY wmi device
is not longer included on new machines, as all lighting control is done
through an EC and the WMAX device was repurposed to fan/thermal control.
I say this based on exploring quite a few acpidumps and a couple RGB
control Windows open source alternatives.

> 
> > 
> > Pros:
> >   - Modern interfaces and design patterns
> >   - This is compatible with Mario's upcoming platform profile changes as
> >     the WMAX device would hold a reference to the platform device
> >   - Would not break compatibility as legacy code is independent
> >   - Easier to understand and develop in the future
> > 
> > Cons:
> >   - Initialy alienware-wmi-base.c would be almost completely legacy code,
> >     as new features don't require a platform device (yet), so
> >     alienware-wmi-base would basically just register the wmax wmi driver
> >     on newer machines
> >   - With this design users would not be able to completely exclude legacy
> >     code with CONFIG parameters
> 
> I wonder if you're better off just having the legacy driver as it's own
> kernel object?  If it only supports a handful of systems, most people won't
> need it compiled.

Yes! I'd like to do this but unfortunately some user space applications
might depend on attributes being available to a platform device named
"alienware-wmi". This is why I wanted to have a unified "alienware-wmi"
platform driver.

Thank you for your feedback! 

> 
> > 
> > After this I want to add HWMON and sparse keymap capabilities to the
> > wmax interface.
> 
> 🎉
> 
> > 
> > I'm sure there are things I'm not seeing so feedback is greatly
> > appreciated!
> > 
> > Regards,
> > Kurt
> 
