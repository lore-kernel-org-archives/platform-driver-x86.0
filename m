Return-Path: <SRS0=5/WG=DD=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31E3C2D0A8
	for <platform-driver-x86@archiver.kernel.org>; Sat, 26 Sep 2020 10:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E4C6238E2
	for <platform-driver-x86@archiver.kernel.org>; Sat, 26 Sep 2020 10:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SWbsTCmp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgIZKsK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 26 Sep 2020 06:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21997 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726409AbgIZKrm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Sep 2020 06:47:42 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601117260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ZIjURh9gEGj/A0gqHD3FD4qcsmY1BeCBDIYOYJ5HgE=;
        b=SWbsTCmpVV4AUFu/bfIoF7z/FTwUfnZMy3d+bHy67qV1cXJjE8DteTZQglOpFfgFszrQcd
        lwURxxv20Pc/cbAzlreebN6K/jus2ioVx51ajcQ2WI2x+vQ67FVkZpMAOGRUcSOLoy/vP4
        7Q51eBycTyDRWlLNFmuddBsNHpLw2D8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-Ve0W0-gWOgaz844PCIcvrQ-1; Sat, 26 Sep 2020 06:47:36 -0400
X-MC-Unique: Ve0W0-gWOgaz844PCIcvrQ-1
Received: by mail-ej1-f72.google.com with SMTP id ce9so1801420ejb.7
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2020 03:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ZIjURh9gEGj/A0gqHD3FD4qcsmY1BeCBDIYOYJ5HgE=;
        b=CnwmAVPVJVTk2WQu7XzCCfS2kSkqZC/sdkLdWejPTjUHI/gX6dmRwc8FYs8pInyyB4
         B4VR2PR9YAosZZw8NO8J6kaFCaGF+V/YY72ZwjatfyNVZeprca/hMgrRjVt+abmwO60d
         Pxjcmkkk2dPX5JCQrtU77U1Ryd9jiQOoKH+Vz1dC7jHr06M0Y6OJHBF0P0A0nd8MOh8R
         rj2fYK8+iCaovSh6w8o2MNnXSpcybGtICQ92Cq3WJzYWGI3WfuBeQZN60r0CpRXL9xMx
         6PM4iMRaPU/X94zOAzpQiSoEcUMnzpmTqcW27PgU4J5UQqZFMYzyxUpJ0Sgq/2dM0bKq
         mEUg==
X-Gm-Message-State: AOAM5312F8y0+/GbT9dYZbon9aKzsBgAMZxbARtARlZL5MHXOxRRl8z2
        QSiqPwcycgD2oBbVgzyupRFRjhPDjsU4dOPzymhHBdTzBxoeIdsoxWdHgoxEb4K5QvtW05SSxI1
        Vcg3qUfKjYZhYB41BOWK6UuxqEAQFrEC+dw==
X-Received: by 2002:a50:cd5d:: with SMTP id d29mr6213437edj.318.1601117255356;
        Sat, 26 Sep 2020 03:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+TO2+4q7lfJenzxiKAyyVxeaY1ycN09RTuKv+bIvfPTGXz5NjNkL+7gKrlxZTcuAGT+5aRA==
X-Received: by 2002:a50:cd5d:: with SMTP id d29mr6213410edj.318.1601117255089;
        Sat, 26 Sep 2020 03:47:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id j15sm3893921ejs.5.2020.09.26.03.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 03:47:34 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for home in HP OMEN
 laptops
To:     Sid Sun <sid@sidsun.com>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        andy <andy@kernel.org>
References: <174c79fb794.120dada4b39603.5369737602791060462@sidsun.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cad5f2ab-e319-b6fd-360d-5beb62d6899f@redhat.com>
Date:   Sat, 26 Sep 2020 12:47:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <174c79fb794.120dada4b39603.5369737602791060462@sidsun.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/26/20 1:36 AM, Sid Sun wrote:
> HP OMEN laptops have a key for OMEN Command Center where home key should be, which is not supported by current hp-wmi drivers, this patch addresses this, making use of the key as a dedicated home key
> 
> Without the patch in place, hp_wmi logs the following in dmesg:
> - hp_wmi: Unknown key code - 0x21a5
> 
> Tested and developed on: OMEN by HP Laptop 15-ce0xx
> 
> Signed-off-by: Sidharth Soni (Sid Sun) <sid@sidsun.com>

So after looking at:

http://s3.amazonaws.com/digitaltrends-uploads-prod/2017/09/HP-Omen-15-review-keyboard-2.jpg

I understand what you mean with "where home key should be". So I've been thinking
a bit about what is the best thing to do here. Arguably mapping it to
KEY_CONTROLPANEL would be more accurate. But I can completely understand how
you just want to have a working "home" key; and it indeed is in the place
where on HP laptop keyboards with a num-pad, you would expect the home key.

So lets just map it to KEY_HOME as you suggest:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 1762f335b..11cf8d1d6 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -149,6 +149,7 @@ static const struct key_entry hp_wmi_keymap[] = {
>          { KE_KEY, 0x2169, { KEY_ROTATE_DISPLAY } },
>          { KE_KEY, 0x216a, { KEY_SETUP } },
>          { KE_KEY, 0x231b, { KEY_HELP } },
> +       { KE_KEY, 0x21a5, { KEY_HOME } },
>          { KE_END, 0 }
>   };
> 

