Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B4DC7619A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Apr 2023 14:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238334AbjDEOd6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Apr 2023 10:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237895AbjDEOd6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2023 10:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4ABF1FE3
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Apr 2023 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680705192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u/rUbS50ET7h3fBMgcFR4AAEoQRwM8+dxclPfZ7iXcw=;
        b=RaJQCkryNDL6g670Btm27Qpo2AbMKkBpNm2SMHEQfQIrwzYEmi34nFaQIoS9nxUPp1o7y6
        /zrgsa/P6+7z+DxGMBLrCct2fQyGvnCuEsrSmlOPWD/D2HVjHyt41ItsGOhMbtd6lnKmbC
        G+s7t/dCGy3mlg3Qx5EvyWPIRIeZWFE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-aP6FFQm-PwOWqL-qEfRhQg-1; Wed, 05 Apr 2023 10:33:10 -0400
X-MC-Unique: aP6FFQm-PwOWqL-qEfRhQg-1
Received: by mail-ed1-f69.google.com with SMTP id m18-20020a50d7d2000000b00501dfd867a4so50556086edj.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Apr 2023 07:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680705188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/rUbS50ET7h3fBMgcFR4AAEoQRwM8+dxclPfZ7iXcw=;
        b=uNv3hGMdL8hasNOGn4u9Thg8z2uEA6fj05CLXusVfOTEVGzgEMkhJZaDBVCASQP44I
         9uH6R8e1df3k/HudaCTpdEpAtwHQmQVVxiEHnXz2HlXXKw9wd+jgqDpGgZyJpqIsJ+ZB
         RdfvNmT+7EVCq3y/Tgpxv5O4n1He+g7erCiNYHvRh/kijKNhqqZLJ4VAb34MV1c3Y3Ha
         piy6Dj8/+R4GLni4eHZrTqrxo633YaPz8/Ig/PcX2BAN1oMwWRTIu/Pa8K8N3COYsMgB
         UpoWv+a1FlhkZtosxdHtkHj+DXy8W6H0gwzVOhJPQtfE5/ou0z/jjcyvoOBmvMJGE7+P
         C/pA==
X-Gm-Message-State: AAQBX9cU3bJhfo7Kubdh27cFr8Vwh+uvcSm5rCg6lRtT07BygUVnGHPX
        /fpbcmyjWeoJDXXC/60Tr3G3SssAwP7k1L6AkdxAmYsqsojpnTb8OtiVPZ29yEeypKlaUTslX/1
        fu5G4+z8zRjlrmTj4otUMja8xO6XvxFrq7Q==
X-Received: by 2002:a17:907:11c8:b0:878:5372:a34b with SMTP id va8-20020a17090711c800b008785372a34bmr2984726ejb.45.1680705188361;
        Wed, 05 Apr 2023 07:33:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPPE1PAdz6Uu4eOmJlSv2zZtAW310HbeekJVe4Ya9JzuFz9kwB3p8Cid3aTR5/yOHZn3/TvQ==
X-Received: by 2002:a17:907:11c8:b0:878:5372:a34b with SMTP id va8-20020a17090711c800b008785372a34bmr2984709ejb.45.1680705188111;
        Wed, 05 Apr 2023 07:33:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z12-20020a1709064e0c00b00882f9130eafsm7317706eju.26.2023.04.05.07.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 07:33:07 -0700 (PDT)
Message-ID: <7ec19101-0288-71e1-cdca-cfe7acbbe0e9@redhat.com>
Date:   Wed, 5 Apr 2023 16:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/1 RESEND] platform/mellanox: add firmware reset
 support
To:     Khalil Blaiech <kblaiech@nvidia.com>, markgross@kernel.org,
        vadimp@nvidia.com
Cc:     platform-driver-x86@vger.kernel.org, davthompson@nvidia.com,
        linux-kernel@vger.kernel.org
References: <10da04fa43e8acce5d4ec173e225c28b9e979e4b.1675790783.git.kblaiech@nvidia.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <10da04fa43e8acce5d4ec173e225c28b9e979e4b.1675790783.git.kblaiech@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Khalil,

On 4/5/23 15:16, Khalil Blaiech wrote:
> Add a new sysfs to initiate firmware reset in isolation mode.
> 
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>

Why are you resending this less then 24 hours after the initial submission ?

Regards,

Hans


> ---
>  drivers/platform/mellanox/mlxbf-bootctl.c | 19 +++++++++++++++++++
>  drivers/platform/mellanox/mlxbf-bootctl.h |  6 ++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
> index 1c7a288b59a5..5e41c270195c 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.c
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.c
> @@ -244,11 +244,29 @@ static ssize_t secure_boot_fuse_state_show(struct device *dev,
>  	return buf_len;
>  }
>  
> +static ssize_t fw_reset_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	unsigned long key;
> +	int err;
> +
> +	err = kstrtoul(buf, 16, &key);
> +	if (err)
> +		return err;
> +
> +	if (mlxbf_bootctl_smc(MLXBF_BOOTCTL_FW_RESET, key) < 0)
> +		return -EINVAL;
> +
> +	return count;
> +}
> +
>  static DEVICE_ATTR_RW(post_reset_wdog);
>  static DEVICE_ATTR_RW(reset_action);
>  static DEVICE_ATTR_RW(second_reset_action);
>  static DEVICE_ATTR_RO(lifecycle_state);
>  static DEVICE_ATTR_RO(secure_boot_fuse_state);
> +static DEVICE_ATTR_WO(fw_reset);
>  
>  static struct attribute *mlxbf_bootctl_attrs[] = {
>  	&dev_attr_post_reset_wdog.attr,
> @@ -256,6 +274,7 @@ static struct attribute *mlxbf_bootctl_attrs[] = {
>  	&dev_attr_second_reset_action.attr,
>  	&dev_attr_lifecycle_state.attr,
>  	&dev_attr_secure_boot_fuse_state.attr,
> +	&dev_attr_fw_reset.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.h b/drivers/platform/mellanox/mlxbf-bootctl.h
> index 148fdb43b435..b48243f60a59 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.h
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.h
> @@ -75,6 +75,12 @@
>  
>  #define MLXBF_BOOTCTL_GET_DIMM_INFO		0x82000008
>  
> +/*
> + * Initiate Firmware Reset via TYU. This might be invoked during the reset
> + * flow in isolation mode.
> + */
> +#define MLXBF_BOOTCTL_FW_RESET  0x8200000D
> +
>  /* SMC function IDs for SiP Service queries */
>  #define MLXBF_BOOTCTL_SIP_SVC_CALL_COUNT	0x8200ff00
>  #define MLXBF_BOOTCTL_SIP_SVC_UID		0x8200ff01

