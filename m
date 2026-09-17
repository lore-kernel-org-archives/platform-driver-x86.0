Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47E568548;
	Thu, 17 Sep 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653745; cv=none; b=ubeOlIHInDuitTT/oSknvPzuBK5/3e2XnusTdBC8VdAN7hDtPkW3bvwUOi4fBziigO85ZnnjFHy7te3sxMBLIPbu0xrEHuICR0tgYmnG27+HMwSEzqd3uqrqQdAnX+SK5xlGZ9oWE/AbH8kSQtonmpl5QD+2lfzkES4jb4sLALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653745; c=relaxed/simple;
	bh=0cM3yF3/PnTDBZOzObj0AvBvE9agboG0VyNJjYcxuxs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H3jWmaSnRmuebLKg5+uy9XgHpaT52x+kQKQdL9irF8nkYn1c7/XUqTZxFgyc1vfg3dLB4Zgo3IVAzGXJ0yToT+9biun2M1d2dElF1rh50JmMy7UszZSDHyQQUCH6/GsQH4H5Cj5BtO1CXVkIlSM/eJAl3MCRS4hG2gA4ATB732M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMQAd+xB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMQAd+xB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789653743; x=1821189743;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0cM3yF3/PnTDBZOzObj0AvBvE9agboG0VyNJjYcxuxs=;
  b=OMQAd+xBoC15SkNqv3zXxViJw4YRugj3sxVL2lsp70f0lRpaCoz+aIGJ
   lKtDoX5UswGdNDWDMjkWjnRTVdJpmrju+W1mc2X8sxkHC+ND1UErKEDCL
   2txAxgMEvRzCCcLSpeRFV1gIEtgHL92Roi73zhAYCPQB+ek358j6DBfM4
   1wlFqI3ElLchWQv0JNh0RpUQnEpCOjMpGBTjg0QZZI395gxlOrCpeHRH5
   Y2dOJ9N5d+c/s4p4viQuhPBcrP5Ii95ZPfYhM7Nv8ec6a8JXABsxKTJce
   /ghrEI9OGe4KIzc40MrvddzXjzXwnBDg77t/mbHX08bDiN1newetTbQeo
   g==;
X-CSE-ConnectionGUID: IiClQxn1Sg+LJvmb/4mOJA==
X-CSE-MsgGUID: 6C1Ye+96RpufpTR1IAsgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77643063"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77643063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:02:03 -0700
X-CSE-ConnectionGUID: 0X2txHzYTvaEC9d0eaG11Q==
X-CSE-MsgGUID: kk3vzQsqQ/aXEEEHcacWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="298886087"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:01:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 17:01:55 +0300 (EEST)
To: Luis Miguel Arias <luismiguel@godjango.dev>
cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: restore battery charge limit
 support
In-Reply-To: <20260818175814.65757-1-luismiguel@godjango.dev>
Message-ID: <568d06ad-1e2a-34c7-614f-4ee4432e5cc5@linux.intel.com>
References: <20260818175814.65757-1-luismiguel@godjango.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Aug 2026, Luis Miguel Arias wrote:

> On ASUS systems where the charge threshold is supported through
> ASUS_WMI_DEVID_RSOC, initializing charge_end_threshold to -1 causes
> the sysfs attribute to return -ENODATA. This makes TLP consider
> charge threshold support unavailable.
> 
> Initialize the cached threshold to 100 instead, allowing userspace
> to set the desired threshold normally.
> 
> Tested on ASUS with TLP 1.8.0:
> 
> Before this change:
> * charge_end_threshold = -1
> * TLP reported no charge threshold support
> 
> After this change:
> * TLP reports "charge threshold" as supported
> * natacpi (asus_wmi) is active
> * charge_control_end_threshold can be set to 80%
> 
> Signed-off-by: Luis Miguel Arias <luismiguel@godjango.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412..87363b198 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1586,7 +1586,7 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>  	 * platforms retains it, therefore signal the threshold as unknown
>  	 * until user explicitly sets it to a new value.
>  	 */
> -	charge_end_threshold = -1;
> +	charge_end_threshold = 100;

Thank you for the submission but is is already covered by the commit 
78bf392ba77d ("platform/x86: asus-wmi: temporarily revert to setting a 
charge limit").

-- 
 i.

