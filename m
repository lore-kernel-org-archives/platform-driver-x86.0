Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B836C433E6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 430BF22CA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407660AbhARSdM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Jan 2021 13:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28996 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407661AbhARSdC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jan 2021 13:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610994696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a54TCGUhDf5oFr28yNxfQl0fQaK7+/QaB7qAdpXspqI=;
        b=Bj3HGz42TivQb7DgZzhsa5//vTua93Wu+uveu8R71ytCaXNK8nktjZ3AoxMkOAj4dpOfqp
        u5ds288T2sxGi0Uq9TsI8EI3/fd2fOL/9xI8wE1JD57GBrvJT/85erDioZKE1JHBQxoQZE
        JfuEGbheYYZJhngTyEE8F4AWUiY1UbU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-mz5FoBSUMUmsZgpYo594QA-1; Mon, 18 Jan 2021 13:31:34 -0500
X-MC-Unique: mz5FoBSUMUmsZgpYo594QA-1
Received: by mail-ed1-f72.google.com with SMTP id o19so1545098edq.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2021 10:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a54TCGUhDf5oFr28yNxfQl0fQaK7+/QaB7qAdpXspqI=;
        b=kd06F68eTa8fw49Td7v/x0/EWOKkke/2t3P/XWh2nU2EiP/Vblpxu+AsZkXOozhegG
         qnhPta/F7+Zsmzv7+S3qHql4D6N4y4j/FMTa47oVUlSCnk59wAqai/YK04tQqSz6vmZK
         6yca2A+Ck3k1Y4nr0s+SxX2G+v6r8li4xcDI72QXaPXVtHtk+wuSVsjq5zgDz4xO1vyE
         eiFlMY5OYtVcDhOJxqEOSrE9FxFfJg9lKM5k8ybCrkjlmYKnBSu/4AsAHwQjrpUuaPg4
         VwWwduAL4KAzaNjmcxaWD6Y2W4Gbn8rKLd/rgyFfTfGNe+jqWYIoinRCo+0UpOwosHKA
         lSlw==
X-Gm-Message-State: AOAM531p7bIOO7GMZSqbCRlq1BMYWYkmD7bsnb2BiYq72buDpnEUn/SI
        cEIuloX7mWsMf/JjB/v/ro/02KhXkWAvj1hSF1E4Tl0SQJKTERgKxSpk5lww3K+yNXJdpHkceWx
        V0am37c29yYaNEJ11lhlmxLay3NEOAJvnyQ==
X-Received: by 2002:a05:6402:ca1:: with SMTP id cn1mr604839edb.128.1610994693488;
        Mon, 18 Jan 2021 10:31:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzveA2gc+qoL4M3a2i0t5TT9zxCli6tnN+oIurkQnt7iNm6nK7rwKuKd66gjV9joxrD8BqJyg==
X-Received: by 2002:a05:6402:ca1:: with SMTP id cn1mr604832edb.128.1610994693330;
        Mon, 18 Jan 2021 10:31:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id m24sm9722206ejo.52.2021.01.18.10.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 10:31:32 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add P53/73 firmware to
 fan_quirk_table for dual fan control
To:     jeanniestevenson <jeanniestevenson@protonmail.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>
References: <Pn_Xii4XYpQRFtgkf4PbNgieE89BAkHgLI1kWIq-zFudwh2A1DY5J_DJVHK06rMW_hGPHx_mPE33gd8mg9-8BxqJTaSC6hhPqAsfZlcNGH0=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce123ade-c1ed-e73b-bba5-8f7fca89481a@redhat.com>
Date:   Mon, 18 Jan 2021 19:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <Pn_Xii4XYpQRFtgkf4PbNgieE89BAkHgLI1kWIq-zFudwh2A1DY5J_DJVHK06rMW_hGPHx_mPE33gd8mg9-8BxqJTaSC6hhPqAsfZlcNGH0=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/15/21 5:06 PM, jeanniestevenson wrote:
> This commit enables dual fan control for the new Lenovo P53 and P73 laptop models.
> 
> Signed-off-by: Jeannie Stevenson <jeanniestevenson@protonmail.com>

I know that Henrique has asked for a better commit message, but I'm preparing a fixes
branch to send out to Linus before the weekend and I want to include this, so I'm
going to accept this patch as is. Jeannie it would still be good if you can send
and email reply with the requested info for the archives.

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


> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c404706379d9..69402758b99c 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8782,6 +8782,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),	/* P71 */
>  	TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),	/* P51 */
>  	TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),	/* P52 / P72 */
> +	TPACPI_Q_LNV3('N', '2', 'N', TPACPI_FAN_2CTL),	/* P53 / P73 */
>  	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
>  	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
> 

