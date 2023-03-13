Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5145FC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjCMMQe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 08:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjCMMQd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 08:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAB63524C
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678709752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lXPYbBYCTYiMKrYNBmUMEnReGM9kweVlcHiDWAi6CGI=;
        b=R9S/gn3WlO4xPNVtmibO5IGGDlEE06ej5o6ac81yAMvUewhOHSjvbnM/Yli/gL0FlfHfIh
        C5dTNGEqfY5BbUH9B1LvjZWJlFDiCKWFIWM9D81obb/g5RoOHSwytVhwgaiOwrPdaTa7vl
        Jf8T27dURyESbBwlStME1i3UWA9VEIs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-Uwzr95SmN6yvFT74ZlQDiQ-1; Mon, 13 Mar 2023 08:15:51 -0400
X-MC-Unique: Uwzr95SmN6yvFT74ZlQDiQ-1
Received: by mail-ed1-f71.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso16494761edu.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 05:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXPYbBYCTYiMKrYNBmUMEnReGM9kweVlcHiDWAi6CGI=;
        b=xObMV5q2E/LUUevBURV8oOj1vwGwRBfhYVtr3+gX4LCnA6BfGKe1dSH3ToWVbG5nUx
         pFYkdMlEVEgtYWhZIySGrjwn5BMXdJl9Q+PZqTIgCZqisEgDplBct8moLUfY2v69xCmv
         LjN8onT3RGlQ1WL2Kyir8SXHh9vy1oBqn2U8/seU5vvEsjpvNXjcaINOxINZzXlBSQ5t
         SkXzm2VOl20M8JfgTD1vRCNsJ/JBfX2z4tOsCSjvnBSIoiujOIHK6bhdtgXFOSYtU3MG
         VzSJ1GHQoidVnd4Z5CUgc+qiCo7kTLO5pIScAl4QaZr3hmlrZvnHUow1UE+3bS5xO26c
         riBw==
X-Gm-Message-State: AO0yUKVtaiP+qhQNtFSvCi8eWUEXdU+EDYCZQaNXFTN/DPaSFfvlUN9s
        eX/gNC95qpCvg/+PAgTY/zKM+Ar1S6Kjs+5sYEbpsipMjfRP4PeFQ08hHzPQjB5YyDfVdaNU0wF
        ao8DcKQ0caccjFkAnEOMM9A79vI4vK+S13Q==
X-Received: by 2002:a17:906:5857:b0:878:81d7:9f77 with SMTP id h23-20020a170906585700b0087881d79f77mr30905956ejs.34.1678709750511;
        Mon, 13 Mar 2023 05:15:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Z5b6MLUkGKVg3T2p+PspkIBkQYBJ2aBl5xrk9I6UV7xAL0Qnjp/YptrZXGlySHUMvNN+nNA==
X-Received: by 2002:a17:906:5857:b0:878:81d7:9f77 with SMTP id h23-20020a170906585700b0087881d79f77mr30905930ejs.34.1678709750285;
        Mon, 13 Mar 2023 05:15:50 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ho20-20020a1709070e9400b00927e0fb3e50sm1506984ejc.100.2023.03.13.05.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 05:15:49 -0700 (PDT)
Message-ID: <a3a87570-5885-6954-4b20-b7a5201c0a07@redhat.com>
Date:   Mon, 13 Mar 2023 13:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] backlight: apple_bl: Use acpi_video_get_backlight_type()
Content-Language: en-US
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Aditya Garg <gargaditya08@live.com>,
        platform-driver-x86@vger.kernel.org,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230307120540.389920-1-hdegoede@redhat.com>
 <20230309170911.GC96419@aspen.lan>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309170911.GC96419@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/23 18:09, Daniel Thompson wrote:
> On Tue, Mar 07, 2023 at 01:05:40PM +0100, Hans de Goede wrote:
>> On some MacBooks both the apple_bl and the apple-gmux backlight drivers
>> may be able to export a /sys/class/backlight device.
>>
>> To avoid having 2 backlight devices for one LCD panel until now
>> the apple-gmux driver has been calling apple_bl_unregister() to move
>> the apple_bl backlight device out of the way when it loads.
>>
>> Similar problems exist on other x86 laptops and all backlight drivers
>> which may be used on x86 laptops have moved to using
>> acpi_video_get_backlight_type() to determine whether they should load
>> or not.
>>
>> Switch apple_bl to this model too, so that it is consistent with all
>> the other x86 backlight drivers.
>> [snip]
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> but...

Thank you.

>> ---
>> A note to the backlight class / subsystem maintainers, this change
>> applies on top of a similar patch for drivers/platform/x86/apple-gmux.c
>> which makes that driver use acpi_video_get_backlight_type(). See:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> I believe it is easiest to also merge this patch through
>> the platform-drivers-x86 tree, may I please have your Ack for this ?
>> ---
> 
> ... please don't treat above as an ack. Lee Jones will hopefully be
> along shortly to discuss that!

Understood.

Regards,

Hans

