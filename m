Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488CBC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2711D61355
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235855AbhESNoJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29006 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353730AbhESNoI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621431767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0zDarqYAubEaaO1sJ6Ra/SVfjQQEFvimAzCT8ejQuv0=;
        b=ISSJDIMsCmlfWA1PL3JMEBEtQogWljGDDEJZz+5pSLEBbkPbTuqn+Dajosv7cR0HEB8fNQ
        09CSguDcnhbb32WCyyTmtG8oqeuv3Ywt7QM6j5lVdGQl4q1zyU9Lb5y3k7e0UA01PkHM+B
        U7iYyVLxopaqD5kdiXMo6kdY2mEPL7c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-LlgkTM8sN7yHQizxYZJ3BQ-1; Wed, 19 May 2021 09:42:45 -0400
X-MC-Unique: LlgkTM8sN7yHQizxYZJ3BQ-1
Received: by mail-ej1-f72.google.com with SMTP id c11-20020a170906170bb02903bbefa04cd1so3745456eje.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0zDarqYAubEaaO1sJ6Ra/SVfjQQEFvimAzCT8ejQuv0=;
        b=D01aLR2BffsF3fMJGTJsLrWzkSRAf51WrcvGS71JnH5olfNoFoiPWyA3ZGn7HccTQA
         ayKiM3ZTOPGX27nhLKjKAkNY583bz/cpf8IegzWLZkTcpxt9ubk3xPZ3He8W1bzIX19W
         pahy13EmIS2TEDSS/pO2uuQwGmaTwIRegXeRcJB256Cv48n9v3iJZkValrK43ZoNCWHH
         oiS7MLSoGk75PApMdyDo1r1SIWibKkCC1yM+cnr2WG/7Aslv3msobuGjpNRZRtAO4Q23
         MXCP6tYDKW5dM7iPGqFtO48GilRn6hROvPMJiGbnm0OAqr8Vk0ZplKPwKQJLnot9JtUF
         eTdQ==
X-Gm-Message-State: AOAM532X37NbRheDgDsnMDdDokdfPQkiKxwe5NLnZ5xmIA8OLkf/fe2A
        23/uQTbj2S0eFYF4CfyfH0utAszUzXAHl7lbPkiS6LHWbiDmm82HbB8D4csmx0c2huOkeVMp2h8
        Ckmtzzr5F2oh7NBWP5iDECL76DPLZekZRnA==
X-Received: by 2002:a17:906:38c5:: with SMTP id r5mr12286432ejd.230.1621431764232;
        Wed, 19 May 2021 06:42:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxixvtj5+/EI1ajawyL5t9qQGR62TgVQh2fNa1qzRJmZlrFw67dTU7Lz/QDKbZdoZqVNZj4Yw==
X-Received: by 2002:a17:906:38c5:: with SMTP id r5mr12286421ejd.230.1621431764105;
        Wed, 19 May 2021 06:42:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ju17sm12681061ejc.72.2021.05.19.06.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:42:43 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Update info for telemetry
To:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        rajneesh.bhardwaj@amd.com, platform-driver-x86@vger.kernel.org,
        david.e.box@linux.intel.com
Cc:     dave.hansen@intel.com
References: <20210513153825.77214-1-irenic.rajneesh@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <12550a6d-5946-b181-4a44-6c4e9be240e9@redhat.com>
Date:   Wed, 19 May 2021 15:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513153825.77214-1-irenic.rajneesh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/13/21 5:38 PM, Rajneesh Bhardwaj wrote:
>  - My linux.intel.com email is no longer valid, update it to my gmail id.
> 
> Signed-off-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>

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
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7fdc513392f4..dd21a6e56e17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9209,7 +9209,7 @@ F:	include/linux/firmware/intel/stratix10-smc.h
>  F:	include/linux/firmware/intel/stratix10-svc-client.h
>  
>  INTEL TELEMETRY DRIVER
> -M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> +M:	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
>  M:	"David E. Box" <david.e.box@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> 

