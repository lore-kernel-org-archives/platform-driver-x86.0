Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA21D2F3B
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 00:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732149547; cv=none; b=bSHi9inB4+p1uImEXzQd++tCqxVRHxOemR5hYrfUmkBN2xuE3/8qQUcZasT73AQfaG79mUy76lNwbu1m2kvqo+jwXeRTum9D/iqwOWiCUjCCJgz9zbdGhxIjqdZomLZByo5g3fHmyep3e82kqXdmbidxXxuPwgZPTdFp1IEXLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732149547; c=relaxed/simple;
	bh=epTFfuQ7NP1NbItiCqUqr5TKznpLE6Qz2+LOMqLS9RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv7NameIkRxQf72XM2IMKbRNrGup4ubn51eGxZBBW8C3+FhSEGXCX4zqNqke2F+zNvKzGKBSFudqbkYvrDQT88LJYfO3LHJbVn2yirumcz/aYSRcAX9c3Nqxbr1tF49s6IRAaCPvILILKLXFSlVT3WkNqF9ugZDdWvwh3VqM3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKGycuos; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKGycuos"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso315102a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 16:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732149545; x=1732754345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X2AjbGVBSgP3qaF2pDN9tlQI+xL7hWcEh5hVVQUrObI=;
        b=GKGycuosOi++GwvP+3dgKFM9uv9w0REUMbyezu0cTt64rWjztkpdMzc9EzUTzw3gH5
         0x+J36+hbiJF0tUGjk+IKt8cc3gW2flLTBe+0H6ja/fWOr3KP2pMactGWSYlvGSaQYkw
         WgUdO5PH58if8sZAstRzRLHdHbWzXKrhpyfi1CQcgSGfqDGd+z/NlnuoYeN8c1Lqppmv
         xIXRdjuRTI6r90YSX9ZA8UfWePcEA34tuKD4KCI6Lzv3HV/ScbRjaR3c0M9ikqzY+jeI
         sKmchMQ3ofU7j/5MJafnQYr9G1/xEP5vGXb/feff9lrSXfCx9s41O9U5oO9NqkuRxyQf
         3Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732149545; x=1732754345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2AjbGVBSgP3qaF2pDN9tlQI+xL7hWcEh5hVVQUrObI=;
        b=PvAscF+0eJpWMwyHyt675IKu/pT7GIfSmNJAoiipIgdonvW45pzTiyuosfcHPPNMEE
         U9mYWbd4xDiXXmbcp9moJ6hLIWeqcwS8jaDwrEO0fEL3G4XncPX8H1cRP1QGKYASlf/Q
         UPXXHIrRBpzvU/QbAAsM8PFUYmXH2nW4cCh9y9OkUjqgyfz0GTd9uG4efiqUhsaAx+z9
         2XVoQ+HERDUqPQ+ofLc5Z1ENJoLHbTMWqG966/ZsMmij1qo51dSjMLvevRqsbc1jajDZ
         xwqywKJbi/scpXFD1QjxTj6NvMF6Hq1VVe9SSMtBoCyccD7gdlRixqPFy4Q6cJeblIBX
         hNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4GI9i40bff0imRqZDMAnS9kDpWVSw+NxBhihjTDDP4U3ZUsjs9iVsCcGrmdP10hw/f901jQLzaoJdTtXvhenmgshw@vger.kernel.org
X-Gm-Message-State: AOJu0YxZj407AuRFX+TOn44U3jW/58zy1iJ7qFO9GG8Qa936eXmQfQr3
	zPt0JnBlq2+/gRtVTHomNh6MfoLe5CbIjTvCMFF3BGtSvrnFsKr7jfQLdNzu
X-Google-Smtp-Source: AGHT+IHPNxgO8zApijWTQKFX98aoe3zfFIULV24aVRCyQDDgd288a+AHnaSh51xoQYh+qfd8NK7l+g==
X-Received: by 2002:a17:90b:1b0a:b0:2ea:aa30:5edf with SMTP id 98e67ed59e1d1-2eaca6d84f6mr5647324a91.5.1732149545086;
        Wed, 20 Nov 2024 16:39:05 -0800 (PST)
Received: from alphacentauri ([181.84.94.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2128788ac90sm1664955ad.53.2024.11.20.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 16:39:04 -0800 (PST)
Date: Wed, 20 Nov 2024 21:39:01 -0300
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	Dell Client Kernel <Dell.Client.Kernel@dell.com>
Subject: Re: alienware-wmi rework RFC
Message-ID: <sjsq5ls6ydng2zqxbu5jwpiu4ekav5vf3dvsfptcpzz7coap4t@77uifjlxgqx7>
References: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
 <bf238c08-1f49-4e16-b9ee-1d1a5e0b9763@amd.com>
 <uyzgfmsbd6dkeyx76fmstqpauj4ulnz2eqbww6dz7fwjxwxer6@vwuebqbtl5e5>
 <7ce64458-4390-4630-8d59-66e37d6f4521@gmx.de>
 <gz67ujg6ggqx7gq4grm2jzi7assjzmcches7dmqaky6qi2fvjq@kkkbkj2z7i5g>
 <9692d8cb-68d6-48e3-9830-8c74da3902ea@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9692d8cb-68d6-48e3-9830-8c74da3902ea@gmx.de>

On Wed, Nov 20, 2024 at 10:07:59PM +0100, Armin Wolf wrote:
> Am 20.11.24 um 16:04 schrieb Kurt Borja:
> 
> > On Wed, Nov 20, 2024 at 01:06:57PM +0100, Armin Wolf wrote:
> > > Am 19.11.24 um 05:29 schrieb Kurt Borja:
> > > 
> > > > On Mon, Nov 18, 2024 at 09:54:25PM -0600, Mario Limonciello wrote:
> > > > > Loop Dell Client Kernel M/B for any comments.
> > > > > 
> > > > > On 11/18/2024 21:47, Kurt Borja wrote:
> > > > > > Hi!
> > > > > > 
> > > > > > I'm planning on migrating the alienware-wmi driver to the new WMI
> > > > > > interface, as it's currently using the deprecated one.
> > > > > 🎉
> > > I like this :)
> > > 
> > > > > > My plan is to:
> > > > > > 
> > > > > > rename alienware-wmi.c -> alienware-wmi-base.c
> > > > > > create alienware-wmi.h
> > > > > > create alienware-wmi-legacy
> > > > > > create alienware-wmi-wmax
> > > > > > 
> > > > > > The last two files would not be independent modules, just includes for
> > > > > > the base module. The base module would be in charge of initializing the
> > > > > > platform driver plus the correct wmi_driver backend, but the wmi probes
> > > > > > would register the platform device. This would be very similar to what
> > > > > > other dell drivers already do. Aditionally I want to migrate everything
> > > > > > to the state container design pattern.
> > > > > > 
> > > > > > I would do this in such a way that the legacy and new code would be
> > > > > > completely independent of each other (i.e. different state containters,
> > > > > > dmi checks, etc).
> > > > > As the original author of this driver when I was at Dell I'll add some
> > > > > comments.
> > > > > 
> > > > > The 'legacy' code was very narrowly focused for supporting a handful of
> > > > > hardware specifically for lighting control.  One was the original Alienware
> > > > > steam machine, and then a few generations of the X51.
> > > > > 
> > > > > I don't know how much of the driver continues to work on hardware since
> > > > > then.  Maybe Dell guys I added to CC can comment on how much of this has
> > > > > stuck around over the years and keeps working.
> > > > My guess is that none of it works on new models. The LEGACY wmi device
> > > > is not longer included on new machines, as all lighting control is done
> > > > through an EC and the WMAX device was repurposed to fan/thermal control.
> > > > I say this based on exploring quite a few acpidumps and a couple RGB
> > > > control Windows open source alternatives.
> > > > 
> > > > > > Pros:
> > > > > >     - Modern interfaces and design patterns
> > > > > >     - This is compatible with Mario's upcoming platform profile changes as
> > > > > >       the WMAX device would hold a reference to the platform device
> > > > > >     - Would not break compatibility as legacy code is independent
> > > > > >     - Easier to understand and develop in the future
> > > > > > 
> > > > > > Cons:
> > > > > >     - Initialy alienware-wmi-base.c would be almost completely legacy code,
> > > > > >       as new features don't require a platform device (yet), so
> > > > > >       alienware-wmi-base would basically just register the wmax wmi driver
> > > > > >       on newer machines
> > > > > >     - With this design users would not be able to completely exclude legacy
> > > > > >       code with CONFIG parameters
> > > > > I wonder if you're better off just having the legacy driver as it's own
> > > > > kernel object?  If it only supports a handful of systems, most people won't
> > > > > need it compiled.
> > > > Yes! I'd like to do this but unfortunately some user space applications
> > > > might depend on attributes being available to a platform device named
> > > > "alienware-wmi". This is why I wanted to have a unified "alienware-wmi"
> > > > platform driver.
> > > > 
> > > > Thank you for your feedback!
> > > It see, that is unfortunate. In this case having a single driver which handles the platform device
> > > and calls the right initialization function from the other two files sounds like a good choice to me.
> > I have another idea:
> > 
> > rename alienware-wmi.c -> alienware-alienfx.c
> > create alienware-wmi-wmax.c
> > 
> > Both independent modules that can be included/excluded with config
> > parameters, etc. alienware-alienfx would register the platform driver
> > and the wmi legacy device driver, while alienware-wmi-wmax would do
> > everything independently and only register an "alienware-wmi" platform
> > device if loaded on a 'legacy' laptop model.
> > 
> > Of course I'd make sure a platform device with the same name is not loaded
> > twice.
> > 
> > Something about this doesn't feel right but I don't know what it is.
> > However it is less files and less memory footprint, because ideally,
> > 'legacy' code would not even load on newer models.
> > 
> > I thought about this because Mario said legacy interface is only
> > supported by a handful of devices and it seems like a waste of resources
> > to load unsupported interfaces.
> 
> I think the WMI driver for the WMAX interface still has to always register the platform device
> since nearly all custom attributes (deepsleep, etc) work on the WMAX interface.
> 
> I would prefer to have a single driver which when using the legacy WMI interface will only provide
> lighting features (correct me if the legacy WMI interface supports more features) but will provide
> all features when using the WMAX WMI interface.

Ack.

> 
> The overhead of handling the legacy WMI interface should be acceptable since it only provides lighting
> services, so a lot of the code can be shared with the lighting code for the WMAX WMI interface.
> 
> Making support for the legacy WMI interface configurable when building the kernel also allows people to
> trim the resource consumption should they not want legacy support.
> 
> Thanks,
> Armin Wolf

I'll do it this way then. I'll send v1 next week or so.

Thank you for your feedback!

Kurt

> 
> > > Thanks,
> > > Armin Wolf
> > > 
> > > > > > After this I want to add HWMON and sparse keymap capabilities to the
> > > > > > wmax interface.
> > > > > 🎉
> > > > > 
> > > > > > I'm sure there are things I'm not seeing so feedback is greatly
> > > > > > appreciated!
> > > > > > 
> > > > > > Regards,
> > > > > > Kurt
