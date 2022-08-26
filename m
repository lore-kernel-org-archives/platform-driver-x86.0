Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0BEECAAD7
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 09:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343965AbiHZJav (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 05:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344039AbiHZJa1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 05:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E15DFC2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661506212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ih2SbtEY0pZuwcaJHYLAqUOvxgA0ukB77yzvQAFrb3s=;
        b=fO/zYWVyD0LrruuPBZ8Il4O8blj4AMY+Ef1+mjVagjtLq7WJ+xCpb4zAnBxPPxx/FRL48c
        BgL2esSKYKDq4eiXiKPkCs0puYUeTIpwSCP7D8pWalnZRamYcbWs3xnsjoUcqh6zl7Q1fz
        UG23GAS7eq1w574xbe8hnxIb7ZQwKZU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-k3lMDHlpM-u3NKg-tAQf9A-1; Fri, 26 Aug 2022 05:30:10 -0400
X-MC-Unique: k3lMDHlpM-u3NKg-tAQf9A-1
Received: by mail-ed1-f71.google.com with SMTP id y20-20020a056402359400b00447a871c48fso813070edc.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 02:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Ih2SbtEY0pZuwcaJHYLAqUOvxgA0ukB77yzvQAFrb3s=;
        b=3RR+sxcxPWVx+vml7RjIVwCO8kqqQLBq1JDYfjOLzceKra/Kf5Ppe0n9IBLzJb25Ve
         O0hqyytnA3nrPbPqXomvlbb5YvIDvoRtoEPH2n+q1+u2g/f0++EuvQYNG39yqI81s1at
         9GjR4EhhN8LagO+HaZzhb160yzK6/T7SuW1mIueiUr4SGDwsb011K8XC2Qw1vdAOiZLy
         hgYwKLRtRhCiBH6F38BHv8NAIUtF3Zn/jOOffdVMbaKNT8CTIM5HisSrVEyhIcSbqbFd
         7ebSh3cVgXZF6qxSxlqDjOxn7syRygKapa/jGOQxnaJpklcW7kxW7TN4cnyw2ahlQAPm
         FS6g==
X-Gm-Message-State: ACgBeo15oKeAq2fn5Cf38tanEJXkhMx6yg92NxqCZPuJS9v0TNiL3Jws
        7RuZhxYtpvnhcSzU/v9+9fC8T2FZnbK0K5zbEahf2cJCJKvMnkXhmHqTEwMeXE42RIOB4YFyUOR
        JoV68C1Q+uVZVo0ZcHk/S/JVBx15chXc7HQ==
X-Received: by 2002:a05:6402:27d2:b0:43e:3ff6:ad58 with SMTP id c18-20020a05640227d200b0043e3ff6ad58mr6088472ede.234.1661506209389;
        Fri, 26 Aug 2022 02:30:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6XJzAEWr8eqq15mFmGlLDa4Jyg+lpqyrhmK/BeY0maPxdBlMFXzhdYr8mV9cuIMz38h/dntQ==
X-Received: by 2002:a05:6402:27d2:b0:43e:3ff6:ad58 with SMTP id c18-20020a05640227d200b0043e3ff6ad58mr6088455ede.234.1661506209190;
        Fri, 26 Aug 2022 02:30:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id bq10-20020a170906d0ca00b00734b2169222sm648238ejb.186.2022.08.26.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:30:08 -0700 (PDT)
Message-ID: <859556d5-f079-8c53-ea28-e2bb56a27732@redhat.com>
Date:   Fri, 26 Aug 2022 11:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Update tablet_mode_sw
 module-param help text
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     "Luke D . Jones" <luke@ljones.dev>,
        platform-driver-x86@vger.kernel.org
References: <20220826092921.8907-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220826092921.8907-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/26/22 11:29, Hans de Goede wrote:
> Document how to select asus_wmi_lid_flip_rog_devid as tablet_switch_mode
> by adding "3:lid-flip-rog" to the tablet_mode_sw module-param help text.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-nb-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index bbfed85051ee..222aef762a6c 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -43,7 +43,7 @@ MODULE_PARM_DESC(wapf, "WAPF value");
>  
>  static int tablet_mode_sw = -1;
>  module_param(tablet_mode_sw, uint, 0444);
> -MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-dock 2:lid-flip");
> +MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-dock 2:lid-flip 3:lid-flip-rog");
>  
>  static struct quirk_entry *quirks;
>  

