Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B282494F0;
	Tue, 18 Nov 2025 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462593; cv=none; b=PGIK1DxqYGXpnJXhoKBM8Zwk7drQbGITK/mZlDWHtDp3Y4qFitQ9yK0uT+xchVxTteQQPqC1kgL5mJxnmPitMTFS1EtedrL+77waKcLeIbeyHmNKiOLoSdpXVJX0R3PHdVdGW3kSWodDCEcrMIY+TcYB6LW+ieeVNHCD8WCFD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462593; c=relaxed/simple;
	bh=BOFR98eONarhpLbhT27bS334i6TAANKGN202X76DwY8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XiZtLGeBM6aEmprGMmz/G24YC5kIbXbbAzBZxXanjZgw0ToRBni2mJa1QRnaF7lNGfxuZJY8rJAdZiFvYp97R/0x4rYfcCMtWuRLqqbjfI1n0Mu8a7qa7A0AEx4B0bdny7oSHwXchJkR47JmuZhZdhuISpCbjgX7DtkKkxU8jbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9Jchr8z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9Jchr8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763462591; x=1794998591;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BOFR98eONarhpLbhT27bS334i6TAANKGN202X76DwY8=;
  b=i9Jchr8zKr4DfRd5JEhHEbamAsazRirFG1rq4i8Aq45XAT1O5mSDXuy5
   NAyu9Z/IccE5uSlaoY4oZhk9UkmJMco52SChg3Ya8Hkf5INkItmhiPEmr
   /ss0hODJYRUyM0ZD7zZ9Lqo5HKzor3yWVFjaERTlJ2w7SKauzBRK4zH3K
   HlucdEp+sUBumAEaJnnDeq5sJQoS4qtoWxXQKPRAsS55zCtbBDo1XHHMJ
   ENrBH6qA4AQz9TpxT7UuB0QIeY1eD/yGg2Rq4XPQPexKl1oQZeEmVyIzD
   Nnj779+/B/IaValn/UXFEi+4F+Oz/FPN3crwmioczQxo8VIn4oMfuIqZV
   g==;
X-CSE-ConnectionGUID: DM+I1xwxRwWSIVZtahPE/g==
X-CSE-MsgGUID: anMnIYETRYCy+LDqizYuRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75804566"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="75804566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:43:09 -0800
X-CSE-ConnectionGUID: xGvWVXLNSgWq771pesI8AA==
X-CSE-MsgGUID: 06Sd+iKARJq5BcicvEDIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191164485"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:43:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 12:43:02 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] platform/x86/uniwill: Set cTGP support based on EC
 for TUXEDO IBP Gen7 MK1
In-Reply-To: <20251117132530.32460-7-wse@tuxedocomputers.com>
Message-ID: <2872e563-8973-d501-764c-920c18afd58d@linux.intel.com>
References: <20251117132530.32460-1-wse@tuxedocomputers.com> <20251117132530.32460-7-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Nov 2025, Werner Sembach wrote:

> The TUXEDO InfinityBook 14 Gen7 shares a boardname between the variant with
> and without an NVIDIA GPU.
> 
> Dynamically read which variant is present from EC to determine cTGP
> support.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 22 ++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 15a94c256f728..f6b24d2c28b89 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -88,6 +88,9 @@
>  
>  #define EC_ADDR_GPU_TEMP		0x044F
>  
> +#define EC_ADDR_SYSTEM_ID		0x0456
> +#define HAS_GPU				BIT(7)
> +
>  #define EC_ADDR_MAIN_FAN_RPM_1		0x0464
>  
>  #define EC_ADDR_MAIN_FAN_RPM_2		0x0465
> @@ -1406,6 +1409,23 @@ static int uniwill_ec_init(struct uniwill_data *data)
>  	return devm_add_action_or_reset(data->dev, uniwill_disable_manual_control, data);
>  }
>  
> +static int quirk_ibp_gen7_ctgp_supported(const struct dmi_system_id *d)
> +{
> +	struct uniwill_data *data = container_of(d, struct uniwill_data, id);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SYSTEM_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +	if (value & HAS_GPU) {
> +		data->id.driver_data =
> +			(void *)((unsigned long)data->id.driver_data |
> +				 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL);

Hi,

Mutating .driver_data like this is a no go. Please store information that 
isn't bound to the match properly, not with hacks like this.

There seems to be already struct uniwill_data where you can add things 
properly. If you want to use .driver_data as mutatable feature flags, you 
need to make a copy of it into a properly named variable (e.g. 
data->features). Then you can do
	data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
here.

> +	}
> +	return 0;
> +}
> +
>  static const struct dmi_system_id uniwill_dmi_table[] = {
>  	{
>  		.ident = "XMG FUSION 15",
> @@ -1462,12 +1482,12 @@ static const struct dmi_system_id uniwill_dmi_table[] = {
>  		.driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>  	},
>  	{
> +		.callback = quirk_ibp_gen7_ctgp_supported,
>  		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>  		},
> -		.driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),

Please always order your series so you don't need to correct things you've 
just added.

-- 
 i.

