Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE52C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 19:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiGJT5U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 15:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGJT5T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 15:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6FC3FB7DA
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 12:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657483037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j6rPChSJrNMOV21SPMB+KCTvjBhzyRJQxoZZsHf/z/U=;
        b=bAgmvh9swtYD0OllFq/l64NbDALj/neMzj0NyDPcBXQg6fL8NO0F7PU2OOCNDcTjk00ooS
        qHaZ50WbdQtc40gzO55wipkvCduui3cd7zkiWWePqHStp81l+GkENHRl3NwrUEQBOPW3+p
        tN3XqPj+H33zMx1lQ3VpMKI7zpRjRG0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-1p8FeR3VN3a_Wp_mj_yvbw-1; Sun, 10 Jul 2022 15:57:15 -0400
X-MC-Unique: 1p8FeR3VN3a_Wp_mj_yvbw-1
Received: by mail-ed1-f70.google.com with SMTP id y18-20020a056402441200b0043564cdf765so2919642eda.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 12:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j6rPChSJrNMOV21SPMB+KCTvjBhzyRJQxoZZsHf/z/U=;
        b=ambcDfws7Clo+XnJNty9QYHNqBC34PuYPXzmdR3wEqiSE//ArG+5ob9hOAK4E/Wkxs
         fBFUAdimdru+tJ2KqejvN06pdFrgLz84vGRlUUXgpZfq5laoDS2gthH2TkVkqz60waD+
         Y78NjVCo6uwet+uL/MC/10y3IQm5VXru7aLiNJC+PiAiqcj9H6YdlcvaD+0RtxbDiUYM
         W+MSERYyyKLEVOTh/omg9qamvzsUhK4pCpIzO+d6Xk3ZERezi/CdGdjFPVyjXmDwf7qm
         mS4+KyOuCmBAehkIL1ac2DSJhjUq5XFyC+VoQQXhAzKVZL/Ay7Kz6Rz4ruBpQhIsYESU
         BCBQ==
X-Gm-Message-State: AJIora9hRXeRBUShr+E0h/bWoSxDphMQmXKDIG7ngkbMOHOFqI6AaB2/
        EnzdVFLg29upSkOxAXGwq8o66ph0TtqkRtLmAfgxy58B+Fqs8YsUjdmM0LJcG2Bpw6RR0iyTCLG
        v0DMuCu1F50F+dXlJBfono42DOEn0cVUF9w==
X-Received: by 2002:a17:907:2c5b:b0:72b:54bd:40f8 with SMTP id hf27-20020a1709072c5b00b0072b54bd40f8mr1383572ejc.137.1657483034717;
        Sun, 10 Jul 2022 12:57:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7rNCF5/yqaZ40q8aChIrxUxRxVr6oAworIrvtHiCFKok1ELZFgoMNqZrRV8mf/Zq8cB0/Jg==
X-Received: by 2002:a17:907:2c5b:b0:72b:54bd:40f8 with SMTP id hf27-20020a1709072c5b00b0072b54bd40f8mr1383554ejc.137.1657483034578;
        Sun, 10 Jul 2022 12:57:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906218200b0072b14836087sm1838111eju.103.2022.07.10.12.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 12:57:13 -0700 (PDT)
Message-ID: <9ce8aa53-ed70-823f-3410-1f50d5b902c9@redhat.com>
Date:   Sun, 10 Jul 2022 21:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] Two fixes for IFS
Content-Language: en-US
To:     Tony Luck <tony.luck@intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "Joseph, Jithu" <jithu.joseph@intel.com>, markgross@kernel.org,
        ashok.raj@intel.com, ravi.v.shankar@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev
References: <c416b93b-8adc-d9a8-ef0d-594cce6d9a9d@redhat.com>
 <20220710182521.60642-1-tony.luck@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220710182521.60642-1-tony.luck@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Tony,

On 7/10/22 20:25, Tony Luck wrote:
> Hans ... if you are pushing to Linus to add "BROKEN", then could
> you include these two patches to make it fractionally less broken?

Since the driver is going to be marked as BROKEN now anyways,
I don't see much value in getting these send last minute to Linus.

At this point in the kernel cycle (rc6 will be out in a couple
of hours likely) we really should avoid churn as much as possible.

Regards,

Hans


