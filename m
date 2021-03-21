Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19E7C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D09D6193A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCUQi5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37712 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229879AbhCUQiX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 12:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616344701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lvmy+xITTOphsL6R6LHjacVC8VE0cJkum34ci5o1DgI=;
        b=IE/AaJMIoeFRIAhMt9sX7OC0BNgy/+EFyYjfBuWEUEm7ja/ljc7oJDRrltJhidY6YJtyoI
        ezKQEZHY1bC+/ju43yTmtLAGEmI/w8j5A9qAKqnVrcKEtrPzsV91meNuJLeRZ4FGVKG3mj
        OJIT4QtyIW0t7ccLa9aDBzAkc5y9jb0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-t6xEg2juNfWxu0dtPF3dRQ-1; Sun, 21 Mar 2021 12:38:19 -0400
X-MC-Unique: t6xEg2juNfWxu0dtPF3dRQ-1
Received: by mail-ed1-f71.google.com with SMTP id h5so26084344edf.17
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 09:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lvmy+xITTOphsL6R6LHjacVC8VE0cJkum34ci5o1DgI=;
        b=tqyG7WgQeX4IyoVEARiIcOuIUn3zSqdbZq74vdGKwsk7AL3U0hjrjiUJiuaSo6J1jX
         Ts3PN/MCaw3B8C9teOcMX3LxqC+qcAabxwNWICOe4M7OT+2ycHpa5l6FgNBx3SGzLug4
         bQ3k4QQ59tzgDU0S6eATa1lLaxbzLQakKEJy/oVIqCU5x951fsvXuqA8vCAmUHyb36MX
         XgRUgZL9dYgfvYOfc1yTuuYc/IEn77O5sG2BP6FQQvS7LVjEh1GL3oZLFTr7hQLlNS5B
         yV7DiBe3dxc38h+P2a6W52WJgV43n/QSHpKWuOY7jv5VF9rXDMBfCLgQxCIqiRdty152
         dhwQ==
X-Gm-Message-State: AOAM530Rjfv0RqHwxwMR4iugbZcZfbu6z+HOsAi+SBVDZAJEwUUbi4dg
        O9vDc+5n6cgfH82ijfvvWB3+54ExWVvHy9kNv7brbu+vymueDSEoYMYmqwZeCsC8W9Kogf4ap9f
        3GUgy8fz+lJn0FNUBwncFOUV+XAsx4vb/D8D5YXyheqGXWHiW7EM+8Y31W1635HlYY64SkLWsqD
        UEYCe2CZ+ZQg==
X-Received: by 2002:a17:907:d1f:: with SMTP id gn31mr4543237ejc.536.1616344698560;
        Sun, 21 Mar 2021 09:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO1AG/z0YFDsQxJO46hq7JwZHTOAIaqSBBh87j3n/vXqZGMokHDNEdc8zEsS0nHVv+pnwWdA==
X-Received: by 2002:a17:907:d1f:: with SMTP id gn31mr4543223ejc.536.1616344698376;
        Sun, 21 Mar 2021 09:38:18 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c15sm7307965ejm.52.2021.03.21.09.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 09:38:18 -0700 (PDT)
Subject: Re: [PATCH] Allow the FnLock LED to change state
To:     Esteve Varela Colominas <esteve.varela@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20210315195823.23212-1-esteve.varela@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0cbd3718-278f-ccc7-c389-b8ebb8338491@redhat.com>
Date:   Sun, 21 Mar 2021 17:38:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315195823.23212-1-esteve.varela@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/15/21 8:58 PM, Esteve Varela Colominas wrote:
> On many recent ThinkPad laptops, there's a new LED next to the ESC key,
> that indicates the FnLock status.
> When the Fn+ESC combo is pressed, FnLock is toggled, which causes the
> Media Key functionality to change, making it so that the media keys
> either perform their media key function, or function as an F-key by
> default. The Fn key can be used the access the alternate function at any
> time.
> 
> With the current linux kernel, the LED doens't change state if you press
> the Fn+ESC key combo. However, the media key functionality *does*
> change. This is annoying, since the LED will stay on if it was on during
> bootup, and it makes it hard to keep track what the current state of the
> FnLock is.
> 
> This patch calls an ACPI function, that gets the current media key
> state, when the Fn+ESC key combo is pressed. Through testing it was
> discovered that this function causes the LED to update correctly to
> reflect the current state when this function is called.
> 
> The relevant ACPI calls are the following:
> \_SB_.PCI0.LPC0.EC0_.HKEY.GMKS: Get media key state, returns 0x603 if the FnLock mode is enabled, and 0x602 if it's disabled.
> \_SB_.PCI0.LPC0.EC0_.HKEY.SMKS: Set media key state, sending a 1 will enable FnLock mode, and a 0 will disable it.
> 
> Relevant discussion:
> https://bugzilla.kernel.org/show_bug.cgi?id=207841
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1881015
> 
> Signed-off-by: Esteve Varela Colominas <esteve.varela@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

And I'll also add it to the fixes branch so that it gets included in
one of the future 5.12-rc releases.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c40470637..09362dd74 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4079,13 +4079,19 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  
>  	case TP_HKEY_EV_KEY_NUMLOCK:
>  	case TP_HKEY_EV_KEY_FN:
> -	case TP_HKEY_EV_KEY_FN_ESC:
>  		/* key press events, we just ignore them as long as the EC
>  		 * is still reporting them in the normal keyboard stream */
>  		*send_acpi_ev = false;
>  		*ignore_acpi_ev = true;
>  		return true;
>  
> +	case TP_HKEY_EV_KEY_FN_ESC:
> +		/* Get the media key status to foce the status LED to update */
> +		acpi_evalf(hkey_handle, NULL, "GMKS", "v");
> +		*send_acpi_ev = false;
> +		*ignore_acpi_ev = true;
> +		return true;
> +
>  	case TP_HKEY_EV_TABLET_CHANGED:
>  		tpacpi_input_send_tabletsw();
>  		hotkey_tablet_mode_notify_change();
> 

