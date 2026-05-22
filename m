Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC33839AF;
	Fri, 22 May 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447877; cv=none; b=ZgZawmVrdA3h2bhjbUbs2wLJMInIck70BG2t4Q+oGS852SyazLUp5WoWiYuORmfx1qdJsoRaVbdbs0tKDBF4ymDK12QwOgPaxDtQEpNVNFizx01SqdhVa/n4vHVJEdkzVrRpj3t5KR7Y5hvDxmiGHlVaHdyHpKKmoVwNGgTD284=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447877; c=relaxed/simple;
	bh=+8seCiqKoSu+JAkT1UxmXBCqRAK6tbNjYefyWyfOoSk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ltDrDhcyWB1ZyK85uOKkWfKTUj34abLhu6HTuU/dsZjNMVn/SjQqJlpv+7sXUCFIVjcheJz7JuMxuDGAAXyhvrG+8secmDFLQFoYtn8w2QMHCfkMLN+1HyF/DCmmjV8GED5Ein21AgDbWBv5/3Ph2SdGlmZPdGpqJAftbvUsQDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctQlLG8a; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctQlLG8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779447875; x=1810983875;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+8seCiqKoSu+JAkT1UxmXBCqRAK6tbNjYefyWyfOoSk=;
  b=ctQlLG8aCahfWB41kphesirT79ZcRyaRtQF0AruibtvSOOqn40NAt/mq
   LZg3E+l/Pl278xAh5ckxlvqczv+3PYfDTYx1WnBAJ3DjFTYP5cYaO+KyD
   eoNRC2/vrlBBlgXfnMsnS8XR7GQGahNb9sPLagQiY7NajsQoVK3UESbFI
   TL3xI0i81M7HwKy3nlW3bI8WuUO6eoXepNc0DoGkkhgGdpR4FyVQu3EU7
   9Jlh1NQVw7LSEHa3MvPmA0iU/6kW7BO/VwrbSNQdWMiEv5MHLL3ccNQLC
   5rnV/6sxlKHAIvmm9WA8XbzXE9qMdCu6+WW6THmtVudP0R24nRaAicWr5
   A==;
X-CSE-ConnectionGUID: ZMwgbal2RkG0BiKcdFHJUA==
X-CSE-MsgGUID: 2/HUthNxTaahMOi3dnQycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80557383"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80557383"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:04:34 -0700
X-CSE-ConnectionGUID: xLpdBEmgSm6Oy15gEtnrAQ==
X-CSE-MsgGUID: V8x4uURITiGDCPxr6qIdhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="278996120"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:04:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 14:04:27 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v3 5/7] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA
 for metric table reads
In-Reply-To: <20260517151211.415627-6-muralidhara.mk@amd.com>
Message-ID: <cdab5033-0ad2-4ed8-ab19-cdac24c390da@linux.intel.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com> <20260517151211.415627-6-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 17 May 2026, Muralidhara M K wrote:

> The metric table for Family 1Ah Model 50h-5Fh
> (struct hsmp_metric_table_zen6) is approximately 13 KB, exceeding the
> PAGE_SIZE (4 KB) cap imposed on the standard sysfs binary attribute
> read path.  Rather than introduce new sysfs infrastructure to support
> binary attributes larger than PAGE_SIZE, expose the metric table
> through the existing HSMP character device using a new ioctl.
> 
> Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA to
> the UAPI header.  The request structure carries the socket index, the
> required buffer size and a __u64-encoded user pointer to the
> destination buffer, so the same layout works for 32-bit and 64-bit
> callers.  Fields are ordered with the __u64 user pointer first so all
> members fall on their natural alignment under #pragma pack(4), giving
> a tight 16-byte struct with no implicit padding; the trailing
> reserved __u16 is documented as "set to zero" so future kernels can
> attach meaning to it.  Userspace sizes its buffer using the matching
> UAPI metric table struct (hsmp_metric_table or hsmp_metric_table_zen6)
> for the running platform; sizes that disagree with the firmware-
> reported table size are rejected with -EINVAL so a short copy can
> never silently truncate the snapshot.
> 
> Dispatch hsmp_ioctl() on the ioctl command, route HSMP_IOCTL_CMD to
> the existing message handler (factored out as hsmp_ioctl_msg()) and
> HSMP_IOCTL_GET_TELEMETRY_DATA to a new hsmp_ioctl_get_telemetry()
> helper.  The new helper validates the request, allocates a kernel
> bounce buffer with kvmalloc() so it can hold the full table even
> when it exceeds a single page (zeroing is skipped because the buffer
> is overwritten in full by memcpy_fromio()), calls hsmp_metric_tbl_read()
> to refresh and copy the table from the SMU DRAM region (under the
> per-socket mutex introduced in a follow-up patch), and copies the
> table to userspace.  Unknown ioctl commands now return -ENOTTY instead
> of falling through.
> 
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes:
> v1->v2: New patch based on bin sysfs
> v2->v3: Replace with IOCTL method
> 
>  arch/x86/include/uapi/asm/amd_hsmp.h | 43 ++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c | 85 +++++++++++++++++++++++++++-
>  2 files changed, 127 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index b86bbc929395..3d085298dd52 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -664,6 +664,40 @@ struct hsmp_metric_table_zen6 {
>  	struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
>  };
>  
> +/**
> + * struct hsmp_telemetry_data - Request descriptor for HSMP telemetry IOCTL
> + * @buf:       Input. Userspace pointer (encoded as __u64 to keep the layout
> + *             stable between 32-bit and 64-bit callers) to the destination
> + *             buffer that receives the metric table.
> + * @size:      Input. Size in bytes of the buffer pointed to by @buf.  Must
> + *             match the firmware-reported metric table size for the running
> + *             HSMP protocol version (see below); any other value results in
> + *             -EINVAL.  The kernel does not write this field back.
> + * @sock_ind:  Input. Socket index from which the metric table is read.
> + * @reserved:  Reserved for future use.  Callers should set this to zero;
> + *             future kernels may begin interpreting the field, so passing
> + *             a non-zero value today is not forwards compatible.
> + *
> + * Placing @buf first lets all fields fall on their natural alignment under
> + * the surrounding #pragma pack(4), so the struct is a tight 16 bytes with
> + * the same wire layout on 32-bit and 64-bit userspace.
> + *
> + * The exact metric table layout depends on the HSMP protocol version reported
> + * by the firmware:
> + *   - Protocol version 6 -> struct hsmp_metric_table
> + *   - Protocol version 7 -> struct hsmp_metric_table_zen6
> + *
> + * Userspace queries the protocol version (e.g. via the protocol_version sysfs
> + * attribute) and uses sizeof() on the matching UAPI structure for both @size
> + * and the allocation backing @buf.
> + */
> +struct hsmp_telemetry_data {
> +	__u64	buf;
> +	__u32	size;
> +	__u16	sock_ind;
> +	__u16	reserved;
> +};
> +
>  /* Reset to default packing */
>  #pragma pack()
>  
> @@ -671,4 +705,13 @@ struct hsmp_metric_table_zen6 {
>  #define HSMP_BASE_IOCTL_NR	0xF8
>  #define HSMP_IOCTL_CMD		_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
>  
> +/*
> + * Fetch the firmware metric (telemetry) table for a given socket via the
> + * HSMP character device.  This avoids the PAGE_SIZE limitation of the
> + * sysfs binary attribute path for tables larger than one page (such as the
> + * ~13 KB hsmp_metric_table_zen6 used on Family 1Ah Model 50h-5Fh).
> + */
> +#define HSMP_IOCTL_GET_TELEMETRY_DATA \
> +	_IOWR(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
> +
>  #endif /*_ASM_X86_AMD_HSMP_H_*/
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index cf9392f99298..3a02d683dea0 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -13,7 +13,9 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/semaphore.h>
> +#include <linux/slab.h>
>  #include <linux/sysfs.h>
> +#include <linux/uaccess.h>
>  
>  #include "hsmp.h"
>  
> @@ -287,7 +289,7 @@ static bool is_get_msg(struct hsmp_message *msg)
>  	return false;
>  }
>  
> -long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>  {
>  	int __user *arguser = (int  __user *)arg;
>  	struct hsmp_message msg = { 0 };
> @@ -343,6 +345,87 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> +/*
> + * Fetch the firmware metric (telemetry) table for the requested socket and
> + * copy it to the userspace buffer described by the request.
> + *
> + * The metric table size is variable across HSMP protocol versions and on
> + * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  Userspace must therefore
> + * supply a buffer at least the firmware-reported size in bytes.
> + */
> +static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
> +{
> +	void __user *arguser = (void __user *)arg;
> +	struct hsmp_telemetry_data req;
> +	struct hsmp_socket *sock;
> +	void __user *user_buf;
> +	size_t tbl_size;
> +	void *kbuf;
> +	int ret;
> +
> +	/* Telemetry data is read-only; require read access on the fd. */
> +	if (!(fp->f_mode & FMODE_READ))
> +		return -EPERM;
> +
> +	if (copy_from_user(&req, arguser, sizeof(req)))
> +		return -EFAULT;
> +
> +	if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)

Sashiko warns userspace can use this as a speculation device so it needs 
to be protected.

Please also address the req.reserved check mentioned by it with -EINVAL so 
it can actually be used safely in future.

> +		return -ENODEV;
> +
> +	tbl_size = hsmp_pdev.hsmp_table_size;
> +	if (!tbl_size)
> +		return -ENODEV;
> +
> +	/*
> +	 * Userspace must size its buffer using the appropriate UAPI metric
> +	 * table struct for the running protocol version.  Reject mismatched
> +	 * sizes so we never silently truncate or short-write.
> +	 */
> +	if (req.size != tbl_size)
> +		return -EINVAL;
> +
> +	sock = &hsmp_pdev.sock[req.sock_ind];
> +	if (!sock->metric_tbl_addr)
> +		return -ENODEV;
> +
> +	user_buf = u64_to_user_ptr(req.buf);
> +
> +	/*
> +	 * The bounce buffer is overwritten in full by memcpy_fromio() inside
> +	 * hsmp_metric_tbl_read(); use kvmalloc() to avoid the zeroing cost of
> +	 * kvzalloc() on the ~13 KB allocation done on every ioctl call.
> +	 */
> +	kbuf = kvmalloc(tbl_size, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	ret = hsmp_metric_tbl_read(sock, kbuf, tbl_size);
> +	if (ret < 0)
> +		goto out;
> +
> +	if (copy_to_user(user_buf, kbuf, tbl_size))
> +		ret = -EFAULT;
> +	else
> +		ret = 0;
> +
> +out:
> +	kvfree(kbuf);
> +	return ret;
> +}
> +
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +{
> +	switch (cmd) {
> +	case HSMP_IOCTL_CMD:
> +		return hsmp_ioctl_msg(fp, arg);
> +	case HSMP_IOCTL_GET_TELEMETRY_DATA:
> +		return hsmp_ioctl_get_telemetry(fp, arg);
> +	default:
> +		return -ENOTTY;
> +	}
> +}
> +
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  {
>  	struct hsmp_message msg = { 0 };
> 

-- 
 i.

