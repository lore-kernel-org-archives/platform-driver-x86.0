Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630DB8BF0
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801719; cv=none; b=ZcCuCXrPOW5s7HOBeAUcZgjCgiRNTcTipyfgnxIOHGtoOx+Jyt55K5Hmn/ShYMbC/ZVG3tKKDNYxfWcOPXvd0Fvd0TKAzUAQg3JSQdZtlYC+W+/BuvQgAy8KJeRvGoCYHoRHMjsTy91+/P5nynOi8O5ui3gzvINrj/YrwvSTWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801719; c=relaxed/simple;
	bh=pMa6PSJyLeiQSq7qwQzAzUnBKJb9SOL7VJDSxWsBbpI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T/8W7VPi84KhRCYjI1yit3OztUBJ9lNPJWJ7Ly3L5iM8JRuHBeM8DMqe7FRILnBdZEHoDOZRzEoJQ+xZ+K0vHAIktmeDUT9g42oD+E64gAHWjASVbgQTiACLxqMMuUczMOYmajFzFywxJul5s6aJd3uyQ8nmHB89xZxmajo2Gss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFtbAJmi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFtbAJmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716801719; x=1748337719;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pMa6PSJyLeiQSq7qwQzAzUnBKJb9SOL7VJDSxWsBbpI=;
  b=CFtbAJmit1ZvCgcgaTbYYXwT69oRwIOiNCSK2sx+PoaRRFbiHkIvlHV4
   TWtOPTf2vCpI00fylco20phSEjjmWaUBJoaq/Oy2unhc6shTOQUAYhsfw
   veepbj3YyXjx4oARk6kuUthIOZoD3QoKnEAn58IFt9Zp0WQq7csi9V77x
   mFetzZ5Er1eeG023iMo2wJEjJaRGfzqdNUGbTZ1i9vitoaQfk9vvkLARb
   JFGji4nSK70jgtQlu/OVNCd4i41EQ492pzRws8aTDz1MWuxHZVVxg1UoU
   5T2Sw2jMwzcqaQGQi9aa+QdMn9aqEuxxqPufMKb/JjOWUMa0RPX+V16+8
   g==;
X-CSE-ConnectionGUID: uMN4rMTCTXKPs13JepZppg==
X-CSE-MsgGUID: oPJRA4y6SXGEb1WjzjqVng==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="30620109"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="30620109"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 02:21:58 -0700
X-CSE-ConnectionGUID: N8KGPYnoT0GY9XkjAzh3GQ==
X-CSE-MsgGUID: k05Hj4fxRXqRWrvI86vbgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="57899679"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.138])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 02:21:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 May 2024 12:21:51 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, hmtheboy154 <buingoc67@gmail.com>, 
    Gregor Riepl <onitake@gmail.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Add info for GlobalSpace
 SolT IVW 11.6" tablet
In-Reply-To: <20240527091447.248849-2-hdegoede@redhat.com>
Message-ID: <ef8a614b-3079-13a4-b223-23e1ef2bec7e@linux.intel.com>
References: <20240527091447.248849-1-hdegoede@redhat.com> <20240527091447.248849-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 May 2024, Hans de Goede wrote:

> From: hmtheboy154 <buingoc67@gmail.com>
> 
> This is a tablet created by GlobalSpace Technologies Limited
> which uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB of storage.
> 
> Link: https://web.archive.org/web/20171102141952/http://globalspace.in/11.6-device.html
> Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index b021fb9e579e..6c03e7daadd4 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -900,6 +900,22 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
>  	.properties	= schneider_sct101ctm_props,
>  };
>  
> +static const struct property_entry globalspace_solt_ivw116_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 7),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 22),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1723),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1077),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-globalspace-solt-ivw116.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),

So you're planning to route these through fixes branch?

Just asking this because you've the other patch in flight which removes 
these max-fingers entries (I know it's not harmful to have an extra entry 
but just trying to synch on the intent).

-- 
 i.

