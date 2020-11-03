Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4522BC55178
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 13:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDD2322243
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 13:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFddN0/C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbgKCNF6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 08:05:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45484 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729072AbgKCNEX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 08:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604408661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6pawvAF7Wv8YKESQSjEip/g3FnuZOBAv2i94QcoQE7I=;
        b=UFddN0/CHZLuSG09pe/neGYtUKW1QvJl7UBtnZrdTxAycxHKrW+O0kfzOTrUXP67m+60Pz
        DfFMNz72PTdsxJc4U8ZgrwWP74X2DOueAXD+D/Vy96IUXCWp1Pk/JQRYP3zEo4BtcMpYP7
        MYKF286sVzEGeftBgB1+ZxBeLsGA6fY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266--fPi297_Ml2QGIArpawAew-1; Tue, 03 Nov 2020 08:04:19 -0500
X-MC-Unique: -fPi297_Ml2QGIArpawAew-1
Received: by mail-ed1-f69.google.com with SMTP id c24so426431edx.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 05:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6pawvAF7Wv8YKESQSjEip/g3FnuZOBAv2i94QcoQE7I=;
        b=MXYEGoPTjOUXPh4H54hYQDc725iJSVSlt9n0ZoYgJUL9gZ4b/M+hV7ibuw3t/+DMTn
         ZazzIEjLQzTX0eCxuSvpq0LaAAb1Xq/Z0KsdClzZG6vZgqAPASMJgrQv3wxeHSlqrO5w
         KZt/F2ft+Y9nvdfloqEGMQlZIDD4nO5OanWg2ZTr7BMPvHsWP2dZZnFR1ymP7368P9/W
         Lfe1A7Yq6uKkywHvL8y3RM/rEjCHMwtVmR5zIHJIUPOCMgnlCFqUHhKYRpHpZ6yVI3Gg
         13j+jZXU7/KZhDwBYz2w+XxIM6Hqyg6pmose03igQPq+3YI3lajL1bjSax61cVv4N3mj
         41pA==
X-Gm-Message-State: AOAM5336ILMmWBN66V0NkMUVfzQLyC/gkWSnWm6BWXaDCvmLd7SHchgU
        6X5id5LtH8l4jQxtthcaIJ693A9JSvnEJ5f25V09QQ40WyQ59IHQ9SqgzkG2dpT+oBaRUOMJoLG
        MEf3MlV163w9rCFVK1KLWilPIj/fHOzaKYw==
X-Received: by 2002:aa7:cc0e:: with SMTP id q14mr5471497edt.181.1604408657778;
        Tue, 03 Nov 2020 05:04:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/t/HbmnzM8648T7je+mnMq8zu3l7DxyaA4JRCFULj3lCwPG1QsxoHaNovGF/+xQ3HghLDMA==
X-Received: by 2002:aa7:cc0e:: with SMTP id q14mr5471477edt.181.1604408657625;
        Tue, 03 Nov 2020 05:04:17 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id rn28sm10215778ejb.22.2020.11.03.05.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 05:04:17 -0800 (PST)
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com
References: <20201028185654.2692118-1-Shyam-sundar.S-k@amd.com>
 <e33a8ba5-4355-8e66-b890-2fa4af8adc81@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <22cdce4f-61cb-5bdb-6486-7c00c1c95b52@redhat.com>
Date:   Tue, 3 Nov 2020 14:04:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e33a8ba5-4355-8e66-b890-2fa4af8adc81@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/3/20 1:28 PM, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 10/29/2020 12:26 AM, Shyam Sundar S K wrote:
>> AMD Power Management Controller driver aka. amd-pmc driver is the
>> controller which is meant for final S2Idle transaction that goes to the
>> PMFW running on the AMD SMU (System Management Unit) responsible for
>> tuning of the VDD.
>>
>> Once all the monitored list or the idle constraints are met, this driver
>> would go and set the OS_HINT (meaning all the devices have reached to
>> their lowest state possible) via the SMU mailboxes.
>>
>> This driver would also provide some debug capabilities via debugfs.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> Changes since v1:(https://www.spinics.net/lists/platform-driver-x86/msg23269.html)
>> - Remove duplicate code and make a common routine for polling SMU
>> - Reorg Maintainers info
>> - add missing iounmap() during erroneous case.
>>
> 
> any feedback on this patch, please?

I have reviewing this on my to do list, some patience please.

Regards,

Hans

