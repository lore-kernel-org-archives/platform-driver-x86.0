Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E665280CE5;
	Tue, 31 Mar 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774961180; cv=none; b=RFE4jH1aD7ZooyC7ibbOZTVdYghM2f224XCzLh0JyVaq6EDMjU4JlV7zqdG7u2UHHjuOOf2GmJ1KGct6JC6lzpiyU4yxPW7uiQdH12/aOuU2+6Wy6+qj8PMiRbuxD2+yPqsKYBAe3DwIoAAU5GY/ZEEZgYqwUM90UOUf9YvWkHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774961180; c=relaxed/simple;
	bh=UatKZ44Qi986FG34XgHLVFr5sSKGa8AnswlVE0Qxli0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UeFzf9aKVj5xGcU3HVJXN5iKyC/ilNAUxixfMBsR0qrE6+pdmX3zCPkMAAL7WcOrRnG7dASS4kTu193LHL8iFhwGUd5aM29oMbSjGgKGfKLOoJ6Kn5tCHQL9LanQ0mY2yF1gybvL82YAclFksjr2Lz9y/AaPdYhoO9JHD8StaXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7Jbf2hn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7Jbf2hn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774961179; x=1806497179;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UatKZ44Qi986FG34XgHLVFr5sSKGa8AnswlVE0Qxli0=;
  b=J7Jbf2hn9e+X4h6wy2BHtBqak+ggzq74LuXfY+ZipKZb2aq7oBsiL/5H
   n44pwnFG+fTneIBCjNM/q3NeEVTLiKYEQxZAprb77jKKIFy918O2+i+2T
   XemNtRivfaUrtf/Nrp00Djqm6ZK1upFcMONcksn/upCaqcMQa4C2OD4AF
   dSjH4YiHd3mRZIu5Wi9bmzCAoGuQBjvt5uUBtY1EFtWq32MOXcj+nhAgv
   6kJZSLswL+4BHY3JldHgyTbvk7Cu+Qbq3kOSLINLaGLRjeakMXZIjojMd
   HVM3xJ+h3WzjQaBfxzWRG5rQ5RlkSG6I1hKJY0u6PCVN+TuS5O2fvX1ry
   A==;
X-CSE-ConnectionGUID: XMMEA/EeQ9Ok8glShIqoCw==
X-CSE-MsgGUID: ppQTmVZZQMORMzC40QCtFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78565410"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="78565410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 05:46:19 -0700
X-CSE-ConnectionGUID: YnG1Th/2S2GsCPAKWgHgEw==
X-CSE-MsgGUID: hC/lTYVZTYuMn1NkdEik4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226606814"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 05:46:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 15:46:11 +0300 (EEST)
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
    Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Clean up security buffer
 helpers
In-Reply-To: <20260309211811.82403-3-thorsten.blum@linux.dev>
Message-ID: <ec9be8c3-6946-5edb-0879-53b150c95ddb@linux.intel.com>
References: <20260309211811.82403-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Mar 2026, Thorsten Blum wrote:

> In calculate_security_buffer(), call strlen() once and use ALIGN() to
> round up to an even size.
> 
> In populate_security_buffer(), also avoid recomputing strlen(), rename
> the u32 pointer from 'seclen' to 'seclenp' to avoid confusion with the
> new length variable, and drop the memcpy() guard since calling it with
> size 0 is a no-op and therefore safe.
> 
> Use 'const char *' for the read-only source string in both helpers.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  4 ++--
>  .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++-----------
>  2 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> index 817ee7ba07ca..5278a93fdaf7 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> @@ -189,8 +189,8 @@ void exit_bios_attr_set_interface(void);
>  int init_bios_attr_set_interface(void);
>  int map_wmi_error(int error_code);
>  size_t calculate_string_buffer(const char *str);
> -size_t calculate_security_buffer(char *authentication);
> -void populate_security_buffer(char *buffer, char *authentication);
> +size_t calculate_security_buffer(const char *authentication);
> +void populate_security_buffer(char *buffer, const char *authentication);
>  ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const char *str);
>  int set_new_password(const char *password_type, const char *new);
>  int init_bios_attr_pass_interface(void);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 9dddab6c9397..aba9ef2cfc03 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -72,13 +72,9 @@ size_t calculate_string_buffer(const char *str)
>   *
>   * Currently only supported type is Admin password
>   */
> -size_t calculate_security_buffer(char *authentication)
> +size_t calculate_security_buffer(const char *authentication)
>  {
> -	if (strlen(authentication) > 0) {
> -		return (sizeof(u32) * 2) + strlen(authentication) +
> -			strlen(authentication) % 2;
> -	}
> -	return sizeof(u32) * 2;
> +	return sizeof(u32) * 2 + ALIGN(strlen(authentication), 2);

You need to add an include for ALIGN().

Also header for strlen() is missing (a pre-existing problem).

>  }
>  
>  /**
> @@ -88,18 +84,18 @@ size_t calculate_security_buffer(char *authentication)
>   *
>   * Currently only supported type is PLAIN TEXT
>   */
> -void populate_security_buffer(char *buffer, char *authentication)
> +void populate_security_buffer(char *buffer, const char *authentication)
>  {
> +	size_t seclen = strlen(authentication);
>  	char *auth = buffer + sizeof(u32) * 2;
>  	u32 *sectype = (u32 *) buffer;
> -	u32 *seclen = sectype + 1;
> +	u32 *seclenp = sectype + 1;
> -	*sectype = strlen(authentication) > 0 ? 1 : 0;
> -	*seclen = strlen(authentication);
> +	*sectype = !!seclen;
> +	*seclenp = seclen;
>  
>  	/* plain text */
> -	if (strlen(authentication) > 0)
> -		memcpy(auth, authentication, *seclen);
> +	memcpy(auth, authentication, seclen);

Logicwise this change seem fine to me but I wonder why is buffer char *
(again, this is a pre-existing problem). It seems u8 * would be more 
appropriate given how it's handled here as something else than characters.


Also, you don't need resend if your patch is still listed in the 
patchwork, it's not lost as long as it remains in patchwork and I'll 
eventually get to it.

-- 
 i.

