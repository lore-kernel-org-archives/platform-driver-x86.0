Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529536B076;
	Wed,  6 May 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068435; cv=none; b=pAi0jh3vV+RcNrlkVgE+dxIdhzAcMp42Ar/+TDRg4hkFJCqrDaf9xwvwdZh8YTRXt6DCPbeqsyUeaoYL1x0BBHDv4VuD+YWreJeH0ZGh35BecNiNJ/eTmLFiB9VaCwkCENMEoL5bQiJJ6fdDwAdL/IkmUwfiPcJfbe/zTVzzK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068435; c=relaxed/simple;
	bh=M/4A6rdGu/tfUpbXwgcMwIPK51FD0r6FLHNKZP+Tcxc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gTpty5VTPlX0aftzMXrAsUFPhTz17npXqiKUlyK9nlSWBWqC81rxJhi3cjAP6oT0RfpOYWc1wWXnr99Qzrr71/q+saNr3i8gE6aVd3RpEokJBbfxdD+yd/ZAcbQZA/URvsa4OMc3yZJ0gVdoLn1qd+zTF4umT6PQL6hDDBDmkvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVqJeKXX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVqJeKXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778068433; x=1809604433;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M/4A6rdGu/tfUpbXwgcMwIPK51FD0r6FLHNKZP+Tcxc=;
  b=mVqJeKXXJO/p+idGl4LLpLR/3u9hxllWGNQoZYeU9ArOfpYqNg5MwIQr
   YyNXAHf67g/bRV53pqRW487BCITnPSfOwlaamScoRhxezLT0gAIB7KWo2
   UjBv+ln5eta8vSX2DfWSjzA5+EDu7zfZqlJukHgthI6O3egn72wyp7yBO
   sBu8MSd6oyeP3mhOh/M8k0Ol9CLX7FVfC5a5aI4jzmFRH31sFe82/Qhyk
   +oMa9ebquG3u2eyi81jp6UE9R4FopTV4Le7Qw949dRJdivZH03d0R4VMZ
   7rsk2cL/VZ4UlGLiDpkE+tbnKLf7XAKf7QaPxVuM8aPzncpJtwzGwUO4o
   w==;
X-CSE-ConnectionGUID: F192n629QfyBYFC/Bp72DA==
X-CSE-MsgGUID: GWKWWM2rQQ2j/zUBIwsD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78019737"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78019737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:53:53 -0700
X-CSE-ConnectionGUID: USLnNDY/R4quphkMD/PBPw==
X-CSE-MsgGUID: H6tVOTUYQVWfQ9Ev3prDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="236365396"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:53:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 May 2026 14:53:46 +0300 (EEST)
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
    Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: use strnlen in
 strlcpy_attr
In-Reply-To: <20260502165707.242332-3-thorsten.blum@linux.dev>
Message-ID: <fcff1484-24b6-ce49-bb5e-f7da3e711eea@linux.intel.com>
References: <20260502165707.242332-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 May 2026, Thorsten Blum wrote:

> Use strnlen() to limit source string scanning to MAX_BUFF bytes. Return
> early on error and make the "empty string means not applicable" case
> explicit.
> 
> Use 'const char *' for the read-only source string while at it.

Hi Thorsten,

First of all, thanks for looking into these.

> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  2 +-
>  .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++++---------
>  2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> index 5278a93fdaf7..f6943301b857 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> @@ -162,7 +162,7 @@ static ssize_t curr_val##_store(struct kobject *kobj,				\
>  
>  union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
>  int get_instance_count(const char *guid_string);
> -void strlcpy_attr(char *dest, char *src);
> +void strlcpy_attr(char *dest, const char *src);
>  
>  int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
>  			struct kobject *attr_name_kobj, u32 enum_property_count);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 51d25fdc1389..6c9911accefc 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -234,18 +234,20 @@ static const struct kobj_type attr_name_ktype = {
>   * @dest: Where to copy the string to
>   * @src: Where to copy the string from
>   */
> -void strlcpy_attr(char *dest, char *src)
> +void strlcpy_attr(char *dest, const char *src)
>  {
> -	size_t len = strlen(src) + 1;
> +	size_t len = strnlen(src, MAX_BUFF);
>  
> -	if (len > 1 && len <= MAX_BUFF)
> -		strscpy(dest, src, len);
> -
> -	/*len can be zero because any property not-applicable to attribute can
> -	 * be empty so check only for too long buffers and log error
> -	 */
> -	if (len > MAX_BUFF)
> +	if (len == MAX_BUFF) {
>  		pr_err("Source string returned from BIOS is out of bound!\n");
> +		return;
> +	}
> +
> +	/* Empty string means "not applicable" and is skipped intentionally. */
> +	if (len == 0)
> +		return;
> +
> +	strscpy(dest, src, len + 1);

And how exactly is this last line different from strscpy(dest, serc, 
MAX_BUFF);

?

I agree something should be done here but I don't like this approach. The 
length passed to strscpy() should be "Size of the destination buffer" but 
your approach calculated the length of the source string (?!):

/**
 * strscpy - Copy a C-string into a sized buffer
 * @dst: Where to copy the string to
 * @src: Where to copy the string from
 * @...: Size of destination buffer (optional)

So, to make it safe and sound logically, to me it looks more like the 
_caller_ should pass the output buffer's size to this function. Or 
alternatively, this function could be wrapped with a macro such that the 
sizeof(*dest) can still be checked to be of correct length.

Also, this function presents itself with str*() name like a generic string 
copy function but what it really is more attr_check_and_copy(), it might 
not copy anything if the checks fail.


-- 
 i.

