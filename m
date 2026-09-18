Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1A9409277;
	Fri, 18 Sep 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751751; cv=none; b=UOzaeug0EOVUR6SB4bQtb55RuBHtJHoo3s3c8AsSvDczzG5zcfDU9OL3SxZui4T6rAfpngX3H7b9Ko6ms3iOoPzuMcC1A26w7AOMWmvY/HVVwhP/ODdujYHzokl2EGDYkj7VmR9ITPaTMPJj71jvFqaY26Y3+iQMaPNdhqHemdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751751; c=relaxed/simple;
	bh=c+nix3SCMoOJFw3pWgrni2hADn/DiEZwjYBvE1AyZmo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i9JwqY5DIMwETjRF6+bwVc+ukLsSP1GP5Yq7psd70pmyroyqlxCYXEd8TAXsuy40NvR5s4AUZZIpyFEcn4e9AQxl4Z6kJA3S0ux9eHD4E2fIRw5e3+tZ7FJyZu7PJWDs7ohN9TZbf5X8PdPutvUwsRIYAP3Rm2NIhq9ikF29VgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxky2nEd; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxky2nEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789751750; x=1821287750;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=c+nix3SCMoOJFw3pWgrni2hADn/DiEZwjYBvE1AyZmo=;
  b=dxky2nEdRw6xzV4gbObbyopjQ/g0F50pTSQnsqlifdSFRHAfDX97ZMnE
   dS8/750lxporoJ3sHbJD9lO6/ICKXZKWcOO7cm+I72oueVlQDRhUT579c
   kqc5XGrCGjIkc/KGt4DAI0802cJkqawfUvoJyftIcSqW8hlC4fwHBFuGm
   GIxtXZjwm86NZZfLp/VWH9wz1vv/9QT2GGmcaffOtK147ZsUtR46IKfr7
   WUBlDfjDS9KBAQ8MWYj8edR098RA8c5mlYQWnnMVnc1L+KAlGya+N+djJ
   VHXA1TVIY+2YBjcDHCgJsZ0AqYeUBW9+A+rLOhWCMpEEZax+kAN31mop0
   w==;
X-CSE-ConnectionGUID: pu1PZpLASmmxOiRe757nvA==
X-CSE-MsgGUID: twvuQOtRSOWWX69kbxmsgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="781139"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="781139"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:15:49 -0700
X-CSE-ConnectionGUID: 0naxZcQnTQmR00uYX+P4cA==
X-CSE-MsgGUID: Jt6ndRvpQnCHFdpqrqhxdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="297952200"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:15:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 20:15:44 +0300 (EEST)
To: Dale Whinham <daleyo@gmail.com>
cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    =?ISO-8859-15?Q?J=E9r=F4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Subject: Re: [PATCH 2/3] platform/surface: aggregator_registry: Fix tablet-mode
 detection on Surface Pro 11
In-Reply-To: <20260829-surface-pro-11-aggregator-registry-fixes-v1-2-ebf5cca9d205@gmail.com>
Message-ID: <12c85dbe-4453-8a38-bd37-cd5f5e97f784@linux.intel.com>
References: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com> <20260829-surface-pro-11-aggregator-registry-fixes-v1-2-ebf5cca9d205@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Aug 2026, Dale Whinham wrote:

> Replace ssam_node_kip_tablet_switch with ssam_node_pos_tablet_switch, as
> Surface Pro 11 reports tablet-mode via the POS ('posture') subsystem and
> not the KIP subsystem.
> 
> The KIP-based driver would remain stuck in a 'folded-back' state after
> suspend/resume, whereas the POS-based device reports its state correctly
> even after suspend/resume.
> 
> This fixes the type cover keyboard/mouse being ignored by desktop
> environments after resume from sleep due to the erroneous 'folded-back'
> state.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Please add Fixes tags to this and patch 1 and send v2.

--
 i.

> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 82c2144e10ec..2cb8278d98ea 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -415,7 +415,7 @@ static const struct software_node *ssam_node_group_sp11[] = {
>  	&ssam_node_hid_kip_penstash,
>  	&ssam_node_hid_kip_touchpad,
>  	&ssam_node_hid_kip_fwupd,
> -	&ssam_node_kip_tablet_switch,
> +	&ssam_node_pos_tablet_switch,
>  	NULL,
>  };
>  
> 
> 
