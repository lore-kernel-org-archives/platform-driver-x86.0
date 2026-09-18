Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0E4E13EA;
	Fri, 18 Sep 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731598; cv=none; b=Km35Kqwd1Fpyh6euZGjXZIal0cwKXjrNndg84UJnJiHmebojFX4WlsQI3ap/5WsAJMBBHWIcZ+cYE8ydaoTjxoR2SCXMPJtwJJCd5NcLyy2NYdRp0RZr3cqQkkqXDp53+htCZQw2FdOrxfyojHCKp+UyM+bYHloC4TQKGQtXZDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731598; c=relaxed/simple;
	bh=ohvB+LMm/ZCQ+F41nkDRk+NajdlJtwY+TCy2eXf1M6I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L4VdQbOnhKz6bx9peAfLu1U9fePYfDboMZl26UTuHSuaUhr6Ta1S3BfJZHVQdZgLz1wymW65BSAyEXiCivrjIy4XgyeqyiVWIG/QSD5etlOKbjtiq9CD9NTNtaPgYt8pQD06Z1RJItqavYPcyjxmr6I/qViLRg0VJEc5NuOYtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mB0C+Yt8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mB0C+Yt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731596; x=1821267596;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ohvB+LMm/ZCQ+F41nkDRk+NajdlJtwY+TCy2eXf1M6I=;
  b=mB0C+Yt8g/zsqCnteAs9AR7qISegGn021ljKNfRdKdTVydP/0sm+3URq
   mw6TO5E2VoOA7fXajI444One8YZTI57Sacr5oi2grhZrewMq32wm90ntb
   ZsmGD9UagOg+5U9acSsJDkE7EAC6PImyfVzt9oftBcguHnZnv1b5o4yTS
   lMkpuD/RWN0aejJr0KYp2Cu5J8C7KHNI5UKyhV653xBf8qXuo+O1ZRN2u
   qlGSdJyHKfE7sQLTwqLXlcxIWAtIsL9NCJ9NJMi8AOjNVo55oH7Y7iemH
   KPS9sVvHt8fsNB7isWUdoWW9GcM92oIqYBhyZ+Mw7LNmN99POlsel7RT9
   A==;
X-CSE-ConnectionGUID: v814JCdGSdySJMv/RHtkrQ==
X-CSE-MsgGUID: kRGNGzfQRfm6rCU4hu+yXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92740032"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92740032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:39:55 -0700
X-CSE-ConnectionGUID: jJBI3zL9TXC7+Zlz+XZ9xA==
X-CSE-MsgGUID: xGF2itB3Sk+foPZOdwPqJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271030238"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:39:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 14:39:45 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: Mario.Limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH v5 3/4] platform/x86/amd/hsmp: Add ACPI client support
 for Family 1Ah
In-Reply-To: <20260901045134.2833282-4-muralidhara.mk@amd.com>
Message-ID: <f22e907f-254d-032a-0350-7f0bb42c0a18@linux.intel.com>
References: <20260901045134.2833282-1-muralidhara.mk@amd.com> <20260901045134.2833282-4-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Sep 2026, Muralidhara M K wrote:

> The ACPI HSMP device (HID AMDI0097) on the Family 1Ah client platforms
> (Models 80h-8Fh and E0h-E3h) describes its mailbox the same way server
> platforms already do, via _CRS/_DSD, so hsmp_parse_acpi_table() and
> hsmp_get_uid() need no client-specific handling.
> 
> Client platforms don't report a server protocol version, so also gate
> the metric table DRAM base lookup on is_client_platform() alongside
> the existing proto_ver check, so client platforms get their metric
> table base initialized too.
> 
> hsmp_pdev->proto_ver holds the Ryzen Master SMC interface version on
> client platforms, a separate numbering space from the server protocol
> versions in enum hsmp_proto_versions, so gate on it using its own
> RYZEN_MASTER_PROTO_VER1 rather than assuming every client platform is
> ready for the metric table lookup regardless of interface version.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  arch/x86/include/uapi/asm/amd_hsmp.h | 9 +++++++++
>  drivers/platform/x86/amd/hsmp/acpi.c | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 00ca7855ca00..3e1b7cbe0f04 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -95,6 +95,15 @@ enum hsmp_proto_versions {
>  	HSMP_PROTO_VER7
>  };
>  
> +/*
> + * The Ryzen Master SMC interface versions its own way, reported by
> + * HSMP_CLIENT_GET_INTERFACE_VER. It is a separate numbering space from
> + * enum hsmp_proto_versions above, which only applies to the server set.
> + */
> +enum ryzen_master_proto_versions {
> +	RYZEN_MASTER_PROTO_VER1 = 1,
> +};
> +
>  struct hsmp_msg_desc {
>  	int num_args;
>  	int response_sz;
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 8257cd1da48e..43d746546536 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -557,7 +557,8 @@ static int init_acpi(struct device *dev)
>  		return ret;
>  	}
>  
> -	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
> +	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
> +	    hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>  		ret = hsmp_get_tbl_dram_base(sock_ind);
>  		if (ret)
>  			dev_info(dev, "Failed to init metric table\n");
> 

Somehow it feels like the patches are in wrong order if you add this 
condition last in the series?

I didn't spend my time on figuring every out but the key question is if 
one builds kernel with only patches 1 or 1+2 applied, does something break 
which is fixed only after this patch 3 is applied?

-- 
 i.

