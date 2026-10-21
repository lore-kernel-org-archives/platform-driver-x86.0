Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581951;
	b=LMp942B36zw/Bd9s18q/ukLMltVNXXJ/DPEu6SadYEgU7fpQOD6/8QUdUGs7TOGRbcXh
	 EpgJWDvYNubBysGR7A/W0iBHJkdFUqV2xLCD82S/1U73+kbkpgQ5ojFcQiRo/gMOE75MT
	 oLFKVoizTEIP35NvJLdRwambnNIxrk5CI0wYkNBqRsyxXsBSg93nHEv4Q5g6nAqd2ZalC
	 cpHulZm++PnCv2jNW8ddwZPyLB0I4OiVhBXiD06SrlIlNc2HJiPlphBHFJd3B26PG8f3a
	 kXjWhQYM/zLFOQqLf/wXnIrCt/LxzlOYJJo5FufQfUdE0RKROniiTExB7MTKl7UtVGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581951;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=HbWE4x3ScGvP95j+jFay/fOy9XNAzNzgKDK1brcE7C8=;
	b=temUIdp9TjiCaiU9xQDfvyymZjEaZ6qovKQuPLnyTbFW4GaQD57LfKUY91BgvtYfxivt
	 2UL9os/CreBWcMpvP5BMN+Ang9K6u1QUVvvX2vt8CuAfhtTe9uByb4wGpAcmysoR0Gso9
	 1EXPHGlYUpfxnzomuQyN9fU0AcWWBCSWCwRbnE9ccwWHtd+ePYUYRimCcaZSTYEqDMl3H
	 vxibG9ffGIV1lKUVIBKQpFKfkJlapBqSQOO4SIxWJ8CNFwuPa6dxdSvb/pxDqY+2D3DEC
	 yLjzXXkdbmErhsXz0LSP9v0xR4Eo4zvNQt+1QHM8NDZAn0LcMqzrjN06tMJDnMxRnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lW/gtcAb";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CAE606A319
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 11:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06CAE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lW/gtcAb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792581950; x=1824117950;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iRsvounm0/DPagQOSGMqPKF/bf90UpYTE8LI4CIXBMQ=;
  b=lW/gtcAbE5tw+H1FJFYgVOnJujgCxIQ1PEfJUo3y9sBUEql5+VBCxAYZ
   BYtGOzE6OeaHZBHmpyxBilRaiLNTB43LM9iatns/s1Wjtg0SUthb5MczO
   WL8vJ6oE1j1EkPmY85DJV7SICToV/PNQQ1YVkEjGJK/ONW+dnhDoPrlXG
   c2tBJ4ZYoLepccILtvWtHyoq3GAKHut/J2ohjlOjy2i7Ho7nyoM9vEepu
   QG+VIRYNoZYdL3M5tU70d8Fj1m5jwl1CirEDXNQk5hQf7BM/CFD3gE6V/
   60Xy11MQTMXN/f5U4VE7fNG8cE93HfU/7JuUdywUEJll6k65LHLlJy2sE
   A==;
X-CSE-ConnectionGUID: nS9GO6H7RPmzGlD/9gIPEg==
X-CSE-MsgGUID: fJ+XMMIXTJiGk3tHjS4zNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1319861"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1319861"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:25:49 -0700
X-CSE-ConnectionGUID: 0RNFM+GbSXiPv1yKj/1DTA==
X-CSE-MsgGUID: LKiMt4o8RAGnCz0RDKrlNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3011274"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:25:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 14:25:41 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, hdegoede@redhat.com, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>, 
    NaveenKrishna.Chatradhi@amd.com, Dhruv Gupta <dhruv.gupta@amd.com>, 
    Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: Re: [PATCH 07/11] platform/x86/amd/hsmp: Add per-platform bitmap to
 validate HSMP messages
In-Reply-To: <497f394990dab5c089950a6ec83c70a512a5fab3.1791446401.git.Suma.Hegde@amd.com>
Message-ID: <5a6e8a43-ed7e-74fc-f83b-ec29352eaf92@linux.intel.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com> <497f394990dab5c089950a6ec83c70a512a5fab3.1791446401.git.Suma.Hegde@amd.com>
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

On Thu, 8 Oct 2026, Suma Hegde wrote:

> From: Suma Hegde <Suma.Hegde@amd.com>
> 
> The HSMP driver previously allowed sending any message defined in
> amd_hsmp.h, including ones not supported on the running platform.
> 
> Add read and write bitmaps per socket to store which HSMP messages
> are enabled on the platform. Add validation in validate_message()
> to reject unsupported messages before they reach the SMU.
> 
> Key changes:
> - Introduce enabled_read_msg_ids and enabled_write_msg_ids bitmaps in
>   struct hsmp_socket.
> - Add is_read_msg_enabled() and is_write_msg_enabled() helpers in
>   hsmp.h.
> - Use is_get_msg() to distinguish read and write HSMP messages.
> - Mark HSMP_TEST, HSMP_GET_PROTO_VER, and HSMP_GET_SMU_VER as always
>   enabled during bitmap initialization, as these cannot be masked by
>   BIOS.
> - Skip bitmap init, populate, and validation on client platforms; the
>   client message set has no per-platform bitmaps yet.
> 
> Co-developed-by: Dhruv Gupta <dhruv.gupta@amd.com>
> Signed-off-by: Dhruv Gupta <dhruv.gupta@amd.com>
> Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 13 ++++
>  drivers/platform/x86/amd/hsmp/hsmp.c | 94 ++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.h | 27 ++++++++
>  drivers/platform/x86/amd/hsmp/plat.c | 13 ++++
>  4 files changed, 147 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index b6f54e8b91663..0d3b324fe2244 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -566,6 +566,11 @@ static int init_acpi(struct device *dev)
>  
>  	sock = &hsmp_pdev->sock[sock_ind];
>  
> +	if (!is_client_platform()) {
> +		init_read_enabled_msg_bitmap(sock);
> +		init_write_enabled_msg_bitmap(sock);
> +	}
> +
>  	/* Test the hsmp interface */
>  	ret = hsmp_test(sock_ind, 0xDEADBEEF);
>  	if (ret) {
> @@ -581,6 +586,14 @@ static int init_acpi(struct device *dev)
>  		return ret;
>  	}
>  
> +	if (!is_client_platform()) {
> +		ret = hsmp_populate_msg_bitmaps(sock_ind);
> +		if (ret) {
> +			dev_err(dev, "Failed to get enabled HSMP messages on this platform\n");
> +			return ret;
> +		}
> +	}
> +
>  	if ((is_client_platform() &&
>  	     sock->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
>  	    (!is_client_platform() &&
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 8dc1fc75bd9ba..89528632c9532 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/array_size.h>
> +#include <linux/bitmap.h>
>  #include <linux/build_bug.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler.h>
> @@ -285,6 +286,8 @@ static int validate_message(struct hsmp_message *msg)
>  {
>  	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
>  	const struct hsmp_msg_desc *desc;
> +	struct hsmp_socket *sock;
> +	unsigned int sock_ind;
>  
>  	if (!plat_desc->msg_desc) {
>  		/*
> @@ -294,6 +297,9 @@ static int validate_message(struct hsmp_message *msg)
>  		 * supports in each direction and leave msg_id correctness,
>  		 * such as an unsupported or out-of-range value, to the SMU
>  		 * status code __hsmp_send_message() already translates.
> +		 *
> +		 * Client platforms also have no per-platform enabled-message
> +		 * bitmaps yet, so skip that check here.

I'm unsure how to read this. This validation seems to be on driver side so 
why cannot it be validated for client?

>  		 */
>  		if (msg->num_args > HSMP_CLIENT_MAX_MSG_LEN ||
>  		    msg->response_sz > HSMP_CLIENT_MAX_MSG_LEN)
> @@ -307,6 +313,17 @@ static int validate_message(struct hsmp_message *msg)
>  	if (!desc)
>  		return -ENOMSG;
>  
> +	sock_ind = array_index_nospec(msg->sock_ind, hsmp_pdev.num_sockets);
> +	sock = &hsmp_pdev.sock[sock_ind];
> +
> +	if (is_get_msg(desc, msg)) {
> +		if (!is_read_msg_enabled(sock, msg->msg_id))
> +			return -ENOMSG;
> +	} else {
> +		if (!is_write_msg_enabled(sock, msg->msg_id))
> +			return -ENOMSG;
> +	}
> +
>  	/*
>  	 * num_args passed by user should match the num_args specified in
>  	 * message description table.
> @@ -822,6 +839,83 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_cache_proto_ver, "AMD_HSMP");
>  
> +/*
> + * Predefine read and write enabled message bitmaps for use on platforms where
> + * HSMP_GET_ENABLED_HSMP_CMDS (37h) is not available.
> + */
> +static const u32 read_bitmap_f19h_m00h_0fh[] = {0x001b8cde, 0x00000000, 0x00000000};

These are just a combination of BIT(msg_id), right? If yes, these should 
be constructed from the named defines by OR'ing them together instead of 
using those obscure literals.

> +static const u32 write_bitmap_f19h_m00h_0fh[] = {0x00047320, 0x00000000, 0x00000000};
> +
> +static const u32 read_bitmap_zen4_variants[] = {0x7fdb8cde, 0x00000000, 0x00000000};
> +static const u32 write_bitmap_zen4_variants[] = {0x80047320, 0x00000007, 0x00000000};
> +
> +static const u32 read_bitmap_f19h_m80h_9fh[] = {0x7e0b8cde, 0x00000038, 0x00000000};
> +static const u32 write_bitmap_f19h_m80h_9fh[] = {0x00040320, 0x00000000, 0x00000000};
> +
> +static const u32 read_bitmap_f1ah_m00h_1fh[] = {0x7fdb8cde, 0x00070182, 0x00000000};
> +static const u32 write_bitmap_f1ah_m00h_1fh[] = {0x80047320, 0x000001c6, 0x00000000};

What's the general plan with these? Do we have to keep adding to them when 
more platforms appear?

> +/*
> + * Family 0x1A model 0x50-0x5f, family 0x1A model 0xC0-0xCF,
> + * family 0x1A model 0x90-0x9B and family 0x1A model 0xA0-0xAB
> + * belong to 6th Gen AMD EPYC Server family.
> + */
> +static const u32 read_bitmap_zen6_variants[] = {0x7fdbbcde, 0x05ff07fe, 0x00000000};
> +static const u32 write_bitmap_zen6_variants[] = {0x00047320, 0x070007c6, 0x00000000};
> +
> +#define set_read_enabled_msg_bitmap(sock, src)	\
> +	bitmap_from_arr32((sock)->enabled_read_msg_ids, (src), HSMP_MAX_MSGS)
> +#define set_write_enabled_msg_bitmap(sock, src)	\
> +	bitmap_from_arr32((sock)->enabled_write_msg_ids, (src), HSMP_MAX_MSGS)
> +
> +int hsmp_populate_msg_bitmaps(u16 sock_ind)
> +{
> +	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
> +
> +	switch (boot_cpu_data.x86) {
> +	case 0x19:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x0F:
> +			set_read_enabled_msg_bitmap(sock, read_bitmap_f19h_m00h_0fh);
> +			set_write_enabled_msg_bitmap(sock, write_bitmap_f19h_m00h_0fh);
> +			return 0;
> +		case 0x10 ... 0x1F:
> +		case 0xA0 ... 0xAF:
> +			set_read_enabled_msg_bitmap(sock, read_bitmap_zen4_variants);
> +			set_write_enabled_msg_bitmap(sock, write_bitmap_zen4_variants);
> +			return 0;
> +		case 0x80 ... 0x9F:
> +			set_read_enabled_msg_bitmap(sock, read_bitmap_f19h_m80h_9fh);
> +			set_write_enabled_msg_bitmap(sock, write_bitmap_f19h_m80h_9fh);
> +			return 0;
> +		}
> +		break;
> +	case 0x1A:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +			set_read_enabled_msg_bitmap(sock, read_bitmap_f1ah_m00h_1fh);
> +			set_write_enabled_msg_bitmap(sock, write_bitmap_f1ah_m00h_1fh);
> +			return 0;
> +		case 0x50 ... 0x5F:
> +		case 0x90 ... 0x9B:
> +		case 0xA0 ... 0xAB:
> +		case 0xC0 ... 0xCF:
> +			set_read_enabled_msg_bitmap(sock, read_bitmap_zen6_variants);
> +			set_write_enabled_msg_bitmap(sock, write_bitmap_zen6_variants);
> +			/*
> +			 * PC6 control (msg 0x29) is not supported from
> +			 * protocol 0x70002 onwards on these models.
> +			 */
> +			if (sock->proto_ver >= 0x70002) {
> +				clear_bit(HSMP_PC6_ENABLE, sock->enabled_read_msg_ids);
> +				clear_bit(HSMP_PC6_ENABLE, sock->enabled_write_msg_ids);
> +			}
> +			return 0;
> +		}
> +	}
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_populate_msg_bitmaps, "AMD_HSMP");
> +
>  static const struct file_operations hsmp_fops = {
>  	.owner		= THIS_MODULE,
>  	.unlocked_ioctl	= hsmp_ioctl,
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 6c850c91a51b1..e67bbdd2b9bee 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -13,6 +13,8 @@
>  #include <asm/amd/hsmp.h>
>  
>  #include <linux/acpi.h>
> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
>  #include <linux/compiler_types.h>
>  #include <linux/device.h>
>  #include <linux/hwmon.h>
> @@ -26,6 +28,8 @@
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  
> +#define HSMP_MAX_MSGS			96
> +
>  #define HSMP_METRICS_TABLE_NAME	"metrics_bin"
>  
>  #define HSMP_ATTR_GRP_NAME_SIZE	10
> @@ -77,6 +81,8 @@ struct hsmp_socket {
>  	struct device *dev;
>  	u16 sock_ind;
>  	u32 proto_ver;
> +	DECLARE_BITMAP(enabled_read_msg_ids, HSMP_MAX_MSGS);
> +	DECLARE_BITMAP(enabled_write_msg_ids, HSMP_MAX_MSGS);
>  	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
>  };
>  
> @@ -86,7 +92,28 @@ struct hsmp_plat_device {
>  	u16 num_sockets;
>  };
>  
> +/* HSMP_TEST, HSMP_GET_PROTO_VER, HSMP_GET_SMU_VER are always enabled in
> + * all the platforms and can't be masked by BIOS. Set those bits in the
> + * bitmap during bitmap initialization.
> + */
> +#define init_read_enabled_msg_bitmap(sock)					\
> +	do {									\
> +		bitmap_zero((sock)->enabled_read_msg_ids, HSMP_MAX_MSGS);	\
> +		bitmap_set((sock)->enabled_read_msg_ids, HSMP_TEST, 1);		\
> +		bitmap_set((sock)->enabled_read_msg_ids, HSMP_GET_PROTO_VER, 1);\
> +		bitmap_set((sock)->enabled_read_msg_ids, HSMP_GET_SMU_VER, 1);	\
> +	} while (0)
> +
> +#define init_write_enabled_msg_bitmap(sock)	\
> +	bitmap_zero((sock)->enabled_write_msg_ids, HSMP_MAX_MSGS)
> +
> +#define is_read_msg_enabled(sock, msg_id)	\
> +	test_bit((msg_id), (sock)->enabled_read_msg_ids)
> +#define is_write_msg_enabled(sock, msg_id)	\
> +	test_bit((msg_id), (sock)->enabled_write_msg_ids)
> +
>  int hsmp_cache_proto_ver(u16 sock_ind);
> +int hsmp_populate_msg_bitmaps(u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
>  long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>  void hsmp_misc_deregister(void);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 40c98d9c66d4f..310a776125961 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -178,6 +178,11 @@ static int init_platform_device(struct device *dev)
>  		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
>  		sema_init(&sock->hsmp_sem, 1);
>  
> +		if (!is_client_platform()) {
> +			init_read_enabled_msg_bitmap(sock);
> +			init_write_enabled_msg_bitmap(sock);
> +		}
> +
>  		/* Test the hsmp interface on each socket */
>  		ret = hsmp_test(i, 0xDEADBEEF);
>  		if (ret) {
> @@ -193,6 +198,14 @@ static int init_platform_device(struct device *dev)
>  			return ret;
>  		}
>  
> +		if (!is_client_platform()) {
> +			ret = hsmp_populate_msg_bitmaps(i);
> +			if (ret) {
> +				dev_err(dev, "Failed to get enabled HSMP messages on this platform\n");
> +				return ret;
> +			}
> +		}
> +
>  		if (sock->proto_ver == HSMP_PROTO_VER6) {
>  			ret = hsmp_get_tbl_dram_base(i);
>  			if (ret)
> 

-- 
 i.

