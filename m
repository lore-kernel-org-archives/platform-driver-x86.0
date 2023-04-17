Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49FDC77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 08:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjDQISa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 04:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjDQIS2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 04:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB4949D5
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 01:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681719461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l2MAcZjawswk5Dyu4gaGw9ebGfX047b7xcVBpLRwA8o=;
        b=TzWULkBllsbQajVSVVCXCYUx9Mp86Z0UqodkbA2bm9For7El6QaDJiD/6yFpTog2RU+TBR
        jlyPza7C1+JfLyDbRhpmVHb9XKGLx9cpB4z63ocP2sSRP+ISr7/IjyPLCJkDPXBKWWgaGI
        2yt2/xIHtF1xtGOkmlHyczdN2+T4gkM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-YZK18BxTM2CwqAuXpRmbSw-1; Mon, 17 Apr 2023 04:17:40 -0400
X-MC-Unique: YZK18BxTM2CwqAuXpRmbSw-1
Received: by mail-ed1-f71.google.com with SMTP id i17-20020a50d751000000b005045c08ca6dso16223469edj.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 01:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681719459; x=1684311459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2MAcZjawswk5Dyu4gaGw9ebGfX047b7xcVBpLRwA8o=;
        b=eMolFakU0ybGBz25wdS7I2JYzN8fy2/8lFPan4ucINDNP2QYTSgBNpxEukNvl9mH4n
         10WOqjgMr415liaimc08FYVXRVOQZ74POn2MOrtYLLq+w26jqp8TJK4xL74zjJCNEbbL
         f7Ci6fchbKoJMIeOoqgbqbT8JLqVjA6wyWh36NsEX69luWSVDA3UuMXxTUAXGEpEW+b/
         4Yg9LkWkTFuqaspb0ci5PB8tum8MEJKiHJzv8GTjQVMruu1idxke0C2qrib7aoLlpHPF
         3JQAR39+0X1ThJ4O02aP5iNHM6DLa57P16aqvK3f0TX1FQCdozwgX762kK4IA67Ube2R
         sx/g==
X-Gm-Message-State: AAQBX9caeQEtF3mDa8ht4xGaFedV0xg17mPCS0mHx7jiA1Q+pwShmNzv
        qYmBRP3mnr9c56BiV5sdyq7wi0Miy2gkmW0tK0WnWQP3YRzre8JONthZXPcpm3Kk2zzvaN87O9i
        Imap2wdYfMkQ3fUXeYWe+zsnIH00TdP+1SA==
X-Received: by 2002:a17:906:b202:b0:933:4556:d1cd with SMTP id p2-20020a170906b20200b009334556d1cdmr6295338ejz.33.1681719458919;
        Mon, 17 Apr 2023 01:17:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHHSiwtPrJY2nMIZllujalWq3N3VKceGokwWi9zf6gc7irFTWPArAeq+YyARFTaJ/VjnSVzw==
X-Received: by 2002:a17:906:b202:b0:933:4556:d1cd with SMTP id p2-20020a170906b20200b009334556d1cdmr6295323ejz.33.1681719458505;
        Mon, 17 Apr 2023 01:17:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id og4-20020a1709071dc400b0094f158ebfc8sm3426228ejc.166.2023.04.17.01.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 01:17:37 -0700 (PDT)
Message-ID: <c4554f47-83e2-32d4-e30c-9610c35d9065@redhat.com>
Date:   Mon, 17 Apr 2023 10:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/1] mlxbf-bootctl: Add sysfs file for BlueField boot
 fifo
Content-Language: en-US, nl
To:     Liming Sun <limings@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <52b0b00dacbc4aad3169dd3667d79c85e334783b.1680657571.git.limings@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <52b0b00dacbc4aad3169dd3667d79c85e334783b.1680657571.git.limings@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/11/23 17:39, Liming Sun wrote:
> This commit adds sysfs file for BlueField boot fifo. The boot
> fifo is usually used to push boot stream via USB or PCIe. Once
> OS is up, it can be reused by applications to read data or
> configuration from external host.
> 
> Signed-off-by: Liming Sun <limings@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  .../testing/sysfs-platform-mellanox-bootctl   |  7 ++
>  drivers/platform/mellanox/mlxbf-bootctl.c     | 68 +++++++++++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> index e79ca22e2f45..9b99a81babb1 100644
> --- a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> +++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> @@ -68,3 +68,10 @@ Description:
>  		Wasted   burnt and invalid
>  		Invalid  not burnt but marked as valid (error state).
>  		=======  ===============================================
> +
> +What:		/sys/bus/platform/devices/MLNXBF04:00/bootfifo
> +Date:		Apr 2023
> +KernelVersion:	6.4
> +Contact:	"Liming Sun <limings@nvidia.com>"
> +Description:
> +		The file used to access the BlueField boot fifo.
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
> index 1c7a288b59a5..d4463bb632e1 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.c
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
> @@ -44,6 +45,10 @@ static const char * const mlxbf_bootctl_lifecycle_states[] = {
>  	[3] = "RMA",
>  };
>  
> +/* Mapped pointer for RSH_BOOT_FIFO_DATA and RSH_BOOT_FIFO_COUNT register. */
> +static void __iomem *mlxbf_rsh_boot_data;
> +static void __iomem *mlxbf_rsh_boot_cnt;
> +
>  /* ARM SMC call which is atomic and no need for lock. */
>  static int mlxbf_bootctl_smc(unsigned int smc_op, int smc_arg)
>  {
> @@ -268,6 +273,45 @@ static const struct acpi_device_id mlxbf_bootctl_acpi_ids[] = {
>  
>  MODULE_DEVICE_TABLE(acpi, mlxbf_bootctl_acpi_ids);
>  
> +static ssize_t mlxbf_bootctl_bootfifo_read(struct file *filp,
> +					   struct kobject *kobj,
> +					   struct bin_attribute *bin_attr,
> +					   char *buf, loff_t pos,
> +					   size_t count)
> +{
> +	unsigned long timeout = msecs_to_jiffies(500);
> +	unsigned long expire = jiffies + timeout;
> +	u64 data, cnt = 0;
> +	char *p = buf;
> +
> +	while (count >= sizeof(data)) {
> +		/* Give up reading if no more data within 500ms. */
> +		if (!cnt) {
> +			cnt = readq(mlxbf_rsh_boot_cnt);
> +			if (!cnt) {
> +				if (time_after(jiffies, expire))
> +					break;
> +				usleep_range(10, 50);
> +				continue;
> +			}
> +		}
> +
> +		data = readq(mlxbf_rsh_boot_data);
> +		memcpy(p, &data, sizeof(data));
> +		count -= sizeof(data);
> +		p += sizeof(data);
> +		cnt--;
> +		expire = jiffies + timeout;
> +	}
> +
> +	return p - buf;
> +}
> +
> +static struct bin_attribute mlxbf_bootctl_bootfifo_sysfs_attr = {
> +	.attr = { .name = "bootfifo", .mode = 0400 },
> +	.read = mlxbf_bootctl_bootfifo_read,
> +};
> +
>  static bool mlxbf_bootctl_guid_match(const guid_t *guid,
>  				     const struct arm_smccc_res *res)
>  {
> @@ -285,6 +329,16 @@ static int mlxbf_bootctl_probe(struct platform_device *pdev)
>  	guid_t guid;
>  	int ret;
>  
> +	/* Get the resource of the bootfifo data register. */
> +	mlxbf_rsh_boot_data = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mlxbf_rsh_boot_data))
> +		return PTR_ERR(mlxbf_rsh_boot_data);
> +
> +	/* Get the resource of the bootfifo counter register. */
> +	mlxbf_rsh_boot_cnt = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(mlxbf_rsh_boot_cnt))
> +		return PTR_ERR(mlxbf_rsh_boot_cnt);
> +
>  	/* Ensure we have the UUID we expect for this service. */
>  	arm_smccc_smc(MLXBF_BOOTCTL_SIP_SVC_UID, 0, 0, 0, 0, 0, 0, 0, &res);
>  	guid_parse(mlxbf_bootctl_svc_uuid_str, &guid);
> @@ -302,11 +356,25 @@ static int mlxbf_bootctl_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		dev_warn(&pdev->dev, "Unable to reset the EMMC boot mode\n");
>  
> +	ret = sysfs_create_bin_file(&pdev->dev.kobj,
> +				    &mlxbf_bootctl_bootfifo_sysfs_attr);
> +	if (ret)
> +		pr_err("Unable to create bootfifo sysfs file, error %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int mlxbf_bootctl_remove(struct platform_device *pdev)
> +{
> +	sysfs_remove_bin_file(&pdev->dev.kobj,
> +			      &mlxbf_bootctl_bootfifo_sysfs_attr);
> +
>  	return 0;
>  }
>  
>  static struct platform_driver mlxbf_bootctl_driver = {
>  	.probe = mlxbf_bootctl_probe,
> +	.remove = mlxbf_bootctl_remove,
>  	.driver = {
>  		.name = "mlxbf-bootctl",
>  		.dev_groups = mlxbf_bootctl_groups,

