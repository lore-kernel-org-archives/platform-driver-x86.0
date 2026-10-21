Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584045;
	b=wqiGVbWJNlykZxqpAofvPVpD2RMlYBkM5jdg/iIwHQDkGUC91Li6immCzq8r0EeCXo9q
	 yA9cKxcAuCIE1DnhXgrQusMOb1tYWK0VbiMumLeRRF7M21AadPdFDlm52vW2fv/7ixROE
	 MrBUfE0fNKwVqDS6F4vl4k0+XAE86JUGR3CbcubeHhjkzDI/o/aPQQJ7f9paMFQFPFXoB
	 Sz4ZYda566E60CaaDjfPlxf6sIfTorHcmbDIylyekDOXhoyLiwdA9jpvhZ0W3xzSnrDeK
	 RwawpYrcxSGrz+y/CHhsoRwDxWCQGD9D6f85Pa4pgYzgR/j/Y5A+eaHyueDZLVrLOGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584045;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=GijDKIg6+YQwhOM1aVtGK73ODuAc1p3aor+nkI5Oh9Q=;
	b=3/xHXL3DBx5AJrTOc9PsjMtWUZTKzDVHwmmQk0DhMfJLZDEhOyDzukqfnHN0QmyFZ6MQ
	 iQAea8YRy2NXED9N+W5zUy60B/rN1jlsEsLTBc05VW6amYbjWgLSOTs2ikS9Jgaahr90L
	 gDgWYyNC4yNxSY7aNZcFr7FZEwwYU44VMNv5HhS/4PUm69HeE3DDRRpD4zKdAWamzKDyw
	 aR7Dkbe92ja7I0bLM1QzBKZP5NgUM6jekySYLHcHkPKnsOy6wKv9Gd9XNLGfYxiOgN/7E
	 7l7wPsp+531U6JRffcOZiiDylSwXpdRpP85ykDBZT2oPmCYmsdv5qshHU1OcOQqA57Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ks70ZiSM;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B81606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B81606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ks70ZiSM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792584045; x=1824120045;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LQ2Y0aGdMwHwHXdEShhXEvcnX8EcPNXuSXXLPsl6nxo=;
  b=ks70ZiSMhWdWuodofN+paDFLwI446BsQDsLqJdqAuWU5X3yjM0zx95RC
   qiTsAVbdkRMZLNf3LT09xZc1usJyLKJPX1xIxmje9Kh9tqP7ahtzf/nU2
   EV2HFvh9Wa2jh1la0Ux1kqqm90j8IQoNw/xElvqCktg9KvjhGMCSkc7ae
   xBGQjMFWEMRr0eCY5B1iqiQfBcROTquQm6tynsbJ0WkAq2A6IdAhlCCXw
   LE7ZNTj1QOC3z9pzbdqNiCjcgMdmbOHNNeM1WrVrMzI85s7L7r682UeNQ
   eU6LqTADGOcbu3z/3JdktiykXuxyyGUfCeT+aRZHUQvu0+YwKg7XBwri9
   g==;
X-CSE-ConnectionGUID: /seUiMYtQCCWq5ar8QH/4w==
X-CSE-MsgGUID: bBjbCagvQkCOlUBP7zo3/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1317685"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1317685"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:00:33 -0700
X-CSE-ConnectionGUID: vipvxv31RRa7E/VqQSyvVw==
X-CSE-MsgGUID: LOCyyLE6SpSQ0t91aItT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4906561"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:00:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 15:00:25 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH 4/8] platform/x86/amd/pmf: Get policy binary signature
 size from PSP header
In-Reply-To: <20261011100554.1841309-5-Shyam-sundar.S-k@amd.com>
Message-ID: <d376fc11-21f4-7965-d763-49834863e3d8@linux.intel.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com> <20261011100554.1841309-5-Shyam-sundar.S-k@amd.com>
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

On Sun, 11 Oct 2026, Shyam Sundar S K wrote:

> The policy binary size is calculated as the payload length plus a fixed
> 512 bytes, which assumes a 256 byte PSP header and a 256 byte RSA2K
> signature. Newer policy binaries can be signed with RSA4K, which has a
> 512 byte signature.
> 
> Read the signature algorithm from the PSP header and use it to get the
> signature size. Check that the buffer is large enough before reading
> the header field, and that the size calculation does not overflow.
> 
> Policy binaries with an unknown signature algorithm are now rejected.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  8 +++++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 34 +++++++++++++++++++++++++--
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index d9fa99c2750f..86999802602c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -29,6 +29,14 @@
>  #define POLICY_SIGN_COOKIE		0x31535024
>  #define POLICY_COOKIE_OFFSET		0x10
>  
> +/* Policy binary PSP header */
> +#define POLICY_PSP_HEADER_SIZE		256
> +#define POLICY_PSP_SIG_ALG_OFFSET	0x34
> +#define POLICY_PSP_SIG_ALG_RSA2K	0
> +#define POLICY_PSP_SIG_ALG_RSA4K	2
> +#define POLICY_PSP_SIG_SIZE_RSA2K	256
> +#define POLICY_PSP_SIG_SIZE_RSA4K	512

SZ_* x3

-- 
 i.

> +
>  /* List of supported CPU ids */
>  #define AMD_CPU_ID_RMB                  0x14b5
>  #define AMD_CPU_ID_PS                   0x14e8
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index e145eb7b03cd..9b328be1e8f4 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -11,7 +11,9 @@
>  #include <linux/array_size.h>
>  #include <linux/debugfs.h>
>  #include <linux/dev_printk.h>
> +#include <linux/overflow.h>
>  #include <linux/tee_drv.h>
> +#include <linux/unaligned.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
>  
> @@ -327,9 +329,32 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
>  	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
>  }
>  
> +static int amd_pmf_get_pb_sig_size(struct amd_pmf_dev *dev, u32 *sig_size)
> +{
> +	u32 sig_alg;
> +
> +	if (dev->policy_sz < POLICY_PSP_SIG_ALG_OFFSET + sizeof(sig_alg))
> +		return -EINVAL;
> +
> +	sig_alg = get_unaligned_le32(dev->policy_buf + POLICY_PSP_SIG_ALG_OFFSET);
> +
> +	switch (sig_alg) {
> +	case POLICY_PSP_SIG_ALG_RSA2K:
> +		*sig_size = POLICY_PSP_SIG_SIZE_RSA2K;
> +		return 0;
> +	case POLICY_PSP_SIG_ALG_RSA4K:
> +		*sig_size = POLICY_PSP_SIG_SIZE_RSA4K;
> +		return 0;
> +	default:
> +		dev_dbg(dev->dev, "Unknown PSP signature algorithm: %u\n", sig_alg);
> +		return -EINVAL;
> +	}
> +}
> +
>  int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  {
>  	struct cookie_header *header;
> +	u32 sig_size, total_sz;
>  	int res;
>  
>  	if (dev->policy_sz < POLICY_COOKIE_OFFSET + sizeof(*header))
> @@ -342,11 +367,16 @@ int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  		return -EINVAL;
>  	}
>  
> -	if (dev->policy_sz < header->length + 512)
> +	res = amd_pmf_get_pb_sig_size(dev, &sig_size);
> +	if (res)
> +		return res;
> +
> +	if (check_add_overflow(header->length, POLICY_PSP_HEADER_SIZE + sig_size, &total_sz) ||
> +	    dev->policy_sz < total_sz)
>  		return -EINVAL;
>  
>  	/* Update the actual length */
> -	dev->policy_sz = header->length + 512;
> +	dev->policy_sz = total_sz;
>  	res = dev->ta_ops->invoke_init(dev);
>  	if (res == TA_PMF_TYPE_SUCCESS) {
>  		/* Now its safe to announce that smart pc is enabled */
> 

