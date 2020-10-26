Return-Path: <SRS0=KVMw=EB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3D4C4363A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6020422460
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJ0RhqOM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783999AbgJZPgZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Oct 2020 11:36:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60222 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1783972AbgJZPgW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Oct 2020 11:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603726581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4T8J9h8aHDWVKUpT3UKKBDgLYCTKNVpvy5H15xGKCd0=;
        b=KJ0RhqOMuWzlLAtGWTKvKWgWowqGOq2nFV1hF0QWut0iFnOeLa2p2Ua1WhkOeDd8wQgt4S
        SYBf/o0EAzMDdPzFGUkDOxG8NWk4vK4nd/KJzrAXLUZpKrsMPD4cQ+pcbk+g57yJ2wedr9
        jKYCqkYov4+6dL4a7WLp+j6OFBuOTM4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-YTemOUydOJutljNkkbbV6g-1; Mon, 26 Oct 2020 11:36:19 -0400
X-MC-Unique: YTemOUydOJutljNkkbbV6g-1
Received: by mail-ed1-f70.google.com with SMTP id a19so4544505edb.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2020 08:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4T8J9h8aHDWVKUpT3UKKBDgLYCTKNVpvy5H15xGKCd0=;
        b=Tb10oyylrUsX+FcoFjaWk1VzUjh2fMX2/ysGw/HkGzvO9s32WqUx+7onP/aifrbpw9
         tN0s/HZdLnIi5oUnpzHHQsfCTx8xq9LUSowWkHN0F7ypVQ1hhHwBG110t91d1PPeiKqB
         vXg1dnOiUt97+y3O4rKOf/64mgvcfsLJkbUF1H+SilU5h3NlDmOMMoljLRme0W2RA7bp
         NQrXjeP7TTEMhYTjrXicmjxkMMe4zlUzni3dRsOf/voxTOv0UqL4nB1IaRk+icXYLU6l
         LxvffUPZqxuAHuhV7Fc6KfnhgOJd1thKJ3TOF20tNC2Vv9lywip+vnZaGJ8ji3/eCAAp
         F1mg==
X-Gm-Message-State: AOAM531ghoS88CakyV/Vx60tI+1W39p8UJvFW0U2C0hcnlnM+IF4wYb9
        4fGiPzLXDoiSV/UHUhlZZG5Fjja9RcE/aGAo8scpfpP5dq4QRlIKDEsRRz8GgXDZEaWGEHTwbgm
        TcuiUkEIQBk3xPzCH+xQ4+e/ii764McgCdA==
X-Received: by 2002:a05:6402:1615:: with SMTP id f21mr16888463edv.257.1603726575214;
        Mon, 26 Oct 2020 08:36:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRiV17XlEk9Alol3IXbaQKVZJaHSEnTXtXAKR+AVqFgAOQj00dGvz+dxPWGkm6yB+z64/rRA==
X-Received: by 2002:a05:6402:1615:: with SMTP id f21mr16888443edv.257.1603726575039;
        Mon, 26 Oct 2020 08:36:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id rl1sm6136899ejb.36.2020.10.26.08.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 08:36:14 -0700 (PDT)
Subject: Re: [PATCH v6] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        mark gross <mgross@linux.intel.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20201006082618.209287-1-divya.bharathi@dell.com>
 <101db8e3-70f0-4e85-b4b9-008995939b1a@redhat.com>
 <DM6PR19MB2636A7CAF82D8CB7DEEF7B2DFA190@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4e415aea-d855-e8a5-0b61-785b67efeb59@redhat.com>
Date:   Mon, 26 Oct 2020 16:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636A7CAF82D8CB7DEEF7B2DFA190@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/20 4:25 PM, Limonciello, Mario wrote:
>>> +
>>> +	print_hex_dump_bytes("set attribute data: ", DUMP_PREFIX_NONE, buffer,
>> buffer_size);
>>
>> This seems to be a debugging left-over?
> 
> Yes it was for debugging, but its configurable to turn on by dynamic
> debug as I can tell.  Is that not correct?

Since it does not have debug in its name I sorta assumed it would
always do the print. But you are right, this is a shorthand macro
for print_hex_dump_debug() (which takes a few more arguments), so
this only dumps the buffer when debugging is enabled.

IOW keeping this "as is" is fine, sorry for the noise.

Regards,

Has

