Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958DF770E5
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jul 2024 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434223; cv=none; b=HMW8GShwUlppNwSea27oVl2JL1ZkzcOjCWBdZxLIBFOmFq9SdlDNmv98UWZpLmprfqVrgA3Dnoc/4kmA6ocNVagCB75Y7cz1eIm131s0bxi01KqUKdWqEkhIMvrUITECLm30xiUGyLhOaVNCQ+AM9VU7GWKvJZle6ykxzM4IHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434223; c=relaxed/simple;
	bh=XqV/Di5G7SwU6dGXn0mOpGZY9prDWe79suagEO/P+ik=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ANVpVvpcmpu8N/1Bu2OAqssfeXLvdtG62lsK0SD3IsE6L82wsj6d8PQz8zgbJHBJFnzdZ/wBIP/IeH7suBypjy59RFAonc64ezAot4Cm0CkXvgBYQIY6RA9AUk6cssbJwGyPPEQcJnZaIohqQVUZXg6afivvl+7CuVSZ1RZ+12U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo4Q2G2G; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo4Q2G2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720434222; x=1751970222;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XqV/Di5G7SwU6dGXn0mOpGZY9prDWe79suagEO/P+ik=;
  b=Qo4Q2G2G3dqbDGAVksgOn9KoAgrIf2CksMECEid8ey95BugtifsOm3wN
   exsr+IUPJ+pB2scKd4dRcAiMEhv30uV0/ALfKrjDVI8VQHlle9yP/0azh
   bnZhWKR7BI1geSw8B6OymrZJvHrc8lWRQPN2uDgiV9kDG4xd6ArseOlnP
   Lc/rvGNfvPkwFvNOFv3Knc57yp0dH5HyBV0KpsqzoweG2mpmmkMC+dCgb
   +ddhachmO8N+jstg4G3nHRyNLxbzJmlngqHYrJ+kHK/4DWZbvuKZ3Mf4h
   LgOxmZjDzGwKIfRTtEiqJJvDOPRTKiMp8fjcxX3L/bDd9ta2NRrDzLtZm
   A==;
X-CSE-ConnectionGUID: 0JCF0MnPS4GNPaSI8Ve0zQ==
X-CSE-MsgGUID: 5XWfNdcRS6unt+crHtyH7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28232312"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="28232312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 03:23:41 -0700
X-CSE-ConnectionGUID: A060CHU0TjSO7K9nYNMTJw==
X-CSE-MsgGUID: yshgb/zHTTOTWy5g/wLxdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47232859"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.115])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 03:23:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jul 2024 13:23:36 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 07/10] platform/x86/amd/hsmp: Use name space while
 exporting module symbols
In-Reply-To: <20240627053958.2533860-8-suma.hegde@amd.com>
Message-ID: <d3f15df2-d903-79a1-38b3-d869f069b61c@linux.intel.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com> <20240627053958.2533860-8-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jun 2024, Suma Hegde wrote:

> hsmp_send_message() is exported with AMD_HSMP name space.
> The other modules who would like to use this symbol,
> need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
> to get away with warning.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 8cad5e813947..4bf598021f4a 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -185,7 +185,7 @@ int hsmp_send_message(struct hsmp_message *msg)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(hsmp_send_message);
> +EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
>  
>  int hsmp_test(u16 sock_ind, u32 value)
>  {
> 

Hmm, there seem to be no in-kernel users of this as you didn't need to do 
any user side import adaptation...

-- 
 i.

