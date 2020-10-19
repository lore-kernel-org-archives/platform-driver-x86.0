Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82313C433DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:37:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EB232223C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="djENMFTX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbgJSShW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 14:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55353 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730620AbgJSShW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 14:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603132641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B2j2o9+XA9EuJHo370jNyNDcY1iI2eMgwcD1Ux/NbX4=;
        b=djENMFTXpNAw2CSFAPTiE4nA5MBvtDtZHoClIpi7aM3vUShRg/OVcRyslL7IUvD/jEQllT
        f/h7449Rseozixlirz805amx55BAxYLaSbTQnLYyUz4xFZr3x14RV2SyT16dHff3eixgS7
        d3rjbSfp2MVIoZvF6ZM2jKVSa+qYrpw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-0t05Gg4RNM-CYXVOQqBT1Q-1; Mon, 19 Oct 2020 14:37:19 -0400
X-MC-Unique: 0t05Gg4RNM-CYXVOQqBT1Q-1
Received: by mail-ej1-f70.google.com with SMTP id x22so212943ejs.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2020 11:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B2j2o9+XA9EuJHo370jNyNDcY1iI2eMgwcD1Ux/NbX4=;
        b=ECZsvrVXHehyHZKU8U4AFdjqoB9qqIMmqvknQKrT1CilYxwuh1I2l1samvYQeDlKWP
         VRKoOsAwXgbd8QjhfkQQlnHGGptdVWArtZes+WMfLEmHfuHn0e2zxovZi7xz6Tzf0ZT8
         PuHDsoPqbDV5Y+QZ5NTVNHaqIV2pZMJdGbg92n3oz002rtTnkxEPrCEjbOGY2oSz5vmj
         sC4TGLJ50+sQDH0A26SMw4aqWvgzuj3QhYcKS72KTryjlNRKqmwf/TqrgUS7PbK6uVaL
         J5bHfvbc23qiVUT9pJNdZkAPPAj71Wqg1zqjjwAey/sTPsi5ClrpQQh1QGsLcw1cFJUU
         wu5g==
X-Gm-Message-State: AOAM532gmGtUwdRwXomF6nhb7MlUy5ZErOtyygfRtZgVGTfq1R9sUDaU
        E98+IAS1K7Gpf1hxdBVoKx6Dtm9LJu08eVm5cbRdJ5V+2N+OfgIYAU1OJvOIJlypX6Txvu92nHj
        ayew3uPgGLcw0boguXDt0BXNC/dcLoGcVtQ==
X-Received: by 2002:a17:907:435e:: with SMTP id oc22mr1261101ejb.485.1603132638110;
        Mon, 19 Oct 2020 11:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuyaJgUk1QEnH5FmBXOnT/MUDlDHDGCo1HkXK9QeLagcWgHr92ULnabXfZtib7H6U3ZHuoeA==
X-Received: by 2002:a17:907:435e:: with SMTP id oc22mr1261084ejb.485.1603132637843;
        Mon, 19 Oct 2020 11:37:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id r21sm565373eda.3.2020.10.19.11.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 11:37:17 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86: Remove led/gpio setup from pcengines platform
 driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Ed W <lists@wildgooses.com>, linux-kernel@vger.kernel.org
Cc:     fe@dev.tdt.de, "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20200921215919.3072-1-lists@wildgooses.com>
 <d4b2045c-769b-4998-64cc-682c01c105fb@wildgooses.com>
 <8058a804-a793-a5f8-d086-0bb0f600aef9@metux.net>
 <65efe44a-bbef-f982-462a-385fffe493a0@wildgooses.com>
 <0de126c4-f2aa-a817-0a38-32bf3ede84d1@redhat.com>
 <e727d039-8dea-1a40-48b9-792b6053807c@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2ba7fc12-a3a7-2783-54e6-27e9eb60ec9c@redhat.com>
Date:   Mon, 19 Oct 2020 20:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e727d039-8dea-1a40-48b9-792b6053807c@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/19/20 5:44 PM, Enrico Weigelt, metux IT consult wrote:
> On 14.10.20 10:41, Hans de Goede wrote:
> 
> Hi,
> 
>> Keep the current LED/gpio setup code, but make executing it conditional
>> on the BIOS version and skip the LED/gpio setup when the new BIOS is
>> present to avoid having duplicate LED entries, etc. in that case.
>>
>> I guess this would still break userspace because if I understand things
>> correctly the new ACPI based setup uses different LED names ? That
>> seems unfortunate, but I guess that from the kernel pov we can just
>> blame the BIOS for this, and since we definitely do not want duplicate
>> LED entries for the same LED, this seems the least bad choice.
> 
> Sorry, but not fine. When a newer box is taken from storage into
> production (eg. replacement or new installation), application breaks.
> LED isn't the only problem, also affects buttons.
> 
> The whole reaons why I invested all the time for writing general
> purpose drivers (fch-gpio is separate from board driver) and bringing
> it to mainline was having clean and generic support for these boards,
> instead of having to carry around special patch queues forever and
> in near future just using stock distro kernel. I guess that's the
> main reason for very most mainlined drivers.

Ack and that is how things should be done.

> This will be defeated
> as soon as the whole thing becomes board/bios specific again.

I hear you, but if newer BIOS versions all of a sudden start
declaring their own stuff, then we need to come up with some
solution here...

Not sure what that solution should be though.

Regards,

Hans

