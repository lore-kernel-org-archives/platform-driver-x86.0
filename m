Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E71B21AB;
	Tue, 14 Jan 2025 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736874797; cv=none; b=KtgONMLGzaalliMN5Jjf8cBYtCbX9EbuRhWLpgZRL6IEV/JqA7f95roNKD3wyAF9MI+699EGqmujxI3STF/XuaVv8UwTPxQq8DRQyQUlzWIyaCKC/vG9JansHfOr2x9YsTazvp4+2xHrh37yYv1jeFGEDPbULgfoP8wWhE1NVY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736874797; c=relaxed/simple;
	bh=v/lhlW+MWrFs3ZxnucpkK9SEvjW3VjFc1bROcWmjLwM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=faRJTlKb0ubThwXNXJky169L7CP0dVtFZJuft2VR38fpgewMcp+QRN/t/5fcdHofvy5MNrAqWLhSMTSocrljYF9T7+1oWatoznxjK+jFbfMIT9j4qm9SggI55qt3UwN8Crkhz83RXbycLLgCWBdJ4xS++mrIjAAtE4gj/0dNqoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vi+jldlm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vi+jldlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874796; x=1768410796;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=v/lhlW+MWrFs3ZxnucpkK9SEvjW3VjFc1bROcWmjLwM=;
  b=Vi+jldlmr3gPZ+YhWjWcATn5vP6tfUeZK4K2EKlItkefjUXzF8H8iCSF
   VtpL+pJTlLw96cE9iSW3qvxFRs2zrMELfORLIU/wXO4z7ETBQOofPaosS
   RSTwamXM4X+ZlPVxl+ZpMMknblJJ9AMFMFLLfKqzBTxfeE8xks2zAVv/h
   6lbL8EaAeFCvbxjymQ48Vs0TocbnlweskAeZpxEz9fU2qIcaCV5nmkWXt
   JwCLwhG73Kq4w1zVfzi+38HYOH6dyP/jEmH4A2BAQK1HKIA7Zrs4rzM60
   pBxEWdqGPghQ8JQPY3FxZwaeGEBCFq7IGlH/npS+thbB5w16lNYCOooxE
   Q==;
X-CSE-ConnectionGUID: jCSDdy0HQumy21ZvhsSEhQ==
X-CSE-MsgGUID: ZCTrxS+ZQw62nkvCPEvjCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47671724"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="47671724"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:13:15 -0800
X-CSE-ConnectionGUID: AR87aroLSYyNiGzaTOLmaA==
X-CSE-MsgGUID: rhk28/WTRIuZmLwFP7O32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105727830"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:13:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 14 Jan 2025 19:13:09 +0200 (EET)
To: Chenyuan Yang <chenyuan0y@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, zijie98@gmail.com
Subject: Re: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger:
 fix race condition
In-Reply-To: <20250111180951.2277757-1-chenyuan0y@gmail.com>
Message-ID: <a973cd37-4d32-e5bd-fb66-3629f9414041@linux.intel.com>
References: <20250111180951.2277757-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Jan 2025, Chenyuan Yang wrote:

> The yt2_1380_fc_serdev_probe() function calls devm_serdev_device_open()
> before setting the client ops via serdev_device_set_client_ops(). This
> ordering can trigger a NULL pointer dereference in the serdev controller's
> receive_buf handler, as it assumes serdev->ops is valid when
> SERPORT_ACTIVE is set.
> 
> This is similar to the issue fixed in commit 5e700b384ec1
> ("platform/chrome: cros_ec_uart: properly fix race condition") where
> devm_serdev_device_open() was called before fully initializing the
> device.
> 
> Fix the race by ensuring client ops are set before enabling the port via
> devm_serdev_device_open().
> 
> Note, serdev_device_set_baudrate() and serdev_device_set_flow_control()
> calls should be after the devm_serdev_device_open() call.
> 
> Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> CC: Hans de Goede <hdegoede@redhat.com>

I've applied this and the other similar patch into the review-ilpo-fixes 
branch.

I altered the shortlogs to: "platform/x86: xx: fix serdev race".

-- 
 i.

> ---
>  drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> index d2699ca24f34..a96b215cd2c5 100644
> --- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> @@ -199,14 +199,15 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
>  	if (ret)
>  		return ret;
>  
> +	serdev_device_set_drvdata(serdev, fc);
> +	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
> +
>  	ret = devm_serdev_device_open(dev, serdev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "opening UART device\n");
>  
>  	serdev_device_set_baudrate(serdev, 600);
>  	serdev_device_set_flow_control(serdev, false);
> -	serdev_device_set_drvdata(serdev, fc);
> -	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
>  
>  	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
>  	if (ret)
> 
