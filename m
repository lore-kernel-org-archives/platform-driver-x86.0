Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E0BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 15:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238990AbiD0PJ1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 11:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238989AbiD0PIp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 11:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A90850041
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651071932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3t/sLcxk5ON+nCAOFqDjHqbbXWr7HEuBu+6M9wcEXV8=;
        b=RCjuKPo24WbpulEqEAHMcnF4mRNXiRdg06g3UX0u09GGp/Mhk82+SxNZSybYupc30h5gj8
        oZpeRv3XfQm5XSU2Jvrsy0ov49TBUDmpEz7GU221Lfngl79RIfgh8K/C//MJ6owfv+WbGp
        AWpHPUvsT/JOH0W3e4/gG0m2AjKbh/4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-0i1RnpKcPfeVnuAY9Oh-lQ-1; Wed, 27 Apr 2022 11:05:30 -0400
X-MC-Unique: 0i1RnpKcPfeVnuAY9Oh-lQ-1
Received: by mail-ej1-f72.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso1319131ejc.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 08:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3t/sLcxk5ON+nCAOFqDjHqbbXWr7HEuBu+6M9wcEXV8=;
        b=LXkIXSMZq8lBcVirTWLOHqZegeXwx51sOADX/sMEF7fB5sCU4TnNIj0y25VpppccIg
         rAhQbyDKmgrjded/3ZNiEoQfrb0tGSph17UdQL61DRiYAsTOPimvYB0JPV2qfQxzRnzb
         spTHPvnXj+SNRDjL+3iKDTEJ70kg77QSTRlua9LaCIIjCN5JdMQcJm8Se2jatBLGLbqn
         iZA38BjtbXGSCEk/2ZzadqCFkoH4dfoNhG/qS39JGCvEn/uZUUCo7Cw24fRwG5Xzxc9q
         +/BGIvcaX/85EktSm7NvtZboo7y3ieZSmjjXUnUbkz5nYK8ztiyjz7jn1+I2aFrLPmU/
         B8Lw==
X-Gm-Message-State: AOAM530OXKwWMkInE6b4wu7afGorrhXgYpTSSUXsmxQosO2MUYmDtviD
        lC0JDUtdrFD1V0JpyBpbBAjcFM5EF8P4MbjCQl4U35HYEKeMaSpwvmRTJ34wt+WVxXCe2ecTIO2
        kxkpZxgVHrXwdtiZ7e7m8zVbcz5JF84IqTA==
X-Received: by 2002:a17:906:1b1b:b0:6f3:9044:5fb4 with SMTP id o27-20020a1709061b1b00b006f390445fb4mr15892651ejg.763.1651071929707;
        Wed, 27 Apr 2022 08:05:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW6QYNB9mO1C2n0d8BB/YK/nWa+lxH0HlS4zgjNQP35Gfh0Ka65UPPL3YcQEW3fJBKBrFN3A==
X-Received: by 2002:a17:906:1b1b:b0:6f3:9044:5fb4 with SMTP id o27-20020a1709061b1b00b006f390445fb4mr15892643ejg.763.1651071929527;
        Wed, 27 Apr 2022 08:05:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906924200b006f3d1141693sm656369ejx.44.2022.04.27.08.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 08:05:28 -0700 (PDT)
Message-ID: <1c5df3fc-98a3-5cc4-a542-1c8920e709e5@redhat.com>
Date:   Wed, 27 Apr 2022 17:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: PCIE ASPM-related trouble with S0ix on Thinkpad X1
 (NVME-related?)
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
        "Box, David E" <david.e.box@intel.com>,
        "Wang, Wendy" <wendy.wang@intel.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
References: <87k0bvutxf.fsf@toke.dk>
 <MW3PR11MB4522A97808B70EFA41122723A1ED9@MW3PR11MB4522.namprd11.prod.outlook.com>
 <8735ii384z.fsf@toke.dk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8735ii384z.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 4/12/22 12:31, Toke Høiland-Jørgensen wrote:
> "Box, David E" <david.e.box@intel.com> writes:
> 
>> There are a few things that could be going on. Please file a bug
>> report at bugzilla.kernel.org under Power Management. Provide all this
>> information and include the output from lspci -vvv when ran as root.
>> Thanks.
> 
> Alright, thanks! Opened
> https://bugzilla.kernel.org/show_bug.cgi?id=215832

David, Toke has provided the requested info at the above bugreport,
but sofar no-one has responded to this bug report yet.

Can you respond / follow up with Toke in the bug report please?

Regards,

Hans

