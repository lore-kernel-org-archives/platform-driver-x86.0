Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15147C47094
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Jun 2021 15:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E162A613D0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Jun 2021 15:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhFJP5V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35536 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230361AbhFJP5U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Jun 2021 11:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623340524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iZQG49OMdPKGkVDjxzrA9bmQ2IiyK39OfqmeMQ/HNjI=;
        b=coeEit+avyKcmzcCYpVE1LCRS8K10e/7XZTihkbjflRBPU2lPFkn5lEYUFD3yzh7bRcVyB
        RBaSshaSCZo95ybNd7mw9tvZwTY3ItB/kp0ijYM51wg3gewj+p18PC+oB4ain0jBFuhgk3
        t96O+crMgQSJ8jpkymq1mTRdzPcRJLc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-gUNMo3x-PkWjszWM2BtJvg-1; Thu, 10 Jun 2021 11:55:23 -0400
X-MC-Unique: gUNMo3x-PkWjszWM2BtJvg-1
Received: by mail-ej1-f72.google.com with SMTP id p20-20020a1709064994b02903cd421d7803so6390440eju.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Jun 2021 08:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iZQG49OMdPKGkVDjxzrA9bmQ2IiyK39OfqmeMQ/HNjI=;
        b=GsN6tZ9ZidsriEUxTrIJCYbE3P+qPALsfkxlUPVG88lzJij65Pi34js9REFd/LiIi7
         4yasDYEG/3ASrZT03mCTk47liz0rcG4qwtyJ1fx9wyULfj5qvoGctQJGtyjzma7QS+3g
         ZHeYGRwgTO0Z2pln1/3LtrSla4zXKba/B/KnzC7l4GnRCNtCuh3XNyi1mqwUUPqEfGbf
         59AulK0K8M5/iLxCA+Q5RfkbtcjwebUbfWAvOV2c/wDDArM5mEyQuI++m3Io3j+670Pe
         h7orDtaqy9uA4nVKT07k/2k3CC4uLgSAz+fwRgjOVU/iGGdix4IhUckhLmL5Dpvx3wfI
         45Qg==
X-Gm-Message-State: AOAM530JyCQrXdzfdgBnYa1q/qhbFDSnnV6fMOIAe0uwUZBE+7QhnfbY
        uFGwY1XCTkZp/98+Gg5TBlBFdvyP7Ly4L2IzIXFfbT8fqLxPYvq5KwquqPks/HXPaJUR0VbgNIq
        vParCHXqtcUECRdVFXr93fvwBCiFFnarNog==
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr162813eds.8.1623340520893;
        Thu, 10 Jun 2021 08:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzegUSmNkouCVxXgL5EpM34N2tl0oLxPr9grZP9q3YInG4mkvVxKvf1gpjZDLfSXaCu5fvtcw==
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr162805eds.8.1623340520764;
        Thu, 10 Jun 2021 08:55:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jp6sm1224885ejb.85.2021.06.10.08.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 08:55:20 -0700 (PDT)
Subject: Re: Computation of return value being discarded in get_cpu_power() in
 drivers/platform/x86/intel_ips.c
To:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Jesse Barnes <jsbarnes@google.com>
Cc:     platform-driver-x86@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <548dd463-3942-00a1-85c3-232897dea1a3@canonical.com>
 <162332615476.15946.17135355064135638083@jlahtine-mobl.ger.corp.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7e13032d-1472-9c50-1dba-9dcebc76729f@redhat.com>
Date:   Thu, 10 Jun 2021 17:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <162332615476.15946.17135355064135638083@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/10/21 1:55 PM, Joonas Lahtinen wrote:
> (Address for Hans was corrupt in previous message, which confused my mail
> client. Sorry for duplicate message, the other is without From: field).
> 
> + Jesse
> 
> Quoting Colin Ian King (2021-06-09 14:50:07)
>> Hi,
>>
>> I was reviewing some old unassigned variable warnings from static
>> analysis by Coverity and found an issue introduced with the following
>> commit:
>>
>> commit aa7ffc01d254c91a36bf854d57a14049c6134c72
>> Author: Jesse Barnes <jbarnes@virtuousgeek.org>
>> Date:   Fri May 14 15:41:14 2010 -0700
>>
>>     x86 platform driver: intelligent power sharing driver
>>
>> The analysis is as follows:
>>
>> drivers/platform/x86/intel_ips.c
>>
>>  871 static u32 get_cpu_power(struct ips_driver *ips, u32 *last, int period)
>>  872 {
>>  873        u32 val;
>>  874        u32 ret;
>>  875
>>  876        /*
>>  877         * CEC is in joules/65535.  Take difference over time to
>>  878         * get watts.
>>  879         */
>>  880        val = thm_readl(THM_CEC);
>>  881
>>  882        /* period is in ms and we want mW */
>>  883        ret = (((val - *last) * 1000) / period);
>>
>> Unused value (UNUSED_VALUE)
>> assigned_value:  Assigning value from ret * 1000U / 65535U to ret here,
>> but that stored value is not used.
>>
>>  884        ret = (ret * 1000) / 65535;
>>  885        *last = val;
>>  886
>>  887        return 0;
>>  888 }
>>
>> I'm really not sure why ret is being calculated on lines 883,884 and not
>> being used. Should that be *last = ret on line 885? Looks suspect anyhow.

This has already been fixed (yesterday actually) in linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=13c3b4f76073d73dd81e418295902676153f6cb5

Regards,

Hans

