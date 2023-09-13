Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48C1EDEC73
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Sep 2023 15:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjIMPa1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 11:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjIMPaM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 11:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 408BC1FF1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694618955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k6Caracy5xcrqm99gFeC/lMsoNzeMeAxsTyy4jpwbf4=;
        b=ZUY/HTh7W3iky4hYyf62mJsxyTGX/LNmDWvvSTK0kmis9crIggMvzv2zV53MtbZai2G+dw
        oku6KZA1wTmiosxmt4WbCQtIQOenzfOybJG18w3BA/bj1+fEGtexG1WXpjlKfcbDYPwJHF
        +pY//HJR+bA/P4WfA8sYay/oee1H7/I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-FeNhLDm2M2OCq1wb_mCaCw-1; Wed, 13 Sep 2023 11:29:13 -0400
X-MC-Unique: FeNhLDm2M2OCq1wb_mCaCw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34a0b75eso421771666b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 08:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694618952; x=1695223752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6Caracy5xcrqm99gFeC/lMsoNzeMeAxsTyy4jpwbf4=;
        b=Zzfhg2pX5A27A1BtoDP9HXFb3jMWp5ZKbeLIMx1DgFIPUtu0p0BKB8LoXoSaBc1nVn
         +bnBnuDmZsiRrlF/8sS7KZ9zgNeMXECiRQWRKkEUvWbVZ+FYtT36CTqyaCd7tQ0Dtbev
         JXKKfgyQnmyDh6Zg6m15rQ1SCRbAdcc5gdPX0xhibIvUQrTfAVj6MBwGxUVBBx6jcP+H
         65sTw4DWh8xSXKZIzKSo3Y3ZNOl3Jloc164+aqjiL0XXzCuesn/2YJ55P7ehrzxKH3tY
         nGtLzZB5oxqtL5jhGvUlyABs+ZHK2cAD4+T8qmvJIs06WkDjKfUwMn7pNS5reQlOpho8
         al5w==
X-Gm-Message-State: AOJu0YxVadAMSrkza5MrIHgBv42a6xFF96Q+CoMPjFKKt3+eWBAWn5Xw
        rioD/62ek3jHnjP/C2pQa8z/rgvlx2+pZXbbjkf/a0EZslCdliKKaLxqrXMLivLEys5LGZ6xMtm
        pdXETBOtgIw79U5uvzgVrrtb3LQUHa6niDQ==
X-Received: by 2002:a17:906:32da:b0:9a5:d657:47e5 with SMTP id k26-20020a17090632da00b009a5d65747e5mr2239110ejk.49.1694618952439;
        Wed, 13 Sep 2023 08:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzaoBG1L2Nvk1WkcTu8Fg+esbIiFARcVWy//x8a3Owu0GknNYj8io6BUwCm7fhENhFo2LlBQ==
X-Received: by 2002:a17:906:32da:b0:9a5:d657:47e5 with SMTP id k26-20020a17090632da00b009a5d65747e5mr2239093ejk.49.1694618951937;
        Wed, 13 Sep 2023 08:29:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ck19-20020a170906c45300b009a1a653770bsm8628701ejb.87.2023.09.13.08.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 08:29:11 -0700 (PDT)
Message-ID: <55d0a6cd-8de5-3cb1-b75c-519c4fb6c5ec@redhat.com>
Date:   Wed, 13 Sep 2023 17:28:37 +0200
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

