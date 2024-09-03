Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB919F434
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359758; cv=none; b=qItJ6cY79pXqKbQIjh0LCOvA6xLQuqh3ZuwWQVDrJFUaZ2j7L5MdVIsgSfAqXvqOhcJ7HrFcK9/dZ8yChL2mGR12+PqmhMufRbCOl+YWar+T8yZQuIcHYXJYCPgC/4GBIENaZknJcr3w8yU3xsY6eMOnvmouXAcl6X5QjeUyywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359758; c=relaxed/simple;
	bh=FB2G7vBzrfmpbEAVnTr7eR37gvk1Ln4ioG//VedNIbw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lalSRNLYlylKuVHdZf2QV2vfwvnh1wFWDKbZqednfmkP/kq4oenWdalxXDOJ8lhDFjrBeRCH0K9VFMyTQwrgSC/GXSA9Ph2MPiSeYNUtpK7GrDZuqRL0KTDpf2pOuBtkQauB/UM9uiQYSCHlXUdkQbOdO7eYwWMz5SUTLdEM1rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kcvh6bHA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kcvh6bHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725359758; x=1756895758;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FB2G7vBzrfmpbEAVnTr7eR37gvk1Ln4ioG//VedNIbw=;
  b=Kcvh6bHA9c+nEGX9kbR7xeKQ8wsFM07YLamID2KE5HIMIj0nBTPURwT1
   xhPgR/4b3BPC3lu0ZzaMnlheMPq9ROkxtslcKiEZkPOuVedNB3rSCZvMU
   FeoTio87cBfgWX2z4vKIhacsUZgXCfzDRPa5P1a+eoZT42A2f7Dl2nWIc
   PB+Q98N0nR0DCubg0GNYGlsYq+PfQWlJkWOQzNSetXmvBsuusc6bucTRG
   Iw9CyDDWSrS4mPpOrBp59X1qrTqHw710pnx5d9f4avdnLYyZxeuejpeEd
   MOBybaYTpUt3YeZs7OoX1/rnob10nXx24exuREG5wkt7QqjT4yjcBISWJ
   A==;
X-CSE-ConnectionGUID: stGPpu1eTuOP2EZHEBXw7A==
X-CSE-MsgGUID: 12pEwuAKRzm+h06fF05l+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35107230"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="35107230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 03:35:57 -0700
X-CSE-ConnectionGUID: poqJ37TfT4ex0LuTOEBprg==
X-CSE-MsgGUID: yD+YBVvJRAmsL6SJSJHj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="69664697"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.241])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 03:35:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 3 Sep 2024 13:35:50 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, James Harmison <jharmison@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: panasonic-laptop: Add support for
 programmable buttons
In-Reply-To: <20240903083533.9403-3-hdegoede@redhat.com>
Message-ID: <38ea9608-782f-ca51-84ec-b66abff38c1e@linux.intel.com>
References: <20240903083533.9403-1-hdegoede@redhat.com> <20240903083533.9403-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Sep 2024, Hans de Goede wrote:

> From: James Harmison <jharmison@redhat.com>
> 
> Newer panasonic toughbook models have a number of programmable buttons,
> add support for these.
> 
> Tested-by: James Harmison <jharmison@redhat.com>
> Signed-off-by: James Harmison <jharmison@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/panasonic-laptop.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 4c9e20e1afe8..2070caa1ea1b 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -224,6 +224,17 @@ static const struct key_entry panasonic_keymap[] = {
>  	{ KE_KEY, 8, { KEY_PROG1 } }, /* Change CPU boost */
>  	{ KE_KEY, 9, { KEY_BATTERY } },
>  	{ KE_KEY, 10, { KEY_SUSPEND } },
> +	{ KE_KEY, 21, { KEY_MACRO1 } },
> +	{ KE_KEY, 22, { KEY_MACRO2 } },
> +	{ KE_KEY, 24, { KEY_MACRO3 } },
> +	{ KE_KEY, 25, { KEY_MACRO4 } },
> +	{ KE_KEY, 34, { KEY_MACRO5 } },
> +	{ KE_KEY, 35, { KEY_MACRO6 } },
> +	{ KE_KEY, 36, { KEY_MACRO7 } },
> +	{ KE_KEY, 37, { KEY_MACRO8 } },
> +	{ KE_KEY, 41, { KEY_MACRO9 } },
> +	{ KE_KEY, 42, { KEY_MACRO10 } },
> +	{ KE_KEY, 43, { KEY_MACRO11 } },
>  	{ KE_END, 0 }
>  };
>  
> @@ -811,7 +822,7 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
>  		return;
>  	}
>  
> -	key = result & 0xf;
> +	key = result & 0x7f;

I'd mention this in the commit message. It's kind of different from adding 
just keys.

-- 
 i.

