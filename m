Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77222C00140
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Aug 2022 13:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiHONkw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Aug 2022 09:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiHONkh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Aug 2022 09:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AE9AD644D
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660570834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WFznknxYVUIEfYgBOXexxkEEuynTrS8Oz/t2Nz94EIw=;
        b=AIFCknWMWPZoyNk3wKZL4XiLzA/2L5BaYplb2txUWW1W+2zNlfHhtoOuICkMt2eZV4mtyM
        dSwbh35hsK3LKK40x6ipwPgYL6C3NJ2RMW8FyrgzoqA6nLKcZRLkNXLBJxnP7yRl5Px660
        xyEUsI5PP4Wfo+2BcwSebmjUpsd9JMs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-YO496PMPNI-dDuWKaddjZA-1; Mon, 15 Aug 2022 09:40:33 -0400
X-MC-Unique: YO496PMPNI-dDuWKaddjZA-1
Received: by mail-ed1-f71.google.com with SMTP id b6-20020a056402278600b0043e686058feso4759624ede.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=WFznknxYVUIEfYgBOXexxkEEuynTrS8Oz/t2Nz94EIw=;
        b=59aAFXBm+rksj+ydAcr0rHnUL/fK2A0nxA3erfiDpnrPP+GZ0HVcMd6RQx1FE+JpU3
         YXBMJ3qj8i5VWEAPemBRGbe2AoPoTDcLBlgU0ccgKErAcqvxFnMerlnGmJp24WiQqmB+
         BxwiUUWWzBt0pyKP/NGGGqhVYEYmn7gUn0YQTdMnsa6qu8C9RV2D4kuQXSTzAOfrbgFy
         bRMgykp6+uULnOOAhs+pppwXokPAIqaCEAkirxXMrx7LQyPkT2JaXWDg0bspCuRauZ0k
         y5sh+ehpt8ACLvc6AF82xjcSuXwo4dO9Eijp1mhTP1KewYr2XjFya6cPOS/A54TYHm+K
         uo3w==
X-Gm-Message-State: ACgBeo3vECKvYH7JPUpPfcwl17rb5HIBVAn4kj3rz6IkNlOYM50OAKbC
        aq+cyk+9mh9zGusB6SESEzMQ4jf1hJcgjnbEK7dMOiJewumW7XtOL9cPK3ybT8OXUAHFdrzV+dD
        bgQuHV2wH7deQwWneSXqvnIYkHqNRXkw03g==
X-Received: by 2002:a17:907:6095:b0:731:87a0:b9e8 with SMTP id ht21-20020a170907609500b0073187a0b9e8mr10680394ejc.124.1660570832241;
        Mon, 15 Aug 2022 06:40:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5oZ7fArE1z6FU2jiWJzYS68Y0xeV9C+owuOUu+SUoYpcY6/WJu+7AZUENP6EKBs3mosb+cIw==
X-Received: by 2002:a17:907:6095:b0:731:87a0:b9e8 with SMTP id ht21-20020a170907609500b0073187a0b9e8mr10680387ejc.124.1660570832079;
        Mon, 15 Aug 2022 06:40:32 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s23-20020a508d17000000b0043d7923af6esm6625114eds.95.2022.08.15.06.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 06:40:31 -0700 (PDT)
Message-ID: <657998b3-0f26-9a66-8191-713715622c01@redhat.com>
Date:   Mon, 15 Aug 2022 15:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/6] Fixes 98829e84dc67 ("asus-wmi: Add dgpu disable
 method")
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220812222509.292692-1-luke@ljones.dev>
 <20220812222509.292692-2-luke@ljones.dev>
 <fc250b82-c7c7-9215-f3dd-be87e0a72edd@redhat.com>
In-Reply-To: <fc250b82-c7c7-9215-f3dd-be87e0a72edd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/15/22 15:25, Hans de Goede wrote:
> Hi Luke,
> 
> On 8/13/22 00:25, Luke D. Jones wrote:
>> The dgpu_disable attribute was not documented, this adds the
>> required documentation.
>>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> 
> Thanks for the patch. Note that the Fixes tag should be above your
> signed-off-by and then the patch should otherwise have a normal
> subject + body. I've changed the commit msg to the following
> while merging this:
> 
> """
> platform/x86: asus-wmi: Document the dgpu_disable sysfs attribute
>     
> The dgpu_disable attribute was not documented, this adds the
> required documentation.
>     
> Fixes 98829e84dc67 ("asus-wmi: Add dgpu disable method")
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> """

While merging this I noticed that this is also using spaces
instead of tabs for indentation, where as the rest of
the file is using tabs.

I've also fixed this up while merging, but next time
please make sure to use spaces.

I will make similar spaces -> tabs changes to patch 2/6 and 3/6

Regards,

Hans




>> ---
>>  Documentation/ABI/testing/sysfs-platform-asus-wmi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
>> index 04885738cf15..0f932fd60f4a 100644
>> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
>> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
>> @@ -57,3 +57,12 @@ Description:
>>  			* 0 - default,
>>  			* 1 - overboost,
>>  			* 2 - silent
>> +
>> +What:          /sys/devices/platform/<platform>/dgpu_disable
>> +Date:          Aug 2022
>> +KernelVersion: 5.17
>> +Contact:       "Luke Jones" <luke@ljones.dev>
>> +Description:
>> +               Disable discrete GPU:
>> +                       * 0 - Enable dGPU,
>> +                       * 1 - Disable dGPU,
>> \ No newline at end of file
> 
> Next time please make sure the file always ends with a newline
> even in intermediate patches.
> 
> Regards,
> 
> Hans
> 
> 

