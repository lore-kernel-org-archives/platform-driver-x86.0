Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1F5C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 12:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbiI0Mu5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 08:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiI0Mu4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 08:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1198DC5C
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664283054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FWI1+hRfFNyVzqxBTRopwVLzKRNVFFSG4GDOBAzhIig=;
        b=EnpQp+akQQgFrqueSIXNZbfZIonqJ+SIP29N+kJ+mt0ScZxslDbrAG5RtH4SwiZeD2wjjk
        oAY+dUD2c0RCZ86+5OxBQTCR8aE4IbSZyE1NnQOhDqbmW5bW4RPCbwElmm2uNFPxZJEEoC
        6VDIwqbzjJg0AvBR8/eQKtaq13n7gRk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-OglpPrQgNXeTZ-ANGqBPng-1; Tue, 27 Sep 2022 08:50:53 -0400
X-MC-Unique: OglpPrQgNXeTZ-ANGqBPng-1
Received: by mail-ed1-f71.google.com with SMTP id m13-20020a056402510d00b004519332f0b1so7653967edd.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 05:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FWI1+hRfFNyVzqxBTRopwVLzKRNVFFSG4GDOBAzhIig=;
        b=GNhvHapVBxq2/zZ3lii0snBlOh/P1zOt3V+YlSbzZd/ZDw3nU4Q1qyp2PbkS3N/OL9
         J+VFmTdmgP0fL+ugJa5pEvsseu8mIM7v7hdjc9E9TD3hfYt0hEJDQcdD4YD7gS8Rpt+s
         vWGSoZ5l4G4Ml5ZDqWJ9KkKnzAklKoNL+6NLrmn/0/+aDVp7O4Nc6IrJhXZOxorOzLnc
         AkDoxAwrxSqdL/L/7VBq2DynKDmHi7A0Uh7Bs6sGpq8rCmtCr8opgKPWYIhd8qU8mWrN
         rKksbU2caXPoI3dNGgQkrxw4YigL+6sanCQlSzevjIHYAWq+DQAp5cOwXqGFFWyqXQnv
         1qKQ==
X-Gm-Message-State: ACrzQf3uB9jOW6hP5ursZ9iSurbrUjTyp7ApgVkhX1DJNtBGNOVET6jV
        jlVQ5XGmtccu/D5neVUFTL392C+hD0MiATfOQu9AHZu6XfdLUhNKG0z8m0juoNwmohGuwhEjZdr
        rMq9D9ell5gzBZLt7RAiHLbWARzbWS1ztdQ==
X-Received: by 2002:a17:906:9beb:b0:773:db0f:d53a with SMTP id de43-20020a1709069beb00b00773db0fd53amr22861665ejc.580.1664283052004;
        Tue, 27 Sep 2022 05:50:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JwvrOLs1pD/WoPOP8BYI8GzzZO/P2yJ8GOUgdyO7J/6uuFFba3CI9DtdIqjI7RqOnynYaEg==
X-Received: by 2002:a17:906:9beb:b0:773:db0f:d53a with SMTP id de43-20020a1709069beb00b00773db0fd53amr22861647ejc.580.1664283051770;
        Tue, 27 Sep 2022 05:50:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f20-20020a50ee94000000b004482dd03fe8sm1178692edr.91.2022.09.27.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 05:50:50 -0700 (PDT)
Message-ID: <b4fea7a5-e4ce-7cb3-d6b4-9621f4e9d840@redhat.com>
Date:   Tue, 27 Sep 2022 14:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86/amd/pmf: install notify handler after acpi
 init
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com, Mark Pearson <markpearson@lenovo.com>
References: <20220923131724.1812685-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220923131724.1812685-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/22 15:17, Shyam Sundar S K wrote:
> It is observed that when thinkpad_acpi driver loads before amd-pmf
> driver, thinkpad_acpi driver sends the AMT "on" event and the request
> immediately will be part of the PMF BIOS "pending requests".
> 
> With the current amd-pmf code, as soon as the amd-pmf driver gets
> probed, it calls apmf_acpi_init() where the notify handler will be
> installed. Handler callback would call amd_pmf_handle_amt() where the
> amd_pmf_set_automode() shall update the auto-mode thermals.
> In this case, the auto-mode config_store shall have "zeros", as the
> auto mode init gets called during the later stage.
> 
> To fix this, change the order of the acpi notifer install and call it
> after the auto mode initialization is done.
> 
> Fixes: 7d77dcc83ada ("platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode")
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Mark Pearson <markpearson@lenovo.com>
> Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 38 +++++++++++++++++------------
>  drivers/platform/x86/amd/pmf/core.c |  1 +
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  3 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 05a2b8a056fc..b6453157a59d 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -243,6 +243,28 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
>  }
>  
> +int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +	acpi_status status;
> +
> +	/* Install the APMF Notify handler */
> +	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
> +	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
> +		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
> +						     apmf_event_handler, pmf_dev);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(pmf_dev->dev, "failed to install notify handler\n");
> +			return -ENODEV;
> +		}
> +
> +	/* Call the handler once manually to catch up with possibly missed notifies. */
> +	apmf_event_handler(ahandle, 0, pmf_dev);
> +}
> +
> +return 0;

Note something has gone wrong with the indentation of the 5 new lines above, they
need an extra tab at the beginning of the line to be properly indented.

I have fixed this up while merging this and added the patch to:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-amd-pmf

Which is where all the AMD-PMF AMT enablement patches are.

I will also merge this branch into review-hans/for-next again so that
this patch will find its way into 6.1-rc1 together with the other AMT
patches.

Regards,

Hans



> +}
> +
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> @@ -257,8 +279,6 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  {
> -	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> -	acpi_status status;
>  	int ret;
>  
>  	ret = apmf_if_verify_interface(pmf_dev);
> @@ -279,20 +299,6 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>  	}
>  
> -	/* Install the APMF Notify handler */
> -	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
> -	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
> -		status = acpi_install_notify_handler(ahandle,
> -						     ACPI_ALL_NOTIFY,
> -						     apmf_event_handler, pmf_dev);
> -		if (ACPI_FAILURE(status)) {
> -			dev_err(pmf_dev->dev, "failed to install notify handler\n");
> -			return -ENODEV;
> -		}
> -		/* Call the handler once manually to catch up with possibly missed notifies. */
> -		apmf_event_handler(ahandle, 0, pmf_dev);
> -	}
> -
>  out:
>  	return ret;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 44fe30726b62..a5f5a4bcff6d 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -369,6 +369,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_init_features(dev);
> +	apmf_install_handler(dev);
>  	amd_pmf_dbgfs_register(dev);
>  
>  	mutex_init(&dev->lock);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index e5dc3ae238c7..84bbe2c6ea61 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -381,6 +381,7 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
> +int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);

