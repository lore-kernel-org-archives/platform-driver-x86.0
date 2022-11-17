Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD24C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 13:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240125AbiKQNek (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 08:34:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239985AbiKQNej (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 08:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB84F100D
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668692019;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hL/CkDwZ5PSSXNx6AH8Ol5aF9aNMQrd0lYSEYATA1qM=;
        b=TkvN4NYsmJEmRXdkatm9o6e9K66Ml3kwpN1aQAPEAiT5Uh/819G4E6dZWXrXpds+53y0mO
        x2ZBpqveng4Tq/RtoT1yAMw24XOuT5AcALucw7sdGjD6YDOH/iA+hsIJpkO6ddz4XhaCNy
        4UWXhLQNLB8ZcJ3UaBe0iDuxJfzxTa4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-gK5j-L2gMA6-A30FkaBPWQ-1; Thu, 17 Nov 2022 08:33:37 -0500
X-MC-Unique: gK5j-L2gMA6-A30FkaBPWQ-1
Received: by mail-ed1-f70.google.com with SMTP id c9-20020a05640227c900b00463de74bc15so1236431ede.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hL/CkDwZ5PSSXNx6AH8Ol5aF9aNMQrd0lYSEYATA1qM=;
        b=vwRqlJjnTdEUYn3+ykryKRmVnbYglZ5twLazahQZVfQHU/Qja+fsjZliy2nhBWp9A8
         T1IbqZMKiiR/AdjEhM/cpE/wJ9qXKVFKOfgTg9q6h8Ni4GVb55psqm8ueA9sf1kL7B8K
         0ZwD7Ad6FTkNQn8oQXLQr3DH5FwtoDIv0g6GzgvmGHILvYgLlCR9QhXv5U30GC/KgHaY
         eBiQ2WRTOWBYIX3Ns1mQZpi/iaguCgJxCh96xBtRHo+UX8DC2bLvgsg67xLZAUWfjDhF
         1Stw58lH8YRPoyNzUUXvTUqpnBMaddYRT115lRFjkqj9MAgUZcYcBkc8uhzNkCRZvDVB
         T1/g==
X-Gm-Message-State: ANoB5plrnX4z8pKi3SYayQk1c7JwYX0XWXWVFAXFDlzbtaWXvoH/XA/5
        rlK314GVo7EZIz8oHjtFNrM/PxN00Hw8pYbIF1nzlGqy6dGot9CVyh99LBaTDyEu8wLpKIJP9Lo
        CtZq6oMKpwdaT9mUywuFf0qjldXiclF9Vzg==
X-Received: by 2002:a05:6402:3719:b0:461:4f34:d8f4 with SMTP id ek25-20020a056402371900b004614f34d8f4mr2246348edb.144.1668692016390;
        Thu, 17 Nov 2022 05:33:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6sKRk3/86Tcy37XD0YlRzFqUBS6qSiNc9p3JAvWavh0/6bd4NkP7VcJbT4ivuY7CMGPSQC7g==
X-Received: by 2002:a05:6402:3719:b0:461:4f34:d8f4 with SMTP id ek25-20020a056402371900b004614f34d8f4mr2246326edb.144.1668692016139;
        Thu, 17 Nov 2022 05:33:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id n22-20020aa7c696000000b00457c85bd890sm543260edq.55.2022.11.17.05.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:33:35 -0800 (PST)
Message-ID: <3995ade6-385c-45cd-3ff4-052835337546@redhat.com>
Date:   Thu, 17 Nov 2022 14:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 4/9] platform/x86/intel/sdsi: Add meter certificate
 support
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, srinivas.pandruvada@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
 <20221101191023.4150315-5-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101191023.4150315-5-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/1/22 20:10, David E. Box wrote:
> Add support for reading the meter certificate from Intel On Demand
> hardware.  The meter certificate [1] is used to access the utilization
> metrics of enabled features in support of the Intel On Demand consumption
> model. Similar to the state certificate, the meter certificate is read by
> mailbox command.
> 
> [1] https://github.com/intel-sandbox/debox1.intel_sdsi/blob/gnr-review/meter-certificate.rst
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Besides Andy's remarks I also have 1 remark myself, see below.

> ---
>  .../ABI/testing/sysfs-driver-intel_sdsi       | 10 ++++
>  drivers/platform/x86/intel/sdsi.c             | 52 +++++++++++++++----
>  2 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel_sdsi b/Documentation/ABI/testing/sysfs-driver-intel_sdsi
> index 9d77f30d9b9a..f8afed127107 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel_sdsi
> +++ b/Documentation/ABI/testing/sysfs-driver-intel_sdsi
> @@ -69,6 +69,16 @@ Description:
>  		the CPU configuration is updated. A cold reboot is required to
>  		fully activate the feature. Mailbox command.
>  
> +What:		/sys/bus/auxiliary/devices/intel_vsec.sdsi.X/meter_certificate
> +Date:		Nov 2022
> +KernelVersion:	6.2
> +Contact:	"David E. Box" <david.e.box@linux.intel.com>
> +Description:
> +		(RO) Used to read back the current meter certificate for the CPU
> +		from Intel On Demand hardware. The meter certificate contains
> +		utilization metrics of On Demand enabled features. Mailbox
> +		command.
> +
>  What:		/sys/bus/auxiliary/devices/intel_vsec.sdsi.X/state_certificate
>  Date:		Feb 2022
>  KernelVersion:	5.18
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
> index ab1f65919fc5..1dee10822df7 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -42,6 +42,7 @@
>  
>  #define SDSI_ENABLED_FEATURES_OFFSET	16
>  #define SDSI_FEATURE_SDSI		BIT(3)
> +#define SDSI_FEATURE_METERING		BIT(26)
>  
>  #define SDSI_SOCKET_ID_OFFSET		64
>  #define SDSI_SOCKET_ID			GENMASK(3, 0)
> @@ -80,9 +81,10 @@
>  #define SDSI_GUID_V2			0xF210D9EF
>  
>  enum sdsi_command {
> -	SDSI_CMD_PROVISION_AKC		= 0x04,
> -	SDSI_CMD_PROVISION_CAP		= 0x08,
> -	SDSI_CMD_READ_STATE		= 0x10,
> +	SDSI_CMD_PROVISION_AKC		= 0x0004,
> +	SDSI_CMD_PROVISION_CAP		= 0x0008,
> +	SDSI_CMD_READ_STATE		= 0x0010,
> +	SDSI_CMD_READ_METER		= 0x0014,
>  };
>  
>  struct sdsi_mbox_info {
> @@ -398,13 +400,10 @@ static ssize_t provision_cap_write(struct file *filp, struct kobject *kobj,
>  }
>  static BIN_ATTR_WO(provision_cap, SDSI_SIZE_WRITE_MSG);
>  
> -static long state_certificate_read(struct file *filp, struct kobject *kobj,
> -				   struct bin_attribute *attr, char *buf, loff_t off,
> -				   size_t count)
> +static ssize_t
> +certificate_read(u64 command, struct sdsi_priv *priv, char *buf, loff_t off,
> +		 size_t count)
>  {
> -	struct device *dev = kobj_to_dev(kobj);
> -	struct sdsi_priv *priv = dev_get_drvdata(dev);
> -	u64 command = SDSI_CMD_READ_STATE;
>  	struct sdsi_mbox_info info;
>  	size_t size;
>  	int ret;
> @@ -441,8 +440,31 @@ static long state_certificate_read(struct file *filp, struct kobject *kobj,
>  
>  	return size;
>  }
> +
> +static ssize_t
> +state_certificate_read(struct file *filp, struct kobject *kobj,
> +		       struct bin_attribute *attr, char *buf, loff_t off,
> +		       size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct sdsi_priv *priv = dev_get_drvdata(dev);
> +
> +	return certificate_read(SDSI_CMD_READ_STATE, priv, buf, off, count);
> +}
>  static BIN_ATTR(state_certificate, 0400, state_certificate_read, NULL, SDSI_SIZE_READ_MSG);
>  
> +static ssize_t
> +meter_certificate_read(struct file *filp, struct kobject *kobj,
> +		       struct bin_attribute *attr, char *buf, loff_t off,
> +		       size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct sdsi_priv *priv = dev_get_drvdata(dev);
> +
> +	return certificate_read(SDSI_CMD_READ_METER, priv, buf, off, count);
> +}
> +static BIN_ATTR(meter_certificate, 0400, meter_certificate_read, NULL, SDSI_SIZE_READ_MSG);
> +
>  static ssize_t registers_read(struct file *filp, struct kobject *kobj,
>  			      struct bin_attribute *attr, char *buf, loff_t off,
>  			      size_t count)
> @@ -472,6 +494,7 @@ static BIN_ATTR(registers, 0400, registers_read, NULL, SDSI_SIZE_REGS);
>  static struct bin_attribute *sdsi_bin_attrs[] = {
>  	&bin_attr_registers,
>  	&bin_attr_state_certificate,
> +	&bin_attr_meter_certificate,
>  	&bin_attr_provision_akc,
>  	&bin_attr_provision_cap,
>  	NULL
> @@ -491,7 +514,16 @@ sdsi_battr_is_visible(struct kobject *kobj, struct bin_attribute *attr, int n)
>  	if (!(priv->features & SDSI_FEATURE_SDSI))
>  		return 0;
>  
> -	return attr->attr.mode;
> +	if (attr == &bin_attr_state_certificate ||
> +	    attr == &bin_attr_provision_akc ||
> +	    attr == &bin_attr_provision_cap)
> +		return attr->attr.mode;

I would prefer for you to just drop this and then change:

> +
> +	if (attr == &bin_attr_meter_certificate &&
> +	    !!(priv->features & SDSI_FEATURE_METERING))
> +		return attr->attr.mode;

to:

	if (attr == &bin_attr_meter_certificate)
		return (priv->features & SDSI_FEATURE_METERING) ?
				attr->attr.mode : 0;

And then keep:

	return attr->attr.mode;

at the end of this function, because now you are hiding all
new attributes by default and then you have to add any new
attributes to the if above, leading to an ever growing lists
of attr to check in that if, so just having:

	return attr->attr.mode;

As default for any non-matches attr would be much better IMHO.

Regards,

Hans





> +
> +	return 0;
>  }
>  
>  static ssize_t guid_show(struct device *dev, struct device_attribute *attr, char *buf)

