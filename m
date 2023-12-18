Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2893D1D158
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uzi3NVpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702907781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mNWqb438BweQiDN2AiFAQD7nqpaayL/O7TdFvzCAs5w=;
	b=Uzi3NVplAtRZhAQ2IutoI7M2fgdtQK/UvkBsRcYV5bhoy1I7yP9NNCY8yYfL0Ee1ygSxpD
	VE7zQRC7hOooAqDpjy6bOA06rJRsTLN1e9a6JA5bmG6mdYuWSe8eWMrf32T8lLXI9mi8l0
	6pIVmvjOzAw+IoKIdYR9E2N4Ys/qftg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-qxz0aLLhPa2avax8g8MzeQ-1; Mon, 18 Dec 2023 08:56:19 -0500
X-MC-Unique: qxz0aLLhPa2avax8g8MzeQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40c42205ed0so26981805e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 05:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907778; x=1703512578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNWqb438BweQiDN2AiFAQD7nqpaayL/O7TdFvzCAs5w=;
        b=dnSt4P/6gmpbo+xXyFW5SzWV+ym6qrzQOBqc9/uYg4rHXVrfExQ7Vi3mv+TId7zSKp
         EI1gLfePXUj356Qr4IZE9F3uCjWZjwnc/4eDn8fHGqs2JpYpuyHdv3QC8RxuvPel+hh9
         u3k3A01e831bkQz93VL0S89/zWq/tfsYo4Aor8hbjFuAG7cGsUmq5EC1ahV2R+WYn45o
         yqBjXHAKGnO0OH2RUeBlJGr8H5KnYF9b15hMUOhcWSs6L+eDp3xqbJyxZKNBetF/Grtk
         Cs/k/7qeUkFUchgzEQuN1RzaaKCwIvsGmIsfluuNp0nUvakuKKf8hiodbXZv6grH+Qdb
         v0tQ==
X-Gm-Message-State: AOJu0YzBWirZy7yWxVj95LpocVnX9taVX5jK7iC4ajDMwU65dDfqBxWO
	f8+wB0kfAwu7K8eax0DwbzWwGLNKsEAhj5+V08F7pl4xYddrAV93rtw1qvoDBMZEWJo80FcFOE5
	5obz3DTjEhsH8BT4g0+QruWuvwHmSXDDxrFW9+AIsiA==
X-Received: by 2002:a7b:c390:0:b0:40b:5e59:e9fa with SMTP id s16-20020a7bc390000000b0040b5e59e9famr8076058wmj.153.1702906443277;
        Mon, 18 Dec 2023 05:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCbRyEBlFybVnpj9CAKorafGoAlhEh75OqbgM6OS76uF+XDk/K2M6NcA4M9S4o8Uquffz0KQ==
X-Received: by 2002:a7b:c390:0:b0:40b:5e59:e9fa with SMTP id s16-20020a7bc390000000b0040b5e59e9famr8076046wmj.153.1702906442893;
        Mon, 18 Dec 2023 05:34:02 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id vs4-20020a170907a58400b00a22fb8901c4sm7411071ejc.12.2023.12.18.05.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 05:34:02 -0800 (PST)
Message-ID: <339541dc-78ff-4e5f-9ee5-7374b1bb6674@redhat.com>
Date: Mon, 18 Dec 2023 14:34:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] platform/x86: Move dev from platdev to hsmp_socket
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
 <20231212103644.768460-6-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212103644.768460-6-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 11:36, Suma Hegde wrote:
> On an ACPI enabled platforms the probe is called for each socket
> and the struct dev is different for each socket. This change
> will help in handling both ACPI and non-ACPI platforms.
> 
> Also change pr_err to dev_err API.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/amd/hsmp.c | 42 +++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 44b15c1fab6a..87af1ad5c645 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -69,13 +69,13 @@ struct hsmp_socket {
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
>  	struct pci_dev *root;
> +	struct device *dev;
>  	u16 sock_ind;
>  };
>  
>  struct hsmp_plat_device {
>  	struct miscdevice hsmp_device;
>  	struct hsmp_socket *sock;
> -	struct device *dev;
>  	u32 proto_ver;
>  	u16 num_sockets;
>  };
> @@ -279,8 +279,9 @@ static int hsmp_test(u16 sock_ind, u32 value)
>  
>  	/* Check the response value */
>  	if (msg.args[0] != (value + 1)) {
> -		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
> -		       sock_ind, (value + 1), msg.args[0]);
> +		dev_err(plat_dev.sock[sock_ind].dev,
> +			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
> +			sock_ind, (value + 1), msg.args[0]);
>  		return -EBADE;
>  	}
>  
> @@ -359,12 +360,12 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  
>  	/* Do not support lseek(), reads entire metric table */
>  	if (count < bin_attr->size) {
> -		dev_err(plat_dev.dev, "Wrong buffer size\n");
> +		dev_err(sock->dev, "Wrong buffer size\n");
>  		return -EINVAL;
>  	}
>  
>  	if (!sock) {
> -		dev_err(plat_dev.dev, "Failed to read attribute private data\n");
> +		dev_err(sock->dev, "Failed to read attribute private data\n");
>  		return -EINVAL;
>  	}
>  
> @@ -400,13 +401,13 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  	 */
>  	dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
>  	if (!dram_addr) {
> -		dev_err(plat_dev.dev, "Invalid DRAM address for metric table\n");
> +		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>  		return -ENOMEM;
>  	}
> -	sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
> +	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>  					     sizeof(struct hsmp_metric_table));
>  	if (!sock->metric_tbl_addr) {
> -		dev_err(plat_dev.dev, "Failed to ioremap metric table addr\n");
> +		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
>  	}
>  	return 0;
> @@ -454,14 +455,15 @@ static int hsmp_create_sysfs_interface(void)
>  	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>  		return -ERANGE;
>  
> -	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
> +	hsmp_attr_grps = devm_kzalloc(plat_dev.sock[0].dev, sizeof(struct attribute_group *) *
>  				      (plat_dev.num_sockets + 1), GFP_KERNEL);
>  	if (!hsmp_attr_grps)
>  		return -ENOMEM;
>  
>  	/* Create a sysfs directory for each socket */
>  	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
> +		attr_grp = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct attribute_group),
> +					GFP_KERNEL);
>  		if (!attr_grp)
>  			return -ENOMEM;
>  
> @@ -469,7 +471,7 @@ static int hsmp_create_sysfs_interface(void)
>  		attr_grp->name = plat_dev.sock[i].name;
>  
>  		/* Null terminated list of attributes */
> -		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
> +		hsmp_bin_attrs = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct bin_attribute *) *
>  					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
>  		if (!hsmp_bin_attrs)
>  			return -ENOMEM;
> @@ -483,7 +485,7 @@ static int hsmp_create_sysfs_interface(void)
>  		if (ret)
>  			return ret;
>  	}
> -	return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
> +	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
>  }
>  
>  static int hsmp_cache_proto_ver(void)
> @@ -502,7 +504,7 @@ static int hsmp_cache_proto_ver(void)
>  	return ret;
>  }
>  
> -static int initialize_platdev(void)
> +static int initialize_platdev(struct device *dev)
>  {
>  	int i;
>  
> @@ -511,6 +513,7 @@ static int initialize_platdev(void)
>  			return -ENODEV;
>  		plat_dev.sock[i].root			= node_to_amd_nb(i)->root;
>  		plat_dev.sock[i].sock_ind		= i;
> +		plat_dev.sock[i].dev			= dev;
>  		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
>  		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
>  		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
> @@ -530,18 +533,17 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  				     GFP_KERNEL);
>  	if (!plat_dev.sock)
>  		return -ENOMEM;
> -	plat_dev.dev = &pdev->dev;
>  
> -	ret = initialize_platdev();
> +	ret = initialize_platdev(&pdev->dev);
>  	if (ret)
>  		return ret;
>  
>  	/* Test the hsmp interface */
>  	ret = hsmp_test(0, 0xDEADBEEF);
>  	if (ret) {
> -		pr_err("HSMP test message failed on Fam:%x model:%x\n",
> -		       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -		pr_err("Is HSMP disabled in BIOS ?\n");
> +		dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
>  		return ret;
>  	}
>  
> @@ -554,13 +556,13 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  
>  	ret = hsmp_cache_proto_ver();
>  	if (ret) {
> -		dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
> +		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
>  		return ret;
>  	}
>  
>  	ret = hsmp_create_sysfs_interface();
>  	if (ret)
> -		dev_err(plat_dev.dev, "Failed to create HSMP sysfs interface\n");
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>  
>  	return misc_register(&plat_dev.hsmp_device);
>  }

