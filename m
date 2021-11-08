Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF6FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 14:29:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44FF661105
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 14:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240432AbhKHObz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23372 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239581AbhKHObz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 09:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636381750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=71aVjrj1e3sOLG/pL2w6mLRIsX6/3JU4ODwP9EBqpA8=;
        b=djNVNgGRL/QQHZN8YOQDYt0rZQr19Xho648Yd5GL5g1ZAPBLsg5UnTaMgyAmgPb5Ovt1X5
        BJfwAARj387czzlcrLVf6mt2x1bpn+b47+J2dL5UJzGrNyElQuAj3okhq2kvWCphI9RFqw
        k2HqUtUxKwPS/zlvwbRc1j/U4BQu2+4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-4F7MfWf6PKi8NIG3BDkPYA-1; Mon, 08 Nov 2021 09:29:09 -0500
X-MC-Unique: 4F7MfWf6PKi8NIG3BDkPYA-1
Received: by mail-ed1-f72.google.com with SMTP id t20-20020a056402525400b003e2ad6b5ee7so15025350edd.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Nov 2021 06:29:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=71aVjrj1e3sOLG/pL2w6mLRIsX6/3JU4ODwP9EBqpA8=;
        b=AIsai9jh/hCIVQ5dOP2aAiiBa+HxC2yHkGNuepiwVBTdXSEvSVm5UArh+V4S4wh6JG
         BWcmnjC44FPuUj7zY6086pD10fUHVYARJsWahOL8kyH33M3UrRXNE60LZ4hLAtA0ePCP
         aA1udubE4ggiMojup2zLhDsQDlPTTLlt3zycvRTXlU7fTEvgjoruehosthkNfzcjsdyF
         P0haRCfWzTnRYy1f35FZrnnIiQ/kFlbiRksxR+pm8BGLvNLWp7FL343HWRPMrgFVGPjX
         hHb4ybnoEA2QN8XhzAx5pMHavLwg+P7zifnd4S9i/FvSEj5W/oWvLQp7Plkb6JPM1zNh
         FgoA==
X-Gm-Message-State: AOAM530N3pJ5zUZIpIwh+xy0gv2BKynoSJU1VSQMHVP/D1y51PrNJlLi
        O+4k+EtgVcsllFXbbgSryoSMpy/GKrBd3e5YYpvH/ajd3v6WBXflxVxCTixpHts/ZWYxUFBXtr7
        +lfC0YRfRfHT6r/BGQCU+D+VthCCyhXdyTA==
X-Received: by 2002:a17:907:7f11:: with SMTP id qf17mr340933ejc.196.1636381748099;
        Mon, 08 Nov 2021 06:29:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy40KEvnccUheADBfx44eYP2KT68QmuQhoH5jSfkJBJUyUlVs7eWXb/DLH8E3tWNFWJas9Wlg==
X-Received: by 2002:a17:907:7f11:: with SMTP id qf17mr340908ejc.196.1636381747915;
        Mon, 08 Nov 2021 06:29:07 -0800 (PST)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id g1sm6893863eje.105.2021.11.08.06.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 06:29:07 -0800 (PST)
Message-ID: <cbdeb76c-bf5a-36c9-88bf-3f2754066090@redhat.com>
Date:   Mon, 8 Nov 2021 15:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support for dual fan
 control
Content-Language: en-US
To:     Jimmy Wang <jimmy221b@163.com>
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211105090528.39677-1-jimmy221b@163.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211105090528.39677-1-jimmy221b@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/21 10:05, Jimmy Wang wrote:
>    This adds dual fan control for P1 / X1 Extreme Gen4
> 
> Signed-off-by: Jimmy Wang <jimmy221b@163.com>

Thanks, patch looks good to me.

I will merge this once 5.16-rc1 is out.

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 9c632df734bb..eb201d001075 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8766,6 +8766,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
>  	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
> +	TPACPI_Q_LNV3('N', '4', '0', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (4nd gen) */
>  	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
>  	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
>  };
> 

