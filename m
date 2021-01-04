Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35571C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAB0021D93
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbhADOfv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:35:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60467 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726472AbhADOfu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609770864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PTEfEjtKePQ0/JuJ57gSim73GubJunX7YVIOZ0Wadjk=;
        b=Dlbk+DIhNtJTuhobKyWtOdzu0/7qZk00DLkyw4bV2wrX1Tuvfkpj76GWmmRnYSa+wqcrf5
        9ZY/8CUMB2QTifyDyoKm7YjGhZn9ST0aPJR3zeGKB+oa3D1ZZOCiZ/2M4s1r/w73MSo6X6
        RSaNrNdMGhu9rF/V+v4Czas5OBKLCGQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-606NgrxDMSCQnQZV8Y6k6Q-1; Mon, 04 Jan 2021 09:34:19 -0500
X-MC-Unique: 606NgrxDMSCQnQZV8Y6k6Q-1
Received: by mail-ed1-f69.google.com with SMTP id k5so11367726edk.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 06:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PTEfEjtKePQ0/JuJ57gSim73GubJunX7YVIOZ0Wadjk=;
        b=d+w0B9BuliFr4AO2NFMThZIB+WkwDZx3Nhek0KA1AQLN8DYR4mhroETow/6IXYeHrh
         c1/MCBfncn+tlh29EgabnT6TWW32Rjd+TI5Ky4/jKYpwlkMJqVX1L9o2RcHWF+lHb33i
         y3lOtfENO7Ri/OJv4Mt3iObmv4Km5IOQB+HjBIAfycgfyCzAd8dDqA85WcTU851DX6xs
         XplSVOicjv7qJUnn8gKoZsQ2sMRmMFVwLxRklz/zmKMCC7MLfGHPRMECInIlHj7GJOg0
         8JLh7eNHEbUxCQqiJUIroAXXYel1EATN0BLRKHcwVacCym6K8VIIyo3sHVbdbBo0i/tb
         tNuw==
X-Gm-Message-State: AOAM533QNE5JA2YFI27AVBCJzZ1ShAzhBwSCPoF49l/id3JfntjwQc0M
        LQcg05hf+13mC8O3kMokfG+RpgWVjmgAfQnJ2blwcttzGwH4/tBAzJo9PWvdfoLtfScePzEI4j2
        m+KMzCtT94WqV/7R/Q70sJbnn0AOHk+zd5g==
X-Received: by 2002:a17:906:4809:: with SMTP id w9mr66494828ejq.139.1609770858001;
        Mon, 04 Jan 2021 06:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6O37oPsVISpiRv4vXsFdt1QCkP08fqKLicEBFWvl0wC0+ErN5ZrtJrx0V/Uvq60GofTzJqA==
X-Received: by 2002:a17:906:4809:: with SMTP id w9mr66494821ejq.139.1609770857873;
        Mon, 04 Jan 2021 06:34:17 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id d3sm40336685edt.32.2021.01.04.06.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 06:34:17 -0800 (PST)
Subject: Re: [PATCH 1/2] ACPI: platform-profile: Introduce data parameter to
 handler
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210101125629.20974-1-jiaxun.yang@flygoat.com>
 <20210101125629.20974-2-jiaxun.yang@flygoat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c58562aa-b3c5-f35f-0328-06bed81db559@redhat.com>
Date:   Mon, 4 Jan 2021 15:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210101125629.20974-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/1/21 1:56 PM, Jiaxun Yang wrote:
> Add a data parameter to handler callbacks to avoid having
> global variables everywhere.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/acpi/platform_profile.c  | 4 ++--
>  include/linux/platform_profile.h | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
> index 91be50a32cc8..60072f6e032d 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -64,7 +64,7 @@ static ssize_t platform_profile_show(struct device *dev,
>  		return -ENODEV;
>  	}
>  
> -	err = cur_profile->profile_get(&profile);
> +	err = cur_profile->profile_get(cur_profile->data, &profile);
>  	mutex_unlock(&profile_lock);
>  	if (err)
>  		return err;
> @@ -104,7 +104,7 @@ static ssize_t platform_profile_store(struct device *dev,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	err = cur_profile->profile_set(i);
> +	err = cur_profile->profile_set(cur_profile->data, i);
>  	mutex_unlock(&profile_lock);
>  	if (err)
>  		return err;
> diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
> index 3623d7108421..272faf55875d 100644
> --- a/include/linux/platform_profile.h
> +++ b/include/linux/platform_profile.h
> @@ -27,9 +27,10 @@ enum platform_profile_option {
>  };
>  
>  struct platform_profile_handler {
> +	void *data;
>  	unsigned long choices[BITS_TO_LONGS(PLATFORM_PROFILE_LAST)];
> -	int (*profile_get)(enum platform_profile_option *profile);
> -	int (*profile_set)(enum platform_profile_option profile);
> +	int (*profile_get)(void *data, enum platform_profile_option *profile);
> +	int (*profile_set)(void *data, enum platform_profile_option profile);
>  };
>  
>  int platform_profile_register(const struct platform_profile_handler *pprof);
> 

