Return-Path: <SRS0=HJcc=DV=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74029C433E7
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Oct 2020 11:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E985F20725
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Oct 2020 11:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LyFtCU88"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730655AbgJNL3q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Oct 2020 07:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55379 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729919AbgJNL3q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Oct 2020 07:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602674984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QaTsnB/NmKVi1NdOeJ8x36SBfiUo2Aw3Dr5NQTlitH8=;
        b=LyFtCU88R00z/dpxAc1u6/kPxpgHqHYzfP/Rg+mkfDyzw+RFiplnB5ggu1V9YxdzNy47l/
        lwHXWggFqixt+QWpyjIAWBzhJpY5646GTool6+586qkTYcECh8lEQYduvgQ8EbRliyJZZ0
        SdNcisa4eDBjs0kn7LHNGIiU8nOfoA8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-H4-ypQHXMAqeUHTfE5X2Ew-1; Wed, 14 Oct 2020 07:29:42 -0400
X-MC-Unique: H4-ypQHXMAqeUHTfE5X2Ew-1
Received: by mail-ed1-f69.google.com with SMTP id j6so1077053edh.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2020 04:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QaTsnB/NmKVi1NdOeJ8x36SBfiUo2Aw3Dr5NQTlitH8=;
        b=GOLC8vFH9KFI559QLLajKiSFTayAZbTB7zQHgAL8o7XTe3KEDL0ADtJRAZDUdGtHHD
         svkELgth3PXDNldaGKrME/LvUUGoTkrFbfDLvcP4h93L4LaeqYmd0TAfbLpul4ZDzFl0
         A2i7s51FzCZ8CGJmzch7QlDtkSiKadx4XrijG2ldWuRl10UZV5J+oz4LIlm1j3YJcVRH
         0p2CUTdoakoONlXajaD4O8EohH2X64VyEqBpcMD8F8oa0d6wUHpnckrEoKMMErH49Gnr
         O3A/NbldDHxkyPtfIIlivSvzqVzXbazbjGSxk38bwX6oTzl/RnItfuo9Fz3g2aIkUS8w
         X32g==
X-Gm-Message-State: AOAM530nMp4ZIQXdAPYlFhr+kv2cOIpYFmtxSDMS4X1pM8Hkp3cyYiwH
        FiotWLmv0fuDKJ/wozdcZaKKdz8IjPDkKykskoi8GwSKp+NTQ2syfy8mHhpAmNr96IEuQBEoRNb
        C2sif8SaxY52ux5tJXpF5FdGe8MR7SUpTVA==
X-Received: by 2002:a17:906:647:: with SMTP id t7mr4893229ejb.428.1602674981326;
        Wed, 14 Oct 2020 04:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGwyGFjVIKKl7Lf54hI7fTvEm7ElH89Mrc1DoIC7JOvVhmBSc+i8q8DLy1qpxgvj3X6UtjYA==
X-Received: by 2002:a17:906:647:: with SMTP id t7mr4893207ejb.428.1602674981114;
        Wed, 14 Oct 2020 04:29:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id m16sm1398566edj.37.2020.10.14.04.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 04:29:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86: Remove led/gpio setup from pcengines platform
 driver
To:     Ed W <lists@wildgooses.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     fe@dev.tdt.de, "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20200921215919.3072-1-lists@wildgooses.com>
 <d4b2045c-769b-4998-64cc-682c01c105fb@wildgooses.com>
 <8058a804-a793-a5f8-d086-0bb0f600aef9@metux.net>
 <65efe44a-bbef-f982-462a-385fffe493a0@wildgooses.com>
 <0de126c4-f2aa-a817-0a38-32bf3ede84d1@redhat.com>
 <e953f3ee-2db1-1523-cd84-6acb26751a15@wildgooses.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d0d91191-cad2-94a1-6373-0f3ff4e38376@redhat.com>
Date:   Wed, 14 Oct 2020 13:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e953f3ee-2db1-1523-cd84-6acb26751a15@wildgooses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/14/20 1:21 PM, Ed W wrote:
> On 14/10/2020 09:41, Hans de Goede wrote:
>>
>> So I have a suggested compromise:
>>
>> Keep the current LED/gpio setup code, but make executing it conditional
>> on the BIOS version and skip the LED/gpio setup when the new BIOS is
>> present to avoid having duplicate LED entries, etc. in that case.
>>
>> I guess this would still break userspace because if I understand things
>> correctly the new ACPI based setup uses different LED names ? That
>> seems unfortunate, but I guess that from the kernel pov we can just
>> blame the BIOS for this, and since we definitely do not want duplicate
>> LED entries for the same LED, this seems the least bad choice.
>>
>> Enrico, would that work for you ?
> 
> 
> I'm cool with this. Enrico?
> 
> I may have some time imminently to have a stab at a new patch. Obviously any help structuring this
> would be appreciated - it feels clumsy using the existing detection mechanism, I think whatever I
> come up with you should kick back and recommend a new board detection structure, but perhaps we can
> shortcut that step with a few comments up front?

I'm afraid I do not have any wisdom to share here. I would use the DMI bios-version
or bios-date strings for the detection, but I guess that is obvious.

Other then I guess I would do a preparation patch restructuring the code so that
the whole conditional part becomes a single if, e.g.:

	if (old_bios()) {
		ret = register_leds_and_gpio_for_old_bios()
		if (ret)
			goto error_cleanup;
	}

So in a separate preparation commit put all the code which you tried to
remove earlier in a single helper function (feel free to pick a different name).

And then in that prep patch the above would look like this:

	ret = register_leds_and_gpio_for_old_bios()
	if (ret)
		goto error_cleanup;

And a follow-up commit adding the new/old bios detection would
introduce the if.

And do the same for the cleanup parts for module unloading.

I hope this helps...

Regards,

Hans

