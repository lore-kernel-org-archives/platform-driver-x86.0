Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE14518D63E
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324416; cv=none; b=F9Umd+Pb1QMLjpSl1QtD2gEy7RlY49tiLC3OEyYT4iDZAqsCqKEIlJ9vFxuMhGyzkxdX815E6jCE3IfeLDotnGHmmL5MKoebClJ1t5HwtOoi1JUfCqOrIBysD7KSbwsA5fwS8QFrcrE/a8BcDm4t6Gr+FC2lm6XRs/EGjCdX2pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324416; c=relaxed/simple;
	bh=fXaMuwkmemBa4+Zj7G7INWhS+1n6WmABuJdQ4hRsn0Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=A5++iJEKLi984vYKYw45nOMqH8j/PE2HDRf/pcgEUYiSgPl+YoapJVfpy9rmZfDkb6sP6uxgMzt0q2Cx67V0SD7Cp5kZWnuflwr38UU09fSkdrZW0py6eULlErWGX/BzLe0zxToTJSdjBLiR/p2k1m6zyKiyt4vjN+Zq7wrknMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjbYnWMN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjbYnWMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731324415; x=1762860415;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fXaMuwkmemBa4+Zj7G7INWhS+1n6WmABuJdQ4hRsn0Q=;
  b=kjbYnWMNUgWCS1qVdGZuImGekTBMJi+ZqpzFeQVrjrThsas/PflxFTH8
   dt8k7AEY5cpujbH43hLmZe8UpQqhU4M22jPPtSOLMl/McYn3GivfEYJwW
   WgIMv0EHLwf31WocSjBZf9C2blYGe7NO+alXUUEgJHNbc43o6BXZnSobq
   SNPPD26TcMJvnbl/jLRMuBJ75O6IVhVtoqvgSQCSq1Nc04yZnuhATQ54D
   xD8Qzp9UgX8cEQx6XuLGAcjEP45O9a4Kqq4XABmRKJrRew5txoX2ZvOid
   WmMnNZPfnBkuimyyJMya249+Opoyj8Vq252z/1jco5Gfbimjh6r4txUbM
   w==;
X-CSE-ConnectionGUID: nxz5wNuiQOaa+FoW1+tCnQ==
X-CSE-MsgGUID: Zob83X5fTiacCRnRRyANUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31285219"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31285219"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:26:54 -0800
X-CSE-ConnectionGUID: XV96EnJ7TaOEcYOLLykRLQ==
X-CSE-MsgGUID: YxcdfOoBRH2bvHtGyvTNGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="91802626"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.107])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:26:52 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 Nov 2024 13:26:49 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Add new error code and error
 logs
In-Reply-To: <20241111091722.1565061-1-suma.hegde@amd.com>
Message-ID: <c3b8fe12-ba3e-cf1e-034a-8e7b37709778@linux.intel.com>
References: <20241111091722.1565061-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Nov 2024, Suma Hegde wrote:

> Firmware is updated to send HSMP_ERR_PREREQ_NOT_SATISFIED(0xFD) and
> HSMP_ERR_SMU_BUSY(0xFC) error codes. Add them here.
> 
> Add error logs to make it easy to understand the failure reason for
> different error conditions.
> 
> Replace pr_err() with dev_err() to identify the driver printing the
> error.
> 
> When file is opened in WRITE mode, then GET messages are not allowed
> and when file is opened in READ mode, SET messages are not allowed.
> In these scenerios, return EPERM error to userspace instead of
> EINVALID.

Hi Suma,

Please split UAPI change into own patch as it's something that might have 
to be reverted so I prefer to have that as minimal as possible.

-- 
 i.

> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 40 +++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 82d8ba2e1204..f29dd93fbf0b 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -7,8 +7,6 @@
>   * This file provides a device implementation for HSMP interface
>   */
>  
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
>  #include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
>  
> @@ -25,6 +23,8 @@
>  #define HSMP_STATUS_OK		0x01
>  #define HSMP_ERR_INVALID_MSG	0xFE
>  #define HSMP_ERR_INVALID_INPUT	0xFF
> +#define HSMP_ERR_PREREQ_NOT_SATISFIED	0xFD
> +#define HSMP_ERR_SMU_BUSY		0xFC
>  
>  /* Timeout in millsec */
>  #define HSMP_MSG_TIMEOUT	100
> @@ -61,7 +61,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	mbox_status = HSMP_STATUS_NOT_READY;
>  	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
>  	if (ret) {
> -		pr_err("Error %d clearing mailbox status register\n", ret);
> +		dev_err(sock->dev, "Error %d clearing mailbox status register\n", ret);
>  		return ret;
>  	}
>  
> @@ -71,7 +71,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
>  					  &msg->args[index], HSMP_WR);
>  		if (ret) {
> -			pr_err("Error %d writing message argument %d\n", ret, index);
> +			dev_err(sock->dev, "Error %d writing message argument %d\n", ret, index);
>  			return ret;
>  		}
>  		index++;
> @@ -80,7 +80,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	/* Write the message ID which starts the operation */
>  	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
>  	if (ret) {
> -		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
> +		dev_err(sock->dev, "Error %d writing message ID %u\n", ret, msg->msg_id);
>  		return ret;
>  	}
>  
> @@ -97,7 +97,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	while (time_before(jiffies, timeout)) {
>  		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
>  		if (ret) {
> -			pr_err("Error %d reading mailbox status\n", ret);
> +			dev_err(sock->dev, "Error %d reading mailbox status\n", ret);
>  			return ret;
>  		}
>  
> @@ -110,14 +110,28 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	}
>  
>  	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
> +		dev_err(sock->dev, "Message ID 0x%X failure : SMU tmeout (status = 0x%X)\n",
> +			msg->msg_id, mbox_status);
>  		return -ETIMEDOUT;
>  	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
> +		dev_err(sock->dev, "Message ID 0x%X failure : Invalid message (status = 0x%X)\n",
> +			msg->msg_id, mbox_status);
>  		return -ENOMSG;
>  	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
> +		dev_err(sock->dev, "Message ID 0x%X failure : Invalid arguments (status = 0x%X)\n",
> +			msg->msg_id, mbox_status);
>  		return -EINVAL;
> +	} else if (unlikely(mbox_status == HSMP_ERR_PREREQ_NOT_SATISFIED)) {
> +		dev_err(sock->dev, "Message ID 0x%X failure : Prerequisite not satisfied (status = 0x%X)\n",
> +			msg->msg_id, mbox_status);
> +		return -EREMOTEIO;
> +	} else if (unlikely(mbox_status == HSMP_ERR_SMU_BUSY)) {
> +		dev_err(sock->dev, "Message ID 0x%X failure : SMU BUSY (status = 0x%X)\n",
> +			msg->msg_id, mbox_status);
> +		return -EBUSY;
>  	} else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
> -		pr_err("Message ID %u unknown failure (status = 0x%X)\n",
> -		       msg->msg_id, mbox_status);
> +		dev_err(sock->dev, "Message ID 0x%X unknown failure (status = 0x%X)\n",
> +			msg->msg_id, mbox_status);
>  		return -EIO;
>  	}
>  
> @@ -133,8 +147,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
>  					  &msg->args[index], HSMP_RD);
>  		if (ret) {
> -			pr_err("Error %d reading response %u for message ID:%u\n",
> -			       ret, index, msg->msg_id);
> +			dev_err(sock->dev, "Error %d reading response %u for message ID:%u\n",
> +				ret, index, msg->msg_id);
>  			break;
>  		}
>  		index++;
> @@ -248,7 +262,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  		 * Execute only set/configure commands
>  		 */
>  		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
> -			return -EINVAL;
> +			return -EPERM;
>  		break;
>  	case FMODE_READ:
>  		/*
> @@ -256,7 +270,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  		 * Execute only get/monitor commands
>  		 */
>  		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
> -			return -EINVAL;
> +			return -EPERM;
>  		break;
>  	case FMODE_READ | FMODE_WRITE:
>  		/*
> @@ -265,7 +279,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  		 */
>  		break;
>  	default:
> -		return -EINVAL;
> +		return -EPERM;
>  	}
>  
>  	ret = hsmp_send_message(&msg);
> 
