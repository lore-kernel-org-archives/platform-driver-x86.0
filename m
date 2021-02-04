Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A0DC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 08:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C660864F43
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 08:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233392AbhBDINp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 03:13:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20189 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231767AbhBDINo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 03:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612426337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/Wh0DIdrkA4YW2O4sxJRy2qqQ4e9oXm1QIzs7RUWeVo=;
        b=NO5GNhNSje5wKR7obqXc/FSGOxIVA6G8uGYJbMgROawj4at9t0O+TeAinpXYmk15vB8nLw
        UGfY1BzDZ4jMm1YvDkqz4RMzgmTRaxItVv1S2N1XVQ4eAZVVhY7ThLDWbTrthSdpYTHE0C
        5Fzc+PzDJJIpiymNHTGrUFcIP/NAV9g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-TIPO6d8EMuGR17M_mB_69w-1; Thu, 04 Feb 2021 03:12:16 -0500
X-MC-Unique: TIPO6d8EMuGR17M_mB_69w-1
Received: by mail-ej1-f70.google.com with SMTP id dc21so2005786ejb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 00:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Wh0DIdrkA4YW2O4sxJRy2qqQ4e9oXm1QIzs7RUWeVo=;
        b=p10EM+j2eI0y8/hceVq7WWll5mL86/ohsJajuAHlX6fipNjx1CbeDNFa4geK0Xcz2Z
         G6c8lVV0qKLoE2rBya9pwrEV9t3msfw8BZxi2Yq6urRfgBgVekG6gENXH3qfbkQepX16
         TcpGE2GQeRZilknn57lFezK4k/TCq268wXXSSbGisK1OVSvpeiQgywe3pb5GJsEg7XD+
         Rfmpg8irhXiyh51NJU1QSPB3RwoBj3dVACtcXH/y9K6wEI8rAYIkUKXjrg0L3CgZ88CZ
         +PTncbV0mejSdBr7C2Ycn26vO1y8VtUzmO/ZL5llRRbTf0ddeg6Sd9FxgKo3tJJ1b3Mf
         T9qw==
X-Gm-Message-State: AOAM530XREFmduS4+GIlV58Ta5HQgdUniimmqjSapmAHOnaT75XEuKZh
        68DgUsnTPg1UhYNFtVxU0qWPCnJs1QGvo1RB0dqUqpB8JTWpdivkkf6TBj3yyJIRWDYcgTxgLjz
        N+Pt5u9wBv/BmbEjB6XTNZJgYP8BRhGUkYA==
X-Received: by 2002:a17:906:e15:: with SMTP id l21mr6832381eji.376.1612426334947;
        Thu, 04 Feb 2021 00:12:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0PqgHF3bUbZJ97CsxfNGMJ+DnJvlxxbl0ArJ8i0X75kxCEWjUlxc3cIP64FHV4H7gowMglQ==
X-Received: by 2002:a17:906:e15:: with SMTP id l21mr6832367eji.376.1612426334821;
        Thu, 04 Feb 2021 00:12:14 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id kv24sm1931809ejc.117.2021.02.04.00.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 00:12:14 -0800 (PST)
Subject: Re: [PATCH v3 12/29] platform/x86: ideapad-laptop: check return value
 of debugfs_create_dir() for errors
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210203215403.290792-13-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <acc8d35b-eea6-8fad-0d7a-ad9c189a51ad@redhat.com>
Date:   Thu, 4 Feb 2021 09:12:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203215403.290792-13-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Barnabás,

On 2/3/21 10:55 PM, Barnabás Pőcze wrote:
> debugfs_create_dir() may return an ERR_PTR(),
> add a check to ideapad_debugfs_init() that
> handles the case when that occurs.

debugfs functions should not be error-checked:

1. They are for debugging so if they don't work it is not an issue
   (note your own error handling also just returns without propagating 
    the error).
2. Subsequent debugfs calls taking the ERR-PTR will detect this and
   turn into no-op-s

So I'm going to skip this patch while applying this series.

Regards,

Hans




> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 1aa3a05c3360..ba0bd344f5ed 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -14,6 +14,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
> +#include <linux/err.h>
>  #include <linux/fb.h>
>  #include <linux/i8042.h>
>  #include <linux/init.h>
> @@ -350,9 +351,11 @@ DEFINE_SHOW_ATTRIBUTE(debugfs_cfg);
>  
>  static void ideapad_debugfs_init(struct ideapad_private *priv)
>  {
> -	struct dentry *dir;
> +	struct dentry *dir = debugfs_create_dir("ideapad", NULL);
> +
> +	if (IS_ERR(dir))
> +		return;
>  
> -	dir = debugfs_create_dir("ideapad", NULL);
>  	priv->debug = dir;
>  
>  	debugfs_create_file("cfg", S_IRUGO, dir, priv, &debugfs_cfg_fops);
> 

