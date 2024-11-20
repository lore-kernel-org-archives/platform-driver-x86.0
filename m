Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C651BF7E5
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115066; cv=none; b=FDgyMQkEURzrq7XjGD2aKArjM8FNjLuSMrF2TzysDyVwNeCy/Z/MHmMWER8PVVMDcdyYNgO91j+8oYXXZTc/in+c2PPylmlQ8vHfm1j61v+FFuZrv1s/33l+9n+H6Dd2b8AsgyzV+Ep/aW5h291bN6qIkgedFNPUGTRvQGAAnHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115066; c=relaxed/simple;
	bh=M4ihmb8wmdZY2S61AMsEhjZ1+vS2HsqHuU98GHMV5Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaHzWBCdLzzJeSuSwPSg8zTnsxuzxIYAJ7146xR4iDIeyD/htNCWJJLkOaxDJKxoDc78+aRxpxwfre0pVR8l4+uJoP7z+6TUS51GULgU7RThuB/ruPk0ZK4S3MxE7kIiJ3xFtTGzL/YtFzsJW4JgRs+0AokEZrBziLfi5FAL0ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3GTtIZ3; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3GTtIZ3"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so1979313b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 07:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732115064; x=1732719864; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dKIizGpW79Ywu5q2PUlJIQqmW0zYIfb1kfgqzoe/lNc=;
        b=F3GTtIZ3OYayafnKZJXnToX/EpSf1uAU7Q13be+h/hT8kb/ags/Vg2zvOdWOBptje5
         hW96ABDH8PEAtUJGy8yqPvbWd2aiamOAqltgrhIwLx3eCKBpGvQpwEqkv9BQEMnE5S5N
         AzGTYlSJWL9EZcTrrJg0lZNqYIG5Giig5AG0TEhefcNZTEzJscDUa2NyVl6SWQxY4bQL
         J13yKtznPE73cbNJ++N4gzyKAj7RSxe3Gij/QHrSgvw5x7aH26/kY+lXn8Rdn+L01c3j
         Cs3Dv9FGcpxXhbFzNnMTiitXVepDQLBkbURUkMn2CVYmvlkONJ6no3K/RKU519pp8ivj
         V9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732115064; x=1732719864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKIizGpW79Ywu5q2PUlJIQqmW0zYIfb1kfgqzoe/lNc=;
        b=CDIxGcdMEcgh7++/3IQEEtyItI2FFBDVelWHWuPODY4k1rqZ29WQ4cuQNty45N7Loz
         iWbVsx1dUTXsd1Qgc4cPsesONYjRufWv6U/LqsNwJDaXA/baRe2aE2Q6navasImy9S3z
         8FIWa8VAaVQu7Ls3U3sJ4VrlRBLEnpn+SmlbYE50Pv/WVVWVPGk438tccOjpcgk/Rr5B
         9jbD7wCch8wZodaeS2EU6xZrgimFKdwcq7VkVWbl8BQRtHLMYavhPmaxi3i5Xq+FJ63V
         eALn1I7qHnrhWSLy1nQDU4zxeHqNtINpM9ks4L4XF0PwLKYsH0nJYQykxAeRylmMoUR5
         b/ww==
X-Forwarded-Encrypted: i=1; AJvYcCWB6lEhvDE9Ba4tsDh8rysGC4eiC8Jz+vnjt/w+kFlEw5VqP00XmA2ygbzg+Ys/wVFXg9iXe8J6Gc8RQO5RBTEAFi6x@vger.kernel.org
X-Gm-Message-State: AOJu0YyRuU3GyNsNQrXWem+5Gb4cO8igbF7DwtAUS8qnNil5A6xVUIHP
	O+WXuyoKPs+ttgNqhxPDpPg3knB9Rdfx2km6JJdc9zSW/d6Rv6Pq
X-Gm-Gg: ASbGncu3Ca5soDjIjQnkF+01M/kuqfI78rXcMOC9INkl9kZsuMWFP8a4aBDixjDenEa
	rrfZS67GN0V+C/hTFAI3ie9rC/vs7RjIIEoNCBEJkca86tTtnxIrFB3JSxb7ZYwsiJ9F1jKqfCY
	JwC3WMW8I3KtOvuOAS2Bz5dATDc035M7pEKk6BYLXxRsEt90VPCM6hzgfLCA7KJZrLv5bfAFDSt
	RyH/S9BVx8ZStq7Cg2YFqEdi1R+3ijv4U6tw8Bh4wky5g==
X-Google-Smtp-Source: AGHT+IEk/3yZUC4wAGzS555O9M0NnfqBgLPIPcDP/bCNwsnCRXC0Ckv4NBpTVnVzCTk4R6t5uOCpqQ==
X-Received: by 2002:a05:6a00:814:b0:71e:58be:3604 with SMTP id d2e1a72fcca58-724bec8769dmr3383033b3a.4.1732115063942;
        Wed, 20 Nov 2024 07:04:23 -0800 (PST)
Received: from alphacentauri ([181.84.94.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befb27bfsm1717093b3a.169.2024.11.20.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:04:23 -0800 (PST)
Date: Wed, 20 Nov 2024 12:04:19 -0300
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	Dell Client Kernel <Dell.Client.Kernel@dell.com>
Subject: Re: alienware-wmi rework RFC
Message-ID: <gz67ujg6ggqx7gq4grm2jzi7assjzmcches7dmqaky6qi2fvjq@kkkbkj2z7i5g>
References: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
 <bf238c08-1f49-4e16-b9ee-1d1a5e0b9763@amd.com>
 <uyzgfmsbd6dkeyx76fmstqpauj4ulnz2eqbww6dz7fwjxwxer6@vwuebqbtl5e5>
 <7ce64458-4390-4630-8d59-66e37d6f4521@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ce64458-4390-4630-8d59-66e37d6f4521@gmx.de>

On Wed, Nov 20, 2024 at 01:06:57PM +0100, Armin Wolf wrote:
> Am 19.11.24 um 05:29 schrieb Kurt Borja:
> 
> > On Mon, Nov 18, 2024 at 09:54:25PM -0600, Mario Limonciello wrote:
> > > Loop Dell Client Kernel M/B for any comments.
> > > 
> > > On 11/18/2024 21:47, Kurt Borja wrote:
> > > > Hi!
> > > > 
> > > > I'm planning on migrating the alienware-wmi driver to the new WMI
> > > > interface, as it's currently using the deprecated one.
> > > 🎉
> 
> I like this :)
> 
> > > 
> > > > My plan is to:
> > > > 
> > > > rename alienware-wmi.c -> alienware-wmi-base.c
> > > > create alienware-wmi.h
> > > > create alienware-wmi-legacy
> > > > create alienware-wmi-wmax
> > > > 
> > > > The last two files would not be independent modules, just includes for
> > > > the base module. The base module would be in charge of initializing the
> > > > platform driver plus the correct wmi_driver backend, but the wmi probes
> > > > would register the platform device. This would be very similar to what
> > > > other dell drivers already do. Aditionally I want to migrate everything
> > > > to the state container design pattern.
> > > > 
> > > > I would do this in such a way that the legacy and new code would be
> > > > completely independent of each other (i.e. different state containters,
> > > > dmi checks, etc).
> > > As the original author of this driver when I was at Dell I'll add some
> > > comments.
> > > 
> > > The 'legacy' code was very narrowly focused for supporting a handful of
> > > hardware specifically for lighting control.  One was the original Alienware
> > > steam machine, and then a few generations of the X51.
> > > 
> > > I don't know how much of the driver continues to work on hardware since
> > > then.  Maybe Dell guys I added to CC can comment on how much of this has
> > > stuck around over the years and keeps working.
> > My guess is that none of it works on new models. The LEGACY wmi device
> > is not longer included on new machines, as all lighting control is done
> > through an EC and the WMAX device was repurposed to fan/thermal control.
> > I say this based on exploring quite a few acpidumps and a couple RGB
> > control Windows open source alternatives.
> > 
> > > > Pros:
> > > >    - Modern interfaces and design patterns
> > > >    - This is compatible with Mario's upcoming platform profile changes as
> > > >      the WMAX device would hold a reference to the platform device
> > > >    - Would not break compatibility as legacy code is independent
> > > >    - Easier to understand and develop in the future
> > > > 
> > > > Cons:
> > > >    - Initialy alienware-wmi-base.c would be almost completely legacy code,
> > > >      as new features don't require a platform device (yet), so
> > > >      alienware-wmi-base would basically just register the wmax wmi driver
> > > >      on newer machines
> > > >    - With this design users would not be able to completely exclude legacy
> > > >      code with CONFIG parameters
> > > I wonder if you're better off just having the legacy driver as it's own
> > > kernel object?  If it only supports a handful of systems, most people won't
> > > need it compiled.
> > Yes! I'd like to do this but unfortunately some user space applications
> > might depend on attributes being available to a platform device named
> > "alienware-wmi". This is why I wanted to have a unified "alienware-wmi"
> > platform driver.
> > 
> > Thank you for your feedback!
> 
> It see, that is unfortunate. In this case having a single driver which handles the platform device
> and calls the right initialization function from the other two files sounds like a good choice to me.

I have another idea:

rename alienware-wmi.c -> alienware-alienfx.c
create alienware-wmi-wmax.c

Both independent modules that can be included/excluded with config
parameters, etc. alienware-alienfx would register the platform driver
and the wmi legacy device driver, while alienware-wmi-wmax would do
everything independently and only register an "alienware-wmi" platform
device if loaded on a 'legacy' laptop model.

Of course I'd make sure a platform device with the same name is not loaded
twice.

Something about this doesn't feel right but I don't know what it is.
However it is less files and less memory footprint, because ideally,
'legacy' code would not even load on newer models. 

I thought about this because Mario said legacy interface is only
supported by a handful of devices and it seems like a waste of resources
to load unsupported interfaces.

> 
> Thanks,
> Armin Wolf
> 
> > > > After this I want to add HWMON and sparse keymap capabilities to the
> > > > wmax interface.
> > > 🎉
> > > 
> > > > I'm sure there are things I'm not seeing so feedback is greatly
> > > > appreciated!
> > > > 
> > > > Regards,
> > > > Kurt
