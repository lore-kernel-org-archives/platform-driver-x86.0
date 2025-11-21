Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6234678D
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736242; cv=none; b=TX142IQT5rxHqjTkgaRK2Q4hXdEFD9Xh0fxP3ctglPuDvcWpOFyZnoRqDnh1DVcdaPEjYUB47Cim8q9OmrLkdEPfRPlBFtkCsn3eU5fmyQDxSV76i8hrXPHOxeyUKGl4i/e3cdnGY6Bv43FXqTdWmO1EMS7Du1Av1jMK6sq9q/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736242; c=relaxed/simple;
	bh=gR0Sc1czY1x+jfE9REY6i+Hfx5lmwRhGUIRtC4PlMC8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PFPc7ofhQW2daa94QRvzWfvi91dsCkw5SC17aCg6zhJSJf9TlSPHL7UH45TIEPZ9LnCkE97J7P3JfMSpgTSRqnAvrlZuX4o7QnKJkyyJH5ZT/YguvRLNXMTZu+mDU8ZJexKivJI7nvGvp+11kvpQcWfpzAknG5sn8QUI4StC7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSMU-0004xo-NS; Fri, 21 Nov 2025 15:43:46 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSMR-001bRM-2C;
	Fri, 21 Nov 2025 15:43:43 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSMR-000000008MX-2UX6;
	Fri, 21 Nov 2025 15:43:43 +0100
Message-ID: <821febecdbf9bdbb39749060fb514cb823388efa.camel@pengutronix.de>
Subject: Re: [PATCH] platform/x86: intel: chtwc_int33fe: don't dereference
 swnode args
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko	 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki"	
 <rafael.j.wysocki@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, 	stable@vger.kernel.org, Stephen Rothwell
 <sfr@canb.auug.org.au>
Date: Fri, 21 Nov 2025 15:43:43 +0100
In-Reply-To: <20251121-int33fe-swnode-fix-v1-1-713e7b7c6046@linaro.org>
References: <20251121-int33fe-swnode-fix-v1-1-713e7b7c6046@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org

On Fr, 2025-11-21 at 11:04 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Members of struct software_node_ref_args should not be dereferenced
> directly but set using the provided macros. Commit d7cdbbc93c56
> ("software node: allow referencing firmware nodes") changed the name of
> the software node member and caused a build failure. Remove all direct
> dereferences of the ref struct as a fix.
>=20
> However, this driver also seems to abuse the software node interface by
> waiting for a node with an arbitrary name "intel-xhci-usb-sw" to appear
> in the system before setting up the reference for the I2C device, while
> the actual software node already exists in the intel-xhci-usb-role-switch
> module and should be used to set up a static reference. Add a FIXME for
> a future improvement.
>=20
> Fixes: d7cdbbc93c56 ("software node: allow referencing firmware nodes")
> Fixes: 53c24c2932e5 ("platform/x86: intel_cht_int33fe: use inline referen=
ce properties")
> Cc: stable@vger.kernel.org
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20251121111534.7cdbfe5c@canb.auug.org=
.au/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> This should go into the reset tree as a fix to the regression introduced
> by the reset-gpio driver rework.

Applied to reset/gpio, thanks!

[1/1] platform/x86: intel: chtwc_int33fe: don't dereference swnode args
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D527250cd9092

regards
Philipp
