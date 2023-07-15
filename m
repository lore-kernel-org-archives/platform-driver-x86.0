Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCB9EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Jul 2023 09:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjGOJlj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Jul 2023 05:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjGOJli (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Jul 2023 05:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA00FC
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689414048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ot+dwxa9fBcUED3IRhl05mYhlO5fDmxxVbrEldSm+H4=;
        b=g8jklNuqj2s8E6+QSY0zPt8o3O/MRyI9ddfzSKu3kul4g3mpTgvV+fCq5n02POpm248cR0
        pPkNVPSj/kGqTZomZPpwJYkv29zKmbWcKIoQp/3HBxvoPDkyvClf/RruFsn1o8F4ms6TLx
        RHcupBdqg/rgFqA2bMnvCbk2+n0KcO8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-sXzSkb3HPYO2iOg6ZbaCdw-1; Sat, 15 Jul 2023 05:40:47 -0400
X-MC-Unique: sXzSkb3HPYO2iOg6ZbaCdw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50daa85e940so1796321a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 02:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689414046; x=1692006046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ot+dwxa9fBcUED3IRhl05mYhlO5fDmxxVbrEldSm+H4=;
        b=Q29vdy93qqi8RFzto/iZotggQ3s5GrliLG5w1hDclB0DLLuTePiJZn6WBj92aPnOBp
         0OsR0RyD8Pt0vlK9wfsPt+KE5mD7aqFNxDxH/xCBqKigswPNLqmGaePYLiwiTQFWkFZb
         k7G29qbU4pnFZ2dwJxOgXB1CffS5+u0dw3cpyAhIRxfaVKQHnn27HyaGlVQak5JiggSB
         O8+cGe3XjHA7GZ4WEmSHeNMGY0lps9+VuUZmqO1cLpgZIkll+TTsP/UfAOl+LNMkzmNP
         8GppCyhWj86iML3coA22j+PLxeZXc3Eu6cJRTNVeRIeDNZM7n45OLPhbxyUEffwPHveq
         MzeA==
X-Gm-Message-State: ABy/qLZYMHj5/sAsQL3rIkqAdokIAhWw8LOcS4Enfkal0FYJVBqk5Nzh
        o6PF7W1uc2mrFaCyYpGJpXHm0Q4ZjV5KvjcWhT1ghwiBYuFAJr3LycxJnWYOrTwWSo+PTHLPQG/
        z+0mIOx5hqypkq5ClKxxjX4q4zetMqQe5IqIy8yJYpw==
X-Received: by 2002:aa7:c245:0:b0:51d:d295:6741 with SMTP id y5-20020aa7c245000000b0051dd2956741mr5280486edo.6.1689414045892;
        Sat, 15 Jul 2023 02:40:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlExhXofDeInVI7POAegpWD7BJSu18PhTRnxs4HOgCwE1B+OAZlQKxL/yTBT6Lx4kUUX64MJgA==
X-Received: by 2002:aa7:c245:0:b0:51d:d295:6741 with SMTP id y5-20020aa7c245000000b0051dd2956741mr5280482edo.6.1689414045603;
        Sat, 15 Jul 2023 02:40:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j4-20020a50ed04000000b0051e2a6cef4fsm6850002eds.36.2023.07.15.02.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 02:40:44 -0700 (PDT)
Message-ID: <7ae06b8a-6c67-f6a6-06ed-2b6c8430c12c@redhat.com>
Date:   Sat, 15 Jul 2023 11:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Fix setting RGB mode on some
 TUF laptops
To:     Kristian Angelov <kristiana2000@abv.bg>, luke@ljones.dev
Cc:     platform-driver-x86@vger.kernel.org
References: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Kristian,

On 7/14/23 22:44, Kristian Angelov wrote:
> This patch fixes setting the cmd values to 0xb3 and 0xb4.
> This is necessary on some TUF laptops in order to set the RGB mode.
> 
> Closes: https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg
> Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
> ---
>  V1 -> V2. Make setting 0xb3 and 0xb4 the default logic
>  
>  drivers/platform/x86/asus-wmi.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 1038dfdcdd32..eb82ed723b42 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -738,13 +738,22 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
>  {
> -	u32 cmd, mode, r, g,  b,  speed;
> +	u32 cmd, mode, r, g, b, speed;
>  	int err;
>  
>  	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, &speed) != 6)
>  		return -EINVAL;
>  
> -	cmd = !!cmd;
> +	/* B3 is set and B4 is save to BIOS. Only set by default*/
> +	switch (cmd) {
> +	default:
> +	case 0:
> +		cmd = 0xb3;
> +		break;
> +	case 1:
> +		cmd = 0xb4;
> +		break;
> +	}

You are now leaving the value of cmd unmodified for values which are not 0 and 1.

I think you need to add a:

	default:
		return -EINVAL;

here to catch cmd not being either 0 or 1.

Luke, what do you think ?

Regards,

Hans



>  
>  	/* These are the known usable modes across all TUF/ROG */
>  	if (mode >= 12 || mode == 9)

