Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF4CEDEC78
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Sep 2023 15:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjIMP2b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 11:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjIMP22 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 11:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EFAD61724
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694618863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k6Caracy5xcrqm99gFeC/lMsoNzeMeAxsTyy4jpwbf4=;
        b=XxoY0WO7l8fiFmIdfjkEc64RMMZcapWStvGIj5zMSvj3qO/YWC9WZE/mf7CTp1VP4EC3+G
        bu7g9IIiceQGtHCXXQhIQLn6KQtBREA7rXAhl1JzOYZnY8yKL6CLa4PhSKisipHgDyF70O
        jkx+ZTYzGF1NzScUiAWn1VbPcDJpDW8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-r0-esHBxOvG99vAPhOhL1Q-1; Wed, 13 Sep 2023 11:27:41 -0400
X-MC-Unique: r0-esHBxOvG99vAPhOhL1Q-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-502a52cae6bso5206771e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 08:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694618860; x=1695223660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6Caracy5xcrqm99gFeC/lMsoNzeMeAxsTyy4jpwbf4=;
        b=q/yvMzqjlGEyW2oVcaeIeWTJloUZnlJ77e3VjOUdcVHwzjngXLxspNUtxw3Uf3xRHV
         1q8mfpVNw+4EPJrCT/AQmt8NDJlW4NavI71Kry+btc69QsyhF2tR5vl7JJ1797TFF2y3
         YJyt6VTyaHOC4LTPgbQEjAmfcx8z6L0Q6+G/VS+vrsd94uyNtxWUAY5Swro16xKPFd3F
         PpVLSF3ST+DuVa6+DflBDtkQ8EdWVhyeBPfeTlI13r6JszRsdn+MtJMHxWmI10rbMNUi
         punbfcZcoEsU0fUWIdfMt/mbTZojQfFh9tvwb4/4fbNbI4mi58lJ2Gm9bfdbfNA3vgav
         Ns2g==
X-Gm-Message-State: AOJu0YzUgFjCf9lTfBqzKV9dA2jgIDojMx/tJLP0S/AJsHznMTAh+eXe
        4ddBHCV0SkTbK9WK5/JMUv5Uyq1AA1ixkD5YAT7WeJOQxhsbRo4kfuticcUhuGVh3oH/YxuX+pM
        49LLd4KSi2zKE7vQ0tsxIB3WQDRPzhlb+o2HiDUPbuA==
X-Received: by 2002:a05:6512:3f08:b0:500:78ee:4cd7 with SMTP id y8-20020a0565123f0800b0050078ee4cd7mr2737074lfa.23.1694618860069;
        Wed, 13 Sep 2023 08:27:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmO/LD7isQGiEj2y+pJoBhK+DVLmxLBBtqmVpRIuZIWnltTiWXezhEDFP0/n0/9/YtAGuP4A==
X-Received: by 2002:a05:6512:3f08:b0:500:78ee:4cd7 with SMTP id y8-20020a0565123f0800b0050078ee4cd7mr2737055lfa.23.1694618859670;
        Wed, 13 Sep 2023 08:27:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l15-20020aa7d94f000000b0052338f5b2a4sm7502766eds.86.2023.09.13.08.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 08:27:38 -0700 (PDT)
Message-ID: <912ddb30-136c-b066-aae4-8726f8f8d035@redhat.com>
Date:   Wed, 13 Sep 2023 17:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/4] platform/x86/amd/hsmp: create plat specific struct
Content-Language: en-US, nl
To:     Suma Hegde <Suma.Hegde@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230906071302.291260-1-Suma.Hegde@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230906071302.291260-1-Suma.Hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Suma,

Thank you for the patch.

On 9/6/23 09:12, Suma Hegde wrote:
> From: Suma Hegde <suma.hegde@amd.com>
> 
> Having a separate platform device structure helps in future, to
> contain platform specific variables and other data.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v1:
> 1. defined HSMP_CDEV_NAME and HSMP_DEVNODE_NAME macros
> 
>  drivers/platform/x86/amd/hsmp.c | 56 +++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 31382ef52efb..94c65320bdcd 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -47,9 +47,23 @@
>  #define HSMP_INDEX_REG		0xc4
>  #define HSMP_DATA_REG		0xc8
>  
> -static struct semaphore *hsmp_sem;
> +#define HSMP_CDEV_NAME		"hsmp_cdev"
> +#define HSMP_DEVNODE_NAME	"hsmp"
>  
> -static struct miscdevice hsmp_device;
> +struct hsmp_socket {
> +	struct semaphore hsmp_sem;
> +	u16 sock_ind;
> +};
> +
> +struct hsmp_plat_device {
> +	struct miscdevice hsmp_device;
> +	struct hsmp_socket *sock;
> +	struct device *dev;
> +};
> +
> +static u16 num_sockets;

Overall this patch looks good to me, but since
num_sockets indicates the size of the plat_dev.sock array,
num_sockets should IMHO itself also be part of
struct hsmp_plat_device.

(and all usages of "num_sockets" should then be replaced by
"plat_dev.num_sockets")

Other then that this looks good to me.

Regards,

Hans





> +
> +static struct hsmp_plat_device plat_dev;
>  
>  static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
>  			 u32 *value, bool write)
> @@ -188,6 +202,7 @@ static int validate_message(struct hsmp_message *msg)
>  
>  int hsmp_send_message(struct hsmp_message *msg)
>  {
> +	struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
>  	struct amd_northbridge *nb;
>  	int ret;
>  
> @@ -208,14 +223,13 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	 * In SMP system timeout of 100 millisecs should
>  	 * be enough for the previous thread to finish the operation
>  	 */
> -	ret = down_timeout(&hsmp_sem[msg->sock_ind],
> -			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
> +	ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
>  	if (ret < 0)
>  		return ret;
>  
>  	ret = __hsmp_send_message(nb->root, msg);
>  
> -	up(&hsmp_sem[msg->sock_ind]);
> +	up(&sock->hsmp_sem);
>  
>  	return ret;
>  }
> @@ -321,28 +335,31 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
>  	int i;
>  
> -	hsmp_sem = devm_kzalloc(&pdev->dev,
> -				(amd_nb_num() * sizeof(struct semaphore)),
> -				GFP_KERNEL);
> -	if (!hsmp_sem)
> +	plat_dev.sock = devm_kzalloc(&pdev->dev,
> +				     (num_sockets * sizeof(struct hsmp_socket)),
> +				     GFP_KERNEL);
> +	if (!plat_dev.sock)
>  		return -ENOMEM;
> +	plat_dev.dev = &pdev->dev;
>  
> -	for (i = 0; i < amd_nb_num(); i++)
> -		sema_init(&hsmp_sem[i], 1);
> +	for (i = 0; i < num_sockets; i++) {
> +		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
> +		plat_dev.sock[i].sock_ind = i;
> +	}
>  
> -	hsmp_device.name	= "hsmp_cdev";
> -	hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> -	hsmp_device.fops	= &hsmp_fops;
> -	hsmp_device.parent	= &pdev->dev;
> -	hsmp_device.nodename	= "hsmp";
> -	hsmp_device.mode	= 0644;
> +	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> +	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> +	plat_dev.hsmp_device.fops	= &hsmp_fops;
> +	plat_dev.hsmp_device.parent	= &pdev->dev;
> +	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
> +	plat_dev.hsmp_device.mode	= 0644;
>  
> -	return misc_register(&hsmp_device);
> +	return misc_register(&plat_dev.hsmp_device);
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
> -	misc_deregister(&hsmp_device);
> +	misc_deregister(&plat_dev.hsmp_device);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> @@ -358,7 +375,6 @@ static struct platform_device *amd_hsmp_platdev;
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
> -	u16 num_sockets;
>  	int i;
>  
>  	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {

