Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35944C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 07:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18F9160F3A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 07:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbhJKHNW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 03:13:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50049 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234116AbhJKHNJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 03:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633936269;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4ufHdDwqlN79+UhpsetonLDLuFxLVpaRNLOG0+gN/fs=;
        b=F5UqrGG1+xp96CeEENc58VpRRQP2Jhy04Npd8eazGM1AEal+/zHmkeKanLIxCPAdH+P/xq
        l5EiekSt2KvL7uWi/nbmM70jMZkrNxOLPOkVNB60ix6hdbIcCWrrbaIL3lJFXKS18vIQ3n
        gEX5HKCPXthwQ0U31WJq0318TAMgKao=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-sKS7Cl8ZPJCPwQcoJ4i8MQ-1; Mon, 11 Oct 2021 03:11:07 -0400
X-MC-Unique: sKS7Cl8ZPJCPwQcoJ4i8MQ-1
Received: by mail-ed1-f72.google.com with SMTP id v9-20020a50d849000000b003db459aa3f5so12404088edj.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 00:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4ufHdDwqlN79+UhpsetonLDLuFxLVpaRNLOG0+gN/fs=;
        b=g06Lc7oj9Q/YVI6hv06KhCPSMOWWDkGdxu4eIP6pCsVXi5Z0nJpA8Smrh+OJO5zAK+
         +vb/Zr69yAQ0AGUgM2hv9tbbPuld+hG8YupK7X7Kbz9+jBCGqvTlaBUIZJfLU0xQwdi9
         VHSE88RkbXDcwzYfhahcpQ7bCS6BTs/dnez16XbgK2M5W4Q+hEg8jWuHR4r9qlHikDIv
         552G205H8sepAqaPCbJOPsn04GiOg7BElOO0yhsYelNpz6YnshT64KCaewr7pqLjXraf
         edlpwCodDIa61Q4TJbvHJ8oVBPhL1Y9tZRvs4rKOQ9A6Zj2hWsRHI3OfmRrkPnzTNmtQ
         xrfg==
X-Gm-Message-State: AOAM531rSy0gnPiQuTih8/8Z5sV/eeZEEpQUkj4UFOqFHbQFs4JvySOd
        7iIzgpizjilr18KqkBpOoHpxEx9vTDuwDC+cI6ci2RgijclD32BkOZa995msiNtsSd7eexd7z9P
        m/PIifOIiQeDtWDOIlkr+q//szjwX4ndldg==
X-Received: by 2002:a50:e1c3:: with SMTP id m3mr39024411edl.28.1633936266777;
        Mon, 11 Oct 2021 00:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRmTTHfeZR3GBvJS0BieP8VpiV3k5sbhkh02O6Mc2oySZA1exPg32XReVdqCdWp4D448Zz+Q==
X-Received: by 2002:a50:e1c3:: with SMTP id m3mr39024383edl.28.1633936266561;
        Mon, 11 Oct 2021 00:11:06 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id la1sm2996905ejc.48.2021.10.11.00.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 00:11:06 -0700 (PDT)
Subject: Re: [PATCH v3 01/11] ACPI: delay enumeration of devices with a _DEP
 pointing to an INT3472 device
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-2-hdegoede@redhat.com> <YWPXixp/J6KIzWp6@lahna>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0c08069e-7758-fc09-c200-d867d097b499@redhat.com>
Date:   Mon, 11 Oct 2021 09:11:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWPXixp/J6KIzWp6@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/11/21 8:19 AM, Mika Westerberg wrote:
> Hi,
> 
> On Sun, Oct 10, 2021 at 08:56:57PM +0200, Hans de Goede wrote:
>> +/* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
>> +static const char * const acpi_honor_dep_ids[] = {
>> +	"INT3472", /* Camera sensor PMIC / clk and regulator info */
> 
> Is there some reason why we can't do this for all devices with _DEP?
> That way we don't need to maintain lists like this.

Up until now the ACPI core deliberate mostly ignores _DEP-s because the
_DEP method may point to pretty much any random ACPI object and Linux does
not necessarily have a driver for all ACPI objects the driver points too,
which would lead to the devices never getting instantiated.

In hindsight this might not have been the best solution (1), but if we
now start honoring _DEP-s for all devices all of a sudden then this
will almost certainly lead to a whole bunch of regressions.

Note that in this case the HID which triggers this is for the device
being depended upon and for all camera sensors used with the IPU3 and
IPU4 Intel camera blocks this is the INT3472 device. By triggering on
this HID (rather then on the sensor HIDs) I expect that we will not
need to update this list all that often.

Regards,

Hans



1) I believe that Windows does pay more reference to the _DEP-s and we've
had some other related issues lately.

