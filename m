Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583687;
	b=qwQY3qgDVwBSBBAfOli3H1L8f+T+LTG0QsLQM6itscphPdbgOCCkzxUMAjcWa1x3dT+k
	 U/D1HxzJsHi5DaV/KAwsqNsFiK9rKqlvD6nkCsu+G+s8ofYnuweevvTjrNTBlIgepgu3s
	 /kaXG//KYUFhTIlCPnAeaApd4Ct8Ec5LGf4s0d6sXbKhylnYV/dgVxWtZ1SyEWV9vbjFL
	 38awQPz14ZxOL/NhY2QL38nSwkcPx/qENxVVN7D2oTw2rk6v199OC8aZHcLiy48GRhL7Z
	 7YrQIeLDOMS+i5/FXeLqeTEzc3xkWHKYW1EW6eSgKLXR7oqrf18s9YVvcgvRy/dClnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583687;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=ouUdvDhOM7UUGEfcBdf1kf7oQeFJRtzvzpcnbUGcHow=;
	b=jQzPQe4dwb0+LFyyToMin+uBsxAXrcY+tK96z25m3cUINtPM+Nh01DjZR7FtLm9C9fpZ
	 w/twicKzjoCVZwwd0tbWzhPH6RNBe2WnxhhWXTuQOxBB8uCMe7olLNw1qe2hx1emMRZo3
	 QuqN2hfqt0CAxYbj18QLe/9ek1HNuI3w6I8MKcw8vu/ZkunVjFWJnywLQaEjVn+B6Swbe
	 757UPz7hd2nEbO4Yq8sOMuqlUidYxyTgOOF5ti3Z36zVA6NJLkmUqY9tF2pP/pVwgjNY0
	 M+vg0gP4H3YInjWEjThGYryNY0zjRo4C68OCda+76pEGe1ksTOPFlSsH6kagN1soZBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lxyukLs3;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FCB606A319
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 11:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FCB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lxyukLs3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792583686; x=1824119686;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/e0QBgUijU04yqhihSiTZunMvklS6RSLd8GA1/FuRbo=;
  b=lxyukLs3M4peQOZ1AXdHq5LjS0WA28aCZHffYlm7L51XYyNciRs9iVWE
   n5zed3HjwYhy6ZeqxDaeJEpf3RTcFHidtbi2UBBIC/Wtaxy8pi62p5ci3
   iprFVQJzywMRN/kJROtBpZ2aQDnVkI/Yj93zgjaCpaJbA2vM258Qe/jmG
   vQ19CWngxa65MtoUUTpsjyef91RPMceIJu0pAxezatG9frARJQ1l5xc0j
   IFCh5Idf4yDnqQ46H1nhQy0NI6QZe4pFYpzLW8j3s8Ok8ErN902kx99xA
   jzRz630q6xy6j030eJOylwlGT9eKLKAK3gSLtablTaImBwJ3yPqt4PqHF
   A==;
X-CSE-ConnectionGUID: 0M2+WKI7S8K7reSG86PHDA==
X-CSE-MsgGUID: 4B2aTht4Ql+WqNADeUvaMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1184891"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1184891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:54:46 -0700
X-CSE-ConnectionGUID: 2Emyz9tIRO2MytxvBFO5iw==
X-CSE-MsgGUID: vhDRWDx/QYGU84t6aPBx+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="2992610"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:54:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 14:54:38 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, W_Armin@gmx.de, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 2/3] platform/x86/amd/wmi: aod: Add debugfs interface
 for raw WMI access
In-Reply-To: <20261010190543.563161-3-Shyam-sundar.S-k@amd.com>
Message-ID: <b0453cc2-bd88-f420-7e82-c8bdd04610f3@linux.intel.com>
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com> <20261010190543.563161-3-Shyam-sundar.S-k@amd.com>
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

> The AOD firmware supports many more commands than the ones exposed
> through sysfs, and the set of commands differs between platforms. For
> debugging and platform bring-up it is useful to have direct access to
> the WMI methods.
> 
> Add debugfs files to list the supported commands, query the range of a
> command and execute a command. This interface is not a stable ABI and is
> only accessible by root.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/wmi/aod.c | 320 ++++++++++++++++++++++++++++-
>  1 file changed, 316 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/amd/wmi/aod.c
> index c64a02b5d379..b7331930f4c3 100644
> --- a/drivers/platform/x86/amd/wmi/aod.c
> +++ b/drivers/platform/x86/amd/wmi/aod.c
> @@ -8,20 +8,27 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/align.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler_attributes.h>
>  #include <linux/container_of.h>
> +#include <linux/debugfs.h>
>  #include <linux/dev_printk.h>
>  #include <linux/device.h>
>  #include <linux/device/devres.h>
> +#include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/fs.h>
>  #include <linux/gfp_types.h>
>  #include <linux/kobject.h>
>  #include <linux/kstrtox.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/seq_file.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <linux/sprintf.h>
>  #include <linux/string.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> @@ -49,11 +56,15 @@
>  #define AOD_CMD_EDC_LIMIT		0x00050003
>  
>  #define AOD_MAX_OID_COUNT		64
> +#define AOD_OID_STRING_LEN		64
>  #define AOD_DVALUES_COUNT		100
>  
>  /* Property flag of a command: discrete values or a linear range */
>  #define AOD_PROPERTY_LINEAR		1
>  
> +/* WMI strings are aligned on a 2-byte boundary inside WMI buffers */
> +#define AOD_WMI_STRING_ALIGN		2
> +
>  #define to_amd_aod_attr(_attr)	container_of(_attr, struct amd_aod_attr, dev_attr)
>  
>  #define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _scale)	\
> @@ -103,6 +114,7 @@ struct amd_aod_oid_package {
>  	u32 length;
>  	u32 id[AOD_MAX_OID_COUNT];
>  	u32 property[AOD_MAX_OID_COUNT];
> +	char id_string[AOD_MAX_OID_COUNT][AOD_OID_STRING_LEN];
>  } __packed;
>  
>  enum amd_aod_setting {
> @@ -126,6 +138,10 @@ struct amd_aod_data {
>  	struct mutex lock;	/* Serializes WMI calls and protects the fields below */
>  	bool supported[AOD_SETTING_MAX];
>  	bool linear[AOD_SETTING_MAX];
> +	u32 dvalues_cmd_id;
> +	u32 stepping_cmd_id;
> +	u32 run_command_status;
> +	bool run_command_status_valid;
>  };
>  
>  struct amd_aod_attr {
> @@ -199,8 +215,35 @@ static void amd_aod_parse_object_id(const struct wmi_buffer *out,
>  	}
>  }
>  
> +static int amd_aod_parse_names(const struct wmi_buffer *out, struct amd_aod_oid_package *pkg)
> +{
> +	const struct wmi_string *str;
> +	size_t offset;
> +	int ret, i;
> +
> +	offset = sizeof(struct amd_aod_oid_result);
> +	for (i = 0; i < pkg->length; i++) {
> +		offset = ALIGN(offset, AOD_WMI_STRING_ALIGN);
> +		if (out->length < offset + sizeof(*str))
> +			return -EPROTO;
> +
> +		str = out->data + offset;
> +		offset += sizeof(*str) + le16_to_cpu(str->length);
> +		if (out->length < offset)
> +			return -EPROTO;
> +
> +		ret = wmi_string_to_utf8s(str, (u8 *)pkg->id_string[i],
> +					  sizeof(pkg->id_string[i]));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* The command names are only decoded when requested, the driver itself does not use them */
>  static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
> -				 struct amd_aod_oid_package *pkg)
> +				 struct amd_aod_oid_package *pkg, bool names)
>  {
>  	struct wmi_buffer out;
>  	int ret;
> @@ -210,9 +253,12 @@ static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
>  		return ret;
>  
>  	amd_aod_parse_object_id(&out, pkg);
> +	if (names)
> +		ret = amd_aod_parse_names(&out, pkg);
> +
>  	kfree(out.data);

You should have used __free() right from patch 1 so you could have 
returned immediately.

>  
> -	return 0;
> +	return ret;
>  }

-- 
 i.
