Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04A6C61DA3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbjAWNa3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbjAWNa2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EBC2202E
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674480585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h1pOiofCrgYVfSVCirt+sR1su5e7XxOWBxxQVEHlSxM=;
        b=hUwZQPb6rDi69q6X+lfUIiC6zhjp32pMTGIXKdV4qL3NfjULQ8nvv4YW0pyhReYAFjS5mK
        oe5ZGPYRKthHkDLCMBx7JEBfWJKj9lO4A8YpDbB95gWGYhCPxXn2fLCprD2p/B5y7zuUe0
        6xDjNdrRqSimr1VbPY0ORX4NsxQk8aI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-KDXD27dqPDaAPOqX8l60qw-1; Mon, 23 Jan 2023 08:29:43 -0500
X-MC-Unique: KDXD27dqPDaAPOqX8l60qw-1
Received: by mail-ed1-f69.google.com with SMTP id s14-20020a056402520e00b0049e0bea1c3fso8426889edd.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1pOiofCrgYVfSVCirt+sR1su5e7XxOWBxxQVEHlSxM=;
        b=VlAN9G2aLisl1/JZ8TxXsiVHCHlL0n/i0mq88e6CD35NLVhpj3OJ/JBTk0/vvUqYut
         u9rXxDR4vIGhwGeIlyLShUpKpAtx+k6w8CtKOuzVe9FMa/mikEPpdHX7YPGC/k8UnzVE
         lb4q/2gp72e79AN6XEOh4EcGjZRH3jbdb/dxN6TWrPy/VsVMQNjz0MoHTHBGFDVbCh2Z
         xNvqhFOPo61jYZBkjkc/J20FDrfqdiJPTzJrUhaNXW7nf9/h+YCNcsuCtof7XY1PpVw1
         Wp5XVIhNt4rqekuWCx4TLkMnxbWMbE4INVNR/S7keIm4rBZjH1Id7QPRJ+a0gjD+Wj5y
         oocQ==
X-Gm-Message-State: AFqh2kqJdRVfvkde3dp2U0Eu9F2PofLX7bVXjyPaFNG+ozmZ/qlTVLrB
        MAVRIuhdg37NsKao94b/zip7GIxjWZ8abthKdcOOy2cY2ShAk1JPE55ueVxpwjznMYjnZUQeEGY
        OMGRLaD38pMUY3JTaliibAwMlD1RLvBdAbg==
X-Received: by 2002:a17:906:33cb:b0:86d:7c0e:c816 with SMTP id w11-20020a17090633cb00b0086d7c0ec816mr33167272eja.27.1674480582344;
        Mon, 23 Jan 2023 05:29:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvQAdUw2Rn+69YtZqpO6gSp02Et/yW29uGOMPmu897BKApMNZGbb85mwbFmpcXO0uyHAAv/bA==
X-Received: by 2002:a17:906:33cb:b0:86d:7c0e:c816 with SMTP id w11-20020a17090633cb00b0086d7c0ec816mr33167258eja.27.1674480582140;
        Mon, 23 Jan 2023 05:29:42 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id sy23-20020a1709076f1700b0086f5bf2b3a1sm12227191ejc.21.2023.01.23.05.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:29:41 -0800 (PST)
Message-ID: <f4a85a55-429f-eb5e-3063-e5e79d4baef6@redhat.com>
Date:   Mon, 23 Jan 2023 14:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: dell-wmi: Add a keymap for KEY_MUTE in type
 0x0010 table
Content-Language: en-US
To:     Koba Ko <koba.ko@canonical.com>, Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117123436.200440-1-koba.ko@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230117123436.200440-1-koba.ko@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/17/23 13:34, Koba Ko wrote:
> Some platforms send the speaker-mute key from EC. dell-wmi can't
> recognize it.
> 
> Add a new keymap for KEY_MUTE in type 0x0010 table.
> 
> Signed-off-by: Koba Ko <koba.ko@canonical.com>

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
>  drivers/platform/x86/dell/dell-wmi-base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
> index 0a259a27459f6..502783a7adb11 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
> @@ -261,6 +261,9 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
>  	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
>  	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
>  
> +	/*Speaker Mute*/
> +	{ KE_KEY, 0x109, { KEY_MUTE} },
> +
>  	/* Mic mute */
>  	{ KE_KEY, 0x150, { KEY_MICMUTE } },
>  

