Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DEBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Mar 2022 11:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbiCVL3h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Mar 2022 07:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbiCVL3g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Mar 2022 07:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8D73550E3A
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647948488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q+jhixLNd1tRMna7dh1+LfmeYG7qSf04xnYLrG1y2sk=;
        b=cpB4/zLEbqoXV0rQFxranRUM8x+k6uKR6dWZly381zeSLDtn2xLPo1F18GkUOFpbz4R2Qf
        W2nvXVEVwRqPZOuNY7iIGJ3Sgmb4O8t5wDyytn6r+HWvoEwehgP6YIWTnGxiimD/3PQslb
        iFLHC/THjPEmal1FIIPtZ218I2tgN7E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-86rS9aoEPd2zu4pkvW0CQQ-1; Tue, 22 Mar 2022 07:28:07 -0400
X-MC-Unique: 86rS9aoEPd2zu4pkvW0CQQ-1
Received: by mail-ej1-f72.google.com with SMTP id de52-20020a1709069bf400b006dffb966922so2978997ejc.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 04:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q+jhixLNd1tRMna7dh1+LfmeYG7qSf04xnYLrG1y2sk=;
        b=Z3f328hwBh1HUiqewo9HMLEYYFEXzDK1Dsz5ksCr7m2MWoKWprb5du2m/wSYOMK75Z
         vQaPmcugCxuW+lfblmEeQMVk74fEtg0xCXo5O3kE1N/Mm/OufjmMHhForAMjIB1t3U85
         uD3R1SaF3iJojTH1VQBMaggSVm/vJ/cMriM6XHG3G/CtLCq3I6NMihac4119fkn6QrVk
         w4nnlLJPN0eKSXEFabNXhimUI1ui3UJM7rcWTDoTFy4l1FXYDO1iBkoVPxEHlijKGbsX
         hFePr5wCksH4AiYUhAdJWYUK/NJlP+hLzDNC9kks8W7MP1iwlRGeK2WM2Wv//LkY2YyA
         siQA==
X-Gm-Message-State: AOAM532lEsJPxqT/eXmVU0wxSEi8orCp0VTBhOwJhhVQcAJxYNvYG1kG
        9F0sXzG+MreHKonMCUCdA81bCK+OLVTxoJWn/5DOBYQQvlwHwd8TW5IjUUlHUGlbCTqmqfkKhMl
        2utcgB9rBYObtF+ulejB/NqIyPmU+uVDemg==
X-Received: by 2002:a17:907:d27:b0:6db:d928:a976 with SMTP id gn39-20020a1709070d2700b006dbd928a976mr25568348ejc.24.1647948485129;
        Tue, 22 Mar 2022 04:28:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2bepHW/hyW/QTus5y1cUM5hn6N7HT+obrJXolK8tngaQAWnUO5hZvqxvEUkQC1cLxQp5IsA==
X-Received: by 2002:a17:907:d27:b0:6db:d928:a976 with SMTP id gn39-20020a1709070d2700b006dbd928a976mr25568313ejc.24.1647948484720;
        Tue, 22 Mar 2022 04:28:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id og49-20020a1709071df100b006db0dcf673esm8324139ejc.27.2022.03.22.04.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 04:28:04 -0700 (PDT)
Message-ID: <f4b82d3d-5c8b-2973-4918-5308210e4431@redhat.com>
Date:   Tue, 22 Mar 2022 12:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] winmate-fm07-keys: Winmate FM07/FM07P buttons
Content-Language: en-US
To:     Daniel Beer <daniel.beer@tirotech.co.nz>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6237f057.1c69fb81.1689.fec7@mx.google.com>
 <2cf4e8b2-dfaa-dd7d-9c00-c7d58eeb367b@redhat.com>
 <20220321193258.GA31646@nyquist.nev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220321193258.GA31646@nyquist.nev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/22 20:32, Daniel Beer wrote:
> On Mon, Mar 21, 2022 at 11:22:40AM +0100, Hans de Goede wrote:
>> Do you have control of the firmware on this device?
>>
>> If yes then IMHO it would be better to implement this in ACPI
>> using the intel-hid fw API for this, see:
> 
> Hi Hans,
> 
> Unfortunately not. I don't work for Winmate and they haven't provided
> any documentation on this.

Ok, in that case please send a v2 addressing Barnabás' remarks.

I'll do a full review of v2 and then depending on what I find
merge it, or ask you to do a v3.

Regards,

Hans

