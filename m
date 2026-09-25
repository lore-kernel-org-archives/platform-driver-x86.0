Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C4D47C10B;
	Fri, 25 Sep 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326226; cv=none; b=lJzfbvdVW+b0XiIMiJJrwdABlAw4brQo8g5BxGOt9VPv6jeNPirreqmj8yaS3gEeXXCJ2nPRh93onzfMS28+ghb+A7qKnbRcmT6oHpOhbNltUPHOymcJcOzALbzuPmsVwvwpO5Z5ECQQD+Bfw5nyUV1WShT+2awnVGSnuMyqQq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326226; c=relaxed/simple;
	bh=ZrqQea9QfkZIfeOp+G1ykf1/KoVZrNbjpHZRRBgZypo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKs1mSXa6Aj0vhbQcbYSLD4CRmliHuNxMh1aFx2t0r69K2l1RWoiArlV/k8XR3JOdBqtScRPUr60BXzK0wFSEu/OaUZjGQd6gnVS3ZaQ9KLaAHyk6vsLSZLYQ3m9GNT+a31mLTOv1BYfW7myjFLXduJh5xR8vNI7/rqEatkaRdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bmprr1Yw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bmprr1Yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790326222; x=1821862222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZrqQea9QfkZIfeOp+G1ykf1/KoVZrNbjpHZRRBgZypo=;
  b=Bmprr1YwnQZRRgwpJpURgtrJQJ8jTJe6L0UDKEn6ztUnGh62jMYyirph
   /c5L44pg1L62zjNf5m+VbiJgPDTbW6u90D4cVFdtZdVm6PiVsNQyUx46N
   aRG4UbLENbkzFe73VgovtN/yLJFoKbiiUokfAdIdOhlP+SIcJgJDhENxS
   ifDBc80VLZMvzVlwuBk2L5vGyJX3UuFYxZJzy7FLHumgikYqcREhHtapB
   qbDwJrX9n0fGKIecoTbzaW7324zD8bFuIQgS3wfNvkOBtBQkQGWLEv4Vf
   PXdrLot3sPBsdckFm6ujNuXfV/R9PS5+tl9kN2nKjccwPxa9deWsQvRtZ
   w==;
X-CSE-ConnectionGUID: zy88QQKYQema1TACp1DC9A==
X-CSE-MsgGUID: LwLGJ/ePQ/eQEUtOwO42nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="107490046"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="107490046"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:50:19 -0700
X-CSE-ConnectionGUID: +tmOa1deSK6kvpaIvTS51Q==
X-CSE-MsgGUID: Eip1mKhXQWyde3+uEpgK1A==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:50:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 29189121BA5;
	Fri, 25 Sep 2026 11:50:16 +0300 (EEST)
Date: Fri, 25 Sep 2026 11:50:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: benjamin.mugnier@foss.st.com, sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com, mchehab@kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH 3/4] media: i2c: vd55g1: Add ACPI support for the Lenovo
 TBE20A1 HID
Message-ID: <arY1yBWSAD-6IkQD@kekkonen.localdomain>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
 <20260924171820.1179823-4-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924171820.1179823-4-koreev.r@gmail.com>

Hi Ruslan,

Thanks for the set.

On Thu, Sep 24, 2026 at 08:18:19PM +0300, Ruslan Koreev wrote:
> The IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 is an ST VD55G1
> enumerated by ACPI as TBE20A1, connected to the Intel IPU7 with one
> CSI-2 lane and powered through an INT3472 discrete device. Match the
> HID and take the sensor version from the match data, as for OF. Only
> the analog supply is switchable on this platform; vcore and vddio are
> always on and fall back to dummy regulators.
> 
> On these platforms the CSI-2 endpoint is a software node that
> ipu-bridge attaches to the sensor device when the IPU driver probes,
> which can happen after the sensor driver has been bound. Defer probing
> instead of failing when there is no endpoint yet, as the other sensor
> drivers used with the IPU bridge do and as v4l2_fwnode_endpoint_parse()
> itself does for a missing endpoint.
> 
> Tested on a ThinkPad X1 Carbon Gen 14 (Core Ultra X7 358H, IPU7),
> streaming 804x704 through libcamera.

Please describe here what the patch does; most of the above goes to the
cover letter.

I'd split the endpoint handling changes into a separate patch, too.

> 
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
> ---
>  drivers/media/i2c/vd55g1.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 6f458f611..64889c35d 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1903,10 +1903,9 @@ static int vd55g1_parse_dt(struct vd55g1 *sensor)
>  
>  	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
>  						   0, 0, 0);
> -	if (!endpoint) {
> -		dev_err(sensor->dev, "Endpoint node not found\n");
> -		return -EINVAL;
> -	}
> +	if (!endpoint)
> +		return dev_err_probe(sensor->dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");

I'd drop the check here and return v4l2_fwnode_endpoint_alloc_parse()'s
return value in vd55g1_check_csi_conf(). Then -EPROBE_DEFER is returned
when appropriate.

>  
>  	ret = vd55g1_check_csi_conf(sensor, endpoint);
>  	fwnode_handle_put(endpoint);
> @@ -2084,6 +2083,13 @@ static const struct of_device_id vd55g1_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
>  
> +static const struct acpi_device_id vd55g1_acpi_ids[] = {
> +	/* Lenovo ThinkPad X1 Carbon Gen 14 IR camera, Intel IPU7 */

No need for such a comment here, I think it's enough it's documented in the
IPU bridge.

> +	{ "TBE20A1", (kernel_ulong_t)&vd55g1_versions[0] },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(acpi, vd55g1_acpi_ids);
> +
>  static const struct dev_pm_ops vd55g1_pm_ops = {
>  	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
>  };
> @@ -2092,6 +2098,7 @@ static struct i2c_driver vd55g1_i2c_driver = {
>  	.driver = {
>  		.name  = "vd55g1",
>  		.of_match_table = vd55g1_dt_ids,
> +		.acpi_match_table = vd55g1_acpi_ids,
>  		.pm = &vd55g1_pm_ops,
>  	},
>  	.probe = vd55g1_probe,

-- 
Kind regrds,

Sakari Ailus
