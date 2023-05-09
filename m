Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F461C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 10:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbjEIKHk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 06:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjEIKHj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 06:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A0486AC
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683626811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Ee2GpLLHH/kzapGilZYjM0C/rauu84sArH/NqSdCD8=;
        b=N5RI/WrsOv6qfw030Gm3psNUmJydFlWzsWyaEDHQxcTNXqE0apiwTSPwzViolocIBbPls7
        cjm5E25ayfbs24sWHYJSkHxSj4z4xJ0canDMgt4A6PnLQvXKxUHjGrpDbUQZCPzpS1qQYJ
        S/2gla/wFTeW5aeTvWHFY+3O3nC218Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-INAfXw0vPnqrsanvpoPNyg-1; Tue, 09 May 2023 06:06:49 -0400
X-MC-Unique: INAfXw0vPnqrsanvpoPNyg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-969d75fec7aso101915066b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 03:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683626808; x=1686218808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ee2GpLLHH/kzapGilZYjM0C/rauu84sArH/NqSdCD8=;
        b=j0gg5DlAgOFariuoejAmCkynLFP/V45dMFzQbncyZH/NonWpYvqD6od9JjDSrhCjCO
         mPpBjggS2LUQexitPDWi1SPjQNt0II/Crtsh8/TxvaurQbWgSv6WCJqVgSzfsscv7odW
         PNGgYNYfYD2NyKB8Dk9fH7Kv4UA1f3i/fcq6lQGPPRB2RsEsfnPqjvByCVzK9v9m2U7N
         5sNSwBuEyUrACL4kD4zkuOqOJwug9t5PbxiVeBOVFuaE2A5uZ41egcwXv3f22dTlREEc
         d1swgetx/uALzC2A696RALzsDz+lZd6oL5x4+f7Yisfujin3VSnaNlK+w3R2zywO+kXE
         Fqcg==
X-Gm-Message-State: AC+VfDwu3YVH+TGIM5m5CCxLWAQrfIe/v+6nx9ijrcWgbIccIGQ1hqCL
        tX/PiYLn6ZS8NdC8uGXCvld8gYIwkZHHr4assAPFEqeEifg/urM4mD0rQQGtyNfcHnQJ7LjdiTK
        zo8j+mBexjNLH879f3nXfwj4O0VU+a7gkFQ==
X-Received: by 2002:a17:906:fe43:b0:965:cc76:7716 with SMTP id wz3-20020a170906fe4300b00965cc767716mr10200159ejb.76.1683626807977;
        Tue, 09 May 2023 03:06:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DwLNFUg3qz4ckQ9WWwo7eBVmzRX9n6NtgCN1LLj4ZSqP60p+jWocaXg14o5LQxCTS5psmgA==
X-Received: by 2002:a17:906:fe43:b0:965:cc76:7716 with SMTP id wz3-20020a170906fe4300b00965cc767716mr10200140ejb.76.1683626807613;
        Tue, 09 May 2023 03:06:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ks16-20020a170906f85000b00947740a4373sm1116652ejb.81.2023.05.09.03.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 03:06:47 -0700 (PDT)
Message-ID: <9761b4c2-25c5-12e2-1b89-c76f1eb48c20@redhat.com>
Date:   Tue, 9 May 2023 12:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/1] mlxbf-bootctl: Add sysfs file for BlueField boot
 log
Content-Language: en-US, nl
To:     Liming Sun <limings@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1f778872d177146336318cf856a2c0b06870b1b7.1683568762.git.limings@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1f778872d177146336318cf856a2c0b06870b1b7.1683568762.git.limings@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/8/23 20:01, Liming Sun wrote:
> This commit adds sysfs interface to be used to write into the
> boot log which is 1KB HW buffer on BlueField SoC. The same log
> buffer is also used by firmware code like ATF/UEFI, and can be
> displayed by userspace tools or from external host via USB/PCIe.
> 
> Signed-off-by: Liming Sun <limings@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Vadim, David, I would appreciate if one of you could also
take a look at this patch.

> ---
>  .../testing/sysfs-platform-mellanox-bootctl   |   7 +
>  drivers/platform/mellanox/mlxbf-bootctl.c     | 141 ++++++++++++++++++
>  2 files changed, 148 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> index 9b99a81babb1..239184db57dd 100644
> --- a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> +++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> @@ -75,3 +75,10 @@ KernelVersion:	6.4
>  Contact:	"Liming Sun <limings@nvidia.com>"
>  Description:
>  		The file used to access the BlueField boot fifo.
> +
> +What:		/sys/bus/platform/devices/MLNXBF04:00/rsh_log
> +Date:		May 2023
> +KernelVersion:	6.4
> +Contact:	"Liming Sun <limings@nvidia.com>"
> +Description:
> +		The file used to access the BlueField boot log.

Access suggests reading, but this is a write-only file please make this more clear.

Also please document the accepted prefixes for log levels here / document
the log format.

> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
> index 1bad1d278672..c02062cb3128 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.c
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.c
> @@ -45,10 +45,38 @@ static const char * const mlxbf_bootctl_lifecycle_states[] = {
>  	[3] = "RMA",
>  };
>  
> +/* Log header format. */
> +#define MLXBF_RSH_LOG_TYPE_SHIFT	56
> +#define MLXBF_RSH_LOG_LEN_SHIFT		48
> +#define MLXBF_RSH_LOG_LEVEL_SHIFT	0
> +
> +/* Log module ID and type (only MSG type in Linux driver for now). */
> +#define MLXBF_RSH_LOG_TYPE_MSG		0x04ULL
> +
> +/* Log ctl/data register offset. */
> +#define MLXBF_RSH_SCRATCH_BUF_CTL_OFF	0
> +#define MLXBF_RSH_SCRATCH_BUF_DATA_OFF	0x10
> +
> +/* Log message levels. */
> +enum {
> +	MLXBF_RSH_LOG_INFO,
> +	MLXBF_RSH_LOG_WARN,
> +	MLXBF_RSH_LOG_ERR
> +};
> +
>  /* Mapped pointer for RSH_BOOT_FIFO_DATA and RSH_BOOT_FIFO_COUNT register. */
>  static void __iomem *mlxbf_rsh_boot_data;
>  static void __iomem *mlxbf_rsh_boot_cnt;
>  
> +/* Mapped pointer for rsh log semaphore/ctrl/data register. */
> +static void __iomem *mlxbf_rsh_semaphore;
> +static void __iomem *mlxbf_rsh_scratch_buf_ctl;
> +static void __iomem *mlxbf_rsh_scratch_buf_data;
> +
> +/* Rsh log levels. */
> +static const char * const mlxbf_rsh_log_level[] = {
> +	"INFO", "WARN", "ERR", "ASSERT"};
> +
>  /* ARM SMC call which is atomic and no need for lock. */
>  static int mlxbf_bootctl_smc(unsigned int smc_op, int smc_arg)
>  {
> @@ -266,12 +294,111 @@ static ssize_t fw_reset_store(struct device *dev,
>  	return count;
>  }
>  
> +/* Size(8-byte words) of the log buffer. */
> +#define RSH_SCRATCH_BUF_CTL_IDX_MASK	0x7f
> +
> +static int mlxbf_rsh_log_sem_lock(void)
> +{
> +	unsigned long timeout;
> +
> +	/* Take the semaphore. */
> +	timeout = jiffies + msecs_to_jiffies(100);
> +	while (readq(mlxbf_rsh_semaphore)) {
> +		if (time_after(jiffies, timeout))
> +			return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mlxbf_rsh_log_sem_unlock(void)
> +{
> +	writeq(0, mlxbf_rsh_semaphore);
> +}
> +
> +static ssize_t rsh_log_store(struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	int rc, idx, num, len, size = (int)count, level = MLXBF_RSH_LOG_INFO;
> +	u64 data;
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	if (!mlxbf_rsh_semaphore || !mlxbf_rsh_scratch_buf_ctl)
> +		return -EOPNOTSUPP;
> +
> +	/* Ignore line break at the end. */
> +	if (buf[size - 1] == 0xa)

Please replace 0x0a with '\n' .

> +		size--;
> +
> +	/* Check the message prefix. */
> +	for (idx = 0; idx < ARRAY_SIZE(mlxbf_rsh_log_level); idx++) {
> +		len = strlen(mlxbf_rsh_log_level[idx]);
> +		if (len + 1 < size &&
> +		    !strncmp(buf, mlxbf_rsh_log_level[idx], len)) {
> +			buf += len + 1;

Why len + 1, this seems intended to assume some separator
between prefix and the actual message?  But if that is
the case please also check that the expected separator
character is there.

Otherwise this looks good to me.

Regards,

Hans



> +			size -= len + 1;
> +			level = idx;
> +			break;
> +		}
> +	}
> +
> +	/* Ignore leading spaces. */
> +	while (size > 0 && buf[0] == ' ') {
> +		size--;
> +		buf++;
> +	}
> +
> +	/* Take the semaphore. */
> +	rc = mlxbf_rsh_log_sem_lock();
> +	if (rc)
> +		return rc;
> +
> +	/* Calculate how many words are available. */
> +	num = (size + sizeof(u64) - 1) / sizeof(u64);
> +	idx = readq(mlxbf_rsh_scratch_buf_ctl);
> +	if (idx + num + 1 >= RSH_SCRATCH_BUF_CTL_IDX_MASK)
> +		num = RSH_SCRATCH_BUF_CTL_IDX_MASK - idx - 1;
> +	if (num <= 0)
> +		goto done;
> +
> +	/* Write Header. */
> +	data = (MLXBF_RSH_LOG_TYPE_MSG << MLXBF_RSH_LOG_TYPE_SHIFT) |
> +		((u64)num << MLXBF_RSH_LOG_LEN_SHIFT) |
> +		((u64)level << MLXBF_RSH_LOG_LEVEL_SHIFT);
> +	writeq(data, mlxbf_rsh_scratch_buf_data);
> +
> +	/* Write message. */
> +	for (idx = 0, len = size; idx < num && len > 0; idx++) {
> +		if (len <= sizeof(u64)) {
> +			data = 0;
> +			memcpy(&data, buf, len);
> +			len = 0;
> +		} else {
> +			memcpy(&data, buf, sizeof(u64));
> +			len -= sizeof(u64);
> +			buf += sizeof(u64);
> +		}
> +		writeq(data, mlxbf_rsh_scratch_buf_data);
> +	}
> +
> +done:
> +	/* Release the semaphore. */
> +	mlxbf_rsh_log_sem_unlock();
> +
> +	/* Ignore the rest if no more space. */
> +	return count;
> +}
> +
>  static DEVICE_ATTR_RW(post_reset_wdog);
>  static DEVICE_ATTR_RW(reset_action);
>  static DEVICE_ATTR_RW(second_reset_action);
>  static DEVICE_ATTR_RO(lifecycle_state);
>  static DEVICE_ATTR_RO(secure_boot_fuse_state);
>  static DEVICE_ATTR_WO(fw_reset);
> +static DEVICE_ATTR_WO(rsh_log);
>  
>  static struct attribute *mlxbf_bootctl_attrs[] = {
>  	&dev_attr_post_reset_wdog.attr,
> @@ -280,6 +407,7 @@ static struct attribute *mlxbf_bootctl_attrs[] = {
>  	&dev_attr_lifecycle_state.attr,
>  	&dev_attr_secure_boot_fuse_state.attr,
>  	&dev_attr_fw_reset.attr,
> +	&dev_attr_rsh_log.attr,
>  	NULL
>  };
>  
> @@ -345,6 +473,7 @@ static bool mlxbf_bootctl_guid_match(const guid_t *guid,
>  static int mlxbf_bootctl_probe(struct platform_device *pdev)
>  {
>  	struct arm_smccc_res res = { 0 };
> +	void __iomem *reg;
>  	guid_t guid;
>  	int ret;
>  
> @@ -358,6 +487,18 @@ static int mlxbf_bootctl_probe(struct platform_device *pdev)
>  	if (IS_ERR(mlxbf_rsh_boot_cnt))
>  		return PTR_ERR(mlxbf_rsh_boot_cnt);
>  
> +	/* Get the resource of the bootfifo counter register. */
> +	mlxbf_rsh_semaphore = devm_platform_ioremap_resource(pdev, 2);
> +	if (IS_ERR(mlxbf_rsh_semaphore))
> +		return PTR_ERR(mlxbf_rsh_semaphore);
> +
> +	/* Get the resource of the bootfifo counter register. */
> +	reg = devm_platform_ioremap_resource(pdev, 3);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +	mlxbf_rsh_scratch_buf_ctl = reg + MLXBF_RSH_SCRATCH_BUF_CTL_OFF;
> +	mlxbf_rsh_scratch_buf_data = reg + MLXBF_RSH_SCRATCH_BUF_DATA_OFF;
> +
>  	/* Ensure we have the UUID we expect for this service. */
>  	arm_smccc_smc(MLXBF_BOOTCTL_SIP_SVC_UID, 0, 0, 0, 0, 0, 0, 0, &res);
>  	guid_parse(mlxbf_bootctl_svc_uuid_str, &guid);

