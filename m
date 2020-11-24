Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF6DC56202
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03A2B2075A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qie0VHmM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732523AbgKXLoP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:44:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33915 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731524AbgKXLoP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 06:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606218253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4NrSc8wihaHmFWeUfPDKBxbk/YM1ofsoDJ23X2QLggQ=;
        b=Qie0VHmMOEtT2D7a5b6ZuOc6pYhiutDsfnw87BkEzj5F+29OEJAQOgRxBIhEbU3tMWSwDZ
        xh7NaNvs6tzLABZ54Y02+VcaJPTRDmMI+8+5yjm5IMWyjiweBECKWGj2GmTlGaNDf38K5q
        qm4aGxdiqyuZBdM0PenJg9vJw8lwyGY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-I0e_D1TAOQCLuzC8TAl9kw-1; Tue, 24 Nov 2020 06:44:11 -0500
X-MC-Unique: I0e_D1TAOQCLuzC8TAl9kw-1
Received: by mail-ej1-f69.google.com with SMTP id gr9so6763063ejb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 03:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4NrSc8wihaHmFWeUfPDKBxbk/YM1ofsoDJ23X2QLggQ=;
        b=BmBHbMTWf7gZB12BDcUVpB1ar2xPGDDYXKOsq0UNjbN8BkfcbbONqH8XyNiaX9Qhqa
         TcL7hTYMfIurbufEe8V458G51F4doyziZQfiOnmC5/O5zQCPY4ZBHy/SPhl8xK7h/25E
         L3K9G0MXJj9sYG28ptKTgaJUy34JJEAdAE5uXQmwK+29Ye9bVV6SfxhNbhI3Mpphyl1j
         RatNLmuIFcStYSdV72IHE1KdimnIkfDzBWu6yPFDxN5AVEsKFPxQBnS+8E5ZJAWrB/Ec
         DNhmcBE3hGnreNMUvbGiA0T3YXHc+kaimtFB9UvUjYtYB1C20CsEK6aNYEvrL2kdldRn
         T0DQ==
X-Gm-Message-State: AOAM533B5pVOVaT78ntxIHxR4T7OPc63oadQsgipdNYTsKFbvQRD3X1l
        2MB4CzEhHghqAoMskS9E+/b94ghnX0THR7UPbHb8PKPcuL0flw7J6yr9RFvyS+gcZgMaQgYW2Xo
        CvU2F+upu8g2jyFUFZChTplGhM0PplusWnQ==
X-Received: by 2002:a17:906:6c93:: with SMTP id s19mr3903946ejr.544.1606218250335;
        Tue, 24 Nov 2020 03:44:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqeAEBo8mx23ukw9XW1uC+amQFfgZkj7hPg4gx5bQ2PGxT2SPXRHV2NUknaBSKxNMUIpb6Ug==
X-Received: by 2002:a17:906:6c93:: with SMTP id s19mr3903927ejr.544.1606218250181;
        Tue, 24 Nov 2020 03:44:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id p25sm4272540eju.63.2020.11.24.03.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 03:44:09 -0800 (PST)
Subject: Re: [PATCH] platform/x86: pmt: Fix a potential Oops on error in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20201117072251.GC1111239@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3a84cc88-25d2-7265-6183-41337109df87@redhat.com>
Date:   Tue, 24 Nov 2020 12:44:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117072251.GC1111239@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/17/20 8:22 AM, Dan Carpenter wrote:
> The "ns->attr_grp" pointer can be NULL so this error handling code needs
> to check for that to avoid an Oops.
> 
> Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/x86/intel_pmt_class.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmt_class.c b/drivers/platform/x86/intel_pmt_class.c
> index aa88dc23bbde..c8939fba4509 100644
> --- a/drivers/platform/x86/intel_pmt_class.c
> +++ b/drivers/platform/x86/intel_pmt_class.c
> @@ -225,7 +225,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  		return 0;
>  
>  fail_ioremap:
> -	sysfs_remove_group(entry->kobj, ns->attr_grp);
> +	if (ns->attr_grp)
> +		sysfs_remove_group(entry->kobj, ns->attr_grp);
>  fail_sysfs:
>  	device_unregister(dev);
>  fail_dev_create:
> 

