Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4C7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 13:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239864AbiKQNSn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 08:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239861AbiKQNSl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 08:18:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3607E558D
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668691064;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C9MvW9IGfYbs61wyWaxjLg53zmskvKkolKu8014WW3k=;
        b=c4VMVsTdmg+szOVsuNXogZtEitXr179gYgaY2YUVAdUMEYTtxU9WuZkG1tRziARdq7A1Yd
        ctUxzt7UFIV4pJcuFJoAgodw7gQrsAIreoVdTLyqJLLXYP0/h6/Cpn5ZqEmupxi26lLq8s
        Ou2JLxTklfHiNMrON/M6PpM3wEMF9sA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-Sb8k1OQIMu-Br9ViUSMq0g-1; Thu, 17 Nov 2022 08:17:42 -0500
X-MC-Unique: Sb8k1OQIMu-Br9ViUSMq0g-1
Received: by mail-ed1-f71.google.com with SMTP id dz9-20020a0564021d4900b0045d9a3aded4so1214702edb.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9MvW9IGfYbs61wyWaxjLg53zmskvKkolKu8014WW3k=;
        b=S8SbLwaiLU1zlOgLpE/fqKZ8YC+Vbei9qGluqgSXDlRWyuFZFmSNy58Npe5jAOo2vB
         7LPKjFO7gt+lX7Q3nRCcVPR7ZPER6E4rPHWCMatRTXQEkV8yIuSkCr2hBzQa3uJbD0vF
         TJSg2M7TyUHpvR0q9eZDZEFB3aiMUpMOAmiMCf112WPiQTjCU7VaVaJOew39EPBZFyPZ
         yzS3NNopf5tGBwYXBaJzC3akrP40wPqgFKn3pcqnt6htbTNcLH+zoJUM9MvlXWNzr3Vw
         PlLNU9INjcxbDbnBv/u4GOhWhtkgfEh9lpWNqWzU+biebU78iJohPAONvieGQ06tqlip
         eUBg==
X-Gm-Message-State: ANoB5pkUXv+/QFQMkXJR9aazkC//VoAP2NZES54/WjNdDJplEc134XoW
        kv+lxvZcmafIHjatkDks8HHw1mlCn/6xLfebAMXBXIyNH7MPcloSlpdKd1KO8gLgTK129EieuKy
        YOjMdIn9Yr2G4qpOcQBvT/AmXn5EQJF/ifQ==
X-Received: by 2002:aa7:cb96:0:b0:461:bacd:c85d with SMTP id r22-20020aa7cb96000000b00461bacdc85dmr2026217edt.278.1668691061722;
        Thu, 17 Nov 2022 05:17:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf63HMSdY1OqKsZjJRGMm+zpx4520anGQNeIGYiBwoiOPQJTTTfEM21hWOQo2T1vprwYviK5Bg==
X-Received: by 2002:aa7:cb96:0:b0:461:bacd:c85d with SMTP id r22-20020aa7cb96000000b00461bacdc85dmr2026196edt.278.1668691061537;
        Thu, 17 Nov 2022 05:17:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f26-20020a17090631da00b007b27aefc578sm353430ejf.126.2022.11.17.05.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:17:40 -0800 (PST)
Message-ID: <05c77221-7457-7829-e5ab-f6115a0dd452@redhat.com>
Date:   Thu, 17 Nov 2022 14:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/9] platform/x86/intel/sdsi: Add Intel On Demand text
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, srinivas.pandruvada@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
 <20221101191023.4150315-2-david.e.box@linux.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101191023.4150315-2-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/1/22 20:10, David E. Box wrote:
> Intel Software Defined Silicon (SDSi) is now officially known as Intel
> On Demand. Add On Demand to the description in the kconfig, documentation,
> and driver source.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  .../ABI/testing/sysfs-driver-intel_sdsi       | 37 ++++++++++---------
>  drivers/platform/x86/intel/Kconfig            |  8 ++--
>  drivers/platform/x86/intel/sdsi.c             |  4 +-
>  3 files changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel_sdsi b/Documentation/ABI/testing/sysfs-driver-intel_sdsi
> index 96b92c105ec4..9d77f30d9b9a 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel_sdsi
> +++ b/Documentation/ABI/testing/sysfs-driver-intel_sdsi
> @@ -4,21 +4,21 @@ KernelVersion:	5.18
>  Contact:	"David E. Box" <david.e.box@linux.intel.com>
>  Description:
>  		This directory contains interface files for accessing Intel
> -		Software Defined Silicon (SDSi) features on a CPU. X
> -		represents the socket instance (though not the socket ID).
> -		The socket ID is determined by reading the registers file
> -		and decoding it per the specification.
> +		On Demand (formerly Software Defined Silicon or SDSi) features
> +		on a CPU. X represents the socket instance (though not the
> +		socket ID). The socket ID is determined by reading the
> +		registers file and decoding it per the specification.
>  
> -		Some files communicate with SDSi hardware through a mailbox.
> -		Should the operation fail, one of the following error codes
> -		may be returned:
> +		Some files communicate with On Demand hardware through a
> +		mailbox. Should the operation fail, one of the following error
> +		codes may be returned:
>  
>  		==========	=====
>  		Error Code	Cause
>  		==========	=====
>  		EIO		General mailbox failure. Log may indicate cause.
>  		EBUSY		Mailbox is owned by another agent.
> -		EPERM		SDSI capability is not enabled in hardware.
> +		EPERM		On Demand capability is not enabled in hardware.
>  		EPROTO		Failure in mailbox protocol detected by driver.
>  				See log for details.
>  		EOVERFLOW	For provision commands, the size of the data
> @@ -54,8 +54,8 @@ KernelVersion:	5.18
>  Contact:	"David E. Box" <david.e.box@linux.intel.com>
>  Description:
>  		(WO) Used to write an Authentication Key Certificate (AKC) to
> -		the SDSi NVRAM for the CPU. The AKC is used to authenticate a
> -		Capability Activation Payload. Mailbox command.
> +		the On Demand NVRAM for the CPU. The AKC is used to authenticate
> +		a Capability Activation Payload. Mailbox command.
>  
>  What:		/sys/bus/auxiliary/devices/intel_vsec.sdsi.X/provision_cap
>  Date:		Feb 2022
> @@ -63,17 +63,18 @@ KernelVersion:	5.18
>  Contact:	"David E. Box" <david.e.box@linux.intel.com>
>  Description:
>  		(WO) Used to write a Capability Activation Payload (CAP) to the
> -		SDSi NVRAM for the CPU. CAPs are used to activate a given CPU
> -		feature. A CAP is validated by SDSi hardware using a previously
> -		provisioned AKC file. Upon successful authentication, the CPU
> -		configuration is updated. A cold reboot is required to fully
> -		activate the feature. Mailbox command.
> +		On Demand NVRAM for the CPU. CAPs are used to activate a given
> +		CPU feature. A CAP is validated by On Demand hardware using a
> +		previously provisioned AKC file. Upon successful authentication,
> +		the CPU configuration is updated. A cold reboot is required to
> +		fully activate the feature. Mailbox command.
>  
>  What:		/sys/bus/auxiliary/devices/intel_vsec.sdsi.X/state_certificate
>  Date:		Feb 2022
>  KernelVersion:	5.18
>  Contact:	"David E. Box" <david.e.box@linux.intel.com>
>  Description:
> -		(RO) Used to read back the current State Certificate for the CPU
> -		from SDSi hardware. The State Certificate contains information
> -		about the current licenses on the CPU. Mailbox command.
> +		(RO) Used to read back the current state certificate for the CPU
> +		from On Demand hardware. The state certificate contains
> +		information about the current licenses on the CPU. Mailbox
> +		command.
> diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
> index 794968bda115..d5a33473e838 100644
> --- a/drivers/platform/x86/intel/Kconfig
> +++ b/drivers/platform/x86/intel/Kconfig
> @@ -157,13 +157,13 @@ config INTEL_RST
>  	  as usual.
>  
>  config INTEL_SDSI
> -	tristate "Intel Software Defined Silicon Driver"
> +	tristate "Intel On Demand (Software Defined Silicon) Driver"
>  	depends on INTEL_VSEC
>  	depends on X86_64
>  	help
> -	  This driver enables access to the Intel Software Defined Silicon
> -	  interface used to provision silicon features with an authentication
> -	  certificate and capability license.
> +	  This driver enables access to the Intel On Demand (formerly Software
> +	  Defined Silicon) interface used to provision silicon features with an
> +	  authentication certificate and capability license.
>  
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called intel_sdsi.
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
> index c830e98dfa38..32793919473d 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Intel Software Defined Silicon driver
> + * Intel On Demand (Software Defined Silicon) driver
>   *
>   * Copyright (c) 2022, Intel Corporation.
>   * All Rights Reserved.
> @@ -586,5 +586,5 @@ static struct auxiliary_driver sdsi_aux_driver = {
>  module_auxiliary_driver(sdsi_aux_driver);
>  
>  MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
> -MODULE_DESCRIPTION("Intel Software Defined Silicon driver");
> +MODULE_DESCRIPTION("Intel On Demand (SDSi) driver");
>  MODULE_LICENSE("GPL");

