Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8A6C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Jun 2022 10:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381209AbiFQKku (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Jun 2022 06:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380840AbiFQKkt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Jun 2022 06:40:49 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46836B006
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jun 2022 03:40:46 -0700 (PDT)
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25HAeTop049615;
        Fri, 17 Jun 2022 19:40:30 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Fri, 17 Jun 2022 19:40:29 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25HAeTWA049612
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 17 Jun 2022 19:40:29 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <cf87225f-7932-9df8-90d9-af602d798700@I-love.SAKURA.ne.jp>
Date:   Fri, 17 Jun 2022 19:40:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] platform/surface: avoid flush_scheduled_work() usage
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <63ec2d45-c67c-1134-f6d3-490c8ba67a01@I-love.SAKURA.ne.jp>
 <df69c497-0ec1-0ffa-b434-dede30a36c36@gmail.com>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <df69c497-0ec1-0ffa-b434-dede30a36c36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If you are fine with per a module WQ, please apply this patch to your tree.

If you prefer per a "struct san_data" WQ like
https://lkml.kernel.org/r/f78ddbdc-8989-a1a7-2234-ce9ec3894625@I-love.SAKURA.ne.jp
does, you can replace this patch with yours.

On 2022/06/10 20:29, Maximilian Luz wrote:
> On 6/10/22 07:41, Tetsuo Handa wrote:
>> Use local wq in order to avoid flush_scheduled_work() usage.
>>
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> ---
>> Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
>> using a macro") for background.
>>
>> This is a blind conversion, and is only compile tested.
> 
> Looks good to me, thanks!
> 
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Tested-by: Maximilian Luz <luzmaximilian@gmail.com>
> 
>>   .../platform/surface/surface_acpi_notify.c    | 27 ++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
