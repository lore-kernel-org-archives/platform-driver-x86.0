Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB7CC761A6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 31 Mar 2023 17:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjCaRf0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 31 Mar 2023 13:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbjCaRfZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Mar 2023 13:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B111F7B8
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680284071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=thdjmYdzdNUYYa5BUZs77ARM8oqqYSIUPVnIwxv8/Xo=;
        b=Z7CK0T3tGAt4yXG0uRgT/dl9Q2PJC25CMOp/ufApauWhBzXD1MkMYWtbr8/GbcroNPRAye
        SqBY4uB8eO6u5M+cff79dpzs2kGqOEoJnKv4cLCeBHDYJWJT9Q/rWkLFViJa+/CwaiJmQV
        wzu/4oNh6rb8RiveIKKfhkJprjBVoRo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-N6bXX4vANnW8wAeiReSLuQ-1; Fri, 31 Mar 2023 13:34:29 -0400
X-MC-Unique: N6bXX4vANnW8wAeiReSLuQ-1
Received: by mail-ed1-f71.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so32705429eda.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 10:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thdjmYdzdNUYYa5BUZs77ARM8oqqYSIUPVnIwxv8/Xo=;
        b=fP6WVwFR6Ln+TzmxjgY/vAYO4EWTe+qHjXYuOQ4NoIObbf9Py3luex1uvOlRvIIFAM
         chD6Bp9CyjAl1pgLsTEXeSbUWA+P8cmjdFbc4CyoMHJQwttlVEqkYtuUi+V51OIB6H1N
         rSMzE8ziOEpaCcV3+3fQs9tNXOR4Od9ma7qTOOl8plqn+IcChjlLIvq0JPoXxzJmW83k
         /+ydc9EONIscBD5Y6/zncSi/fJO22OF72hBxlJFvD6iTaTT+Io/Q73asBpQPvavtn3UJ
         9v1B4oDYOxzWgWXWzX5oB2jH19rDZQjIBYuEjc4tByy9pUAeSfovqUaRR0zm/rjRFWwv
         i8nA==
X-Gm-Message-State: AAQBX9ed3CrdwlUT+fCePYwIGMjmYZ0Pn+gsg1RSQIoh2bmswSM0zC0u
        f/tZGRschmXqdCQ+N4yLvyO58tpSzNTuIIM4mlFnIfsxg/NuN1R4N3Yg3twmE8dFJFqpFzWW0cK
        y5Q4XVACR6dEWsCBPQxvNJkPvZA8BjxM3soJT6EZBbA==
X-Received: by 2002:aa7:cd12:0:b0:4fd:20ee:225d with SMTP id b18-20020aa7cd12000000b004fd20ee225dmr24750340edw.24.1680284068196;
        Fri, 31 Mar 2023 10:34:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+7N67YQnfQFTGBh2sNN+uqA26wkrpsm/usxs7lDNVehSW3Mu3K8zluwm8x/DugJ+LLodEgw==
X-Received: by 2002:aa7:cd12:0:b0:4fd:20ee:225d with SMTP id b18-20020aa7cd12000000b004fd20ee225dmr24750328edw.24.1680284067957;
        Fri, 31 Mar 2023 10:34:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090617c200b00930c7b642d0sm1166526eje.166.2023.03.31.10.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 10:34:27 -0700 (PDT)
Message-ID: <3a89c1f4-f876-3a5d-465c-6d374890b6e3@redhat.com>
Date:   Fri, 31 Mar 2023 19:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Add "X570S AORUS ELITE" to known working boards
Content-Language: en-US, nl
To:     linux@weissschuh.net, Brandon Nielsen <nielsenb@jetfuse.net>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331014902.7864-1-nielsenb@jetfuse.net>
 <2cf99af4-2d6c-44b6-a133-4ff0d94dca20@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2cf99af4-2d6c-44b6-a133-4ff0d94dca20@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/31/23 11:44, linux@weissschuh.net wrote:
> Hi,
> 
> thanks for the patch!
> 
> 
> Mar 31, 2023 04:01:37 Brandon Nielsen <nielsenb@jetfuse.net>:
> 
>> ---
>> drivers/platform/x86/gigabyte-wmi.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
>> index 4dd39ab6ecfa..ca5124e31d2c 100644
>> --- a/drivers/platform/x86/gigabyte-wmi.c
>> +++ b/drivers/platform/x86/gigabyte-wmi.c
>> @@ -160,6 +160,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>>     DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
>>     DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
>>     DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),
>> +   DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570S AORUS ELITE"),
>>     DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z690M AORUS ELITE AX DDR4"),
>>     { }
>> };
>> -- > 2.39.2
> 
> 
> This patch is missing a proper subject line, a commit message and Signed-off-by.
> Please send a v2 and take a look how similar patches are structured.
> 
> https://lore.kernel.org/lkml/20220705184407.14181-1-parherman@gmail.com/

Since I'm preparing a fixes pull-req to send to Linus today
and since this is just a simple hw-id addition I have merged this now,
so that it can be included in the fixes pull-req.

I have fixed the subject and solved the missing Signed-off-by problem
by setting myself as author and crediting Brandon with a:

Reported-by: Brandon Nielsen <nielsenb@jetfuse.net>

Regards,

Hans




