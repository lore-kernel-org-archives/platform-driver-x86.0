Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5F01DF24B
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739966909; cv=none; b=FYNVmeDTppbBx/Er02SGl/A32Ld1HaX7TWka+hdLfVvgCaTDpfh//ff250I5VxgKJjjbspRlMSd8Q116VZ5Knxp9W63Gh1FCgvZ5oPoYAiS9Ru0+zX8TSL9NpzQGxjlbOice8+XRFsQSj+aEMKvqiTLr+8+JzgLheQ87lK90foU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739966909; c=relaxed/simple;
	bh=uE8CUjR58RLwuzsqmPJ2Twtd7ZBgQ7uMjtufoLK9fYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bX9r7+FA6+NQmoYa5UvcHc2ZgYkmaXUYjTbj+AR4yqKGoI4dfFhI697cFBkJaZAaB7TQhnoErCBBWFL998/0t6CUaOpZz3HofjMB91cR7d4JE1xn/wpKyINOMtyKlLxkMEQE+Nh30WJMVITPitZ4yjeCts3dvSNLClnkfHRDRt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JLRk6MhQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JLRk6MhQ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54524740032so5826099e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2025 04:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966905; x=1740571705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
        b=JLRk6MhQsI0egle9P/i5LwAyjj3vcerxgF3i5jjK8fqWvJZ23Dcy49YQs/LKCz50ec
         lpGbdcNdoF4soVNTBp/2BmH3BvqpXN6W12QDoasuLNhEwqLBi+kiEx3OyUMzph0CeJGG
         cG29ZFq/O/0YXeiO6ILOZ8Ubxsu3A5VWUqnMTnkkyXqgJK+jaQ0i54JbPzLQeS+vfTCx
         CgsuyfP7movhUeItO23to2InSpjGHsrsxY6oKvWiW7vvCjOjhpYZ2ZTTCwoLTCuAcTGq
         Z2VzaJYxIclGqUrTmCSov7RCtO1sWUfeoOY4ItVPNVtp3WxsCCZsO6fat0KyNG7cWVx/
         kF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966905; x=1740571705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
        b=p8W4vazS27tGf9jrubbcA9NXD4bpNVoP3z3B8iIQmTsvcWuPLQgOoimeB1q16J0dwC
         i0ooy/ezb1NaLElvzWEw0OYKwvUfJgkfiZ4O0LtVEixpF6CxF8jvO5U+NUpBJNcyB0+N
         CLJAna1UUny26mRSzC+mOoEr4t65Vp8WRtpownY60ob0a8jZAtDmFQ/wyLbt+RoAGo45
         X8bNjaZQfoTpBD8CFC3vO87jdEhYiVvO4UYZPCBQ0oRz+7u3EZBcdDigDUyN5sPQba/+
         WNGiwJW7enMIQh1AYtUH6m0ZRig4ce9oU6UR8tFkJ1NYRwoyUXZ67c8TSJSOVhP4SLeU
         yyZw==
X-Forwarded-Encrypted: i=1; AJvYcCW01WAMZ0Muh1FKkZYgfgFGBnf021gT07C70sVNZ7SgvaaqY/r0YAQfKlGdb9SqpGPeGuN8cT/mb1OJjnyfoh5IY5cl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eJ80v/g3K67sYrlMgnq06BeQ0/8s3/QUqTR1vbckY2yFtee7
	/ddLPW7s64nvyz3yIvV9AmGgL1dBBuMAWAs9RfpptmvBfiaojtPb4QiphJO1dJI=
X-Gm-Gg: ASbGncuIEHzJGBdt4ANP4SLh29ya38dBLz2J1m/GVpTaxzTWQ7jfQkRPap0C264j8Si
	LoQfqbbgparFZxXytwQXzPEuGtoIzhoGhSniuWBNUdTkeN5tVNTqIm/BL6rwt+kT178DKhtNk+9
	mOTpR6Y2yOOA+XRcVrRg5Bt6xihsdXgT4FKcvWdkGN+56ToI0ekHPpq3xYrKvcjXDaeytL0NycI
	T3RiYbjjz6vsHDpWAcEAU4ENQqFGWATiG+1h0cAkp6gBQZ+HwEUE7rLUTZob1X2E1+HPgtkLd11
	1XCjynNouXBb0ueboOs7jyI/cBB4t6EwY/lHFuhnWmyb8fQNAQVMixeB/tEUpmDTDwmE6jc=
X-Google-Smtp-Source: AGHT+IFMLOpDHMHA4h3/Gxx2zV0fjSL0lgJbRphbGzyITSKOMSUgTcKxT5mQ7K/tT3lwL8tk5JoMMA==
X-Received: by 2002:ac2:4e05:0:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-5452fe5bedcmr6706804e87.22.1739966905285;
        Wed, 19 Feb 2025 04:08:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461cfdd5a2sm1148260e87.39.2025.02.19.04.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:08:24 -0800 (PST)
Date: Wed, 19 Feb 2025 14:08:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <eskvhtljnrkhm6vmqy52gkweexj3tcethejeywcoib4la72jcl@ojuqcazpvht4>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
 <2025021922-spongy-swirl-0746@gregkh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021922-spongy-swirl-0746@gregkh>

On Wed, Feb 19, 2025 at 11:13:14AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 19, 2025 at 11:06:02AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> > > Add helper functions to create a device on the auxiliary bus.
> > > 
> > > This is meant for fairly simple usage of the auxiliary bus, to avoid having
> > > the same code repeated in the different drivers.
> > > 
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > >  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/auxiliary_bus.h |  17 +++++++
> > >  2 files changed, 125 insertions(+)
> > > 
> > > diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> > > index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> > > --- a/drivers/base/auxiliary.c
> > > +++ b/drivers/base/auxiliary.c
> > > @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> > >  }
> > >  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> > >  
> > > +static void auxiliary_device_release(struct device *dev)
> > > +{
> > > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > > +
> > > +	kfree(auxdev);
> > > +}
> > > +
> > > +/**
> > > + * auxiliary_device_create - create a device on the auxiliary bus
> > > + * @dev: parent device
> > > + * @modname: module name used to create the auxiliary driver name.
> > > + * @devname: auxiliary bus device name
> > > + * @platform_data: auxiliary bus device platform data
> > > + * @id: auxiliary bus device id
> > > + *
> > > + * Helper to create an auxiliary bus device.
> > > + * The device created matches driver 'modname.devname' on the auxiliary bus.
> > > + */
> > > +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> > > +						 const char *modname,
> > > +						 const char *devname,
> > > +						 void *platform_data,
> > > +						 int id)
> > > +{
> > > +	struct auxiliary_device *auxdev;
> > > +	int ret;
> > > +
> > > +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> > > +	if (!auxdev)
> > > +		return NULL;
> > > +
> > > +	auxdev->id = id;
> > > +	auxdev->name = devname;
> > > +	auxdev->dev.parent = dev;
> > > +	auxdev->dev.platform_data = platform_data;
> > > +	auxdev->dev.release = auxiliary_device_release;
> > > +	device_set_of_node_from_dev(&auxdev->dev, dev);
> > > +
> > > +	ret = auxiliary_device_init(auxdev);
> > > +	if (ret) {
> > > +		kfree(auxdev);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	ret = __auxiliary_device_add(auxdev, modname);
> > > +	if (ret) {
> > 
> > This loses possible error return values from __auxiliary_device_add().
> 
> Why does that really matter?

At the very least the caller (or caller of a caller) can call
dev_err_probe() or dev_err("%pe"). With the current implementation as
everybody maps NULL to -ENOMEM the error message will be cryptic.

Or just having a cryptic value in the logs.

> > I'd suggest to return ERR_PTR(ret) here and in the
> > auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
> > failure.
> 
> Will the caller do something different based on the error value here?
> All we care is that this worked or not, the specific error isn't going
> to matter for device creation like this.

The caller might not, the developer might.

-- 
With best wishes
Dmitry
