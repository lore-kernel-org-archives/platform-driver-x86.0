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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9531BC433E6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 18:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EB9164F6A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 18:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbhBBSWj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Feb 2021 13:22:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58917 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233658AbhBBOGW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Feb 2021 09:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612274695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MKvpyexj8hdyx3zG/jAy0UzjVGsWowtAK0n9Ey04MJk=;
        b=dfLatvomAZFEfW4DLdKvYtVwtPqUJV0eOV69/QpT4e38hkD4XGN9rEBTQRh1YPDGlKCXpc
        41iw36jLbXwAVqQ26QSjyrN28IOLGAqjknZg0z5k5PkTVv40lLLV8fCHCWxu1iR2583xpH
        hdzZKZN5mXM11hTQVZ5PzfDdjItGz2w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-auGsKaojNAymyN3oCOjvbQ-1; Tue, 02 Feb 2021 09:04:53 -0500
X-MC-Unique: auGsKaojNAymyN3oCOjvbQ-1
Received: by mail-ed1-f69.google.com with SMTP id a26so9667737edx.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Feb 2021 06:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MKvpyexj8hdyx3zG/jAy0UzjVGsWowtAK0n9Ey04MJk=;
        b=EMzzrmOZlYrxxsjx8+A9lxoJK5esF7s6o8E01myUGTmfAB8IQRa6bRIQfNAeW9e0aT
         1CMd1neSQBE9JP/I+1337ROJQF1xcv9Q98+fgbsoo12C0Edkyeiaf/Aa5F0Fz+DFJdRI
         NG7y50vlGiyaHVS0ZU5zAzAfbe5B4h/FQVLDQtg0tN/lcxa61w8hIoSOqSzu0X2KqZdb
         SVvfAhYLS0sa+u1lBw5/k/K3+SdQJnhoUwnnmHM6/zCdiHKTko2INgslH5fg6qCAbBq1
         Vc04JbvYZSC/m4cVGxVew3omskKfya7CLZhaNTmWgyv70P0sMeh3L2Qk/F5VgWLBYL8Z
         9x/w==
X-Gm-Message-State: AOAM532DXpNwySsie12p/1pH/lpthssjdFj4KgMHFEfZte/Li9uTiH2/
        S++k2Um55H4enVVMnbFxxrBn6ymm3WmlAbtlejF0+v7+7BVqNTobn/orcCdAtwO+rUekas2ewyF
        JSQBGPkfWRcr1C+mZc8jccRxIAwIZGg75lQ==
X-Received: by 2002:a17:906:2a06:: with SMTP id j6mr21718921eje.164.1612274692060;
        Tue, 02 Feb 2021 06:04:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd4zMs8S4fP6OHAYsfcRxCYPfQbucQjG/nyFEtkYPFGxIqd0RO5avdSDb6ad1WtOVLE+vFmQ==
X-Received: by 2002:a17:906:2a06:: with SMTP id j6mr21718910eje.164.1612274691944;
        Tue, 02 Feb 2021 06:04:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id m14sm1421119edl.10.2021.02.02.06.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 06:04:50 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Don't register keyboard_lang
 unnecessarily
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <mpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>
References: <20210125205258.135664-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bd23eabc-5168-8491-866a-0dfb108433bc@redhat.com>
Date:   Tue, 2 Feb 2021 15:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125205258.135664-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/21 9:52 PM, Hans de Goede wrote:
> All recent ThinkPad BIOS-es support the GSKL method used to query the
> keyboard-layout used by the ECFW for the SHIFT + other-key key-press
> emulation for special keys such as e.g. the '=', '(' and ')' keys
> above the numpad on 15" models.
> 
> So just checking for the method is not a good indicator of the
> model supporting getting/setting the keyboard_lang.
> 
> On models where this is not supported GSKL succeeds, but it returns
> METHOD_ERR in the returned integer to indicate that this is not
> supported on this model.
> 
> Add a check for METHOD_ERR and return -ENODEV if it is set to
> avoid registering a non-working keyboard_lang sysfs-attr on models
> where this is not supported.
> 
> Cc: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've applied this patch to my review-hans branch now,
so this should show up in platform-drivers-x86/for-next soon.

Regards,

Hans

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index df2506974106..0b268e17cb7b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10356,6 +10356,13 @@ static int get_keyboard_lang(int *output)
>  	if (!acpi_evalf(gskl_handle, &kbd_lang, NULL, "dd", 0x02000000))
>  		return -EIO;
>  
> +	/*
> +	 * METHOD_ERR gets returned on devices where there are no special (e.g. '=',
> +	 * '(' and ')') keys which use layout dependent key-press emulation.
> +	 */
> +	if (kbd_lang & METHOD_ERR)
> +		return -ENODEV;
> +
>  	*output = kbd_lang;
>  
>  	return 0;
> 

