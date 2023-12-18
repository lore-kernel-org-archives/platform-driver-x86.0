Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC822230F
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnQ9dXaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702900729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05ypV8nBwMaGEuHJriwBXifOia5g7vcZBpXPz2BtZLA=;
	b=cnQ9dXaVVoV4HsCmMl5FIJO301YM2DjkEbyllcYUM15RZI4dS7vAU+SpmXhNP+/5GHFi64
	VFDwEALmimXY4x0NiPWrz6JCGDPMTN5HwqX0pZ7eaxA26ZhFZcSBdlyCDsZhLZaXpJZsW4
	2s0gDwr4CG73BnWAhQebXiiSvQ33IH0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-KjhgIVDWOd2aCNTldry0DA-1; Mon, 18 Dec 2023 06:58:47 -0500
X-MC-Unique: KjhgIVDWOd2aCNTldry0DA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-551c184a8aeso1547943a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 03:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702900726; x=1703505526;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05ypV8nBwMaGEuHJriwBXifOia5g7vcZBpXPz2BtZLA=;
        b=lm1ArXnNegShvt/0RJcm8PLtHRmubK8h1akLzPRjmvrawfAdLht8jfYVg8q5MAjiiA
         1tfofS9pMHA9971QQBvfYzemzqYktvlpo634WJrG9Bk8wsIFlCo0bCc+LAlLfF9jrtZJ
         Ret0LUjiB+6XYijtpsFzdnDlgR1s503vKLiQFP2nW6yxHJN1JmG35bGC82k8g43/PJkJ
         fc1UlR/ypjzO8Inb0svl906LSTfQu28EAUuA3AaMn7wTJV8v5Gv99ykSoYHto1viII2c
         /tU0GSsMKl8M5GaLn03kdXybQQsWqQijh7dwo17OZj/MBRMNe25emOfqH1880XCSfYYA
         Ah9w==
X-Gm-Message-State: AOJu0YzTMgdLloGwjhQO9u5I2x/aSbeS7eGijRz82F0RJ8nqkX7o6nd/
	2onQ06ja2rELIPH8tiCLGXHM4cQr4bxcAIeLfPrOABo57mr3WjsJR6KbgHTvd6xKzGkiJsr3duh
	xV+ssbyj+eNKeCbnUZXJqv7hltPfXRaRn/w==
X-Received: by 2002:a50:d0c6:0:b0:553:328c:110 with SMTP id g6-20020a50d0c6000000b00553328c0110mr794623edf.55.1702900726713;
        Mon, 18 Dec 2023 03:58:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrHVnUPIh6lcx/qsY1+wa7z5Lg8r+tUqNRnPHyHU5hcmduKANDj5gCqbhw9ukLdAVZt++E5w==
X-Received: by 2002:a50:d0c6:0:b0:553:328c:110 with SMTP id g6-20020a50d0c6000000b00553328c0110mr794619edf.55.1702900726382;
        Mon, 18 Dec 2023 03:58:46 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r14-20020aa7cb8e000000b00552f2607d2asm2533557edt.96.2023.12.18.03.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 03:58:45 -0800 (PST)
Message-ID: <37cce327-1ebf-45bf-a1ea-5c0752de119f@redhat.com>
Date: Mon, 18 Dec 2023 12:58:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/12] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
 <20231212014705.2017474-12-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212014705.2017474-12-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 02:47, Shyam Sundar S K wrote:
> A policy binary is OS agnostic, and the same policies are expected to work
> across the OSes.  At times it becomes difficult to debug when the policies
> inside the policy binaries starts to misbehave. Add a way to sideload such
> policies independently to debug them via a debugfs entry.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  1 +
>  drivers/platform/x86/amd/pmf/tee-if.c | 60 +++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 55cd2b301bbb..16999c5b334f 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -219,6 +219,7 @@ struct amd_pmf_dev {
>  	bool cnqf_supported;
>  	struct notifier_block pwr_src_notifier;
>  	/* Smart PC solution builder */
> +	struct dentry *esbin;
>  	unsigned char *policy_buf;
>  	u32 policy_sz;
>  	struct tee_context *tee_ctx;
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 38b75198cc3f..cf95251741c7 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -8,6 +8,7 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
> @@ -16,9 +17,14 @@
>  
>  /* Policy binary actions sampling frequency (in ms) */
>  static int pb_actions_ms = MSEC_PER_SEC;
> +/* Sideload policy binaries to debug policy failures */
> +static bool pb_side_load;
> +
>  #ifdef CONFIG_AMD_PMF_DEBUG
>  module_param(pb_actions_ms, int, 0644);
>  MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
> +module_param(pb_side_load, bool, 0444);
> +MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>  #endif
>  
>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> @@ -269,6 +275,54 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> +				   size_t length, loff_t *pos)
> +{
> +	struct amd_pmf_dev *dev = filp->private_data;
> +	int ret;
> +
> +	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> +	if (length > POLICY_BUF_MAX_SZ || length == 0)
> +		return -EINVAL;
> +
> +	dev->policy_sz = length;
> +
> +	/* re-alloc to the new buffer length of the policy binary */

You are leaking the original policy_buf here. Also by 
storing length + the kzalloc result in policy_sz + policy_buf
before a successful kzalloc() + copy_from_usr() you are
leaving things in a state where there is no valid policy_buf
on error exits, where as other code assumes there always
is a valid policy_buf.

I have squashed in the following fix to fix both these issues:

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 9a4757f4f521..502ce93d5cdd 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -286,22 +286,25 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 				   size_t length, loff_t *pos)
 {
 	struct amd_pmf_dev *dev = filp->private_data;
+	unsigned char *new_policy_buf;
 	int ret;
 
 	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
 	if (length > POLICY_BUF_MAX_SZ || length == 0)
 		return -EINVAL;
 
-	dev->policy_sz = length;
-
 	/* re-alloc to the new buffer length of the policy binary */
-	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
-	if (!dev->policy_buf)
+	new_policy_buf = kzalloc(length, GFP_KERNEL);
+	if (!new_policy_buf)
 		return -ENOMEM;
 
-	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
+	if (copy_from_user(new_policy_buf, buf, length))
 		return -EFAULT;
 
+	kfree(dev->policy_buf);
+	dev->policy_buf = new_policy_buf;
+	dev->policy_sz = length;
+
 	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret)

Regards,

Hans


> +	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	if (!dev->policy_buf)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
> +		return -EFAULT;
> +
> +	ret = amd_pmf_start_policy_engine(dev);
> +	if (ret)
> +		return -EINVAL;
> +
> +	return length;
> +}
> +
> +static const struct file_operations pb_fops = {
> +	.write = amd_pmf_get_pb_data,
> +	.open = simple_open,
> +};
> +
> +static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
> +{
> +	dev->esbin = debugfs_create_dir("pb", debugfs_root);
> +	debugfs_create_file("update_policy", 0644, dev->esbin, dev, &pb_fops);
> +}
> +
> +static void amd_pmf_remove_pb(struct amd_pmf_dev *dev)
> +{
> +	debugfs_remove_recursive(dev->esbin);
> +}
> +#else
> +static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root) {}
> +static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> +#endif
> +
>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  {
>  	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> @@ -281,6 +335,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
> +	if (pb_side_load)
> +		amd_pmf_open_pb(dev, dev->dbgfs_dir);
> +
>  	return amd_pmf_start_policy_engine(dev);
>  }
>  
> @@ -393,6 +450,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  {
> +	if (pb_side_load)
> +		amd_pmf_remove_pb(dev);
> +
>  	kfree(dev->prev_data);
>  	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);

