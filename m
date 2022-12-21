Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37921C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 22:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiLUWty (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 17:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiLUWtx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 17:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3962180B
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 14:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671662944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MkYdowqSsnhKJx4DXhnvmYyyNmKzLB7vdV8jhQr3yJY=;
        b=cd0Db/6tR2mWTOwKweqhKRIJn/8/AjrMipdwDcer/eReOuufucnFljwfYs2mvgGSdk2gbM
        PGeAc2XD6TekKO2GPKMZohM0iiWjMNGQrJgJwi0DAIUK0vb2yB58vXKusVzUdZfZdO2iUV
        wbRcT5epBChf4F9WtaUlyucONOy0Psk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-xrlus-xoOSCmEdnKE2kU7A-1; Wed, 21 Dec 2022 17:49:02 -0500
X-MC-Unique: xrlus-xoOSCmEdnKE2kU7A-1
Received: by mail-ed1-f70.google.com with SMTP id f15-20020a056402354f00b00475a6378738so245337edd.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 14:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MkYdowqSsnhKJx4DXhnvmYyyNmKzLB7vdV8jhQr3yJY=;
        b=Y21HIfQxaj/sNak/OamMJVk7D6vRjahaP0Q/1G5aNLa7/QyJFGR71oxXSqnTC+61Ty
         9a9JaLn+Uw5t1R3V/OECqM34Jq3+Y43h3DKrjbJgj+VoN83jCNuWdInsOdFNh70hXuV1
         FB9txl0r3ypEaxYmcha3A6CgEi21qGE5Her85FyQ2Vdcc/haj2R/6ToW+bpOVpD0Km0s
         HhGScqrAG6CzZ+TDCzqmqOpiQZxXOOW/Wbx0c/krOVce9u4bp+fIvO+rD1sQj69yI9a2
         u6qwY2WsNtgy73OeiNpo7Km9duXVs6/vJlcPvCJ02531w0KTNw8DferpModQiPJ+sm3Z
         SOCg==
X-Gm-Message-State: AFqh2ko0LZOLoGcsH1Mj3wFOQR/i6YVWOWcpNvjAQ6sO8u34CCKUEhl3
        SL7xWdDg+V0Ts23vShwnvFWdjlgsclxu6KWeHn7jxp6lyIdqfbiq/DA/K2/wsCFn37YopjmuOiD
        Rp2Q80ICv14bt1DKKg8/480bbgcNSUBI9Ji2ClYwjm1Tn4LAHBcUg0/zXZknoB/AxFuHa5wsvun
        YZoLGqKqVzBw==
X-Received: by 2002:a17:906:7254:b0:7ad:bc7e:3ffd with SMTP id n20-20020a170906725400b007adbc7e3ffdmr3099909ejk.42.1671662941357;
        Wed, 21 Dec 2022 14:49:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvojSc9Wk+lGULdkJd1ZBihoAH6SJr7T8VmJI558wMb2Prw3Nx+1h3i7UDGl61DobJz6M24Vg==
X-Received: by 2002:a17:906:7254:b0:7ad:bc7e:3ffd with SMTP id n20-20020a170906725400b007adbc7e3ffdmr3099904ejk.42.1671662941155;
        Wed, 21 Dec 2022 14:49:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ss1-20020a170907c00100b007c0d41736c0sm7626856ejc.39.2022.12.21.14.49.00
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 14:49:00 -0800 (PST)
Message-ID: <77a626b9-3483-6c75-9905-96ddfd65cf8a@redhat.com>
Date:   Wed, 21 Dec 2022 23:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US, nl
To:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Hans not reading email for the next 2 weeks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Starting tomorrow I'm taking time of from work for 2 weeks
and I won't be reading email during that time.

So if you are wondering why I'm quiet / not responding to
your patches that is why :)

I'll "see" you all in 2 weeks.

Merry Christmas and a happy new year!

Regards,

Hans


