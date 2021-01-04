Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C3AC433E9
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D78D22211
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbhADOl6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36021 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727042AbhADOl6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609771231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QFfXv6TzDRE7F942fvHmw3WnMe4ntA68qR259LcqXAc=;
        b=GQiwixzYA24qid4TxZMxrM97FdV+/9xqjxm2dDR7N11e6zkbhqaTf2i1DrCcvvVan+WF1a
        z2y92gN+79LzRtM4HVdZHVX2AMsI8dy7iE18Olg80SV4ZWxVOBv4C4yPf7L0G37wdeIQZs
        w2+goRdsoOvVl3eJ/RQwaR3S7chWzgo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-zhbloVCvO9-9TChqSTi3sw-1; Mon, 04 Jan 2021 09:40:30 -0500
X-MC-Unique: zhbloVCvO9-9TChqSTi3sw-1
Received: by mail-ed1-f69.google.com with SMTP id u18so12274845edy.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 06:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QFfXv6TzDRE7F942fvHmw3WnMe4ntA68qR259LcqXAc=;
        b=RbgFYm7jUJD4IPy4Z37wo1Ah8Or4A6d+5e0uOv2QrzeDsR3UXQVGBKuVcoWvYGgdvn
         4zkKQuw/izjO6HdQeqRDeF8h/JHTOmf844nh4nUILd0w2bN9jpECwPmziUpUoOw8H+P9
         EoF04hctr2oX1kiL8q2IA5QSCBf2nV4bySNR5UaR/ZdznkmlFsr0BgKoYKZbqf8bHOiS
         Dy+PKIFoNMUADbaj/xTNuSUOCAeshe5vUujhZyMbesdK+dF2G4AkD91xOI8t4NqTv6Bv
         RYdMKr8glQBz/Ia1zkw4/T5qPazLIO9m1n1q6Q6bUA1YZ5RZ2u8VqVcqs6uV3xmqonX7
         sdnQ==
X-Gm-Message-State: AOAM533UUaZZW/Y5g8a7mGfnV3YGye8Y1w45eLJ6FRlCPbGpEndxXkwU
        n8O5UlyJq+29bnPZJVrQ8ldTJWexokyunXfxfwiYFN10SZzOSdDNdNy2sOoT7yKi57wTED6KoNl
        JEFKYAOr9ZtLJcHcwpBjvwXKC1FPYU7DHFA==
X-Received: by 2002:aa7:cd44:: with SMTP id v4mr71107001edw.156.1609771228658;
        Mon, 04 Jan 2021 06:40:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx6P6tR5UcsmUHVGbV86xokCSfjVoiuiRBDMj9z44PscTIMEbLncB4lg2h8VyJQ8X1aBPlOw==
X-Received: by 2002:aa7:cd44:: with SMTP id v4mr71106988edw.156.1609771228541;
        Mon, 04 Jan 2021 06:40:28 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id e19sm44477821edr.61.2021.01.04.06.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 06:40:28 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel-vbtn: Support for tablet mode on Dell
 Inspiron 7352
To:     Arnold Gozum <arngozum@gmail.com>
Cc:     AceLan Kao <acelan.kao@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201226205307.249659-1-arngozum@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <15c05099-6739-b71e-c39f-10c03cada588@redhat.com>
Date:   Mon, 4 Jan 2021 15:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201226205307.249659-1-arngozum@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/26/20 9:53 PM, Arnold Gozum wrote:
> The Dell Inspiron 7352 is a 2-in-1 model that has chassis-type "Notebook".
> Add this model to the dmi_switches_allow_list.
> 
> Signed-off-by: Arnold Gozum <arngozum@gmail.com>

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
>  drivers/platform/x86/intel-vbtn.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 3b49a1f4061b..9bbdb26d4305 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -222,6 +222,12 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Switch SA5-271"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7352"),
> +		},
> +	},
>  	{} /* Array terminator */
>  };
>  
> 

