Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982DB46C4BF;
	Tue, 21 Jul 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648566; cv=none; b=d8DmfJUfvDkHCxcYSLDNWAWLYLk1NApKVB7LMuC7fQvT2TUiwh4TJEibgokV90AMFe9E0L5Rb0p+98gUjDTf23zdp+vj1zx/l7CcsVGvR5syWgEV2q4m369107I2CVqcAg/3+Y6sF0itaB6nYLPCftxd6z3ZRuSyFPL1AiXF+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648566; c=relaxed/simple;
	bh=2gkfXDwBcyxUOY0Yp2etk9eiyIbteuYkRxvM4a1ix9o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HUvMzfe2m/R4xWqzk/5iUZhobmVK/hdSCsk+TdhQPNFLK9O9tv7onz5H2bk+H+5mojmfU9Ie2n+M0R1N3RPUccYCNCr+3SauYB6IgpzugEekgREXXt/ejAJyFmmi/DM1VZxdhEfRSJcihCcmCD4WP2CpSxFcWg2s5x+5HSiF0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvLW3K8I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvLW3K8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784648565; x=1816184565;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2gkfXDwBcyxUOY0Yp2etk9eiyIbteuYkRxvM4a1ix9o=;
  b=CvLW3K8IdvY2B/yKY8rBr76ZpI/DGQMjNPsMmukVxTG/heL6svCCIIP/
   irJ7ZlWIfyyhHrzUjS890dysuRZ5w+qFDOXVUbZqSJwWc2NUfaB6ww8lk
   cnQ1U/lYdlYffi6fs+gYiM+5ZX2cjKoGrk/dNlsPdEo6TIpuOx1Nd3RHX
   7GGOh8IrAYeC8RNkDjGUwuuG3bGtTSIBGupsSIxY4D5pCyyH+WeDJzUmM
   3WcD3yl2zbvQV5hHHOB7wslUo/qMJ38MO3z2HUCZqDyq1CwiBDcgN3McH
   TnznaTLTRf/2VBWymFdYiIkCTAfEd+reNrycsxhObGai+by+wb4SR1b2Q
   A==;
X-CSE-ConnectionGUID: tFhCnDv0TSmOBv5JeYO9jQ==
X-CSE-MsgGUID: kiS6c+hkRYqa5t3ssZsJ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95908687"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="95908687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:42:44 -0700
X-CSE-ConnectionGUID: UdKzJj7AShG2vvXIePoqsw==
X-CSE-MsgGUID: re+kEFabRoyrk6RigIq4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="253891710"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:42:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 18:42:33 +0300 (EEST)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com, 
    radheykalra901@gmail.com, edip@medip.dev, hello@kursatabayli.dev, 
    mjg59@srcf.ucam.org, akpm@linux-foundation.org, jorge.lopez2@hp.com, 
    jes965@nyu.edu, mario.limonciello@amd.com, julien.robin28@free.fr
Subject: Re: [PATCH 1/5] platform/x86: hp-wmi: validate WMI response header
 size
In-Reply-To: <dd9b30907b64b97b5e0ffb8f3e7440070192ce9c.1784195117.git.emreleno@gmail.com>
Message-ID: <70687f1c-a0e0-8df8-d2d9-64fafe96a1be@linux.intel.com>
References: <cover.1784195117.git.emreleno@gmail.com> <dd9b30907b64b97b5e0ffb8f3e7440070192ce9c.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Emre Cecanpunar wrote:

> hp_wmi_perform_query() reads struct bios_return without checking that
> the firmware response buffer is large enough to contain it. A truncated
> response can therefore cause an out-of-bounds read.
> 
> Reject responses shorter than the mandatory header before accessing its
> fields or calculating the payload offset.
> 
> Fixes: 62ec30d45ecb ("misc: add HP WMI laptop extras driver")
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 5353d997d272..205a6020e9c5 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -670,6 +670,11 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  		ret = -EINVAL;
>  		goto out_free;
>  	}
> +	if (obj->buffer.length < sizeof(*bios_return)) {
> +		pr_warn("query 0x%x returned a short buffer\n", query);
> +		ret = -EINVAL;
> +		goto out_free;
> +	}

Hi,

This driver is using a deprecated WMI API. The new API might be able to do 
size checks for you so the correct course of action seems to modernize 
this driver instead.

IIRC, I have recently mentioned this same thing to somebody else so 
somebody might already be cooking a modernization patch.

-- 
 i.

