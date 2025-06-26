Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3E535975
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jun 2025 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955522; cv=none; b=SCv5hwzGpFanixTh6kOfZ8hpCarpp0Ob5Z/fH1W2syVdb+EdU2bKWnx7aZAxMJ4auQldqFJ4jh8NAW0lRyLqUQLnHtejCLOiAxh5SzAuanUFhsq+U39el8wkkanP8UqnPnLuUz9LHpvHj55ndy4+e0Ywzn5Fv3gLxGZuiudVXM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955522; c=relaxed/simple;
	bh=UGFHL46cfd/oqqfbyV4YuMFu1KYIONs7DTp/R8aYo3w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HpqxylD2iyEe37Z9lb0W2xQcUigAzR55EqOuiC0/XW3RUGB4G5wjvPsihaFc+IJIDHXpjkR70XS7GEQ6+IKnQgYgIJG0NAKSXw3Bu+vIBLeHwZm8mN26aQpaf0DD+xIKgy8Lqeodbjhg0Svg9smcmkyjOvke/Bd81qiLq0Nsxo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaBozyhW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaBozyhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750955520; x=1782491520;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UGFHL46cfd/oqqfbyV4YuMFu1KYIONs7DTp/R8aYo3w=;
  b=SaBozyhWCon+Zm6tEN/txtZaiQ3shCOdDq0CNsAhSAkMhZkOrAmihL/Z
   tVqOueG/eVSiOGw8cUQmIcGfaTiRrEtiGCeu8FMh1R7v0fADHJLnZHDjr
   m78uHo1Qs1x+nA8za4B9JRB+KjUKUhEMPQoCJGK81P4dENbHeIXZU8fft
   FCglB9xN1A7vaKaMV5k2CIylWYFf8lS8Gb1ezOzYn0EZW0rtgg80FR6OJ
   gQixCc2B2FfuNVmRfMdYeq+2E9dtpveB40YnvgWez+itRVqnoIKI8rd4q
   CnqgXhrG3zdrVVnc74/bSrJZr+B+yrMYed/3nncPwoKR7/Dsp1f6Syez0
   Q==;
X-CSE-ConnectionGUID: mnYZGe+5TJKFfUDjSqQyOQ==
X-CSE-MsgGUID: FmhilJ13Q8SbkhOkZSPDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78695462"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="78695462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:31:59 -0700
X-CSE-ConnectionGUID: 5NL1MGwmTfO5BwInB2HJqQ==
X-CSE-MsgGUID: Gg/JPO6bR/Ow2xSTCcV4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="151978494"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:31:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Jun 2025 19:31:54 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Use guard mutex to synchronize
 probe
In-Reply-To: <20250625100216.1462594-1-suma.hegde@amd.com>
Message-ID: <ada3eca0-4c86-c3ee-816c-a3635b4ad110@linux.intel.com>
References: <20250625100216.1462594-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jun 2025, Suma Hegde wrote:

In the shortlog, drop word "guard". This should also mention ACPI as the 
legacy probe is not affected.

> When async probing is used, 2 hsmp_acpi_probe() calls can race and
> make a mess of things.

Too vague wording.

> So, add guard mutex to synchronize them.
>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 2f1faa82d13e..ab2b65f16d1d 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -15,11 +15,13 @@
>  #include <linux/array_size.h>
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
> @@ -44,6 +46,8 @@ struct hsmp_sys_attr {
>  	u32 msg_id;
>  };
>  
> +static DEFINE_MUTEX(hsmp_lock);
> +
>  static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  			      u32 *value, bool write)
>  {
> @@ -585,6 +589,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
>  
> +	guard(mutex)(&hsmp_lock);
> +
>  	if (!hsmp_pdev->is_probed) {
>  		hsmp_pdev->num_sockets = amd_num_nodes();
>  		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)

So is it just the ->sock alloc and misc dev registration that require
protection? (The latter doesn't even seem to require that if a local 
variable carries that information over.)

-- 
 i.

