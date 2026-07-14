Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDEF3F4829;
	Tue, 14 Jul 2026 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022025; cv=none; b=mM6xa9F4m9K1yHkgidE4MRaMW+6MTsgZih45+Fgvxp8M3gJHx/alxIffOgF6ttBXkeFHEBk7N2NQCbnBvxlWQ/HEspBUOZmtey8ZErPB2kmlJ5RCFkybV2LtRkwyWPDGpXXgJDiJZUF/fbcWtKxJZ6ZnwYrQmiBacWfWSLFUjVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022025; c=relaxed/simple;
	bh=wrPx0hvuUujnOArhp+9g7U8p8v6mfKoZo5CUAYt8ZQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXBsnxlmr3Nassr6CP+waKwLssw8VY26nusd1O1jl2+ZRT3hg5MwyOuoTp6OQaXpN6saoqKKdfR7isdqleRL5okCqja987BA6dUnmY7+TCAatNU3e0CvI3jIFx56ElC21Auahou4I3Q7t9qwt8a29hIalRNCTw4lgjoOOX9elh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHEVJwtd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHEVJwtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784022023; x=1815558023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wrPx0hvuUujnOArhp+9g7U8p8v6mfKoZo5CUAYt8ZQ0=;
  b=OHEVJwtd5G69LQyfx85sQH6YRdlPEc7aR9dFq2l1FKmn9pFC7Wo6zllY
   x785SQv2K2GQbOt8dHkOI4SaBXnLsWsqKjhsgp90HI4hcJLrP7TUSQYiK
   0rGGkg2MyM+q2fsgiOOpAaibedXbi6u+6ctlrehmpVul8CCGWtdp5a3C7
   wyA9oliatAr3SIxuCDET6tngVye8Rev+3AoahNcM0buJpzt+v/Dtpwpcy
   zYzZ6cKzoVixNn1GYPp8t8wW+geJeEqafohQlzKiJxTYlSPpT89hOU/Zo
   hJIjGR3ryQDsaJth7s6etOyePThW9J9R3gC1GzCrbGrppzSABbDhYWtII
   A==;
X-CSE-ConnectionGUID: ykHrjmfGTFmgEWcWFkh3+Q==
X-CSE-MsgGUID: bX7LW0LnQ9C9R/tm6m+jow==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84520326"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84520326"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:40:23 -0700
X-CSE-ConnectionGUID: 6foZP+VZTUaUDRJnvTzmAg==
X-CSE-MsgGUID: BFUsCFjUR4eNFiQKfJyGnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="252424937"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2026 02:40:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 38DC395; Tue, 14 Jul 2026 11:40:18 +0200 (CEST)
Date: Tue, 14 Jul 2026 12:40:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, brgl@kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v7 2/4] drm/xe/i2c: use
 device_create_managed_software_node()
Message-ID: <alYEAE_fZCfrRAYs@kuha>
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
 <20260713-swnode-remove-on-dev-unreg-v7-2-6d6bc448427a@oss.qualcomm.com>
 <alUGHxyN6l7awuEn@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUGHxyN6l7awuEn@intel.com>

On Mon, Jul 13, 2026 at 11:37:03AM -0400, Rodrigo Vivi wrote:
> On Mon, Jul 13, 2026 at 05:11:58PM +0200, Bartosz Golaszewski wrote:
> > This driver intentionally uses the fine-grained approach to creating
> > platform devices. It assigns a software node as the primary firmware
> > node of the device it creates. Ahead of improving the reference counting
> > of platform device software nodes, switch to using
> > device_create_managed_software_node(). This way, we create a dynamic
> > software node whose life-time is tied to the device to which it's
> > assigned.
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>

LGTM:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> > ---
> >  drivers/gpu/drm/xe/xe_i2c.c | 22 ++++++++--------------
> >  drivers/gpu/drm/xe/xe_i2c.h |  1 -
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> >  2 files changed, 8 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index 3d80eafb9a1318996d10db11e14af4cfde07ba55..af6e973e5e68125a9c006bb646447ca6e377a6e6 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -93,13 +93,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> >  {
> >  	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> >  	struct platform_device *pdev;
> > -	struct fwnode_handle *fwnode;
> >  	int ret;
> >  
> > -	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> > -	if (IS_ERR(fwnode))
> > -		return PTR_ERR(fwnode);
> > -
> >  	/*
> >  	 * Not using platform_device_register_full() here because we don't have
> >  	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> > @@ -107,10 +102,14 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> >  	 * platform_device_register_full() is done.
> >  	 */
> >  	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> > -	if (!pdev) {
> > -		ret = -ENOMEM;
> > -		goto err_fwnode_remove;
> > -	}
> > +	if (!pdev)
> > +		return -ENOMEM;
> > +
> > +	ret = device_create_managed_software_node(&pdev->dev,
> > +						  xe_i2c_adapter_properties,
> > +						  NULL);
> > +	if (ret)
> > +		goto err_pdev_put;
> >  
> >  	if (i2c->adapter_irq) {
> >  		struct resource res;
> > @@ -123,8 +122,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> >  	}
> >  
> >  	pdev->dev.parent = i2c->drm_dev;
> > -	platform_device_set_fwnode(pdev, fwnode);
> > -	i2c->adapter_node = fwnode;
> >  	i2c->pdev = pdev;
> >  
> >  	ret = platform_device_add(pdev);
> > @@ -135,8 +132,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> >  
> >  err_pdev_put:
> >  	platform_device_put(pdev);
> > -err_fwnode_remove:
> > -	fwnode_remove_software_node(fwnode);
> >  
> >  	return ret;
> >  }
> > @@ -144,7 +139,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> >  static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
> >  {
> >  	platform_device_unregister(i2c->pdev);
> > -	fwnode_remove_software_node(i2c->adapter_node);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> > index 425d8160835f4648891ff75f2a9c06284241710e..b28229f056c5a664e1d41dc0cc1978782fe1c2f1 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.h
> > +++ b/drivers/gpu/drm/xe/xe_i2c.h
> > @@ -30,7 +30,6 @@ struct xe_i2c_endpoint {
> >  };
> >  
> >  struct xe_i2c {
> > -	struct fwnode_handle *adapter_node;
> >  	struct platform_device *pdev;
> >  	struct i2c_adapter *adapter;
> >  	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
> > 
> > -- 
> > 2.47.3
> > 

-- 
heikki
