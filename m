Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061F6C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Feb 2021 20:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7FAF60202
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Feb 2021 20:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbhBXUYL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Feb 2021 15:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32309 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234632AbhBXUYK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Feb 2021 15:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614198161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CxZTCOjkYbOnGULO11ZbBQgSUM7OFTzm0oARySokNpI=;
        b=QxdF++IF+Y0J6/5TjDAhlTxacTb0Jzrykl7UXGSmUhUXCmGfGsylsxJYq46rzjBV/aVajx
        WHPiV4y7y3GDxUSLlSuVOoJb3To+jrOinP1rpI/FgOX6g0YQACtl+BQpzrInNgBMGXhhRL
        Ewvko6osJp2v+mvlbAtY1+/VcCG7/6U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-jJs1bXbIPIulGEp2mOAQ5g-1; Wed, 24 Feb 2021 15:22:38 -0500
X-MC-Unique: jJs1bXbIPIulGEp2mOAQ5g-1
Received: by mail-ed1-f71.google.com with SMTP id y90so1536105ede.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Feb 2021 12:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CxZTCOjkYbOnGULO11ZbBQgSUM7OFTzm0oARySokNpI=;
        b=fukpZ8hrsGIy7TyKWEw3Kkza20qrMgooJiiVjHY3uFOvaQXPDu94E0NV4gYUbnBSVj
         CCvZ+KriqIulCF02DINQxZdL7VmhcZGR5mfiaAAG6zUsMdMXAYdafuAcRuTNsnrJJL0N
         kI6WoSEeY6GQdy7pST/2G9SBfFGffk7UE8ZI1ARcy+uXSRqHqplfN/klI8YFyh3gmyTi
         kLdSBJ/28eTSSCoV1Y+a75xszhr2iihNFSidnPDMJvGEvyL4ecS6EgtQ2n5FoVKArCZs
         VF4Xlg+WCZNGMumT3Tshv9rfzhvSoYhm55cBEotMRpZ7rBO7yX/JzEeBZ97AKyDPZIEj
         bp/A==
X-Gm-Message-State: AOAM530Z6+pWEYkOisMUm4HnPwTkumzVdvsrdERFB4s0Wbn1gF+aBu2h
        eCqEYV5uT6QuVZyqiJSnnnEyjLtgQES9xso/eey7FdejT0zOqUyHn0FlwS8J8mFbhr4Vm+E0Fgw
        TF2C5muNMNkdidhry4evNZ5Dnwux3646uZqHHI5viInSXUMRR0gmQu8DBhCu1BHdV/MAwwdM5VH
        1goTrp1FB6SQ==
X-Received: by 2002:aa7:cdcb:: with SMTP id h11mr33507043edw.252.1614198157139;
        Wed, 24 Feb 2021 12:22:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq6ZhvWIl3uDmQDoot5ifJ+RyZfrotWKkmeV2nmLjUQb2TXAnkAqSnBlUK2IZEU6J/zi7nZg==
X-Received: by 2002:aa7:cdcb:: with SMTP id h11mr33507028edw.252.1614198156975;
        Wed, 24 Feb 2021 12:22:36 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m7sm1926661ejk.52.2021.02.24.12.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 12:22:36 -0800 (PST)
Subject: Re: [PATCH V2 1/2] MFD: intel_pmt: Fix nuisance messages and handling
 of disabled capabilities
To:     "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org,
        mgross@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210128172846.99352-1-david.e.box@linux.intel.com>
 <20210224201005.1034005-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d45db24-7741-1956-9cf1-35a7dec517c5@redhat.com>
Date:   Wed, 24 Feb 2021 21:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224201005.1034005-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/24/21 9:10 PM, David E. Box wrote:
> Some products will be available that have PMT capabilities that are not
> supported. Remove the warnings in this instance to avoid nuisance messages
> and confusion.
> 
> Also return an error code for capabilities that are disabled by quirk to
> prevent them from keeping the driver loaded if only disabled capabilities
> are found.
> 
> Fixes: 4f8217d5b0ca ("mfd: Intel Platform Monitoring Technology support")
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> For merge in platform-drivers-x86
> 
> Based on 5.11-rc1 review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Which, assuming you did a git remote update recently is AKA platform-drivers-x86-v5.12-1 .

> Changes from V1:
> 
> 	- None. Patch 2 added.

The series looks good to me, so for the series:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Lee, since both patches touch mfd files (and patch 2 also touches files under drivers/platform/x86)
I think it would be best if you just merge the entire series.

As always I would appreciate a pull-req from you to also pull the changes
into my tree, in case further drivers/platform/x86/intel_pmt* changes
show up during this cycle.

Regards,

Hans






> 
>  drivers/mfd/intel_pmt.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> index 744b230cdcca..65da2b17a204 100644
> --- a/drivers/mfd/intel_pmt.c
> +++ b/drivers/mfd/intel_pmt.c
> @@ -79,19 +79,18 @@ static int pmt_add_dev(struct pci_dev *pdev, struct intel_dvsec_header *header,
>  	case DVSEC_INTEL_ID_WATCHER:
>  		if (quirks & PMT_QUIRK_NO_WATCHER) {
>  			dev_info(dev, "Watcher not supported\n");
> -			return 0;
> +			return -EINVAL;
>  		}
>  		name = "pmt_watcher";
>  		break;
>  	case DVSEC_INTEL_ID_CRASHLOG:
>  		if (quirks & PMT_QUIRK_NO_CRASHLOG) {
>  			dev_info(dev, "Crashlog not supported\n");
> -			return 0;
> +			return -EINVAL;
>  		}
>  		name = "pmt_crashlog";
>  		break;
>  	default:
> -		dev_err(dev, "Unrecognized PMT capability: %d\n", id);
>  		return -EINVAL;
>  	}
>  
> @@ -174,12 +173,8 @@ static int pmt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
>  
>  		ret = pmt_add_dev(pdev, &header, quirks);
> -		if (ret) {
> -			dev_warn(&pdev->dev,
> -				 "Failed to add device for DVSEC id %d\n",
> -				 header.id);
> +		if (ret)
>  			continue;
> -		}
>  
>  		found_devices = true;
>  	} while (true);
> 
> base-commit: a7d53dbbc70a81d5781da7fc905b656f41ad2381
> 

