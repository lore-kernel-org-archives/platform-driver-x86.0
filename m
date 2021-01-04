Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFC8C4332D
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9402F221F1
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbhADOgF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:36:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27876 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727203AbhADOgF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609770878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MlGNmue/OEcc+LrokQ5uW+ClGR/N9N2hz5xtfGyMhr8=;
        b=PEaf0PDGxshevRGo4BojzBDOyEjRaadYsqkR4D77hfAd+utPI2KSIDUORNfsfQCFxgKVEc
        CLFkIQGQWXFn6aaJBKsB4CP/SKSBQNlJ6mZ/fS9Bo8SNT41m72WJCeN/9Vox/Iu6cgdLOg
        2pSXEh+36VyNdm4mZD54SIEo8ie1Rew=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-YTlRATqYMQq1Rc6eN5RUbw-1; Mon, 04 Jan 2021 09:34:33 -0500
X-MC-Unique: YTlRATqYMQq1Rc6eN5RUbw-1
Received: by mail-ej1-f70.google.com with SMTP id ov1so7039462ejb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 06:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MlGNmue/OEcc+LrokQ5uW+ClGR/N9N2hz5xtfGyMhr8=;
        b=VSnU1kf4GIi2qFWNFnCkfMWdHV3nz7sJ+U9wG6PP6tNjDvF/hcVGCDdmXwkMT77mdw
         CUbsjC04A/j2+bD9VhQj2GHgOJznkWvY435heRPN4aYD577an13AxsYNSetgsJP+KrpP
         b/e6QWgZ/Z6SMwwiBFh3qYBK/cOlzFRSCNq2dhU2YwRbQKekG1/7sc70wTiF3e41PT4U
         VzXWzU10W5IrTgBiECQOR9BciVbE0wTdYv2QyeXsuKpSHRzumO/8Wfe7evBKd6LMTeGR
         iuZ3dC33+Reclc6ZImDwynRal3SFI6E+hHqgcPZY2kDIMQM1Vbxix3a65+0d5FPeREGv
         GrQg==
X-Gm-Message-State: AOAM532zDvFnOHUUmVgrX79vYIeUrOY6TmRvslpEcMo7RwBkJdRMf9Mi
        kG9tcRZ3OVrlKrgpB1D/+QMAw9Rwf1ugGeDWqnKYvFsMquThegDeyK90TVuBZXG9On4DLmUW+69
        wlcrjvN/DN07HkXlexCq0Y1mrpvURnEdJFw==
X-Received: by 2002:a17:906:b09a:: with SMTP id x26mr42799380ejy.199.1609770872624;
        Mon, 04 Jan 2021 06:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyznHvL5Jm3vifHBDmK8iYArUSZMyjWRdPfXkd44h1PErXhEC1aVo64TNJev5ys8eLkIEsggA==
X-Received: by 2002:a17:906:b09a:: with SMTP id x26mr42799366ejy.199.1609770872506;
        Mon, 04 Jan 2021 06:34:32 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id v24sm44039398edw.23.2021.01.04.06.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 06:34:32 -0800 (PST)
Subject: Re: [PATCH 0/2] IdeaPad platform profile support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210101125629.20974-1-jiaxun.yang@flygoat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <35ac853a-266c-6944-6e5e-6286456865e3@redhat.com>
Date:   Mon, 4 Jan 2021 15:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210101125629.20974-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/1/21 1:56 PM, Jiaxun Yang wrote:
> Tested on Lenovo Yoga-14SARE Chinese Edition.
> 
> Jiaxun Yang (2):
>   ACPI: platform-profile: Introduce data parameter to handler
>   platform/x86: ideapad-laptop: DYTC Platform profile support
> 
>  drivers/acpi/platform_profile.c       |   4 +-
>  drivers/platform/x86/Kconfig          |   1 +
>  drivers/platform/x86/ideapad-laptop.c | 281 ++++++++++++++++++++++++++
>  include/linux/platform_profile.h      |   5 +-
>  4 files changed, 287 insertions(+), 4 deletions(-)


Thank you for your series, unfortunately the
"ACPI: platform-profile: Introduce data parameter to handler"
patch causes a conflict with the pending:
"[PATCH v8 3/3] platform/x86: thinkpad_acpi: Add platform profile support"
patch.

But I do agree that adding that data parameter makes sense, so
it might be best to merge:

"ACPI: platform-profile: Introduce data parameter to handler"

First and then rebase the thinkpad_acpi patch on top.

Rafael, do you think you could add:

"ACPI: platform-profile: Introduce data parameter to handler"

To the 2 ACPI: platform-profile patches which you already have pending for 5.11-rc# ?

Regards,

Hans

