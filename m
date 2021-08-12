Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A67EC4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 14:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B1BE6103A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 14:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237171AbhHLO44 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47594 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236417AbhHLO4y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Aug 2021 10:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628780189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cjsDZJduu5uDvA/8iU4JwndmjzVaghcHRj0vb6wP0ns=;
        b=THzHBPnN/ar9LfKGZeD8zve3ALMMTMZPfy1qohqUGSQJfiNa7pu/7kF/Wb35uCzNO5C/2l
        x6J3DET8aDn4c4OtqTLB/BUA5qN/nvQ4jcB1MllcU413JdeIKovKcvUgf6grnI3V6kFf9A
        zpv2RPuHb/rCMJZrus6XVJ8Npb6QBRI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-2nxqxwpiO2SYFB_-pQzwBQ-1; Thu, 12 Aug 2021 10:56:28 -0400
X-MC-Unique: 2nxqxwpiO2SYFB_-pQzwBQ-1
Received: by mail-ej1-f69.google.com with SMTP id ja25-20020a1709079899b02905b2a2bf1a62so1926741ejc.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Aug 2021 07:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cjsDZJduu5uDvA/8iU4JwndmjzVaghcHRj0vb6wP0ns=;
        b=NWXzq0sqvfBsihDHS4I6pz4e1SH0z2Ss6coILqUtKfvVmYDQw6ckIykZzuPtu/wF/f
         SZ1MM4BcjXK8vIU4dODLzaSlEqW4h4E8x1b0oNsf+BACw9Y3n3FKDkEFWruTxwRMf/QT
         7JPainyTUBDedVEpLv3RQZUMYVo4S5BQuYbiccWywRe0BBcgXJoK3+rPgdHBYj+tkIwJ
         0RL/OHeCrUTgDf6giUQbKc+KpsJyVDTv0tucMOSCDC56GOzRKhsQUrdU2VjtEr9Fw1sW
         rVZEl69O5NIQHuCls5ar9u99O/9tp+RidE2bj3bXoKPjT6nxK7Pt2bVc27AqMWSvNqg+
         YxRQ==
X-Gm-Message-State: AOAM533wxzs+8fI+az9AvrnWgNWHUNM1Uj/nKqo1R9K2kkd0CI38HFv2
        imugHtfZnVCufOwEDfuR1PlfH1SoZClcMXjLHvCVhAUR3DWHB2/qMeaHfugs6i7Qc8EvKrccAVn
        FrChloMVTCAKqS5zmFl9K2xKJN0bDFLEdEEMfILNHfe78uS0A+1Krw8jkPCFBbg8EENsJNNcVBp
        C+8gJ+aab/5A==
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr6094832edl.307.1628780186693;
        Thu, 12 Aug 2021 07:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmuV7oRuDTynylP8pniYBhkAtrBK+YWTlP5mX+AmAmAr3qJjSaBg8fp0cbTxhEBsgQXGMl3g==
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr6094811edl.307.1628780186491;
        Thu, 12 Aug 2021 07:56:26 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cz17sm1258443edb.36.2021.08.12.07.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 07:56:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] platform/x86: asus-nb-wmi: Allow configuring
 SW_TABLET_MODE method with a module option
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210812145513.39117-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1166d133-e2da-1068-4045-9bd6aa21aca4@redhat.com>
Date:   Thu, 12 Aug 2021 16:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812145513.39117-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 8/12/21 4:55 PM, Hans de Goede wrote:
> Unfortunately we have been unable to find a reliable way to detect if
> and how SW_TABLET_MODE reporting is supported, so we are relying on
> DMI quirks for this.
> 
> Add a module-option to specify the SW_TABLET_MODE method so that this can
> be easily tested without needing to rebuild the kernel.
> 
> BugLink: https://gitlab.freedesktop.org/libinput/libinput/-/issues/639
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans and the pdx86/fixes branches
now (the patches were already tested by the bug reporter before I posted
them).

Regards,

Hans


> ---
>  drivers/platform/x86/asus-nb-wmi.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 0cb927f0f301..9929eedf7dd8 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -41,6 +41,10 @@ static int wapf = -1;
>  module_param(wapf, uint, 0444);
>  MODULE_PARM_DESC(wapf, "WAPF value");
>  
> +static int tablet_mode_sw = -1;
> +module_param(tablet_mode_sw, uint, 0444);
> +MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-dock 2:lid-flip");
> +
>  static struct quirk_entry *quirks;
>  
>  static bool asus_q500a_i8042_filter(unsigned char data, unsigned char str,
> @@ -477,6 +481,21 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
>  	else
>  		wapf = quirks->wapf;
>  
> +	switch (tablet_mode_sw) {
> +	case 0:
> +		quirks->use_kbd_dock_devid = false;
> +		quirks->use_lid_flip_devid = false;
> +		break;
> +	case 1:
> +		quirks->use_kbd_dock_devid = true;
> +		quirks->use_lid_flip_devid = false;
> +		break;
> +	case 2:
> +		quirks->use_kbd_dock_devid = false;
> +		quirks->use_lid_flip_devid = true;
> +		break;
> +	}
> +
>  	if (quirks->i8042_filter) {
>  		ret = i8042_install_filter(quirks->i8042_filter);
>  		if (ret) {
> 

