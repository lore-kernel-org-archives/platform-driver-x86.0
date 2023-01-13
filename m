Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B131C54EBD
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Jan 2023 10:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjAMK2r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Jan 2023 05:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240798AbjAMK2o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2023 05:28:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A6948CE6
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2023 02:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673605676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=od9kPh+X6yfk3gKWQX3dtc7pBBPaFt95z7PpOq5w5zg=;
        b=b6rS0oQvp3CQe28s4/vY/sIhUVM+DB/+gSisb9JZFb157FUtaaOj8Y6TxLLVzhpbar7wIp
        h6JY9PvBm0Lfx91SA2YnvfpN4Dzr4CPepR+jcN78tcr5q5IHpGXxApAlhrCQqApQKnzXq0
        +fnytbM1TYZhXZ6CJ4tGahtgj47qNuc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-ViIOWTzQP3iGExxdkeiC_w-1; Fri, 13 Jan 2023 05:27:55 -0500
X-MC-Unique: ViIOWTzQP3iGExxdkeiC_w-1
Received: by mail-ed1-f71.google.com with SMTP id e6-20020a056402190600b0048ee2e45daaso14167216edz.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2023 02:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=od9kPh+X6yfk3gKWQX3dtc7pBBPaFt95z7PpOq5w5zg=;
        b=etNmJTu6K5mnFzMmMVML9ycVp93RCxQm7hrh0EFPqkdq5wGsBYhjTL0Hvf4uqSBOdH
         yhRuyXXRp8YZxCReLcp4g6J5Od9b5cPfqo6m9olMLXvk+K4shiZwL0g4hJxR9Z5JvfeT
         ibbdZn6Y9sre4CYwuDG2nkaWBgT525H+cvqvQlGZKN7OUY70l0RcreBujCO+q6xMuPAz
         /HHKYgzrr6j1mMJ3ZYrsJc59a2iwZBrUq7wfL8++GUhbE3fPIE0sp0L0R/D6uWBkf5nq
         WdJfPL+QVHWLuHLdthId9rl7G8tFJFE4et4YRgmLZKxzTY8Lub0zos6rBz3J64lUKzIo
         0U3Q==
X-Gm-Message-State: AFqh2kr9DIcXTaSnbVHDdNWuAn98NL0Ph8qW08CDmtrOduMMi+zcVfAh
        HTJO5pMerAMhcXmfYG2s5EBZdUqK2mfOMmtHvcgc5NhdOM/sWwjGx18KX1/H95ubxUimg+m4W4m
        ZQGPVizp65YCq6VFHWB8IHjxh8YBh+2d1qQ==
X-Received: by 2002:a17:907:7a0d:b0:78d:f455:c398 with SMTP id mg13-20020a1709077a0d00b0078df455c398mr58267343ejc.62.1673605674253;
        Fri, 13 Jan 2023 02:27:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucDV+ovV3AnszEtkCBxaDEe52wdWvs42ZVNElvZjNXQra3UucmE6luutE0smLFoydxhX+Qvg==
X-Received: by 2002:a17:907:7a0d:b0:78d:f455:c398 with SMTP id mg13-20020a1709077a0d00b0078df455c398mr58267334ejc.62.1673605674061;
        Fri, 13 Jan 2023 02:27:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 14-20020a170906308e00b0084d3acda5fasm6874006ejv.189.2023.01.13.02.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 02:27:53 -0800 (PST)
Message-ID: <974c6bd1-db40-572d-2bfe-9a326eefd059@redhat.com>
Date:   Fri, 13 Jan 2023 11:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] platform/x86: Drop empty platform remove functions
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Peter Kaestle <peter@piie.net>,
        Mark Gross <markgross@kernel.org>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>
Cc:     kernel@pengutronix.de, platform-driver-x86@vger.kernel.org
References: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
 <20230112220112.cxzfoxo4cejzjbpx@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230112220112.cxzfoxo4cejzjbpx@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Uwe,

On 1/12/23 23:01, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Dec 13, 2022 at 05:23:56PM +0100, Uwe Kleine-König wrote:
>> this series removes all platform remove functions that only return zero
>> below drivers/platform/x86. There is no reason to have these, as the only
>> caller is platform core code doing:
>>
>>         if (drv->remove) {
>>                 int ret = drv->remove(dev);
>>
>>                 if (ret)
>>                         dev_warn(...)
>>         }
>>
>> (in platform_remove()) and so having no remove function is both
>> equivalent and simpler.
> 
> Gentle ping! I didn't get any feedback for this series yet after nearly
> a month.

This Monday I returned to work after 2 weeks of holiday :)

And before that I was dealing with the upcoming merge window.

I did do a whole bunch of patch review/merging this week, but those
were all fixes for 6.2-rc#.

I plan to do another round of patch merging coming Monday and these
patches look fine, so I expect to merge them coming Monday.

Regards,

Hans

