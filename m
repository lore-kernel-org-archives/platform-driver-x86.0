Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CE1C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:23:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FE0761074
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348284AbhDGOXW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:23:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53514 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344449AbhDGOXV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617805391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eVyiDWShbCf6rFt8W3DQDH822FOwiFYHJb1DwH4NLUw=;
        b=ffNkgnULUw8Vhsq8jiI49byIifVQyeevqhh0AicF5UVkjxGLi88tZDSUU6zbh8wBM3O9v/
        O4cSCnDDR6+mfEsrAXg1onNz6w4YzCb4Ab9wB6+03JjSzS56Y137lb8VQhCwPPJwFDudg3
        Zqr8WTWY2qZxwau7ROfgYJXDts57lFs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-SMPkdKRWNoG5ddfwyDJrmw-1; Wed, 07 Apr 2021 10:23:10 -0400
X-MC-Unique: SMPkdKRWNoG5ddfwyDJrmw-1
Received: by mail-ed1-f69.google.com with SMTP id h5so12208211edf.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eVyiDWShbCf6rFt8W3DQDH822FOwiFYHJb1DwH4NLUw=;
        b=mnTG2E9SSKTqcQidhHP1yIzY1kmJI3kwnG/lZAa16ODcN/g0VXp9muKkTXTnfMeIg+
         j/y0vquG0tctvjFBOXhHzh5fZM2M4XmPpsB4oEDAE5+33yKv/51LrMnkzYKXvA3nWlul
         MaHQGNijESygoxBTZmHKoiW6hXylooKxKq1oPdAGTZUkeuNysul6wo0dpYT08WdgjWma
         up15acPdwsHpEJ0YWiXfY3/Q3jjMkZ9+nubyiPDFH8P5e0/PrUaK8uEiJ+f9NBr2+vcU
         vmBHAXZPrAjD3gRQmrpNK6l3Ww5Hqlu6JuTsv71pw54eIjDnT4hLxsAf0gCdbDbiLsvi
         Vwcg==
X-Gm-Message-State: AOAM532jOjjYDMQ35xer5IIGGvqj9IjbgRv6dIIpTw1ZuNAPS2ifeAAv
        W6CLX4SnG7zLRfkd0alj0N4TUo/GkwhKw0Q70n5sgNjJ+lKVh88zJvATJSIehYzJJ+oc8yMFjJ3
        c4b5QxvS8Cv1Jp4Y7bkMtkgODw+XBas9sSg==
X-Received: by 2002:a05:6402:3550:: with SMTP id f16mr4762627edd.134.1617805389135;
        Wed, 07 Apr 2021 07:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWL4xswvyEz2QVSSs/SoBM6G+ynGMmY/lkQvA5Ma9/Qouqe27s32LovUW7+bp1IDw1dlm6Pw==
X-Received: by 2002:a05:6402:3550:: with SMTP id f16mr4762609edd.134.1617805388977;
        Wed, 07 Apr 2021 07:23:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f11sm2682995ejh.120.2021.04.07.07.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:23:08 -0700 (PDT)
Subject: Re: [PATCH 1/9] platform/x86: intel_pmc_core: Don't use global pmcdev
 in quirks
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401030558.2301621-1-david.e.box@linux.intel.com>
 <20210401030558.2301621-2-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4e374b74-3587-b5d8-2c5c-a8ab184d8858@redhat.com>
Date:   Wed, 7 Apr 2021 16:23:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401030558.2301621-2-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 5:05 AM, David E. Box wrote:
> The DMI callbacks, used for quirks, currently access the PMC by getting
> the address a global pmc_dev struct. Instead, have the callbacks set a
> global quirk specific variable. In probe, after calling dmi_check_system(),
> pass pmc_dev to a function that will handle each quirk if its variable
> condition is met. This allows removing the global pmc_dev later.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel_pmc_core.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index b5888aeb4bcf..260d49dca1ad 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1186,9 +1186,15 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   * the platform BIOS enforces 24Mhz crystal to shutdown
>   * before PMC can assert SLP_S0#.
>   */
> +static bool xtal_ignore;
>  static int quirk_xtal_ignore(const struct dmi_system_id *id)
>  {
> -	struct pmc_dev *pmcdev = &pmc;
> +	xtal_ignore = true;
> +	return 0;
> +}
> +
> +static void pmc_core_xtal_ignore(struct pmc_dev *pmcdev)
> +{
>  	u32 value;
>  
>  	value = pmc_core_reg_read(pmcdev, pmcdev->map->pm_vric1_offset);
> @@ -1197,7 +1203,6 @@ static int quirk_xtal_ignore(const struct dmi_system_id *id)
>  	/* Low Voltage Mode Enable */
>  	value &= ~SPT_PMC_VRIC1_SLPS0LVEN;
>  	pmc_core_reg_write(pmcdev, pmcdev->map->pm_vric1_offset, value);
> -	return 0;
>  }
>  
>  static const struct dmi_system_id pmc_core_dmi_table[]  = {
> @@ -1212,6 +1217,14 @@ static const struct dmi_system_id pmc_core_dmi_table[]  = {
>  	{}
>  };
>  
> +static void pmc_core_do_dmi_quirks(struct pmc_dev *pmcdev)
> +{
> +	dmi_check_system(pmc_core_dmi_table);
> +
> +	if (xtal_ignore)
> +		pmc_core_xtal_ignore(pmcdev);
> +}
> +
>  static int pmc_core_probe(struct platform_device *pdev)
>  {
>  	static bool device_initialized;
> @@ -1253,7 +1266,7 @@ static int pmc_core_probe(struct platform_device *pdev)
>  	mutex_init(&pmcdev->lock);
>  	platform_set_drvdata(pdev, pmcdev);
>  	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
> -	dmi_check_system(pmc_core_dmi_table);
> +	pmc_core_do_dmi_quirks(pmcdev);
>  
>  	/*
>  	 * On TGL, due to a hardware limitation, the GBE LTR blocks PC10 when
> 

