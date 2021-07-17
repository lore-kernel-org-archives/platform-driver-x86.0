Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6157BC636C9
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 15:27:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35AE96109E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 15:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbhGQPab (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 11:30:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27332 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234255AbhGQPa3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 11:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626535651;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qSYu8OGUW+aUjw/ZabUFvXYIhAJnXy9UL+z5inA5c0Y=;
        b=QHHFosiRe+msefoVe1tZJaoKLFtyPlm+0mDOExvFZ4Em49cTuUCxYWGqVkFI/Tjhb73tYB
        im+C+nSBwcg5mKWdkaW3s9EXeTVjOidHR0s++OqtWU2Wy96QVIMQssLcytom+hv2aHsGGb
        3YatrlhG8VzysQ9y2W2uc2ou0tyUlDA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-0PYeOvENPjShCmBOWVEj0g-1; Sat, 17 Jul 2021 11:27:30 -0400
X-MC-Unique: 0PYeOvENPjShCmBOWVEj0g-1
Received: by mail-ed1-f72.google.com with SMTP id e3-20020a0564020883b029039ef9536577so6467763edy.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jul 2021 08:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qSYu8OGUW+aUjw/ZabUFvXYIhAJnXy9UL+z5inA5c0Y=;
        b=IhhoRw/f68+s5yW7hNYVpQ2GyIvmTFQqj+c2FIm8mjjDsxtm7hghPBZNJBLLlJ4QGZ
         vYZHftvd6XT1jaczIibiWy5zTBqQUVorExkfaxC6LiZQQpNMfU2D/6EoGR17frY8KSiV
         hNT5cJS45qwBZdbWjYiQNEpCg1cYuRnkP+yHARJvFXz8L4+Y8JJ+8IajgppAA586NfgG
         EymwS+ywho2Koxo5USgzXX4J9e3p63HeLwaEVD1WBfPJIPMrOl3tpmNZb2u35qpuICmI
         s+vL/2IJLr8NwF8sQkWGztN8qj8UZUpeQlkVnxdnrcxNHZUn6wlLhZBNq8tNSfzmrmwL
         smKQ==
X-Gm-Message-State: AOAM532g5Qax7wuflpELvXY+77i5k6W30+jAIW7Tpo6b3D5mFOQgxwYU
        TkfuHHZtAB0F40ElB4UGBhtVUp2TuVIAjbYz+u7ou3+5Gd2tW9KQSC5rSCHT/qkhQI/80sHWh0y
        dFUBeMLKaox6zGBTCwLpMRlJtPtuXQWzBQYnGGA3C4FM5u/Zi0O3moaz++ZOQt6hyjwdUVtYQ5q
        dStHjvKYbs5Q==
X-Received: by 2002:a17:907:7708:: with SMTP id kw8mr18743333ejc.111.1626535649407;
        Sat, 17 Jul 2021 08:27:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM9dqEbFlowffLhnRST57SFoEh86jCiVUCj38S+XW4emIUCaADYgoosEEwPBNQbDZm76vUmw==
X-Received: by 2002:a17:907:7708:: with SMTP id kw8mr18743320ejc.111.1626535649246;
        Sat, 17 Jul 2021 08:27:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k21sm3965524ejj.55.2021.07.17.08.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 08:27:28 -0700 (PDT)
Subject: Re: [PATCH 1/3] platform/x86: think-lmi: Move pending_reboot_attr to
 the attributes sysfs dir
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210717143607.3580-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a46014f5-39e9-62bc-eaac-bfb2874af275@redhat.com>
Date:   Sat, 17 Jul 2021 17:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717143607.3580-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/17/21 4:36 PM, Hans de Goede wrote:
> From: Mark Pearson <markpearson@lenovo.com>
> 
> Move the pending_reboot node under attributes dir where it should live, as
> documented in: Documentation/ABI/testing/sysfs-class-firmware-attributes.
> 
> Also move the create / remove code to be together with the other code
> populating / cleaning the attributes sysfs dir. In the removal path this
> is necessary so that the remove is done before the
> kset_unregister(tlmi_priv.attribute_kset) call.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans and the pdx86/fixes
branches now.

Regards,

Hans


> ---
>  drivers/platform/x86/think-lmi.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 64dcec53a7a0..989a8221dcd8 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -672,6 +672,7 @@ static void tlmi_release_attr(void)
>  			kobject_put(&tlmi_priv.setting[i]->kobj);
>  		}
>  	}
> +	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
>  	kset_unregister(tlmi_priv.attribute_kset);
>  
>  	/* Authentication structures */
> @@ -680,7 +681,6 @@ static void tlmi_release_attr(void)
>  	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
>  	kobject_put(&tlmi_priv.pwd_power->kobj);
>  	kset_unregister(tlmi_priv.authentication_kset);
> -	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
>  }
>  
>  static int tlmi_sysfs_init(void)
> @@ -733,6 +733,10 @@ static int tlmi_sysfs_init(void)
>  			goto fail_create_attr;
>  	}
>  
> +	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
> +	if (ret)
> +		goto fail_create_attr;
> +
>  	/* Create authentication entries */
>  	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
>  								&tlmi_priv.class_dev->kobj);
> @@ -760,11 +764,6 @@ static int tlmi_sysfs_init(void)
>  	if (ret)
>  		goto fail_create_attr;
>  
> -	/* Create global sysfs files */
> -	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
> -	if (ret)
> -		goto fail_create_attr;
> -
>  	return ret;
>  
>  fail_create_attr:
> 

