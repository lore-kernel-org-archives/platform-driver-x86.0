Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE62C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BDE821582
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bl96Q0GS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgIQNpx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:45:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37445 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727118AbgIQNd1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:33:27 -0400
X-Greylist: delayed 2853 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 09:33:25 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600349581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Bv7qRoyern4UfY8IWH7ldX7xtyXLVYWqRlCrNzW7Lc=;
        b=Bl96Q0GSYs6JCamW+PmhrP5HDNWKxMMPIUdiKCMLn2m3efGc2kYQIechbFxe6XEbjUdLcJ
        eePdHdX8Ehj80PN6aNaEuOJnkh0gmVrk5VZC+KdBH13/L24wRiRmM5gE9Mf3AXPy6pXQFl
        MF21IgTJoXrsmAlAExX6S6UxjUAhxew=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-yP7ReIZhP9Sh6jZnq1Mvtw-1; Thu, 17 Sep 2020 09:24:34 -0400
X-MC-Unique: yP7ReIZhP9Sh6jZnq1Mvtw-1
Received: by mail-ed1-f70.google.com with SMTP id g16so879376edy.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 06:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Bv7qRoyern4UfY8IWH7ldX7xtyXLVYWqRlCrNzW7Lc=;
        b=eoX2oMhacTGb0+pdViO1Q473JDgdLoFBnWMnO4xZ21B3UZPkF6BOBYExTCv6iK5QY+
         FMFzqgnrMCAniwAC6pUGX1n6kvHRpAHSUD8Lqk7gwVl1iW7WA64997UUo84YfGiiclfX
         9YFLFfVXe506fL1J23HO9DICkvT27GokcK2nDAnNkXp0rlOm3EBH+ufeLPsaB4FOgmlv
         zht1NZfEchY6vojVWSdsS9HfaumcMBa9TIq8APDGlrGl0o2ZLMKjbKDtqdBSD5uhBvCQ
         pZid2RiZmBr3v+usqFNBQQ+ZO8ngilPLJClxTT/lgJ4Lkn+8VMtADZUkDoVzGJkSmTyn
         5LoQ==
X-Gm-Message-State: AOAM530RAaNYxxL/kRB/pb5q3fws+8ALlcfNqWSKoxrPQd0+eM62wFGi
        rzV/DUvoRIj1nHgfe2Kz8kiT1LAiOVuJC8OZQvI4O7VDplV0KtIm5PskoM/Q4NPfi9VXYXBNK5m
        EYl5n2MNCwmHzCxrRYt1t6Ccs8nUPJNCGWA==
X-Received: by 2002:aa7:ce97:: with SMTP id y23mr33973236edv.128.1600349073234;
        Thu, 17 Sep 2020 06:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy//9ThT8Cfn/hvALl8T4LWNQ9JumN5KmYm8Y9NtVaiWoGNAB+LtS9zM2eDj6P8CF0Ejv0yCw==
X-Received: by 2002:aa7:ce97:: with SMTP id y23mr33973219edv.128.1600349073085;
        Thu, 17 Sep 2020 06:24:33 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id f13sm16392905edn.73.2020.09.17.06.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 06:24:32 -0700 (PDT)
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jared Dominguez <jaredz@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <jQoirRukXGYClb58QQWmL6rQ6usxi_hKzPRYe2tlEyjXG-hEVxwzECgEXFxzyMRG2sEnxwdKNvmWzEV4oZcaJ4MM5RrgFtBdin8yxH4cAYs=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3748b6be-cd8b-19e6-eb36-c5f94850d764@redhat.com>
Date:   Thu, 17 Sep 2020 15:24:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <jQoirRukXGYClb58QQWmL6rQ6usxi_hKzPRYe2tlEyjXG-hEVxwzECgEXFxzyMRG2sEnxwdKNvmWzEV4oZcaJ4MM5RrgFtBdin8yxH4cAYs=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 3:02 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2020. szeptember 17., csütörtök 13:22 keltezéssel, Hans de Goede írta:
> 
>> [...]
>> I guess we should also add an optional lap_mode sysfs attribute
>> to the class-device, to have all the info for the Thinkpads in
>> one place.
>> [...]
> 
> 
> Excuse my ignorance, but why does "lap_mode" need to be here?
> I understand the implications of it regarding performance, but
> I think it would be more sense to export it via the hwmon (or
> something similar) subsystem? What am I missing?

Well hwmon has very clearly defined sensor types, like voltage,
fan-speed and temperature. lap_mode does not match any of them.

Also registering another-type class device just for the lap_mode
boolean seems overkill, esp. since lap_mode is inherently coupled
to the performance-profile stuff.

Regards,

Hans

