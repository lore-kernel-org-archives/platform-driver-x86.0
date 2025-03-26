Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174941B3950
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Mar 2025 10:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742986473; cv=none; b=g+HykmNzYsfxALuR3sBrD+Gh1u33F7ikPgFKgRKHlrUHoT1tWBBXoEskxvhdxK6yqObCC6lEgtWG+0u+re5p38sJJU9oWGOvpUBKuJKgYb0Zh45oYvgEBqsv7rTNADStWHjZ6dyixR03FU/ofAnfx9t55NmmuR+MeONLoWqGTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742986473; c=relaxed/simple;
	bh=Wlt2qLHtSqKhRuD0VSANybP/y8FqoXz0JqXYGcY4v/8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AiKq3soGLDLzfVrvkyiMPATZJv9m6pPoLdvnAfE9LJFnOzMJKso6PE+eyU2rVxvn4/5rGqZ7E9rVlg4RLqVKm5Ng6o/fi8I9BCOuQMvg6xeV9AKdr4fcnnnxVrh1dWm36QP8+VNb3kQgCD49bqnnYV43RIg7s0Oe5ROtbKsJv8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4oxEd9J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4oxEd9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742986472; x=1774522472;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Wlt2qLHtSqKhRuD0VSANybP/y8FqoXz0JqXYGcY4v/8=;
  b=P4oxEd9J1iZQlpQMpxueE/pFZvuiAaVcpLx2713W3QDI4AbzAZtp4iMe
   stdacLhtJsWWzVehuEObcN4XdqoWSQVu5aEGIO/0APZPynA680VeCZ17t
   GwABr+GSB6vKviwc6KEZxWc8wnFk3/Kid9Q5ISkkyUDaj+qp9AO9MMoQf
   zRpyBv502v0lUX+VMHKgXmEb4NPCO9kSje4C8F+PWly2i/gbLOWtwVTSo
   gluwRd3UOBpAVFrfYLRsZ2mvSR+IbGXGtYVA6bhTJ1W9maR/1gcHNB5z4
   6BEJ6aIGaXdb4Wheg0Ly4+JTaSvMcxwAklJ8jAsFUuZ95FzjcqOqqqdVM
   g==;
X-CSE-ConnectionGUID: /sDcKcxJQw6pCfLtJDvHJg==
X-CSE-MsgGUID: K4hSncaoRJKrgyI4joSi3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43993499"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="43993499"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 03:54:18 -0700
X-CSE-ConnectionGUID: fS5EiDORSZmC3ElOZGO/VA==
X-CSE-MsgGUID: cn0K03PGRvOk0SkbOZPlwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="128872004"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.5])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 03:54:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Mar 2025 12:54:11 +0200 (EET)
To: Kevin Robert Stravers <kevin@stravers.net>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCHv3] platform/x86: asus-wmi: Add quirk for ASUS Vivobook
 S14
In-Reply-To: <20250321174307.1831859-1-kevin@stravers.net>
Message-ID: <e56fd6e1-6981-7388-b0df-91423b626b09@linux.intel.com>
References: <20250321174307.1831859-1-kevin@stravers.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Kevin Robert Stravers wrote:

> The ASUS Vivobook S14 will have wifi disabled on boot as well as
> resumption from suspend if the asus-wmi driver invokes rfkill functions.
> 
> This patch disables asus-wmi's rfkill usage to prevent the wifi card
> from being software disabled.

Hi,

Developer's certificate of origin (the Signed-off-by tag) is required
(more details under Documentation/process/).

> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    |  5 +++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 3f8b2a324efd..1e6fb9308560 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
>  	.ignore_key_wlan = true,
>  };
>  
> +static struct quirk_entry quirk_asus_vivobook_s14 = {
> +	.skip_rfkill = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -530,6 +534,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_zenbook_duo_kbd,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS VivoBook S14",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "S5406SA"),
> +		},
> +		.driver_data = &quirk_asus_vivobook_s14,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..42e58a28c3e2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2138,6 +2138,8 @@ static int asus_new_rfkill(struct asus_wmi *asus,
>  
>  static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
>  {
> +	if (asus->driver->quirks->skip_rfkill)
> +		return;
>  	if (asus->driver->wlan_ctrl_by_user && ashs_present())
>  		return;
>  
> @@ -2188,6 +2190,9 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
>  
>  static int asus_wmi_rfkill_init(struct asus_wmi *asus)
>  {
> +	if (asus->driver->quirks->skip_rfkill)
> +		return 0;
> +
>  	int result = 0;

This line declares variable so it must appear before code (the only 
expection to that rule is linux/cleanup.h related ordering requirements).

...But I think you should also move the new check below the mutex_init()
lines.

I can't comment on if the rfkill interface has somehow changed and thus 
doesn't work with this device or if it's just broken. Hopefully somebody 
else notices this and expresses their thoughts about that.

>  	mutex_init(&asus->hotplug_lock);
> 

This patch didn't add the skip_rfkill field to struct quirk_entry??

Formatting of the patch seemed fine now. :-)

-- 
 i.

