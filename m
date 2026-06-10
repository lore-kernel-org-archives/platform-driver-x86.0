Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB43E2ABC;
	Wed, 10 Jun 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089342; cv=none; b=ugFAinhdxvFxVdXHZ6favr2PXBxplcLihO8/cJUEb5nAIJ129qGXairbNGXSVEkiQPecR6aL14kq0IjMNqTXPQvY5FvXGd+D13nAn8rlbFlceJwrDkFJTrH8xGw6lE8U0vPl79kEjIghu8LYsIVidpJV1hHkkFzwaSrWTpCBcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089342; c=relaxed/simple;
	bh=SD06FK8JfFny5X4G0Sr2yHQXJohz9l94hefUuoJapsg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gXZp0dQ1+D7/3y4qbH+Jp5SintPbMOhZcxoPRT9fV94nRYn1UWL2qrYGeWn9IMWFHxNuW+2L5UylqXPB8vT8WxsnBNeBBbRQmHI8rM0vh01xuKZnxyXxBj1fnHqmTydaQ42BjpGvbqCBYMT6STrhmDiFdUevmsKglKr0tGFMvPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ix6xtpqy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ix6xtpqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781089336; x=1812625336;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SD06FK8JfFny5X4G0Sr2yHQXJohz9l94hefUuoJapsg=;
  b=Ix6xtpqyMce7BaX/+SeL5QEe65mWAzWEsABW+1tsFQQCweuE5gedzcna
   mqkL9NFQ+nYb93NBBLMW6OcS7w85hq9NI2ipnYp+U/H/2fi+48oKUydjY
   OPDz3j7D4JKJHaGhBEMCuayuK6NXw8FRuoXyZysTQhRCYoX1sFlK4+kHR
   PvElKWyyvKhGHR4zS2hgQIRwVft1fspCaqQddNNGFD/y1nfRAiI1sK9X7
   abTaJoj0EI9dgNvj2h3bvJXhS1rycddCQhvDwklFOdfi/9PDPfsgRopug
   c1vcoajhxYHTLjQLf7hjBLI8P4/qMk2RBMEtvw6h2hbV674+qz7Cu0NLM
   Q==;
X-CSE-ConnectionGUID: JSUheIKMQoGWHlVEGEKi5g==
X-CSE-MsgGUID: gQ6DRqrmT3u1b/wxlLYa+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104544324"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="104544324"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:02:15 -0700
X-CSE-ConnectionGUID: 1ZqLPIAuTSmhgoO/14haGg==
X-CSE-MsgGUID: 1PAp0wVnROuWOIJqMjG2dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245996335"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:02:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 14:02:08 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v4 5/7] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA
 for metric table reads
In-Reply-To: <20260528093954.2461272-6-muralidhara.mk@amd.com>
Message-ID: <24802a50-52d9-0a89-a330-acc43b01b72b@linux.intel.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com> <20260528093954.2461272-6-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 May 2026, Muralidhara M K wrote:

> The metric table needs to be delivered to userspace as a single
> atomic snapshot, but the current sysfs metrics_bin path is a file
> read: userspace can read it in chunks and observe a torn snapshot
> if an SMU refresh happens between read() calls. The same path is
> also bounded by PAGE_SIZE, so the ~13 KB hsmp_metric_table_zen6
> used on Family 1Ah Model 50h-5Fh cannot be returned at all,
> regardless of how userspace reads it. Rather than extend sysfs to
> lift both restrictions, expose the metric table through the
> existing HSMP character device using a new ioctl that always copies
> the full table in one shot.
> 
> Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA
> to the UAPI header. Under the surrounding #pragma pack(4), placing
> the __u64 user pointer first gives a tight 16-byte layout that is
> identical for 32- and 64-bit callers, and the trailing __u16
> reserved field is rejected with -EINVAL if non-zero so future
> kernels can repurpose it without breaking already-deployed
> userspace. Userspace sizes its buffer using the matching UAPI
> metric-table struct for the running platform; sizes that disagree
> with the firmware-reported table size are rejected so a short copy
> can never silently truncate the snapshot.
> 
> Dispatch hsmp_ioctl() on the ioctl command: the existing message
> handler is factored out as hsmp_ioctl_msg() for HSMP_IOCTL_CMD, and
> HSMP_IOCTL_GET_TELEMETRY_DATA goes to a new
> hsmp_ioctl_get_telemetry() helper.
> 
> The user-controlled indices reaching kernel arrays via these ioctl
> paths are clamped with array_index_nospec() to mitigate Spectre v1
> (CVE-2017-5753): req.sock_ind before indexing hsmp_pdev.sock[], and
> msg.msg_id once at the entry to hsmp_ioctl_msg() so all six
> downstream hsmp_msg_desc_table[] dereferences inherit the clamp
> from a single mask.
> 
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst  |  30 ++++++-
>  arch/x86/include/uapi/asm/amd_hsmp.h |  43 ++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c | 117 ++++++++++++++++++++++++++-
>  3 files changed, 188 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 8bb411f0d70d..74c259507888 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -68,6 +68,14 @@ under per socket sysfs directory created at
>  
>  Note: lseek() is not supported as entire metrics table is read.
>  
> +The sysfs metrics_bin path supports only HSMP protocol version 6 and,
> +because it is a file read, can return a torn snapshot if userspace
> +reads in pieces.  Protocol version 7 metric tables
> +(``struct hsmp_metric_table_zen6``, ~13 KB) also exceed PAGE_SIZE, so
> +a read returns ``-EOPNOTSUPP``.  For atomic reads on any protocol
> +version, use the ``HSMP_IOCTL_GET_TELEMETRY_DATA`` ioctl on /dev/hsmp
> +(see below).
> +
>  Metrics table definitions will be documented as part of Public PPR.
>  The same is defined in the amd_hsmp.h header.
>  
> @@ -167,7 +175,7 @@ Next thing, open the device file, as follows::
>      exit(1);
>    }
>  
> -The following IOCTL is defined:
> +The following IOCTLs are defined:
>  
>  ``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
>    The argument is a pointer to a::
> @@ -180,6 +188,26 @@ The following IOCTL is defined:
>      	__u16	sock_ind;			/* socket number */
>      };
>  
> +``ioctl(file, HSMP_IOCTL_GET_TELEMETRY_DATA, struct hsmp_telemetry_data *req)``
> +  Atomically fetch the firmware metric (telemetry) table for a socket.
> +  The ioctl copies the table in one shot, so unlike the metrics_bin
> +  sysfs path it cannot return a torn snapshot and is not bounded by
> +  PAGE_SIZE.  Required for HSMP protocol version 7+ (e.g. Family 1Ah
> +  Model 50h-5Fh, ~13 KB ``struct hsmp_metric_table_zen6``).  Argument::
> +
> +    struct hsmp_telemetry_data {
> +    	__u64 buf; /* User pointer to destination buffer */
> +    	__u32 size; /* Size of @buf, must equal firmware-reported table size */
> +    	__u16 sock_ind; /* Socket index */
> +    	__u16 reserved; /* Reserved, must be zero */
> +    };
> +
> +  Userspace picks the layout matching the running protocol version
> +  (``struct hsmp_metric_table`` for v6, ``struct hsmp_metric_table_zen6``
> +  for v7, queried via the ``protocol_version`` sysfs attribute) and
> +  uses ``sizeof()`` of that struct for ``size``.  The kernel rejects
> +  a mismatched ``size`` or non-zero ``reserved`` with ``-EINVAL``.
> +
>  The ioctl would return a non-zero on failure; you can read errno to see
>  what happened. The transaction returns 0 on success.
>  
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 438ac38d0dc8..50b28ccc7597 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -686,6 +686,40 @@ struct hsmp_metric_table_zen6 {
>  	struct hsmp_metric_table_zen6_ccd ccd[HSMP_F1A_M50_M5F_MAX_CCDS];
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
> @@ -693,4 +727,13 @@ struct hsmp_metric_table_zen6 {
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
> index cf9392f99298..67f0074bb532 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -12,8 +12,11 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/nospec.h>
>  #include <linux/semaphore.h>
> +#include <linux/slab.h>
>  #include <linux/sysfs.h>
> +#include <linux/uaccess.h>
>  
>  #include "hsmp.h"
>  
> @@ -287,7 +290,7 @@ static bool is_get_msg(struct hsmp_message *msg)
>  	return false;
>  }
>  
> -long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>  {
>  	int __user *arguser = (int  __user *)arg;
>  	struct hsmp_message msg = { 0 };
> @@ -303,6 +306,19 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>  		return -ENOMSG;
>  
> +	/*
> +	 * Sanitize the user-controlled msg_id against speculative
> +	 * execution.  The bounds check above retires the out-of-range
> +	 * case with -ENOMSG, but a mispredicted branch can still let the
> +	 * CPU speculatively use msg_id as an index into
> +	 * hsmp_msg_desc_table[] (here and in validate_message() /
> +	 * is_get_msg() called downstream via hsmp_send_message()), and
> +	 * pull arbitrary kernel memory into the cache (Spectre v1,
> +	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
> +	 * dereference sees the sanitized value.
> +	 */
> +	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
> +

This is a good change, but it looks to me it's fixing an existing problem, 
that is unrelated to this patch which is supposed to be about:

"Add IOCTL_GET_TELEMETRY_DATA for metric table reads"

So I think it should be done in own patch.

>  	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>  	case FMODE_WRITE:
>  		/*
> @@ -343,6 +359,105 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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

Here the comment says "at least" but you check it's exactly equal to the 
required size?

> + */
> +static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
> +{
> +	void __user *arguser = (void __user *)arg;
> +	struct hsmp_telemetry_data req;
> +	struct hsmp_socket *sock;
> +	void __user *user_buf;
> +	size_t tbl_size;
> +	unsigned int sock_ind;
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
> +	/*
> +	 * Reserved fields must be zero so future kernels can safely
> +	 * repurpose them without breaking already-deployed userspace.
> +	 */
> +	if (req.reserved)
> +		return -EINVAL;
> +
> +	if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)
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
> +	/*
> +	 * Sanitize the user-controlled socket index against speculative
> +	 * execution.  The bounds check above retires the out-of-range case
> +	 * with -ENODEV, but a mispredicted branch can still let the CPU
> +	 * speculatively use sock_ind as an index into hsmp_pdev.sock[] and
> +	 * pull arbitrary kernel memory into the cache (Spectre v1, CVE-2017-
> +	 * 5753).  array_index_nospec() turns the bounds check into a
> +	 * data-flow clamp so the speculative load is in-range too.
> +	 */
> +	sock_ind = array_index_nospec(req.sock_ind, hsmp_pdev.num_sockets);
> +	sock = &hsmp_pdev.sock[sock_ind];
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

