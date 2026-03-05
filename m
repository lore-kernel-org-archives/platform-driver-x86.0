Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329191F91F6;
	Thu,  5 Mar 2026 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714910; cv=none; b=N8RM1DPjGRst0AFbcqALKrp4lF9P4rZOhquOkgf0ftoAAjczKCK/9gQrrZ8WXy1XCel+71uVUX05CY3GpgmMjcMVuo+F41dhnhtN/IwtDdq+9S1jI1vldOdUG/iY6HitRyzuU4ZGWCipLJcvk3jfasTlSNB2FF91pHUMtV7+658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714910; c=relaxed/simple;
	bh=ogmOaDVJXwzgSXzPel+vUu/em4qMamAGr750RLhn4yg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uPjdyl6Y4aV+9FcOJp67W0RXRefRCztEMrYzkBcmZ+U1oV+uA0R6QubLHaF+Y4ZNT1wrHDqnywRaodVM+JuzCnL0YXAu2JKrxdYPJhJjCqKjlru0J0iG5INUboV/96FR/q+TqpeNqlk6Ri1IoCgkpikxeFU8Ld299RZaVt6sp9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5f2ox3r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5f2ox3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772714909; x=1804250909;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ogmOaDVJXwzgSXzPel+vUu/em4qMamAGr750RLhn4yg=;
  b=h5f2ox3rD4eYlkV9ryz7VATCyqN0ypFb43nP2Fq2nFe0c6TIo01NtBOJ
   qe4R7lH6KccW2uT5CAliuodmTCpMAR0xIzICFJp9XPJAMVbq1a992J3j8
   AUl80UMw/1VXv433eWE+cAcn4swVi/cNl3uC3e2iiTjTb01gLG27EkGhj
   krub/cwXvp+tWdZxMNttUGejSWotWJdgR261fb3ows1/7UpiVDDFHb63u
   4sh/xtJE6c72Z/uDgCsHlXB/oTIwmuqCaJnZ3mJ5olghm4IymnZJhss1u
   4xrUK6KHaF/SW1Cu3CH6igdxooKwA+5MO+AVbCL/K+zv9CaR/41MNoXYW
   Q==;
X-CSE-ConnectionGUID: WyrjVnKkTXyhmWLjYkr+9g==
X-CSE-MsgGUID: sslSjicARR2OkqY2bq+TRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96416443"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="96416443"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 04:48:28 -0800
X-CSE-ConnectionGUID: 9I+JhX47QDaFxOVip2v9sQ==
X-CSE-MsgGUID: fha9GTU7TkW/HZUlGuQPqA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.93])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 04:48:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 5 Mar 2026 14:48:22 +0200 (EET)
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
    Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Use sysfs_emit{_at} in
 show functions
In-Reply-To: <20260305124126.255026-2-thorsten.blum@linux.dev>
Message-ID: <77f08627-cb28-8c0e-112b-f7ebef5a9a74@linux.intel.com>
References: <20260305124126.255026-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Mar 2026, Thorsten Blum wrote:

> Replace sprintf() with sysfs_emit() and sysfs_emit_at() in sysfs show
> functions. sysfs_emit() and sysfs_emit_at() are preferred for formatting
> sysfs output because they provide safer bounds checking.
> 
> In reset_bios_show(), use sysfs_emit_at() to avoid manual buffer size
> accounting.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  .../platform/x86/dell/dell-wmi-sysman/sysman.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 9dddab6c9397..0f24cecc93fc 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -11,6 +11,7 @@
>  #include <linux/dmi.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/sysfs.h>
>  #include <linux/wmi.h>
>  #include "dell-wmi-sysman.h"
>  #include "../../firmware_attributes_class.h"
> @@ -143,17 +144,14 @@ int map_wmi_error(int error_code)
>   */
>  static ssize_t reset_bios_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>  {
> -	char *start = buf;
> +	ssize_t len = 0;
>  	int i;
>  
> -	for (i = 0; i < MAX_TYPES; i++) {
> -		if (i == reset_option)
> -			buf += sprintf(buf, "[%s] ", reset_types[i]);
> -		else
> -			buf += sprintf(buf, "%s ", reset_types[i]);
> -	}
> -	buf += sprintf(buf, "\n");
> -	return buf-start;
> +	for (i = 0; i < MAX_TYPES; i++)
> +		len += sysfs_emit_at(buf, len, i == reset_option ? "[%s] " : "%s ",

Are all checkers okay with this construct? IIRC something doesn't 
like having such logic in where only a formatting string is expected.

--
 i.

> +				     reset_types[i]);
> +	len += sysfs_emit_at(buf, len, "\n");
> +	return len;
>  }
>  
>  /**
> @@ -194,7 +192,7 @@ static ssize_t reset_bios_store(struct kobject *kobj,
>  static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
>  				   char *buf)
>  {
> -	return sprintf(buf, "%d\n", wmi_priv.pending_changes);
> +	return sysfs_emit(buf, "%d\n", wmi_priv.pending_changes);
>  }
>  
>  static struct kobj_attribute reset_bios = __ATTR_RW(reset_bios);
> 
