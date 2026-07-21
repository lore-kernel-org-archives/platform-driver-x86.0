Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97346C4B2;
	Tue, 21 Jul 2026 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649544; cv=none; b=roQKefytUQ8itbp05cZvLwGoCrgwhUd0Dfzzraq1Vcr7V0QTLXeJrMemOQT5eAB7qkvAbiyJn30E8lzeH/b9BMt1aaXKrNOFCYBGn8SFFqH+KK1urBWuZZf9dDm8cMbiUfkqbBE+VkffS3ShG7X28e0mLukk2Kw3UwV5MUxrT4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649544; c=relaxed/simple;
	bh=TEAolO+jHNTKLm2ftgus6hIrPjmjfoPSirtYPtyLfuM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Pf4fEdTZt7rNrByAu1DeNPiREM3QP4FujsrVS/lj88bAgPnZpjEmVVtY7vrOqrTPa1e8Vmxf8puZBnqZ3bv020YYwFQUEPdMS+QEgqVMtjFKrWD3qGiK3DOzsJ5PNt9JdcK8hKwzoZhAR+n8StyCoIefNlsCBCYGK6LsH6I81n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INobg97o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INobg97o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784649543; x=1816185543;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TEAolO+jHNTKLm2ftgus6hIrPjmjfoPSirtYPtyLfuM=;
  b=INobg97oCZJXmjjN2iFRFZE7xQfzSWaOnKIB2LmMmbfnMVu5gKZpHE/R
   vzFT47YTjCbcaxZ1nnmEk38ReA/o3qxHjsmBuxGVcj8dZbzeJDuMebFHL
   9mGdz3Ytyvb/d+pdxeiPcymduQop255A0xaoFaOFNTSYcwwmxSe0uTmgu
   zEmUcGLZeA2SvUo5/55YWz+rzUA5wbwEdFqy/n3oR2p2viYIWkm/z7+HN
   GHERjwHZ1EMNiqM4+lozHID83aI7eZ3pSZL4d3IFS/QQsuaUGmYhLu7fw
   49wx0XW2dsCP+sGROSzS1r+DSBriNK9u1ZYggWd58c+i4I0BVY5btOP4I
   A==;
X-CSE-ConnectionGUID: swBbafZEQGeZfSA65ZTvcQ==
X-CSE-MsgGUID: //hz+36kSwO9r3FqmtJ/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85455502"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85455502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:59:03 -0700
X-CSE-ConnectionGUID: ZO1wEqW4SFKIx/wwiBYgIQ==
X-CSE-MsgGUID: Ppf5WOKLQ/+WbHpEbcfHGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="261366346"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:58:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 18:58:55 +0300 (EEST)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com, 
    radheykalra901@gmail.com, edip@medip.dev, hello@kursatabayli.dev, 
    mjg59@srcf.ucam.org, akpm@linux-foundation.org, jorge.lopez2@hp.com, 
    jes965@nyu.edu, mario.limonciello@amd.com, julien.robin28@free.fr
Subject: Re: [PATCH 5/5] platform/x86: hp-wmi: report fan speed command
 failures
In-Reply-To: <c441b3dd6688040fe0154aad185e6e4817ccf124.1784195117.git.emreleno@gmail.com>
Message-ID: <3ed45ff3-d9f0-c14a-a43f-da0b07117f54@linux.intel.com>
References: <cover.1784195117.git.emreleno@gmail.com> <c441b3dd6688040fe0154aad185e6e4817ccf124.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Emre Cecanpunar wrote:

> hp_wmi_fan_speed_set() passes the raw WMI result to
> hp_wmi_apply_fan_settings(), which only checks for negative errors. A
> positive HP firmware error consequently reaches the success path and
> schedules keep-alive work for a fan speed that was not applied.

Missing info on which hw this problem occurs.

> Convert positive firmware errors to -EINVAL before returning from the fan
> speed helper, matching the other fan control commands.
> 
> Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 65c3bac17ad6..8f8da31bd5ef 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -907,8 +907,10 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
>  		return ret;
>  	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY, HPWMI_GM,
>  				   &fan_speed, sizeof(fan_speed), 0);
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
>  
> -	return ret;
> +	return 0;

You know the drill by now.

-- 
 i.

