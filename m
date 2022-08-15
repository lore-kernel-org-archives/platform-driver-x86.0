Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5FBC25B0E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Aug 2022 13:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbiHONZo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Aug 2022 09:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240447AbiHONZX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Aug 2022 09:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DD0926FB
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660569921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dIIzjPxeddzxMn7RZ9/iKALDcfamsWN+Y3QvwDD0LAQ=;
        b=HQkC9+r428EDkWPmbBpUhX/NXorfdxCkf1gETUN/ra99SNJI4t+f/TUdFlrK4/xW3by+zE
        eFvpNYrYu57+pwRsB65hiJ2icMYdbf+SXSrEZQuDnTuVOthulBBt2SLMI3wI+tt4QDBf96
        2/et5c+ppWNYhM//T58+qpy9fT7pRy4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-b6mIy0FxPvecxLXhhvxb2g-1; Mon, 15 Aug 2022 09:25:17 -0400
X-MC-Unique: b6mIy0FxPvecxLXhhvxb2g-1
Received: by mail-ed1-f70.google.com with SMTP id c14-20020a05640227ce00b0043e5df12e2cso4763224ede.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dIIzjPxeddzxMn7RZ9/iKALDcfamsWN+Y3QvwDD0LAQ=;
        b=d/WS5frYmm/FYDxJ4S6wG67noyhz/kA0SPfvZ9BXEaqhpTlLYUeBSDuZ+xHQtZ8zFB
         brDj8KWqZd2PxjIBWmElirP8DWPjRenSD6m7Q1+Ca5WCFFLxOm1lILJorOdvrCsSxxP8
         hO02AqWWV8lgunCOlNVO52bc5u7UFCojTAqXKUtQMyyzSZdjUd3mMdSPmTR3diIO31HE
         dIR/We6mgeMpLlwC4vtqqiOOv2eRhRfVb1BOy/4ZmNxxVtvawzGxxucm6QGtWg0VYEwe
         Pq7i8AX0NI9M0JxeQf8CL2xF0PCHN43XnxlUf+fZ/oqaOHMm1ukVt7P/L0YPSZrNgbNd
         NJJw==
X-Gm-Message-State: ACgBeo3DkZrUt8cqQ9ZGU9Iz6nduRYXxiPs8tTJOehvwB6HOKxK0dE+z
        ir439B4i3IjtjsUnZ/PQOwtO7G0alDN6rMUp76cjxO44yLuu5EBJEYBxManowoTuvI/39kX7yr0
        iRPMcF0mPRA3MN8jaDYoB81bVzLclEIfeZg==
X-Received: by 2002:a17:907:a06b:b0:730:9496:4f63 with SMTP id ia11-20020a170907a06b00b0073094964f63mr10323124ejc.238.1660569916907;
        Mon, 15 Aug 2022 06:25:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Np8EHjN3xV6j5gtUKKxrJruO/oaY6oPl7sUzHkQj7ymdHJKpTA67SMUruPrbigSRKc8zgyg==
X-Received: by 2002:a17:907:a06b:b0:730:9496:4f63 with SMTP id ia11-20020a170907a06b00b0073094964f63mr10323118ejc.238.1660569916757;
        Mon, 15 Aug 2022 06:25:16 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id j4-20020aa7ca44000000b0043d1a9f6e4asm6703036edt.9.2022.08.15.06.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 06:25:16 -0700 (PDT)
Message-ID: <fc250b82-c7c7-9215-f3dd-be87e0a72edd@redhat.com>
Date:   Mon, 15 Aug 2022 15:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/6] Fixes 98829e84dc67 ("asus-wmi: Add dgpu disable
 method")
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220812222509.292692-1-luke@ljones.dev>
 <20220812222509.292692-2-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220812222509.292692-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Luke,

On 8/13/22 00:25, Luke D. Jones wrote:
> The dgpu_disable attribute was not documented, this adds the
> required documentation.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks for the patch. Note that the Fixes tag should be above your
signed-off-by and then the patch should otherwise have a normal
subject + body. I've changed the commit msg to the following
while merging this:

"""
platform/x86: asus-wmi: Document the dgpu_disable sysfs attribute
    
The dgpu_disable attribute was not documented, this adds the
required documentation.
    
Fixes 98829e84dc67 ("asus-wmi: Add dgpu disable method")
Signed-off-by: Luke D. Jones <luke@ljones.dev>
"""

and I will make similar changes to patch 2/6 and 3/6
> ---
>  Documentation/ABI/testing/sysfs-platform-asus-wmi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index 04885738cf15..0f932fd60f4a 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -57,3 +57,12 @@ Description:
>  			* 0 - default,
>  			* 1 - overboost,
>  			* 2 - silent
> +
> +What:          /sys/devices/platform/<platform>/dgpu_disable
> +Date:          Aug 2022
> +KernelVersion: 5.17
> +Contact:       "Luke Jones" <luke@ljones.dev>
> +Description:
> +               Disable discrete GPU:
> +                       * 0 - Enable dGPU,
> +                       * 1 - Disable dGPU,
> \ No newline at end of file

Next time please make sure the file always ends with a newline
even in intermediate patches.

Regards,

Hans


