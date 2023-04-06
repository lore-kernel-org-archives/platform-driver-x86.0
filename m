Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB11C76196
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 12:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjDFM2z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjDFM2y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 08:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB39140C6
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680784092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u7AnMsWo/iJ5OTsTaA2l0gb9MT+nu7FOs61UeuJ4cHE=;
        b=Y/vrjJdTcASoQU00AKgDbw7mZ6UBJAYaFarzkKYblvYQqskXqGB6c+0MBMcILffVzaGYy2
        yIlOEB0NWQyOmJe+6LgLRvfuPcb7AhOuCzu7U2mCi4y1s53MKvEZqdi61ULQ7zQ3yQ1sUG
        bP5nag1yJaAXSyjfKyg2p5tN1WITNbc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-vm6dVZfVPt2mNt3Brl6n9g-1; Thu, 06 Apr 2023 08:28:10 -0400
X-MC-Unique: vm6dVZfVPt2mNt3Brl6n9g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50470e94f8dso63860a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Apr 2023 05:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680784088; x=1683376088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7AnMsWo/iJ5OTsTaA2l0gb9MT+nu7FOs61UeuJ4cHE=;
        b=KuWKqGCpYBtWgPI3uj5E12OoDv78UXvDVj6W8Kqy74oFp6++wB3HnZYQzhkEVAaLrt
         O3PwaHzOiZP+yvfaO52k8WdGFSTeqfgMsT7lgFryAYtReJGeutUxvdcdMozEj/cNngTG
         uwsnoB4F8ObxMZWbfdwvMHmr7v6YzSeaHv0p5F90ayYwPGuVA2ExJsBMGrxwnmGjFU62
         FZ89GUD20O2Nou2+rbDdl0ciFVg5+dBRRg9ttgBDK2Gf5iArVdsc8vlFtqbTo3KCn46z
         RqimIj6LyVKmD3flOwhyI3LMNfWbzDQ8j6xYbTobYcZ6CEAKZQUytljwwIuqkAX0mQFN
         NMWw==
X-Gm-Message-State: AAQBX9cwx1OerGOpNi+jNRmvwg9NQrs4cXDK/UVZ9pM5ZnlVficT8Mvj
        MRBMxAQlsCIKEyWdqw2ydUBWjAmJ2+9/x8pnBz7mAFHbPCvIOzmFFKWm0rlymYhOzQ0KUg/a+4D
        pbO+T2Vy6O/MvMCztthmf60Y1xYEmNh3m1rBymyoYgQ==
X-Received: by 2002:a50:fe8f:0:b0:502:3376:dbe1 with SMTP id d15-20020a50fe8f000000b005023376dbe1mr5331210edt.15.1680784088038;
        Thu, 06 Apr 2023 05:28:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350aJA72xs/8X3yGFMyNsV6577vfrcW9WcRoy9xzkdV6qKMs6UuoqQgClvcnyLctjkzdOLZld2Q==
X-Received: by 2002:a50:fe8f:0:b0:502:3376:dbe1 with SMTP id d15-20020a50fe8f000000b005023376dbe1mr5331193edt.15.1680784087727;
        Thu, 06 Apr 2023 05:28:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a24-20020aa7cf18000000b005023aaf52desm668444edy.95.2023.04.06.05.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:28:07 -0700 (PDT)
Message-ID: <a872def2-9738-cdc2-51ff-74ae3a27de4b@redhat.com>
Date:   Thu, 6 Apr 2023 14:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/1 RESEND] platform/mellanox: add firmware reset
 support
Content-Language: en-US, nl
To:     Khalil Blaiech <kblaiech@nvidia.com>, markgross@kernel.org,
        vadimp@nvidia.com
Cc:     platform-driver-x86@vger.kernel.org, davthompson@nvidia.com,
        linux-kernel@vger.kernel.org
References: <10da04fa43e8acce5d4ec173e225c28b9e979e4b.1675790783.git.kblaiech@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <10da04fa43e8acce5d4ec173e225c28b9e979e4b.1675790783.git.kblaiech@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/5/23 15:16, Khalil Blaiech wrote:
> Add a new sysfs to initiate firmware reset in isolation mode.
> 
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>

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

