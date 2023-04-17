Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C729DC77B77
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 10:51:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjDQKvO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbjDQKuw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 06:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCA98A6F
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681728480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=icnW2LXvgJOkMT3ImYMGxEL0kg7+YMO+xtreYgKJV+4=;
        b=JUaeVY2iKQK38qR73VkecUfBa+zYTOXEdv8WwJP3oeQ93jRzz0xOw2mtWBCzwWUmCuAOOl
        pBqIXldKwys0cLJBF0AAtTHXDiwbth1SjB6S0Ddw4EvpET/NdJuCNq6cG5B+jmIy7Y7vgc
        FCSkQiTLwKhRVSF6QK3i/LWIXcpcB80=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-V0cJJ1I-Pg6fGYvjpopxow-1; Mon, 17 Apr 2023 06:25:37 -0400
X-MC-Unique: V0cJJ1I-Pg6fGYvjpopxow-1
Received: by mail-ed1-f69.google.com with SMTP id z34-20020a509e25000000b00504ed11e0c5so8433491ede.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727136; x=1684319136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icnW2LXvgJOkMT3ImYMGxEL0kg7+YMO+xtreYgKJV+4=;
        b=esrhE5PBR8hqKcWgmpDur9/pGwD9DLnkS5Nm7A+U8R1dKJ+HWkqu+eqSzLwP00LpLt
         oKhhhx1kLzGvftKFwPPfinCz9LG8pacaM5A4SUd1bzK/GC3YIou5J+rJjxuuue6qgkVS
         B+q/tUO1n3GpWMMpb7rKEOFdM3gSDwOMSnONnhnYVu5I69eCrEp0BjUOX1JRn0KJ4sd1
         FunHUfiVMP2xd4wcjOL9ZLNcsIwjKPlKIoQ0sfmD4SKckfSzNP3f/2DjWUXM9M/yDQ/q
         sipNOILDDKJc5YGIGX7j62uAd/Kl84DHsU8F6jmA0tnkyAwztSYVCItRGL5MFDSc4SHV
         GqLg==
X-Gm-Message-State: AAQBX9eODAIyX193jtd1cAgwvIPeWPQ1yySDgQCTka5mW1MIDAIzQTl6
        JBMluOXpVkLIX1nxEa3ffwLWeT0wNXg87ezY8i/4o9k6ynKyXSmw/PyCiulZNqCFcpzPlnA97wV
        Nvsd3Mr3RcUKFvZgYxl/eufvT/4vW2ila2G1AEmyYjw==
X-Received: by 2002:a17:906:6054:b0:947:ebd5:c798 with SMTP id p20-20020a170906605400b00947ebd5c798mr6838235ejj.54.1681727135872;
        Mon, 17 Apr 2023 03:25:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350aaIl56IdLA3NbNLrKinZOW8Zjf8g3yD0laZKybOhej/UzvYARION1QstjVk5E7GhpmGglIPg==
X-Received: by 2002:a17:906:6054:b0:947:ebd5:c798 with SMTP id p20-20020a170906605400b00947ebd5c798mr6838220ejj.54.1681727135599;
        Mon, 17 Apr 2023 03:25:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t16-20020a170906269000b00932ba722482sm6526421ejc.149.2023.04.17.03.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:25:35 -0700 (PDT)
Message-ID: <1aab7409-ae85-802f-9e22-25b8c456b06b@redhat.com>
Date:   Mon, 17 Apr 2023 12:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] platform/x86: x86-android-tablets: Update Yoga Book
 HiDeep touchscreen comment
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230416212841.311152-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230416212841.311152-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/16/23 23:28, Hans de Goede wrote:
> After recent i2c-hid-of changes, the i2c-hid-of driver could be used
> for the Yoga Book HiDeep touchscreen comment instead of the native hideep
> driver. Update the comment to reflect this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next)
branch now.

Regards,

Hans




> ---
>  drivers/platform/x86/x86-android-tablets/lenovo.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index a571dcd11544..b5dd74bf9e8c 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -41,10 +41,13 @@ static struct lp855x_platform_data lenovo_lp8557_pdata = {
>  /* Lenovo Yoga Book X90F / X90L's Android factory img has everything hardcoded */
>  
>  /*
> - * The HiDeep IST940E touchscreen comes up in HID mode and could alternatively
> - * be used in I2C-HID mode (I2C-HID descriptor reg 0x0020) if i2c-hid-of.c is
> - * modified to use generic (non-OF) device-properties and thought to deal with
> - * the reset GPIO. "hideep,force-native-protocol" resets it to native mode.
> + * The HiDeep IST940E touchscreen comes up in I2C-HID mode. The native protocol
> + * reports ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR which are not reported in HID
> + * mode, so using native mode is preferred.
> + * It could alternatively be used in HID mode by changing the properties to:
> + *	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0020),
> + *	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
> + * and changing board_info.type to "hid-over-i2c".
>   */
>  static const struct property_entry lenovo_yb1_x90_hideep_ts_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1200),

