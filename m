Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89A4C77B61
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 17:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbjDYR4R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 13:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDYR4Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 13:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8870CC2E
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 10:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682445328;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qwU0ROkheDnijyi+MYsBDonZSHpK8JQv792q8U7KINI=;
        b=M5wjuMgY4Lg1tDsicQvm/NKadXQcjOVH5dvGjVw64nZjRjR8aMh25sGv8LlEyPw88vCKL1
        6Wo22B/KfnHpOV6Caq6oS3Q+TWFdlh/LZVf3kPIRK8pI/mvahVx3S256vCu7TmKTtOQeF2
        vZy+y3f4sormdUDm8TTl6lvcrFzNzp4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-GCZGrt6nMJyygiQafv3gTQ-1; Tue, 25 Apr 2023 13:55:27 -0400
X-MC-Unique: GCZGrt6nMJyygiQafv3gTQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9532170e7d3so531062066b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 10:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682445326; x=1685037326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwU0ROkheDnijyi+MYsBDonZSHpK8JQv792q8U7KINI=;
        b=gYPX8RoOrVX4E6kKGKaKALG8DAtHcGCcDaBqyb4J9YCOlBZKZMQ8covfZuGu1EUuax
         /Zw1z7q5tvhRvbnr4+IpFeTP2xNgNF3f92BUXgFh/Qlg+un3mxMedXvCVR2G0fUhb7ef
         Z0k67vHTIlULSAte03/tUi9cgz0SQpa0wCqNEeQoPheih0T7KMtX7/KoV6Q++Fo18TXt
         8VG+2b5PxkU/s3cFY7OMjBoJJS6jsNx45ZM98l2v7V5y4r36VNCrA8NAKJSRAAPBFesV
         8kf8HHMNX+Ft4rmgCau1m3dLgHoKzJKJ6ZXQOFdocar9DlcHJIYUbIRUvZxwFyon1EVk
         2xWQ==
X-Gm-Message-State: AAQBX9dpu2wBrBoK2b7IQw3nPvrU9AC1oSOZAAiIvY/ImMVE7iNEUxtb
        v+87kY+rCZhj337jdEkx3N0wffigMbORiVaoifrHfgcxt+I/SVa2SiJsEdzGHKZBboLAsN/A8U3
        Kn+XY0IKeKMk4x6dBzkWV1j/WSQoprLkv5A==
X-Received: by 2002:a17:906:15d:b0:932:e6d5:bd7c with SMTP id 29-20020a170906015d00b00932e6d5bd7cmr14872422ejh.20.1682445326529;
        Tue, 25 Apr 2023 10:55:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350aSoLy6Ajs1Vc+A4XVuIr1XE5/6cvhrX1DjpSEeoqnm+h+xFklrE+mzwA3LrGe3XBm17iVKlw==
X-Received: by 2002:a17:906:15d:b0:932:e6d5:bd7c with SMTP id 29-20020a170906015d00b00932e6d5bd7cmr14872400ejh.20.1682445326184;
        Tue, 25 Apr 2023 10:55:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906101a00b0095729352bf3sm5597938ejm.215.2023.04.25.10.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 10:55:25 -0700 (PDT)
Message-ID: <2225a78f-5766-c6d9-68d5-32da7f9d2791@redhat.com>
Date:   Tue, 25 Apr 2023 19:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hp-wmi: add micmute to hp_wmi_keymap struct
Content-Language: en-US
To:     Fae <faenkhauser@gmail.com>, markgross@kernel.org
Cc:     jorge.lopez2@hp.com, kai.heng.feng@canonical.com,
        rishitbansal0@gmail.com, dhould3@gmail.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230425063644.11828-1-faenkhauser@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425063644.11828-1-faenkhauser@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/25/23 08:36, Fae wrote:
> Fixes micmute key of HP Envy X360 ey0xxx
> 
> Signed-off-by: Fae <faenkhauser@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Patches which are added to review-hans now are intended for
the next rc1. This branch will get rebased to the next rc1 when
it is out and after the rebasing the contents of review-hans
will be pushed to the platform-drivers-x86/for-next branch.

Regards,

Hans



> ---
>  drivers/platform/x86/hp/hp-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 873f59c3e280..6364ae262705 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -211,6 +211,7 @@ struct bios_rfkill2_state {
>  static const struct key_entry hp_wmi_keymap[] = {
>  	{ KE_KEY, 0x02,    { KEY_BRIGHTNESSUP } },
>  	{ KE_KEY, 0x03,    { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY, 0x270,   { KEY_MICMUTE } },
>  	{ KE_KEY, 0x20e6,  { KEY_PROG1 } },
>  	{ KE_KEY, 0x20e8,  { KEY_MEDIA } },
>  	{ KE_KEY, 0x2142,  { KEY_MEDIA } },

