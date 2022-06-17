Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A014C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Jun 2022 11:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241130AbiFQLbU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Jun 2022 07:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233326AbiFQLbU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Jun 2022 07:31:20 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB2C6CAAF
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jun 2022 04:31:19 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x17so5379001wrg.6
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jun 2022 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v4rgUkefwnPSODljmB9PIpdtanNPG8CCuhHs+/DE16I=;
        b=BeKh/apD5qRPHICs7OWOYQflLYU2uBF9vanObMWE5fcZTPlncHQUp1cz4dfUlWJob0
         aDQrtuVMfq27E1/9hqZGu1Irv2h3eICawStjYdFu4E9lttb+RphK1lhg0fTZLG7kTkxU
         mN/aqIU8eSjlkOiMnsFSWkVk6fmD2yrN7CoYb9NaLaqMlU95iMS7+gFr6y5sQJWKOyUA
         u+ipHIPpxfQLmfZeU3/PIT7qCn1SpqIRBefSLRLKSB3APkoPym2cIOapqjQ/BiVaO5Ii
         S2nS5w3eOFOGWubSw3QI0yJ28GO7HnH3WEKwp8H1YFzOrsFIV+loJm5kXHMx5d9IOI1l
         d1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v4rgUkefwnPSODljmB9PIpdtanNPG8CCuhHs+/DE16I=;
        b=eluCWNGTe5hBSNJwIr0gkietxSIxknl3bFmylJSedhknUBs+kdVrmr4TV2pQolUx31
         H7t21yzxc2t409D1Q5SG6hL/fEHypt+rheuERal5rWJZHk8/plUFZtMbULMYUq5TRDLG
         ISg6V9JqmwFSoYCRrBPFfALyY+ddwRbLNOfGHVEvIVXlB1vXVX/Gk33MlPZjLRnRf5Ps
         5JjTYIYQ9kW6u3ZeTcEdyHdzKNe+Rue/DaecuMtMOqJ3ZbddbgfFHKGQgdySTqONCJFD
         PiaiDmqFLFBRTHYuGxk/3lfR+OQhZStfqvoinBJDwEIUwrmgyK83FQSFK3CY3HLmzHXK
         jrKg==
X-Gm-Message-State: AJIora+1xkM1ac6sf2m2ZXIneUePA4otF+q8Tr0uiFp01VPd+IKB5zMt
        pPmmF/yRBx4rKYBUy9BcTWk=
X-Google-Smtp-Source: AGRyM1sYcbeoAyecNWf+eeenVgc1F8MJE96AiUM21pASAAt0o6DHElUq4tYVjyTI6np5+e+QOxg/bQ==
X-Received: by 2002:a05:6000:2cf:b0:212:27f4:5f80 with SMTP id o15-20020a05600002cf00b0021227f45f80mr8767285wry.545.1655465477834;
        Fri, 17 Jun 2022 04:31:17 -0700 (PDT)
Received: from [192.168.2.202] (pd9ea38ee.dip0.t-ipconnect.de. [217.234.56.238])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b0020fe35aec4bsm4579558wrr.70.2022.06.17.04.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 04:31:17 -0700 (PDT)
Message-ID: <09c589ee-d7fd-a504-50ef-b7803c0dc403@gmail.com>
Date:   Fri, 17 Jun 2022 13:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] platform/surface: avoid flush_scheduled_work() usage
Content-Language: en-US
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <63ec2d45-c67c-1134-f6d3-490c8ba67a01@I-love.SAKURA.ne.jp>
 <df69c497-0ec1-0ffa-b434-dede30a36c36@gmail.com>
 <cf87225f-7932-9df8-90d9-af602d798700@I-love.SAKURA.ne.jp>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <cf87225f-7932-9df8-90d9-af602d798700@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/17/22 12:40, Tetsuo Handa wrote:
> If you are fine with per a module WQ, please apply this patch to your tree.
> 
> If you prefer per a "struct san_data" WQ like
> https://lkml.kernel.org/r/f78ddbdc-8989-a1a7-2234-ce9ec3894625@I-love.SAKURA.ne.jp
> does, you can replace this patch with yours.

I think a per-module workqueue is perfectly adequate, unless there are
some considerations I'm missing. We generally expect there to only ever
be one device instance present that this driver binds to, and even if
there were multiple instances, it's fairly low-use and we only flush in
the remove function (this is to say that I see virtually no potential
for this to live-lock or something similar).

I guess one could make the case that having it in the module as opposed
to the driver may lead to an unused workqueue if the module is loaded
(or built in) but the driver is never used. However, generally the
driver should be built as module (unless you're very specifically
targeting Surface devices) and the module is only ever loaded if the
driver will actually be used.

So, in the end, both ways should lead to virtually the same result. And
I don't really have any strong preferences either way.

> On 2022/06/10 20:29, Maximilian Luz wrote:
>> On 6/10/22 07:41, Tetsuo Handa wrote:
>>> Use local wq in order to avoid flush_scheduled_work() usage.
>>>
>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>>> ---
>>> Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
>>> using a macro") for background.
>>>
>>> This is a blind conversion, and is only compile tested.
>>
>> Looks good to me, thanks!
>>
>> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
>> Tested-by: Maximilian Luz <luzmaximilian@gmail.com>
>>
>>>    .../platform/surface/surface_acpi_notify.c    | 27 ++++++++++++++++---
>>>    1 file changed, 24 insertions(+), 3 deletions(-)
