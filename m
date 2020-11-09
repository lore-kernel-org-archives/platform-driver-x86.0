Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2290C388F7
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9625920897
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDCkluaK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgKILNI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:13:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56785 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727311AbgKILNG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 06:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604920384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6f4hga6TnBXBWcFEXJdBV6y3khnB0XO3gwtaYVX58Jc=;
        b=WDCkluaKwa12x+obanrKV7RZz9Z2k9QU3svJAPqqkh1ecE09Xhcgn80LWEDAkrLhwd7eN2
        +ZRBHiZ1H1pu7ulF2CFG00uoH5uQ6HPvFyTbFpasvX1T3OkrygxSpbX0Zi27a6BcuIf0pg
        dJkSKkL0qUbJZ1yesRHYHO69186voHw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-FJNc0EQLMXilB7vOu_XI_w-1; Mon, 09 Nov 2020 06:13:01 -0500
X-MC-Unique: FJNc0EQLMXilB7vOu_XI_w-1
Received: by mail-ed1-f71.google.com with SMTP id a73so2571218edf.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 03:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6f4hga6TnBXBWcFEXJdBV6y3khnB0XO3gwtaYVX58Jc=;
        b=BDwsRLQKdI96eE7PhwF1GJUFoRQwYHl2COLbImVN0l7ORqkFABVInu2zmRZyCpkHlq
         Vqg2nbC9B8P3yPuyT3EiYRyQOCANwPIsh4DeN8SJT1PHx8wPbfiWfDQqDpBSIpqJEoVg
         spRbEpcMqESF53ADaQme4R1pSubmY7l9ZxykHhahLSu8NWL2K6sfoxj3ePO6s1aN8UzS
         Y8TneC6tPDmFvFYGrNZLaKD7A7ECwQBkCpLiUQxDLRXACt5jzvY6zcMVPsF1IVcsmY8n
         m5+LnHzbyMVg7lujEBcJX+9rELzFfFjcNFzm/PpQ5ezUcd1dh+zEyWLYHfaL2AwMSTpY
         BYfw==
X-Gm-Message-State: AOAM530k5LnzMPheGIl+PSU/EqBbrPYUf5n0ktF5iuZK3Od7am1Eblns
        w/b6xcrSN6ifxfJWRab4wr247S6deKopRe1QFoQCv0WiG4cpc24Czj9sCSxNZOtOs8ID0PgcfHE
        HnuS24QMpp/Xb2aLDgg47E0U106bCsDw/Pg==
X-Received: by 2002:aa7:dd17:: with SMTP id i23mr14513133edv.276.1604920380703;
        Mon, 09 Nov 2020 03:13:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwY3xUHXUo4UcN/8HlGKF9x+lnva5VzatMi3uOqQdzJT3VvNhIrR5YEZPr2TmnZQC7m8qfNLw==
X-Received: by 2002:aa7:dd17:: with SMTP id i23mr14513113edv.276.1604920380469;
        Mon, 09 Nov 2020 03:13:00 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id b6sm8972567edu.21.2020.11.09.03.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 03:12:59 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: fix init_bios_attributes()
 error handling
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Divya Bharathi <divya.bharathi@dell.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20201103101735.GB1127762@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a4f6be26-1270-8923-c8c4-a68b1d680414@redhat.com>
Date:   Mon, 9 Nov 2020 12:12:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103101735.GB1127762@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/3/20 11:17 AM, Dan Carpenter wrote:
> Calling release_attributes_data() while holding the "wmi_priv.mutex"
> will lead to a dead lock.  The other problem is that if kzalloc() fails
> then this should return -ENOMEM but currently it returns success.
> 
> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
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
> The "platform/x86: Introduce support ... " commit doesn't use the patch
> prefix which the driver will use going forward.  That means that whoever
> fixes the first bug has to pick the patch prefix and sometimes people
> are not happy with that.
> 
>  drivers/platform/x86/dell-wmi-sysman/sysman.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> index 3842575a6c18..055556d5c70d 100644
> --- a/drivers/platform/x86/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> @@ -443,8 +443,10 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  
>  		/* build attribute */
>  		attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> -		if (!attr_name_kobj)
> +		if (!attr_name_kobj) {
> +			retval = -ENOMEM;
>  			goto err_attr_init;
> +		}
>  
>  		attr_name_kobj->kset = tmp_set;
>  
> @@ -486,13 +488,13 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  		elements = obj ? obj->package.elements : NULL;
>  	}
>  
> -	goto out;
> +	mutex_unlock(&wmi_priv.mutex);
> +	return 0;
>  
>  err_attr_init:
> +	mutex_unlock(&wmi_priv.mutex);
>  	release_attributes_data();
>  	kfree(obj);
> -out:
> -	mutex_unlock(&wmi_priv.mutex);
>  	return retval;
>  }
>  
> 

