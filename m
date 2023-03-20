Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3548C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 13:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjCTNuf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 09:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjCTNue (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 09:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313BDAF22
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679320181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dTB+1XfSXsy0vMQD3TqCWnvYGHCLVIdTBw7HZKV79x0=;
        b=elADLH1Np0guCnrVNHxGeHEAPnp8Z3CCdZukbLbgmvMkW8HVUflC+HS+7IFWx07ycjcihc
        RqHKXH33dtQUojDbn2ggDEhxEvgbZzDYLbfDi50lmzf/eYtdJ1aCOEFWdVL4oRG87/nTGM
        /Z130KMToB0txzejaGPyAUdxf9k0sB0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-mjevisY9Mbu3od8obQtSvw-1; Mon, 20 Mar 2023 09:49:40 -0400
X-MC-Unique: mjevisY9Mbu3od8obQtSvw-1
Received: by mail-ed1-f70.google.com with SMTP id e18-20020a056402191200b004fa702d64b3so17922648edz.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679320178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTB+1XfSXsy0vMQD3TqCWnvYGHCLVIdTBw7HZKV79x0=;
        b=QdU341p2YI3mdgJB5QfAG8nkI6SfDPoH2WyBscCny29NBOh+UGoL7TgLqgYLcCEHFW
         ju069ksbUGrzXTVk2HRb6kQkCrX3bhdSqD6nq6apJR46UPJmCGFkEsgrJ7iT98UL8raJ
         EWNBbQjG+BTZfMSsQNgPSePfo71xU+vphLenrnLFPv6lovXbcViOZDIki3KJazOU67LH
         KvZTrFYYJ+Xd0MnhRLl6RfX8SVVAXeokgsuvOlVmDgcHDZBQS9xlEBXmljbKr/XptyQ/
         3qXoKem/vxd0jkzLrIhVz9RXlaDI05lWEvsNjOvcNO+47Vuy5mEIenwR9aaIAPkJZY0S
         020A==
X-Gm-Message-State: AO0yUKWikzzH01xihE2HmQMenLKMex6u+G8lx7orDCOJV62WYXp7F6im
        zsmrAKGYAMr0itGPC/LI6ebbIRmkmqBqbbp2bYp5CddAcqVfy6A12lMZzi/RJCxGkc9huzd868g
        fuZs1T92eiQfa4GZovuFToyN+fmIrULWpFecj8LTHAQ==
X-Received: by 2002:a05:6402:b2e:b0:4f9:9e56:84bf with SMTP id bo14-20020a0564020b2e00b004f99e5684bfmr12071974edb.10.1679320178640;
        Mon, 20 Mar 2023 06:49:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set/bYLJtkFRGKGZjvhhYu9afxtSCNjBLiZiL9VRfBbMYcm5RWIy8o4oLuzGO5yrPtHEPIBCBBg==
X-Received: by 2002:a05:6402:b2e:b0:4f9:9e56:84bf with SMTP id bo14-20020a0564020b2e00b004f99e5684bfmr12071961edb.10.1679320178362;
        Mon, 20 Mar 2023 06:49:38 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k6-20020a50ce46000000b004f0e11e071dsm4929235edj.73.2023.03.20.06.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 06:49:37 -0700 (PDT)
Message-ID: <610802f2-1b02-e3c9-b2a5-c0946303b244@redhat.com>
Date:   Mon, 20 Mar 2023 14:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86 (gigabyte-wmi): Add support for A320M-S2H V2
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>,
        Frank Crawford <frank@crawford.emu.id.au>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230318091441.1240921-1-frank@crawford.emu.id.au>
 <1fa8e7c3-215b-4888-90e6-e5d372e4d179@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1fa8e7c3-215b-4888-90e6-e5d372e4d179@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/18/23 17:40, Thomas Weißschuh wrote:
> On Sat, Mar 18, 2023 at 08:14:41PM +1100, Frank Crawford wrote:
>> Add support for A320M-S2H V2.  Tested using module force_load option.
>>
>> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> 
> Acked-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



>> ---
>>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
>> index 322cfaeda17b..4dd39ab6ecfa 100644
>> --- a/drivers/platform/x86/gigabyte-wmi.c
>> +++ b/drivers/platform/x86/gigabyte-wmi.c
>> @@ -140,6 +140,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
>>  	}}
>>  
>>  static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("A320M-S2H V2-CF"),
>>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
>>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H WIFI-CF"),
>>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
>> -- 
>> 2.39.2
>>
> 

