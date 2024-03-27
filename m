Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54DF136E1C
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 23:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711582589; cv=none; b=I5tvlM2PNEbfRz2giWmZLa+mCaGRvxQ/5BPcPPx9lR9oxegbSa4gTzTaWhR/RkYAXIuZNcHT0vAqlVIUZk6jGn8Hufo6Tmp7qML20TBg8V9NUXWAfypXDGXRulJ5iWDqar/XsMHlBSnC3rkcMkYgVWWkRkkqz6+DP99+E8GMvfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711582589; c=relaxed/simple;
	bh=X1ad2gzUqsQ3h4LgK6qvvHu9sMDo5c6s0O+IiwE/oSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwhNpMnWAGJvX2SFq9U5Jr66Dx7bpiI64P9ZOVsfay0Q4s/ozPdc3NgAQMU9N3WOH9ZHLQEWRu1cGkocifvokLc4j9lvNxnYjLxpmx2qUA6Y0D81LwovnIyTWahl0Nd8aa5UvHdbrEv/L3B65D0QjY2BHSQ5u42VxNrd7yMTMUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MY1wJdNp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MY1wJdNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711582588; x=1743118588;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X1ad2gzUqsQ3h4LgK6qvvHu9sMDo5c6s0O+IiwE/oSw=;
  b=MY1wJdNpjy+t4gUVgZ+f9eXxE/oFsdE+w4a4+EUEhK60+BR6ONyvfeW8
   qWFmRgSLDrbXnU5OkssEGZ2FnlTMYw3zZWgRsHhodOvUOk2SsBUSz8IO1
   tu1y5J/rl5cgmFCyo0ZfRF5E8rowfK5AbB0J85c3HXVsI/2EoaISAW6bV
   5hule3iHTzO4AUxOjFJOSq/fAgc/g0yIilTi88J0b+bOwvQ2ULfCHoYtj
   mJ/8wRMQkrAbAMR85UB49EH7U6itghSKQSdhpaiMLMlK1WPnBTrBO9fw9
   eBB0zz3cgbEjz8QD5ojWPSop11tyF3Z+WYVP8wsSgZDUIRaPKgbiQlZvn
   Q==;
X-CSE-ConnectionGUID: NZgb8/n+T5+jdJEJZuHfJg==
X-CSE-MsgGUID: glyHCqgUTGShlg6PrA52HA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6828539"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6828539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 16:36:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="16532895"
Received: from soralee-mobl1.amr.corp.intel.com (HELO [10.255.228.178]) ([10.255.228.178])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 16:36:26 -0700
Message-ID: <5c9bcf27-0b57-4750-960f-e01a08149b93@linux.intel.com>
Date: Wed, 27 Mar 2024 16:36:26 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-vbtn: Log event code on unexpected
 button events
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: AceLan Kao <acelan.kao@canonical.com>, platform-driver-x86@vger.kernel.org
References: <20240327195712.43851-1-hdegoede@redhat.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240327195712.43851-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 3/27/24 12:57 PM, Hans de Goede wrote:
> When logging the warning about receiving a button event on a device
> without buttons log the event code which triggered the warning.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  drivers/platform/x86/intel/vbtn.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 084c355c86f5..de4decbb13ba 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -158,7 +158,8 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  
>  	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
>  		if (!priv->has_buttons) {
> -			dev_warn(&device->dev, "Warning: received a button event on a device without buttons, please report this.\n");
> +			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
> +				 event);
>  			return;
>  		}
>  		input_dev = priv->buttons_dev;

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

