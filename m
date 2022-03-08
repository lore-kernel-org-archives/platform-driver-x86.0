Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD95C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Mar 2022 15:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345687AbiCHP0o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245730AbiCHP0o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 10:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6747A47562
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 07:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646753146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vn7UND9wBFlJmmt538KsB78UCXUVTdqlds9oCSIt2Bs=;
        b=Og2YdQbqGIGR1GfXPslyVbyXmuNFowKXnte0OHLGmvKiE/F9yCSi3j+E6jFPpQR9dUwatk
        hKM5UXbGxjWlBXdrPwvui2qZJ756HRXmNkNMGdTm4V1PqCFVN79VtPcx1PpkK37O5JJqrP
        ZVYgZhedh2SD+lJn6qE/Q2m1vVLGCbA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-smSpHbkyMN-Flv-lQH4gMA-1; Tue, 08 Mar 2022 10:25:45 -0500
X-MC-Unique: smSpHbkyMN-Flv-lQH4gMA-1
Received: by mail-ed1-f72.google.com with SMTP id i17-20020aa7c711000000b00415ecaefd07so8431772edq.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Mar 2022 07:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vn7UND9wBFlJmmt538KsB78UCXUVTdqlds9oCSIt2Bs=;
        b=vNn1yOmTuo1Fpo1KCARjN6TQ0WHHAOEOu2w+CCj065qAsrYVVDa8rbfriiyB9gqN/G
         l51Z9BnjJjpIIaxsdO7ORAmB8LM8MV0JKRKc6rOxonz4773fuDJ1Vl95Ya5IwPyOSLhK
         jpsalRTUlNPRU3nGdFLZB2Gq61dZMbXo2uFj72goX0dUhe/SSFOtjE3Gd8U4Ojmzkflu
         pXDx54rmejF6oTjLTbZCmXH0Q+rewH/ngNoOGMHAglPVU9Oo8uOQHjwRwxLpy4bOMmNd
         SPumfgfd9hE80CQsq3q0qFjeujXWNoY7f7fIbjYpkBTO5FqOL7nJa65UiHqRz5r5Db6q
         HiDw==
X-Gm-Message-State: AOAM530lOlS/MRZhfxXDWOw9r169GCFyo4t3tEiZ+ecrlotUL+SnGCnx
        Z8OVAFK3b+R54Yg+hZYf63nWJbr1dCC6A+s0M3InfOmefzGIyXs+Adgt9rTwY27yZv5IfIzsZWb
        X6d7LZSSkstuD7H9Jrh3xw+x+VSmz9RR+pA==
X-Received: by 2002:a17:907:3f22:b0:6d7:8257:b27d with SMTP id hq34-20020a1709073f2200b006d78257b27dmr13175705ejc.190.1646753144240;
        Tue, 08 Mar 2022 07:25:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1qYMSm7nL5PC30Ej4xgqkK5cH/Xhy7tEF9HLiReD7+r/essYpy5YQPz6oDE+KoFGxzpLTqA==
X-Received: by 2002:a17:907:3f22:b0:6d7:8257:b27d with SMTP id hq34-20020a1709073f2200b006d78257b27dmr13175692ejc.190.1646753144074;
        Tue, 08 Mar 2022 07:25:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402004300b004162aa024c0sm4709277edu.76.2022.03.08.07.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 07:25:43 -0800 (PST)
Message-ID: <e1ff6522-35f3-0443-5e9b-381b0a79ac39@redhat.com>
Date:   Tue, 8 Mar 2022 16:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: mmotm 2022-03-06-20-33 uploaded (x86-android-tablets)
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
        mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220307043435.251DBC340E9@smtp.kernel.org>
 <77c9adca-df79-1bbc-f2e5-5635f79b7148@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <77c9adca-df79-1bbc-f2e5-5635f79b7148@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/22 22:15, Randy Dunlap wrote:
> 
> 
> On 3/6/22 20:34, Andrew Morton wrote:
>> The mm-of-the-moment snapshot 2022-03-06-20-33 has been uploaded to
>>
>>    https://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> https://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
>> You will need quilt to apply these patches to the latest Linus release (5.x
>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>> https://ozlabs.org/~akpm/mmotm/series
> 
> on x86_64:
> 
> ld: drivers/platform/x86/x86-android-tablets.o: in function `lenovo_yoga_tab2_830_1050_power_off':
> x86-android-tablets.c:(.text+0x17): undefined reference to `efi'
> ld: drivers/platform/x86/x86-android-tablets.o: in function `lenovo_yoga_tab2_830_1050_init':
> x86-android-tablets.c:(.init.text+0x6d2): undefined reference to `spi_bus_type'
> 
> 
> Full randconfig file is attached.

Thank you for reporting this. I'll send out a fix adding
SPI and EFI to depends on list for the Kconfig symbol for this module.

Regards,

Hans

