Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8987392824
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083298; cv=none; b=NCG5NLqIv7Rf2bo8my3vouzBjIN+UQIFY9m3Ha09zy872iHke9S/nvYjFulLDG676dkupKfDX/1SXP01QpJNgIcz0SosDKN4CqWz623OCVp6jHZRzQ70Iq4/DcJ1l+8wQ/cVFYgr4e7t7IuMRc01/KmWkwjVv1wOvitd5RtZ/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083298; c=relaxed/simple;
	bh=8ywMVgsqioh3l3mOnlkKD55F0gJaTZBld88LIpzaCag=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kziF6yMr4/c6RmvcNdz3o4Mr8CjzmbrbLm9gz/o2QIAvD86ypa8cbW1517ZwqD8E66Lzd+sIP2UsOu9KRWvmFZOJkY5OMDt2ARnKsV5DjJ56oiISi5UsIuMsIOZv9IhNjytVKRDC9k/NycHupLIueFkuB7+pqksZT6x1TskXzfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXuylHZ2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXuylHZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781083297; x=1812619297;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8ywMVgsqioh3l3mOnlkKD55F0gJaTZBld88LIpzaCag=;
  b=MXuylHZ24fOY/pmMSKSZ9OuXIqXh1ZslJvjBXi9Zv9DtUMUIJ2Fiyzru
   9JbDzB2kduGkt3gGlo+nqxQ3jqzGNGBU8+Hw5qtsznLGaGDswOp3CyUuV
   H8HQbAxMmLS0RMbBoOO8Wwp0J+S2h6FPe86V58sGiCtFyBbZpPsDkIN9q
   PitRjZ690nMsMvxu524fbGo4itLhKjqVwE2Mi/imNv4cnA8P9ULESKBrN
   tefZNzOnIwgZMHN13eP44O31EjDwPIqjPalxBO3u1T+7CFqH/QRq/Cjpo
   iqIOY6fE6AxcVKbZDB+dOcfDwSLbrVBAwVmJ+ZeFzuSPWwjJmLvANDrZi
   Q==;
X-CSE-ConnectionGUID: Z9OLwCZFS3mJIkvsz5t0cA==
X-CSE-MsgGUID: Z8Yw2kIiSzuUoB9hqInCHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81720000"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81720000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:21:24 -0700
X-CSE-ConnectionGUID: rS5ceJTMQk+4GMADtDSfzg==
X-CSE-MsgGUID: JZwG+2iOS+C9uvuSDJ4J8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241690930"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:21:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 12:21:19 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    krishna.chomal108@gmail.com
Subject: Re: [PATCH v9 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx
 support
In-Reply-To: <20260606080204.724444-4-radheykalra901@gmail.com>
Message-ID: <c581954f-8fd2-6b19-8444-e6fdaa269f30@linux.intel.com>
References: <20260606080204.724444-1-radheykalra901@gmail.com> <20260606080204.724444-4-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Jun 2026, Radhey Kalra wrote:

> HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
> the existing Victus fan-speed WMI control path. Add board data for the
> Victus S thermal-profile path and fan-control support.
> 
> Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 91578e7..c124ad0 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -170,6 +170,11 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
>  	.fan_profile		= &victus_s_fan_profile_params,
>  };
>  
> +static const struct hp_wmi_board_params victus_8a3d_board_params = {
> +	.thermal_profile	= &victus_s_thermal_params,
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
>  static const struct hp_wmi_board_params *active_board_params;
>  
>  static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
> @@ -230,6 +235,10 @@ static const char * const victus_thermal_profile_boards[] = {
>  
>  /* DMI board-specific feature data for Omen and Victus laptops. */
>  static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
> +		.driver_data = (void *)&victus_8a3d_board_params,
> +	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },

Lets try to keep these in order (8902 < 8A3D).

>  		.driver_data = (void *)&omen_v1_legacy_board_params,
> 

-- 
 i.

