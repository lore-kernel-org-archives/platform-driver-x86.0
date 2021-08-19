Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779C5C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 14:08:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55E4D6113B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 14:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbhHSOJZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 10:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25552 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235352AbhHSOJZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 10:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629382128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2F1dSKGuznQXHJo/a/g/86LxQF+PyMn3A5VP447VPq4=;
        b=N2YeB+cPAFaAS6JnSwKzbWiWZrRXyQ9gtWd093ufLU1HsPVvgLTbOvpYdjAvC7lE/Eoh9K
        wHiD3iRT5JL/n6peiIUHo51TrRNtGS29zGbtTi6/up2puwjotmW2eaqNyILw2ld2pbIocK
        9aWCBFhlZL8uwnHvRayyLj9o4uiMcAs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-PMZH9Y41PQ6mc_4bgPG3tw-1; Thu, 19 Aug 2021 10:08:47 -0400
X-MC-Unique: PMZH9Y41PQ6mc_4bgPG3tw-1
Received: by mail-ed1-f71.google.com with SMTP id ec47-20020a0564020d6fb02903be5e0a8cd2so2898934edb.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Aug 2021 07:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2F1dSKGuznQXHJo/a/g/86LxQF+PyMn3A5VP447VPq4=;
        b=og0+k3VOwP0woONm1MrU8VVqJXcPDNQkVILo2rzmr7WDKB7ngdk7CdDKJXHMfPHIA5
         ZE+kV3PbtKSrbwq6vZvlUuV7hj/44VAOVsyQSZuJw7zPkMuOFn0XmkjI9f9cqorqSet6
         WpeDd850pZ3M6KnzWw8uKXySVaVEQsS4Kzz+vKQ7gWF0+nybEyWE4TSmF0Cf1HrhU1zW
         oN2EkUwWKgE6rvxJf5YuQ+XcNmCjVAjGH5M8PGoGvtL+mjKvtXyw/seRETzDS608VL57
         moDnmsT4HLQ/SI0iOCI4sVswoypzCevx5b1Rw+pbYji10Fcs6mCE+W29w/XiJu0B6c/J
         /3jg==
X-Gm-Message-State: AOAM531n1skguBtd3wAuXCNgpzv/mnoYN74Q5tydwS98K8717pnlWDdq
        rPJlAl4cYvIB0VXgaTM5smPmxeQIJ4JgVrkBGzzMKVYMDR+OhW/QLNzn+V4umjyeU2ky4tvyTAy
        8uc1yojbTh5aYGcchACaip9EbZDVmpERdwxxhnXYgKZsaUqdcDqPCprImdZcyPXe9S+xclNhmoq
        WEnbdfJRe3JQ==
X-Received: by 2002:a17:906:3157:: with SMTP id e23mr16175969eje.29.1629382126073;
        Thu, 19 Aug 2021 07:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9zhOERw3eniU+oEfoni7CeWjvoPSXJX1DSQJT2CcpSeJlKv7kqgKMujE5GRkMIuAeDeN3vg==
X-Received: by 2002:a17:906:3157:: with SMTP id e23mr16175936eje.29.1629382125840;
        Thu, 19 Aug 2021 07:08:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ne22sm255341ejc.113.2021.08.19.07.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 07:08:45 -0700 (PDT)
Subject: Re: [PATCH v3 00/20] Intel platform driver code movement
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Alex Hung <alex.hung@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210819033001.20136-1-hpa@redhat.com>
 <1360c64f-b695-a4b8-8b61-a4dfb0e896f0@redhat.com>
 <CAHp75VcdOc+G1Yov9HcGhMbEqzGwemmD7=SHd3qOOsEdAqjg2Q@mail.gmail.com>
 <CAHp75VfvjVeq716d=aGvZXvmzbpW4+XG66ryVYrBxk5G5Wd6cg@mail.gmail.com>
 <a5e52890-c162-ab48-4858-3eb0e971e5a1@redhat.com>
 <07cfd37a-cce6-56f2-0ff1-d4daeccfc67c@redhat.com>
 <CAHp75VfTc5tyoVnWYBsu9dNJyqyN1wLB2qEqSXyCdtYqZEzq9Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b521dd02-4ea6-c604-b851-ee41e8d1ad33@redhat.com>
Date:   Thu, 19 Aug 2021 16:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfTc5tyoVnWYBsu9dNJyqyN1wLB2qEqSXyCdtYqZEzq9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/21 4:01 PM, Andy Shevchenko wrote:
> On Thu, Aug 19, 2021 at 4:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 8/19/21 3:31 PM, Hans de Goede wrote:
> 
> ...
> 
>> Note that drivers/platform/x86/intel_ips.h is deliberately not moved
>> (for now) since it is also used by the i915 driver.
>>
>> My plan is to merge a follow-up patch moving that through drm-intel-next
>> once 5.15-rc1 is out.
> 
> Why we can't do it in the same patch?

Because the intel-drm code is seeing a lot of churn, so that will
cause conflicts. It will be a lot easier to do the move of that
last file through the drm-intel-next tree once this rename series
has landed in 5.15-rc1

Regards,

Hans

