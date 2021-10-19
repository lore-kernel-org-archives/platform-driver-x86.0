Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB879C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 15:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97BEC60F9F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 15:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhJSPXF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Oct 2021 11:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60700 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230097AbhJSPXE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Oct 2021 11:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634656851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZWUsS1V9g+wCEnrKEW2P2nBdry4D/ofDOreqnNn0C2s=;
        b=Ol1/scX32HL2GqkYgWcHnVDQ0ZQldkG6e2/3Emi+FiPfDVXYw5rm97C2H+MyL14bghEZDM
        35K2zCChV/YUAYWeqoJqR7chUzNwqmzteBsAcTbVy07060SYxWhMlOkvfmCRXfYr+Rj6HA
        gJTJMKG0HKsYbC9zDDzaFCV4yLk47w4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Qp6QgkwsPBSd_FWpKkiHjw-1; Tue, 19 Oct 2021 11:20:50 -0400
X-MC-Unique: Qp6QgkwsPBSd_FWpKkiHjw-1
Received: by mail-ed1-f72.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso754902edt.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Oct 2021 08:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZWUsS1V9g+wCEnrKEW2P2nBdry4D/ofDOreqnNn0C2s=;
        b=KUPEzOOQJYv3G6jLtxpag/XblsCcFpnkRy5K9O42vRkK1JyKCQFpIFKD7CmiAqOeAV
         Vi9T5+gR8FLEyqAv08qnhnVH+gwPh1I4NVTIAXc0mf95sG52iROKLrow0GQsMbPBXGna
         w9emwpE7v4zKp7WPetTTUsZJusPiA6pMSkmU9cJdbcU3v/udGnFYg/iTLmonols3Wg7Y
         TgAOKYN6EXvc3OAmWQdiut7xqbAMMMEqI9Fr8G5UxHINcnyTz6X+j0ZyIHBzyaUgCoKI
         Y2USv/0hvvq4XWPFBnkM3BeYSpW5bwvk8jVSYowAeCn4uffDoH1vkd47xsT8lp+yzkKH
         D0nQ==
X-Gm-Message-State: AOAM532piddBjLtFI1A7U7qKtXG1lGRxWMQFMUyHN4DENXQdGGuq2M/i
        1zC+SBeIjdbalyjVHAgAjk4lMfhcDd/duPOx6E7ZOeTjP3P0tpLseeYAWiKZqxSOZYcR5oG9JA6
        ve1UxBN6pfCoLam6LpgF3fnMbtSvkRfrZgQ==
X-Received: by 2002:a17:906:6149:: with SMTP id p9mr14323020ejl.362.1634656848836;
        Tue, 19 Oct 2021 08:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW6yXFO906BnyicHeJfsJ3U1p1KKs/jg69z8HMFssRbuPqqO7meXlrWwPYJVckb8fdiwjteg==
X-Received: by 2002:a17:906:6149:: with SMTP id p9mr14322995ejl.362.1634656848617;
        Tue, 19 Oct 2021 08:20:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s12sm3985147edj.82.2021.10.19.08.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 08:20:48 -0700 (PDT)
Message-ID: <21ebf31f-2f2a-2f5e-e731-a44ea178a6bd@redhat.com>
Date:   Tue, 19 Oct 2021 17:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical
 warning
Content-Language: en-US
To:     Nathan Chancellor <nathan@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tor Vic <torvic9@mailbox.org>
References: <20211018182537.2316800-1-nathan@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211018182537.2316800-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/18/21 20:25, Nathan Chancellor wrote:
> A new warning in clang points out a use of bitwise OR with boolean
> expressions in this driver:
> 
> drivers/platform/x86/thinkpad_acpi.c:9061:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>         else if ((strlencmp(cmd, "level disengaged") == 0) |
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                            ||
> drivers/platform/x86/thinkpad_acpi.c:9061:11: note: cast one or both operands to int to silence this warning
> 1 error generated.
> 
> This should clearly be a logical OR so change it to fix the warning.
> 
> Fixes: fe98a52ce754 ("ACPI: thinkpad-acpi: add sysfs support to fan subdriver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1476
> Reported-by: Tor Vic <torvic9@mailbox.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 07b9710d500e..7442c3bb446a 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9058,7 +9058,7 @@ static int fan_write_cmd_level(const char *cmd, int *rc)
>  
>  	if (strlencmp(cmd, "level auto") == 0)
>  		level = TP_EC_FAN_AUTO;
> -	else if ((strlencmp(cmd, "level disengaged") == 0) |
> +	else if ((strlencmp(cmd, "level disengaged") == 0) ||
>  			(strlencmp(cmd, "level full-speed") == 0))
>  		level = TP_EC_FAN_FULLSPEED;
>  	else if (sscanf(cmd, "level %d", &level) != 1)
> 
> base-commit: 85303db36b6e170917a7bc6aae4898c31a5272a0
> 

