Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432020;
	b=3KrJYotlnzeDEtnzrhe3u/kbeb3OnlIbG9UQtX3VL4O7R9/kziXeR+VJqc/+NEEJ97qB
	 1ICLqWREitKwM0TDZVZqUuNCWMjJokoSYO4R/mqskxiIpLPqPBd1imKR/2rHkx8SarCJR
	 JeLzHYTo0vIvZa6Op1GqDsBkBQJGOAIXVmbuVFU6++hRQwfcOFxlrWqnDENsTaj4vhg6A
	 ntLEfAi4Wz9bbzrAGrpsfDxrR3BdfDCj1Tkzptniw2LdKy7+hAnN223G825/y6FG027FV
	 UuSSUIoNOunlqmLDD/K/Nh5CRZoaTd/IJ/ZtiVM9eeoX5mIvoeZv/w7ovZWNCWWi9XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432020;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=/vixKJEYz+skknbR/3KXhtOcpLmKVux1xBYSIrIHWM8=;
	b=Sv+LiyZEnzGL3ilIVAxz4nfBatZQxEJCc8Gx6qmh7AXp1DMKGmIKRg3CZtTKaZpEcU/B
	 LLgwpPMQT2A9sm6v8WqjkQrNF8avN4nIemZ959O+kgiV542cGYnyaDcnp7PkUkGP6/jl/
	 IyYbqaUspp56mspFK1xAbRk/4w3pLL1u1pGbUT7phHAmgpc9vA4dL0tOtBe1o99J/are6
	 g1SqzyEtfV0rsuHXRQubflrXhxzZ/5pmWmWUP+69P5auJiB0itjAK3MHH7S886obkNm7o
	 aXWEk+7YZJtwIyfdPoxUOdPBZI3NVLmJ9BNjTp2QvkwzhNYSQkIeT77k2y8ZLC9RiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Weu8yk/I";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B60606A337
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B60606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Weu8yk/I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795432021; x=1826968021;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XF/spGofiXy/lqDZq5z0+t8n5kf4jtW7S0Ouu4eCVuk=;
  b=Weu8yk/IEB6pr/JxlE+afPngIwpWTSe0CgcCJGps6ku4zPZLva2YavRE
   buPONFwwy41Qe6VwhJB6cttepeK9l+1ZAmXx0EYKVI/ohWgt4RxxJMYCy
   BlIyKZPgfmC6AdibPW7WqV/DqyP1kULK1PSS203cXtoCgBea5LLM7BAdO
   vPsQEdltfNxxxTcTS5vbIAS7ya910BDEvrRLTcHoqwBOVH+VOifFA0Er9
   Hyx8SidJMUIlbIgh0ht0GPjdwdHkRMIv/iwrzg+8JmaualHcn2J/r96Vp
   0ie0oaXVRgZNovxb8g/rmRZnI8sUuSXc7nqZv4xbS6JAu5V2UsrgViO1J
   g==;
X-CSE-ConnectionGUID: 0/oXsnTRTT+Vuu4ltRMK3w==
X-CSE-MsgGUID: bDpX/dlMRwydKNBoUr0sug==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4132711"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4132711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:07:00 -0800
X-CSE-ConnectionGUID: vc9NQ6I1Q5C0NAtmzWIoZQ==
X-CSE-MsgGUID: xMAE09CQQYqb6Jcn7v35eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11369994"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:06:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:06:43 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 05/26] platform/x86/amd/hsmp: Print protocol_version as
 hexadecimal
In-Reply-To: <4786ebe4d0e6c9cedad6a51eea3ae5222fd5ba6e.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <e7e96761-dba3-0a13-eb4d-ab70d7344a87@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <4786ebe4d0e6c9cedad6a51eea3ae5222fd5ba6e.1793602633.git.Muthusamy.Ramalingam@amd.com>
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

On Mon, 2 Nov 2026, Muthusamy Ramalingam wrote:

> Switch the protocol_version sysfs file on both drivers to
> hsmp_msg_resp32_hex_show so the HSMP interface version is reported as

Doesn't this change existing ABI ?

> eight hexadecimal digits, matching metric_version.
> 
> Introduce hsmp_msg_resp32_hex_show for that formatting.
> 
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |  2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c  |  2 +-
>  drivers/platform/x86/amd/hsmp/plat.c  | 16 ++++++++--------
>  drivers/platform/x86/amd/hsmp/sysfs.c | 15 +++++++++++++++
>  drivers/platform/x86/amd/hsmp/sysfs.h |  2 ++
>  5 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index e14925896a3e9..44a7da87e5907 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -101,7 +101,7 @@ write-only when the platform enables only that direction of the message.
>  * prochot_status: Reports 1 if the processor is at thermal threshold value,
>    0 otherwise.
>  * smu_fw_version: SMU firmware version.
> -* protocol_version: HSMP interface version.
> +* protocol_version: HSMP interface version, as eight hexadecimal digits.
>  * ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
>  * ddr_utilised_bw: Current utilized DDR bandwidth in GB/s.
>  * ddr_utilised_bw_perc: Percentage of current utilized DDR bandwidth.
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index a74fb274ee652..6bbcc2f7e6a30 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -518,7 +518,7 @@ static const struct bin_attribute *hsmp_attr_list[] = {
>  HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444);
>  HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
>  HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 49a0c01f6dd1b..ba8274e5bfb4a 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -233,14 +233,14 @@ HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 5);
>  HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 6);
>  HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 7);
>  
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 0);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 1);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 2);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 3);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 4);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 5);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 6);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 7);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 0);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 1);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 2);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 3);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 4);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 5);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 6);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 7);
>  
>  HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 0);
>  HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 1);
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index f7c90680a4ff6..bc1b349468978 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -83,6 +83,21 @@ ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
>  	return sysfs_emit(buf, "%u\n", data);
>  }
>  
> +/* Print a 32-bit response as 8 hex digits (protocol_version, metric_version). */
> +ssize_t hsmp_msg_resp32_hex_show(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "0x%08x\n", data);
> +}
> +
>  ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
> index 9381498420f5a..aae932079ab70 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.h
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -54,6 +54,8 @@ static struct hsmp_sys_attr hattr_##_var = {				\
>  
>  ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf);
> +ssize_t hsmp_msg_resp32_hex_show(struct device *dev, struct device_attribute *attr,
> +				 char *buf);
>  ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf);
>  ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
> 

-- 
 i.

