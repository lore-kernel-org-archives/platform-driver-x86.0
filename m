Return-Path: <SRS0=1Jx7=C6=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB207C43463
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 08:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8902D20773
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 08:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J/HP6NjE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgIUIbU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Sep 2020 04:31:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40577 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726211AbgIUIbU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 04:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600677078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xMw4PrbTwfMtSzkiHjjRiYQzAJ5UL39XTOjvADbIDp4=;
        b=J/HP6NjE+WM/dzMbRIY6V3r7dJupBa1uXh9Sl1L9PbZtuFK1MoG+z34rTVsCvUKXCHl9Vm
        XN2QdmLjONt6zaGhVSq3FzCcDVnrSy8cfPVxfBRSA9Anfw0yyaw8DM537V71eotDfWQXhP
        nzcGvuRj8EWV4remaVL5CI+QStw3f08=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-3i7lQTYwNGOk2ILt2_L9bg-1; Mon, 21 Sep 2020 04:31:16 -0400
X-MC-Unique: 3i7lQTYwNGOk2ILt2_L9bg-1
Received: by mail-ed1-f69.google.com with SMTP id r8so4322387edy.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 01:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xMw4PrbTwfMtSzkiHjjRiYQzAJ5UL39XTOjvADbIDp4=;
        b=o2pWIZ+9c1ZfRmDY9AAIogHide070Wp9ad+Y8srHWP7YC7q31zWEmT915hOadekvbk
         44f7r7y9vPzhUIP9KOqjYbqYsnHxYFXLV8TiJAPskOViY/NhVYAstBf7bwyYjhw3WHM/
         Xdc4wUENUHlu8JYFK/H+nYgKNCT8O4Ep+Gypat7eIzjq8eBr+LW3XlLKoZj5IleJ0mwG
         737OrND4Y71A9JZB3wdxIVN+Qy0A9484iaopCnBNOZ0ltseYNdoY2f1ROFTDtZACE8O0
         vtGt0RINbyV4T/M1b1no6vHS/zJwA0fApW0VOlPYrlANvAWZvMTwdOYw/s3JzEwKo3PD
         PmCA==
X-Gm-Message-State: AOAM533GKsQ6epA0fUqWNlI06JPUBcVwZMR0TpRf7xCAjm7YuHjaRUBI
        7139Qawz606lEDV8Po/lpoZk4F06Mi+n+cDbqZdkO0j+eRfI9R0UNiTFXIEwDLmQpETHKj9oFBb
        59YbyUtz/lfa99ze1j1VWKumgc8MhcPggZQ==
X-Received: by 2002:a50:9dc8:: with SMTP id l8mr51363644edk.58.1600677075178;
        Mon, 21 Sep 2020 01:31:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKARDhb9cnoiwBw+s/IJDj/+Ob6mgB/CLbLN5Ded+KL4YCvMkRq0e0SvHEQfHQa81PHLacRA==
X-Received: by 2002:a50:9dc8:: with SMTP id l8mr51363624edk.58.1600677075017;
        Mon, 21 Sep 2020 01:31:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id bz5sm8385165ejc.83.2020.09.21.01.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 01:31:14 -0700 (PDT)
Subject: Re: LG laptop driver not working on recent models
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alessandro Zarrilli <alessandro@zarrilli.net>,
        Mark Gross <mgross@linux.intel.com>,
        Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <CAJubAmEg_uXsWRqHXA2_L8i2AVU_ZLH19txYqgVpP5s+AwNzfA@mail.gmail.com>
 <CAHp75VdKkZ0Ra3FMvbfq2hJH7_KZ5S_XLCxmrgFOAMiGDe6AKQ@mail.gmail.com>
 <78578539-19c2-8915-91f8-8a82bafb5135@redhat.com>
 <GxGF1TZmiB_rQkmbSArqPGuGoD-nIHGe2pZpUHOuerXgAYR187jtfHMIx0X5cXufT542KGk-ZGZPdWjBuku5sw3k0IhTxkXjpjQK628VO2Q=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f9ec3ea-2536-24ba-0de6-978fb233b5c6@redhat.com>
Date:   Mon, 21 Sep 2020 10:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <GxGF1TZmiB_rQkmbSArqPGuGoD-nIHGe2pZpUHOuerXgAYR187jtfHMIx0X5cXufT542KGk-ZGZPdWjBuku5sw3k0IhTxkXjpjQK628VO2Q=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/20 10:18 AM, Barnabás Pőcze wrote:
> Hi
> 
>> [...]
>>
>> Assuming I have got this right, then now a days we have
>> a standard power_supply class sysfs attribute for this,
>> charge_start_threshold .
>>
>> Or maybe I got it wrong and the battery_care_limit means
>> never charge above that value? Then the new standard
>> power_supply class sysfs attribute would be
>> charge_stop_threshold.
>> [...]
> 
> A small note, as per Documentation/ABI/testing/sysfs-class-power, the attributes
> are charge_control_{start,end}_threshold. The charge_{start,stop}_threshold
> attributes have only ever been used in the thinkpad_acpi driver (as far as I know).
> And it has been extended not so long ago to use the "new" attributes.

Ah, I'm running 5.8 on a Thinkpad and I did not know the thinkpad
driver (initially) used non standard sysfs-attribute names thank you
for the correction.

Regards,

Hans

