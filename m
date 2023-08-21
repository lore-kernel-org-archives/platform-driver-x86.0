Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF98EEE4996
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 12:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbjHUMuo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 08:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbjHUMun (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 08:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7449CC
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692622199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U2tMdqihoLdVc/FNclnLyyqSQNriGxLnDeEcp+obbhU=;
        b=L5VtZk9w658Wu9ZkxuC9MVn2q8ErxKVx7ng7iHCqFevK1lFX2GA+Wqjp/dLid3TG5fAsTJ
        Uw6akBRcqOTfnspM8VeRcUIs5NVGEahhO+wH/8iMek9I0hQMCYNrx5XnHr995lf3bM1414
        pRGfwKMxCg6LRqt7Dkb5cVrEiZrl+0w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-8B6TKIplN7ui6-6ztp2Irw-1; Mon, 21 Aug 2023 08:49:58 -0400
X-MC-Unique: 8B6TKIplN7ui6-6ztp2Irw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-523d73637e2so2102150a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 05:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692622197; x=1693226997;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2tMdqihoLdVc/FNclnLyyqSQNriGxLnDeEcp+obbhU=;
        b=S3D6F3DewWTL4Ptqt9YoLrH8foO4489XYPnTcHirzILBjDljkOdlxO6eOFopItTjPX
         9/xALBye8aYf+niYhu7F46YHabn+LrygE/FsvzcCwJrTp71gMIAy13mRFBbkKbBB4iiL
         yp9EnU1QqWVmWn45wKEgGQXL66rBiHVR1LRKEQhnGtdLWTTKC9RTE1E/AbY4Th5XvawZ
         vLUorDWGoOMA11Izcn9pQ6iKUm3xWHBeTMoMEPQAGnHu9wMJL0QUaAmToGJvXNqaSOfe
         xQKP5uLu6LKEeb7XiDiZzl3DMrRbM36oAwvE90W4Lw8RrfMRP6WvAO8cRbN6+9mkfDIg
         d0Rg==
X-Gm-Message-State: AOJu0YwHCXzPEaHTIfu5vvWmj8QehEUSOCuM5FbyK4sc6eCIWlwtoLi5
        yX76Db61u1vlTUy8YQ0u3UOZGX0rz7T7NG6k2N5EEela1wGZb0ciPOBeStjufMP8zfnhTZxnsPg
        L9VaoP0Ct2m6NDKQPoW7x7AfU28zG+UBJ0kbw8A/l9g==
X-Received: by 2002:a17:906:1da2:b0:99b:c830:cf23 with SMTP id u2-20020a1709061da200b0099bc830cf23mr5454458ejh.27.1692622197179;
        Mon, 21 Aug 2023 05:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfv9DsJSZhAGR7ioe4x0Zc5TqTJCwThGMpHNpW8bHZXlrcqN3j3A6qu33K7waNuUF/HM/ziQ==
X-Received: by 2002:a17:906:1da2:b0:99b:c830:cf23 with SMTP id u2-20020a1709061da200b0099bc830cf23mr5454446ejh.27.1692622196895;
        Mon, 21 Aug 2023 05:49:56 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906a21900b00992f309cfe8sm6503224ejy.178.2023.08.21.05.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 05:49:56 -0700 (PDT)
Message-ID: <d237c65d-f63e-f085-119f-8faf4ecf082c@redhat.com>
Date:   Mon, 21 Aug 2023 14:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] platform/x86: thinkpad_acpi: Switch to
 memdup_user_nul() helper
Content-Language: en-US
To:     Ruan Jinjie <ruanjinjie@huawei.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
References: <20230810122012.2110410-1-ruanjinjie@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230810122012.2110410-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/10/23 14:20, Ruan Jinjie wrote:
> Use memdup_user_nul() helper instead of open-coding to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

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
>  drivers/platform/x86/thinkpad_acpi.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 85772bad753e..d70c89d32534 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -908,16 +908,9 @@ static ssize_t dispatch_proc_write(struct file *file,
>  	if (count > PAGE_SIZE - 1)
>  		return -EINVAL;
>  
> -	kernbuf = kmalloc(count + 1, GFP_KERNEL);
> -	if (!kernbuf)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(kernbuf, userbuf, count)) {
> -		kfree(kernbuf);
> -		return -EFAULT;
> -	}
> -
> -	kernbuf[count] = 0;
> +	kernbuf = memdup_user_nul(userbuf, count);
> +	if (IS_ERR(kernbuf))
> +		return PTR_ERR(kernbuf);
>  	ret = ibm->write(kernbuf);
>  	if (ret == 0)
>  		ret = count;

