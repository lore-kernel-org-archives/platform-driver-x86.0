Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1485C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 08:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBB7E60F11
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 08:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238067AbhIMIkm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29474 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238065AbhIMIkm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 04:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631522366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gtcB1ZveNkkyyDIRMBjXT7lZaidk8qRpb8YYNagAX+E=;
        b=RukM4cpddi0HmjXFoDzfsdo1KAkwYMYzTjSkhvyxjyJ7JEqJ+HTSg+ShWLl0K2MxqFHmjM
        OMtRDCWrAMZwiXPoDcsYAfhvVFNIA03tTU+ee7eLT+ADfGGuiSxNmum9R1Bl9gZToMjG3C
        0bJdfTRtaYD56tbudqbjSJXVIyKTEA0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-jDdtJQcOOueQiAVBi4-SQQ-1; Mon, 13 Sep 2021 04:39:25 -0400
X-MC-Unique: jDdtJQcOOueQiAVBi4-SQQ-1
Received: by mail-ed1-f69.google.com with SMTP id bf22-20020a0564021a5600b003c86b59e291so4552439edb.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 01:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gtcB1ZveNkkyyDIRMBjXT7lZaidk8qRpb8YYNagAX+E=;
        b=Vg+W+6+p6ila5Dv/iihvCipOoegBkilEm9eYugcIf2Yut4yIqbOTgFiNAsooZAG4eP
         ZK8MbUhi+k0BVcr8B4Wm/fLIPVHiuoSgEZFEQ2IkwHkFKuNpDaFj9MTT2ZeBXu2JyHsP
         BRBv0M3ZiAvQiEWK2Od+Tw0rDLQ/QiQQtBvNcB2h+L7pw5hSs53otHU0h7Ujm7SJyYrQ
         HiALh5iHDcca33J/j8/Q4ob6SI/mmF1alLNfgoqbSF0POTjgo+TWPXPKT4jm2JQMAJr3
         71JInHoj6C7wtUwQREVLKmyuRBSA0YrQ7eYOvMkpI8DkoQjd7EIhPT6LJ9ffNHwhJLGY
         6QTQ==
X-Gm-Message-State: AOAM532MA1WuOmz33ZQ6Ke+4vjs8MCtFX0BvY36DW33WhKuox7Ws9Lqq
        fwyKzb2CkLwISf58wZWwSIXMc0vVZd54tKSZySa+Nm282geUwY5fh3Dg3KmoT1OPMzak20Z+QAV
        DwpMt3ZOQCOgr59N1x9pHkqi8IrbXX+kmhSIMtiDtD6PSBPOfFwjv/Zzx9DhpFDjqM7ZMZ8jJ97
        O7FQTZ/Fl+6w==
X-Received: by 2002:a17:906:dfe3:: with SMTP id lc3mr31543ejc.478.1631522364036;
        Mon, 13 Sep 2021 01:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjn7icXxsvIYRwAfH3+fkB6UdJFFB9H+pX6mulcGO7xSOr2xqka4qWn1F+/L0vms3vvmLdXg==
X-Received: by 2002:a17:906:dfe3:: with SMTP id lc3mr31529ejc.478.1631522363800;
        Mon, 13 Sep 2021 01:39:23 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id p11sm1066357ejb.61.2021.09.13.01.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 01:39:23 -0700 (PDT)
Subject: Re: [PATCH] lg-laptop: Correctly handle dmi_get_system_info()
 returning NULL
To:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <93ff3bb-503b-f73-bf18-87bae1699ed@svgalib.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <49184a3e-f150-117c-d944-bebf85a725f6@redhat.com>
Date:   Mon, 13 Sep 2021 10:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <93ff3bb-503b-f73-bf18-87bae1699ed@svgalib.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/29/21 2:07 PM, Matan Ziv-Av wrote:
> 
> The laptop model is identified by parsing the product name. If no 
> product name is available, do not try to parse it.
> Default model is 2017.
> 
> Signed-off-by: Matan Ziv-Av <matan@svgalib.org>

I will also add this to the fixes branch, so that it gets send out
to Linus in my next pull-request with fixes for 5.15.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also add this to the fixes branch, so that it gets send out
to Linus in my next pull-request with fixes for 5.15.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/lg-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index 3e520d5bca07..88b551caeaaf 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -655,7 +655,7 @@ static int acpi_add(struct acpi_device *device)
>  		goto out_platform_registered;
>  	}
>  	product = dmi_get_system_info(DMI_PRODUCT_NAME);
> -	if (strlen(product) > 4)
> +	if (product && strlen(product) > 4)
>  		switch (product[4]) {
>  		case '5':
>  		case '6':
> 

