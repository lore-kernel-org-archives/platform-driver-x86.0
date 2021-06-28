Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25D8C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:15:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B15BD619AB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhF1JRk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55563 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232415AbhF1JRi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 05:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624871712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5bou4h074m3o/W74lRU3ezW0yQ1+IHLUSss8INpB7tU=;
        b=aJC7HY04wAroFUtWkRjFshDW8rMA2AlP4zUHio0J+/h6mggLEIbb5n6IbeZlvmf7deX1Of
        Dl6yDDhkg11PabDZUHFJFy3Vz6EwA0oyijAr64qXF7+LENsybz2Pf4Yrp88X4AjMpcx3Wz
        ClDpaC5/poo4STu21jWGUriTDeS3NOM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-oq21GrvPOBGTsPowgChTUQ-1; Mon, 28 Jun 2021 05:15:11 -0400
X-MC-Unique: oq21GrvPOBGTsPowgChTUQ-1
Received: by mail-ed1-f70.google.com with SMTP id o8-20020aa7dd480000b02903954c05c938so2254822edw.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 02:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5bou4h074m3o/W74lRU3ezW0yQ1+IHLUSss8INpB7tU=;
        b=SRDkgNWR1KGkFqLs93dJTW3YCvqOIuPRlmBVSJwB+XG9Q7NvcxXEpOgKv52sj+Nv9m
         oWUi8bJJlt5GYKrsrIA9AbDGganXB5xfavDpWV/v7pRPdAGKtkLyIajIqfSgngoSY5nN
         5ujdFPMgEspIbmdZqFTWYSKn3Eavrgq3964D2Gv5lXj76NjLN/YSg0WLfqcJEkZkHlRr
         PPXtxLh7rZaMMzods4EFIXLZ7jl8qnYN3MVoPqp/RKL26m2pgM54kFIF+GxV1Zl20KWu
         wgU/hX6+xG9/ll21SKvt5UBrSvjhaTUdfkMG5cagmCxo86jpcOG7sLup5MG0DwVEchpf
         7XrQ==
X-Gm-Message-State: AOAM530xeXSuDGtDcVLSsgDCHlGkp+DvjjEa98YjO21XhVinjQvjqDkx
        advBfAd3Y9OAFe2c+VO73jBH9BBLNZ2qgy1z3Y0L9Wp6VRPueX2mrGKbGxIRAKnOZ9HSAGJZSbU
        YxeKxVuViHPmm2zMUmIWjGtjUc+je28dZMw==
X-Received: by 2002:a17:906:31d4:: with SMTP id f20mr22633333ejf.383.1624871709979;
        Mon, 28 Jun 2021 02:15:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8mJSO5fIGvt8yQ58Tc6tauoJdaypg9Uo0BH/ZKvCHDRQqrU5UpRKRWSg513d19BQXRr3ZXg==
X-Received: by 2002:a17:906:31d4:: with SMTP id f20mr22633314ejf.383.1624871709795;
        Mon, 28 Jun 2021 02:15:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bq1sm6582042ejb.66.2021.06.28.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 02:15:09 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Change user experience
 when Admin/System Password is modified
To:     Prasanth KSR <kosigiprasanth@gmail.com>, dvhart@infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>
References: <20210628084906.4233-1-prasanth.ksr@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f4ec848d-735b-68aa-bee2-de9a2fbbe195@redhat.com>
Date:   Mon, 28 Jun 2021 11:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628084906.4233-1-prasanth.ksr@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/28/21 10:49 AM, Prasanth KSR wrote:
> Whenever user has changed an Admin/System Password using the sysfs,
> then we are automatically copying the new password to existing
> password field.
> 
> Co-developed-by: Divya Bharathi <divya.bharathi@dell.com>
> Signed-off-by: Divya Bharathi <divya.bharathi@dell.com>
> Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>

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
>  .../x86/dell/dell-wmi-sysman/passwordattr-interface.c         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> index 339a082d6c18..86ec962aace9 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> @@ -95,9 +95,9 @@ int set_new_password(const char *password_type, const char *new)
>  
>  	print_hex_dump_bytes("set new password data: ", DUMP_PREFIX_NONE, buffer, buffer_size);
>  	ret = call_password_interface(wmi_priv.password_attr_wdev, buffer, buffer_size);
> -	/* clear current_password here and use user input from wmi_priv.current_password */
> +	/* on success copy the new password to current password */
>  	if (!ret)
> -		memset(current_password, 0, MAX_BUFF);
> +		strscpy(current_password, new, MAX_BUFF);
>  	/* explain to user the detailed failure reason */
>  	else if (ret == -EOPNOTSUPP)
>  		dev_err(&wmi_priv.password_attr_wdev->dev, "admin password must be configured\n");
> 

