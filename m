Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C920CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 13:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbiKQNTm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 08:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbiKQNTm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 08:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3362C10D
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668691127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RhNeVeGXMYYXWnz8b2c3imCIGNZyFL2jLVPCJnULsd0=;
        b=GG/161q8d/Ws+zSJT935cq7lHcLJknyukbzE+Va+ULphNLE5YXvP7hwuXVR/NsGLdFuSMd
        z6HCQvE4WVwwYJP2EuVUYFTIL/edpEnN25rpEnenwso95meSKNNXNJ0PAS7fR3Dtv7J8Ub
        dbsTH7EUG0DHuqCkNb77ktU1NbiXv9g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-pwAnmEm0MlyJfhnREtw51Q-1; Thu, 17 Nov 2022 08:18:46 -0500
X-MC-Unique: pwAnmEm0MlyJfhnREtw51Q-1
Received: by mail-ej1-f71.google.com with SMTP id sg37-20020a170907a42500b007adaedb5ba2so1085596ejc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:18:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhNeVeGXMYYXWnz8b2c3imCIGNZyFL2jLVPCJnULsd0=;
        b=bU+lID1MsczSqVq/ulc8J2WHjOxmgcNuOi2lNxsbxmKEGAmvzNsXMsP40AoO1YAAdQ
         SV+hnlYfXA2Cy24Cag/q9Sz0RSKKuUSgFk61FPmOfM5G1iJ2NEfDxOilITZS/EE9s/U+
         b+dy+DFTrqG6Alsn7gKdY0LCvLVN41/rkVHkh3/AUZGQLEJxFjbEAtHtMJ3k3dGsL2T8
         S+iveWsHgT3GPtp/Fq+l01NaNT8UnNNpRgkEhcMBfWrD830v0rogLP9mrhwQho0LqRNK
         MQ9DG18ARv/KaETuPuF5JNXkvCAt6BfhzMy/LHciDnMiZ+KIOUIf5kRWKTfHDvyviYtB
         mgwA==
X-Gm-Message-State: ANoB5pmmW2VEUH5P5Y5xowKCWtix6tcesw3UkiiUKqexvfq9d2WDhPdD
        MLhxpKn6jFfql/qYK2nY+rsVhpz9wfT3n+4SHwZFAsvFQxJjU8yAsQFBe2oxsoqw3FryZRWwB7O
        tCWqGQXeWP9V51Gu3FViiKzXlJBLJnzBnlA==
X-Received: by 2002:a17:906:f2cf:b0:7ad:975f:b576 with SMTP id gz15-20020a170906f2cf00b007ad975fb576mr2123679ejb.49.1668691124896;
        Thu, 17 Nov 2022 05:18:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7hDLH/4aJgJ5iuIBjzJkjY7QmuRC5FLuUXegndhu3xAluCMSJWhurCxylsyz9wl51pn+ZKzQ==
X-Received: by 2002:a17:906:f2cf:b0:7ad:975f:b576 with SMTP id gz15-20020a170906f2cf00b007ad975fb576mr2123656ejb.49.1668691124682;
        Thu, 17 Nov 2022 05:18:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r9-20020a056402018900b00463c5c32c6esm520495edv.89.2022.11.17.05.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:18:44 -0800 (PST)
Message-ID: <cefd7cfd-0256-b7db-8cdc-d3c686a7fa32@redhat.com>
Date:   Thu, 17 Nov 2022 14:18:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/9] platform/x86/intel/sdsi: Hide attributes if hardware
 doesn't support
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, srinivas.pandruvada@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
 <20221101191023.4150315-3-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101191023.4150315-3-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/1/22 20:10, David E. Box wrote:
> Provisioning capabilities are enabled by a bit set by BIOS. Read this bit
> and hide the provisioning attributes if the On Demand feature is not
> enabled.
> 
> Also, remove the sdsi_enabled boolean from private and instead add a
> features register since this will be used for future features.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel/sdsi.c | 33 ++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
> index 32793919473d..bca05b4dd983 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -41,7 +41,8 @@
>  #define SDSI_SIZE_READ_MSG		(SDSI_SIZE_MAILBOX * 4)
>  
>  #define SDSI_ENABLED_FEATURES_OFFSET	16
> -#define SDSI_ENABLED			BIT(3)
> +#define SDSI_FEATURE_SDSI		BIT(3)
> +
>  #define SDSI_SOCKET_ID_OFFSET		64
>  #define SDSI_SOCKET_ID			GENMASK(3, 0)
>  
> @@ -100,7 +101,7 @@ struct sdsi_priv {
>  	void __iomem		*mbox_addr;
>  	void __iomem		*regs_addr;
>  	u32			guid;
> -	bool			sdsi_enabled;
> +	u32			features;
>  };
>  
>  /* SDSi mailbox operations must be performed using 64bit mov instructions */
> @@ -332,9 +333,6 @@ static ssize_t sdsi_provision(struct sdsi_priv *priv, char *buf, size_t count,
>  	struct sdsi_mbox_info info;
>  	int ret;
>  
> -	if (!priv->sdsi_enabled)
> -		return -EPERM;
> -
>  	if (count > (SDSI_SIZE_WRITE_MSG - SDSI_SIZE_CMD))
>  		return -EOVERFLOW;
>  
> @@ -405,9 +403,6 @@ static long state_certificate_read(struct file *filp, struct kobject *kobj,
>  	size_t size;
>  	int ret;
>  
> -	if (!priv->sdsi_enabled)
> -		return -EPERM;
> -
>  	if (off)
>  		return 0;
>  
> @@ -464,6 +459,23 @@ static struct bin_attribute *sdsi_bin_attrs[] = {
>  	NULL
>  };
>  
> +static umode_t
> +sdsi_battr_is_visible(struct kobject *kobj, struct bin_attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct sdsi_priv *priv = dev_get_drvdata(dev);
> +
> +	/* Registers file is always readable if the device is present */
> +	if (attr == &bin_attr_registers)
> +		return attr->attr.mode;
> +
> +	/* All other attributes not visible if BIOS has not enabled On Demand */
> +	if (!(priv->features & SDSI_FEATURE_SDSI))
> +		return 0;
> +
> +	return attr->attr.mode;
> +}
> +
>  static ssize_t guid_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct sdsi_priv *priv = dev_get_drvdata(dev);
> @@ -480,6 +492,7 @@ static struct attribute *sdsi_attrs[] = {
>  static const struct attribute_group sdsi_group = {
>  	.attrs = sdsi_attrs,
>  	.bin_attrs = sdsi_bin_attrs,
> +	.is_bin_visible = sdsi_battr_is_visible,
>  };
>  __ATTRIBUTE_GROUPS(sdsi);
>  
> @@ -490,7 +503,6 @@ static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct pci_dev *paren
>  	u32 size = FIELD_GET(DT_SIZE, disc_table->access_info);
>  	u32 tbir = FIELD_GET(DT_TBIR, disc_table->offset);
>  	u32 offset = DT_OFFSET(disc_table->offset);
> -	u32 features_offset;
>  	struct resource res = {};
>  
>  	/* Starting location of SDSi MMIO region based on access type */
> @@ -528,8 +540,7 @@ static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct pci_dev *paren
>  	priv->mbox_addr = priv->control_addr + SDSI_SIZE_CONTROL;
>  	priv->regs_addr = priv->mbox_addr + SDSI_SIZE_MAILBOX;
>  
> -	features_offset = readq(priv->regs_addr + SDSI_ENABLED_FEATURES_OFFSET);
> -	priv->sdsi_enabled = !!(features_offset & SDSI_ENABLED);
> +	priv->features = readq(priv->regs_addr + SDSI_ENABLED_FEATURES_OFFSET);
>  
>  	return 0;
>  }

