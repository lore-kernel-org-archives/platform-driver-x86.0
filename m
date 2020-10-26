Return-Path: <SRS0=KVMw=EB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBC3C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:41:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AF1022400
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgCZ4sn2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784310AbgJZPlv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Oct 2020 11:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20796 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1773432AbgJZPlv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Oct 2020 11:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603726909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XxTRL/KCZQNPaBl6z/BK7HxMO/ugsS28Pfq4Yc2zsNs=;
        b=UgCZ4sn2ot8o97HYLimlUlhqW3XncyVdVpkU0nkuFkZldEkgwvkthUOh/f8KEym18iz6/D
        AsqhyVnpcPtrCO593bB7RRl7htQbcN7jBHk1t5qgBP90gAH1WS4ueRJUutRot1Q6RZlq3K
        AY168R0aj/Zdb9sjr9QA/w+xDT2urNI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Qq8KkD4nMtC3s1H74tYJ4A-1; Mon, 26 Oct 2020 11:41:48 -0400
X-MC-Unique: Qq8KkD4nMtC3s1H74tYJ4A-1
Received: by mail-ed1-f70.google.com with SMTP id 28so4594665edv.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2020 08:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XxTRL/KCZQNPaBl6z/BK7HxMO/ugsS28Pfq4Yc2zsNs=;
        b=XjVcvYdKpOeJpH08Z/pNeXt4TBHmpTKb5BM60yoXGFaOWqk7KqIBr+nUX+qluCQVGV
         VJxlWCJEMfpb/cBo91H3cjZT7SLs4/mL+CIVKCQG4/OMmHCfFa88zxmE2nikR98QrZ4N
         1PeABOt3QrGNlpnLSE7jz0mvWPY4GIhKJpDPHd4IX5h1Hq3CiCdvHRVnwezffq4RZ+8S
         1b1oVbIgY80XQsn0Ji6V/+50RGecubPjfPhmxhkcEnwgElRnzWNRJy2ljxtrBOpfVhnk
         VVrXvH+4pr7Alx02i2nynbdFy01GWrM07GCG+GIoTxVXHHXABnKj21jDndjGCmb2Jhd4
         8psA==
X-Gm-Message-State: AOAM531Xse5dBKN6f8W25aYADV6eP4qZquFjpKJkUn7hgkdLDeHW2OmU
        8VlzsMf3VOH2NZJDfepF3q3si0TEZ9ez+aMJ5+KKxNcwEWXEzGuhiRDYVzQiDbK5sFmJxzCpFG6
        C2wtf7KWlijeHaujtN9LLvEZLmTuSoyGVmA==
X-Received: by 2002:aa7:c647:: with SMTP id z7mr3542519edr.350.1603726906745;
        Mon, 26 Oct 2020 08:41:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzijRjaL5cxTNnxce+CH5tVZ5Z7zUs0Eo2Y0iQEs1wVNkENTg7loIfaBSfL3fK8YefmAtAilg==
X-Received: by 2002:aa7:c647:: with SMTP id z7mr3542449edr.350.1603726905798;
        Mon, 26 Oct 2020 08:41:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q3sm5421050edv.17.2020.10.26.08.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 08:41:45 -0700 (PDT)
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
 <DM6PR19MB26367BCFE51C45BC00D13F6BFA190@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7f40bc72-83cc-c265-ac46-9543f74d228a@redhat.com>
Date:   Mon, 26 Oct 2020 16:41:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26367BCFE51C45BC00D13F6BFA190@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/20 4:39 PM, Limonciello, Mario wrote:
>> This was present in previous versions too, but I just noticed this are you
>> sure that using
>> .string.pointer is correct here? That seems wrong since the pointer gets
>> allocated by
>> the Linux ACPI core, so it is not under influence of the AML code?
>>
>> I think you want / need to use ".integer.value" here ?
>>
>> And maybe first do a type check, e.g.:
>>
>> 	if (obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_INTEGER) {
>> 		ret = -EINVAL;
>> 		goto out;
>> 	}
>>
>> Adding this type check will also show if I'm right that you should use
>> .integer.value ...
>>
>> 	ret = snprintf(buf, PAGE_SIZE, "%lld\n", obj-
> 
> We'll need to double check this, but I'm pretty sure the firmware outputs
> everything as a string.

Ok, in that case it should probably be printed as a "%s" though and not interpret
the buffer-address which the kernel allocated for storing the string as an
integer.

And it would still be good to do the type-check for this, but then checking
for a type of ACPI_TYPE_STRING.

Regards,

Hans

