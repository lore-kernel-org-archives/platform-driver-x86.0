Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEE376BD5
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jan 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768479382; cv=none; b=ausyPic1kScDlGMI4MOTllORj7US5qC9VT3H/HnjG8hnr7fmxfhtihkThPoQioA5vnd0Xmni7S3JyxDsUUeC9DlntnqnxsbfnrRWAgaT5CQLg99nBK/4oLjthckNI7rK0pBAyrWVT6o8CkpSxkHgHt7q7DbLAD6RoBsRTHLh/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768479382; c=relaxed/simple;
	bh=mgtdeMRZ49GGOM7C7Ium8QI1Y3BTxTMbuTCncJWBHe4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e48G/ixEUor1k9P/5J2R3U5nQbU6pksTEDJ2KEjsBfvGCs+JYAUluFTFP1i9Td2RKGgN/sC4YQtMfp7np1btWfXIsjzpXO17CaxAX5Rx8uEtXT0jzIgSmNpy+ZEy1l4JgH6m7fNsLltMN2XBv+3WYvIoSvVzmr0VpPvGTAVMxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg53stUw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg53stUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768479381; x=1800015381;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mgtdeMRZ49GGOM7C7Ium8QI1Y3BTxTMbuTCncJWBHe4=;
  b=Tg53stUwzMOfTmE0YZQLkeHZ+gKQtMFfnPUpZzKFaAXT2lfonRUQVUPv
   0tQ2gRIlBz9NOVZudk5SCih4nIH+2GD4uhrjsrqp+2mMGBG4qj2+qnM1t
   v0XI74rItElRgaWLLWOzVaBE1/sRRV5aKBYkkRryEKVAiOoMAPJQHE6Es
   NmRsfMJU5Ay61D/TxrLA/6JgHjUuqYteJN4ZBtHSg2q7lvKxlmtCge7do
   iJRPiUrAV429EV/2yDJiWsZXeLgy1oDZ8mmOEcaWYaQ97u1tKZKlP9+b/
   LBI3RbOZRE5j1M0S6KGRUVT5HJJ8DASKNEUm+fip5sdCQVzIDdsk4Oe3a
   A==;
X-CSE-ConnectionGUID: v+M0KTL6R+m6FrzO/tvitw==
X-CSE-MsgGUID: qT+PvIk1RLCCUMVG+FK/qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73634564"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="73634564"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:16:11 -0800
X-CSE-ConnectionGUID: pZY79SWFTXGMP5l6nvyi2g==
X-CSE-MsgGUID: ZtqiE62jS8y8lkRFmY1sBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204996207"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:16:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 14:16:03 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: jorge.lopez2@hp.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/hp: hp-bioscfg: Fix kobject warnings for
 empty attribute names
In-Reply-To: <20260114221730.653822-1-mario.limonciello@amd.com>
Message-ID: <b3654571-013d-1a3c-18da-33f67e17d225@linux.intel.com>
References: <20260114221730.653822-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jan 2026, Mario Limonciello wrote:

> The hp-bioscfg driver attempts to register kobjects with empty names when
> the HP BIOS returns attributes with empty name strings. This causes
> multiple kernel warnings:
> 
>   kobject: (00000000135fb5e6): attempted to be registered with empty name!
>   WARNING: CPU: 14 PID: 3336 at lib/kobject.c:219 kobject_add_internal+0x2eb/0x310
> 
> Add validation in hp_init_bios_buffer_attribute() to check if the
> attribute name is empty after parsing it from the WMI buffer. If empty,
> log a debug message and skip registration of that attribute, allowing the
> module to continue processing other valid attributes.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

A Fixes tag?

> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 5bfa7159f5bc..5bee916429aa 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -781,6 +781,12 @@ static int hp_init_bios_buffer_attribute(enum hp_wmi_data_type attr_type,
>  	if (ret < 0)
>  		goto buff_attr_exit;
>  
> +	if (strlen(str) == 0) {

+ #include.

> +		pr_debug("Ignoring attribute with empty name\n");

This too seems to lack an include.

(Both problems seem to pre-exist.)

> +		ret = 0;
> +		goto buff_attr_exit;
> +	}
> +
>  	if (attr_type == HPWMI_PASSWORD_TYPE ||
>  	    attr_type == HPWMI_SECURE_PLATFORM_TYPE)
>  		temp_kset = bioscfg_drv.authentication_dir_kset;
> 

-- 
 i.

