Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580850;
	b=ZodPXTORsPkLQ979kPw3BJjHWS33bSL7sQ5gGckAp/homN2DLcknWvEMV/AUWrYW/Gpp
	 FQLBxnEY5mCJYNwZVr9925GyJhQrpiefQnaSlCRFSsiyiH3kChBN6s2OLsEszdDWM0J7h
	 W5hC1qvG5CieFMUuS7Q6v7v/sZfFuhJ9ogamgZrgqNMPml68kd5bBYgmHEGjoGKVOz5dD
	 EYyknKJ55UCk1mPZuTNOWHQ/oK4Klq1yby/KUq/3aJ4c+NNkzxnr4t7MjYkRT/UXuVsc9
	 yCwWznRLCbyGSRUZXZX/gOFXTYoR95YOsRGr2HJxuxk4sQYygUUkDL1pV3wQFMG2tsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580850;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=uPOHPepwHYn+MVcCMUEMTnjfdnouuLvn9TnTc4ObIbM=;
	b=0waBgXXZw2IPaN8b6mtyikxYfJpAMbWsz9wGuQ3/UKVpjMtpm0WguVGSl97wenuOaq5W
	 jjtTczYS7iU1X66vDVRhQkbQZPfzsLhdrkFtH5u7qwI1oMHO+Qg0MV2c7oI24Rvl4+Npv
	 qKHt71rmMbAMUyWquQiTnXWBbctjb4hEIyq2ykEO6DNdM9ioQGLYPnR84Di5h+AnMemBg
	 Zm7QxJysiqd7B7cVqXGUlcnNN2q/dVKim4RhzNJtzBmfkEd8+zdQXHvuXGazURfS/bXQW
	 DKQ8cMCcvSA225rk1PlqYFxY/E9kd1SxvoJAc0dPKOkekgGwomIssR1SCfQa4FiojEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gfc7YMPg;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA57606A31B
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 11:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA57606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gfc7YMPg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792580850; x=1824116850;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yXcOjRPEh2vjRYk13XJs+/d9fQaXzPOSaj8YrAwn87Q=;
  b=Gfc7YMPgR7L5Q0MqRjNWt52iqAHDc178wtO82OXppbRLOjJyqKf4fBs+
   zmuz6fqk4XOHrSnAHHD1moFVjloIV3pcfeUcjM9oPUSS7V5Cq8S0a3gao
   AQuUvg6eHWSHEHFEPOtSMlMyyNskNh3bIPOEb24CFLFmPRh75oO+1V/8E
   5dZOAzBCFcH3oGlQGc/M2BpjHDMLqsROQkNis4pYwlAe95pwFGTaxIHxZ
   8HRiQycfo23xd279LdfbqmRXpZpLbMOUj4QTPfHudzAhlQY3tCrResy3o
   dZbj6rjR7w7xvpyq7qPkZJ6fK6NAZX3gnyEPj1Ve0OhMmD0hBn8GZN43i
   Q==;
X-CSE-ConnectionGUID: PuuqeTbYTvONSs2HtXdoEw==
X-CSE-MsgGUID: vjfOj+o4SPi+bZQxPiL3kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1182015"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1182015"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:07:28 -0700
X-CSE-ConnectionGUID: tz67zf/tT56Bk4nC3spDSQ==
X-CSE-MsgGUID: s7ZzL13YTkO3qNaFaKl1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3384394"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:07:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 14:07:19 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, hdegoede@redhat.com, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>, 
    NaveenKrishna.Chatradhi@amd.com, 
    Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: Re: [PATCH 03/11] platform/x86/amd/hsmp: Null-check drvdata in
 hsmp_is_sock_attr_visible()
In-Reply-To: <3cc4005d44f633a427eb3861be8094999ce9e71e.1791446401.git.Suma.Hegde@amd.com>
Message-ID: <f46416a5-2ffc-c530-6f5e-4eee9ae97ff4@linux.intel.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com> <3cc4005d44f633a427eb3861be8094999ce9e71e.1791446401.git.Suma.Hegde@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Oct 2026, Suma Hegde wrote:

> From: Suma Hegde <Suma.Hegde@amd.com>
> 
> dev_get_drvdata() can return NULL if probe failed before setting the
> socket pointer. Check for that before reading sock->proto_ver so the
> sysfs visibility callback cannot NULL-dereference.
> 
> Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 088c44ea1782e..0e412c23c69c8 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -306,6 +306,9 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct hsmp_socket *sock = dev_get_drvdata(dev);
>  
> +	if (!sock)

Please put call and it's error handling next to each other, effectively 
that means moving sock assignment out of the local variable block.

> +		return 0;
> +
>  	if (!is_client_platform() && sock->proto_ver >= HSMP_PROTO_VER6)
>  		return battr->attr.mode;
>  
> 

-- 
 i.

