Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCAC39ACD
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 06:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709187165; cv=none; b=oB/GW5UDXlTvWpbdpye8QzJR6bho3hiHxBi2Nj58L+j1+FguzO0eozWpTGk2PtfY9izEIdoB4ezB6ZSf/tcvGJOin8P5Ep3tuKMQ8VcmQDttDv78MFYMqXuSvzuB1FUYebkszYN1XnNdzD6jPXW5e6kCtdABN9FTnINwuNkPxmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709187165; c=relaxed/simple;
	bh=7cc96VyUoTrijyVqzV1hLqRskrab7WYzOALGIart5/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgFtXrFDCJjtt/AmKKyrLBU32eLwtFB4wFCt+geBVaknjsuV0pq4k0SscKUsXafYpssy1yV5Wp12h9EQ0Aeq+ex5wU5oy4fM9ZWBtjp3Y8dO7VlhoXZOvxX5Lp6r2m2HGg7vFUVKN0Y6Wvj67j96XvIOBTU+SjeuipWvi12VNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=U9SRvy27; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="U9SRvy27"
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 8CC226045F;
	Thu, 29 Feb 2024 06:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709187163;
	bh=7cc96VyUoTrijyVqzV1hLqRskrab7WYzOALGIart5/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9SRvy27I5Axmx8JN6KprloiT1WBp98tM4f1Vt02TYC7fYc2/it3xAXf/v2A6ucLE
	 h+O3ClAyrak1l1WSfM0PTFux7fLRBH6Wa74p6uBu0P0wU3eqrTlwPuq9XQgTGY4ky+
	 iciiHdjLmSsWMYkCzpBqnyf0b+DVaVRHPdl5Qa8IdF52c0R+cDbqoC3JA7Ue3toebB
	 9zgC5huVrsKlL47XaC4QTTPpxMOg42qBDlXpW0hSa7YUMmBXxNUpDTq9lbgpPSz6sM
	 6WHTvQx3OLr6Br7k3OITRNtqlpnJmrBOM+mPQeIkmGq4djDz01E21pAEXJzyh4c7XX
	 RWmgq9HXMbnbA==
Date: Thu, 29 Feb 2024 08:12:32 +0200
From: Tony Lindgren <tony@atomide.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86: Add new get_serdev_controller() helper
Message-ID: <20240229061232.GA5299@atomide.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
 <20240216201721.239791-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216201721.239791-3-hdegoede@redhat.com>

* Hans de Goede <hdegoede@redhat.com> [240216 20:17]:
> +static inline struct device *
> +get_serdev_controller(const char *serial_ctrl_hid,
> +		      const char *serial_ctrl_uid,
> +		      int serial_ctrl_port,
> +		      const char *serdev_ctrl_name)
> +{
> +	struct device *ctrl_dev, *child;
> +	struct acpi_device *ctrl_adev;
> +	char name[32];
> +	int i;
> +
> +	ctrl_adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
> +	if (!ctrl_adev) {
> +		pr_err("error could not get %s/%s serial-ctrl adev\n",
> +		       serial_ctrl_hid, serial_ctrl_uid);
> +		return ERR_PTR(-ENODEV);
> +	}

Maybe split get_serdev_controller() into two functions, an acpi specific
function, and a serdev specific function? And I also think these should
not be in the header file, maybe splitting will also help with that :)

> +	/* get_first_physical_node() returns a weak ref */
> +	ctrl_dev = get_device(acpi_get_first_physical_node(ctrl_adev));
> +	if (!ctrl_dev) {
> +		pr_err("error could not get %s/%s serial-ctrl physical node\n",
> +		       serial_ctrl_hid, serial_ctrl_uid);
> +		ctrl_dev = ERR_PTR(-ENODEV);
> +		goto put_ctrl_adev;
> +	}
> +
> +	/* Walk host -> uart-ctrl -> port -> serdev-ctrl */
> +	for (i = 0; i < 3; i++) {
> +		switch (i) {
> +		case 0:
> +			snprintf(name, sizeof(name), "%s:0", dev_name(ctrl_dev));

Note that in theory it's possible we will encounter a device that has
multiple serial core controller instances as noted by Jiri earlier.

And each controller may have one or more ports. For the multiport test
case, you can use qemu with options like below FYI:

-chardev null,id=s1 -chardev null,id=s2 \
-device pci-serial-2x,chardev1=s1,chardev2=s2

Regards,

Tony
