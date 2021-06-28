Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFB4C49361
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 15:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE43A61954
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 15:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbhF1PR3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 11:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60852 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238112AbhF1PPY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 11:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624893178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1DN/DqwvHKPbkV1XM5jlyCDcxuozpiNSSje+yfBx04A=;
        b=at9ACtU5TVCHztHE4VIyEf8C7jy93j93vh5wmc29HVNelWaUpraOhK1P12X0vbE46rRukm
        HEJXG3tZXNJOcHXBt1dV74afc9YjnQe+S/ndlOStX3YMJBWGDFfZQMSue0GJfIiE7Xj84z
        C9106TI8fAByJKZHvOYYDo14222Zc2g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-QgAVW28sNwWwQ7IwdgNSAg-1; Mon, 28 Jun 2021 11:12:55 -0400
X-MC-Unique: QgAVW28sNwWwQ7IwdgNSAg-1
Received: by mail-ed1-f71.google.com with SMTP id o8-20020aa7dd480000b02903954c05c938so2842092edw.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 08:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1DN/DqwvHKPbkV1XM5jlyCDcxuozpiNSSje+yfBx04A=;
        b=o3Jq6uYr8N2INC8geVjozLVc3JgvsaZZ6mrFT204sJ1+wJSmvTOtqlYkPn1581rE0T
         PynLCeU1VHAjZjgsLYniNiJp6Uyt3Dbk+vwMu2unvZVjBraVDEo5SydIj2DU6mH8WZwt
         +cOF8H7kfH+Gik0zsniFHQ14GQYKl2Q8IC2bJy/9LyOGLvwbE5AJttAyFVXcToJsEhaH
         rjTxAI6oSRYqK9MEt+Im+iM3necx6+ECoxjza+aWP5vnqTHikmXFmNJWWsEcFGnONPlE
         vBCZonF5Qc3igRid+mbBCYq1PQ2dB4pRrAgTGhYAFF3gIYybMTBBfgQmpezn5+h81z5q
         pnGA==
X-Gm-Message-State: AOAM531yz6Wj78bukuftmCU6s0blI9suYcE07GBPxWMtKXDOXLv6isSl
        NreAC9pmOIedajERaPvgA7TcwplJuSgk+Pql3WaeifN7KnlzTKh9lZtvM5JcB4AuxoCH9uBVayG
        8O6hjxSo1uUCVvMVOnfwHdlXo7sDb2n3QhA==
X-Received: by 2002:a05:6402:b17:: with SMTP id bm23mr34043920edb.173.1624893174082;
        Mon, 28 Jun 2021 08:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx49KmZG+oBY+azuLtlXg9yAcLEyAz5N4uuHSg4vfJ6ta6RkA5yR4Hwlu8zhB6SnEX+j+Fbnw==
X-Received: by 2002:a05:6402:b17:: with SMTP id bm23mr34043896edb.173.1624893173864;
        Mon, 28 Jun 2021 08:12:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hg25sm6937900ejc.51.2021.06.28.08.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 08:12:53 -0700 (PDT)
Subject: Re: [PATCH V2 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shravan S <s.shravan@intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210510074016.31627-1-s.shravan@intel.com>
 <20210510074016.31627-2-s.shravan@intel.com>
 <CAHp75Ve_=mv5MbLvqxGwu8GAuxAjBLpRHE9KNua-yvmzUNKuKw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <79bd7236-dec1-ffde-8c23-3a500e04eedd@redhat.com>
Date:   Mon, 28 Jun 2021 17:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve_=mv5MbLvqxGwu8GAuxAjBLpRHE9KNua-yvmzUNKuKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/24/21 12:24 PM, Andy Shevchenko wrote:
> On Wed, Jun 23, 2021 at 5:04 PM Shravan S <s.shravan@intel.com> wrote:
> 
> Besides the fact of missed documentation, this code is far from the
> upstream-ready quality.

I agree that the code needs more work here.

> Send a new version to our internal mailing list for the detailed review.

I'm not in favor of internal reviews, esp. not when new userspace
API is involved. I would greatly prefer for the discussions surrounding
this to be kept public.

> And as I said, the interface should be provided by WWAN subsystem (or
> whatever subsystem(s) for this will be suitable *), while this should
> be a driver between actual implementation and the abstract interface.
> I believe this kind of feature will be needed (if not used already) by
> non-Intel hardware and we should have a more unified interface from
> day 1. Is it possible?

I agree that ideally we should have some generic userspace API for this,
but I'm afraid that ATM that simply is not possible. This whole notion
of maximum tx power being controlled based on various sensors because
of SAR reasons is pretty new (at least in the PC/laptop space) and
I know of a couple of vendors who are slapping some adhoc firmware
interface on the sensor readings for some modem related userspace
process to consume.

The 2 implementations which I know about for this are wildly different
and I expect we will see more, equally creative firmware interfaces
for this.

I don't think that it is realistic to try and layer a common userspace
interface over this at this point time. Actually I believe that even
trying to do so is a bad idea at this point in time, since this is
all so new that we are bound to get it badly wrong if we try to
design a common userspace API for this now.

I also don't want to wait for this to all crystallize out since that
will likely take years; and we should add support for this under Linux
in a reasonable time-frame. For laptops which ship with Linux
pre-installed it is important that there is feature parity between
Windows and Linux; and support for these new type of modems which need
this "SAR" integration is one of the biggest pain points with this ATM.

So for now I'm ok with having vendor specific userspace API for this
as long as it is somewhat sane and as long as it is very clear from
the sysfs path that this is vendor specific.

> *) maybe you need to introduce a layer which will provide a common
> interface between subsystems and hardware blocks for this kind of
> functionality. Either way, lack of documentation is perceptible.
> 
>> V2 :
>> * Changes to the remove netlink and introduce sysfs to communicate to Userspace via notify
>> * Handled review comments by changing ioctl calls to sysfs

I've not looked at the actual code at al yet, with that set thank you
changing over to sysfs.

I assume the sysfs atttributes for this all sit under

/sys/bus/platform/devices/INTC1092:00  ? 

And thus it is very clear that these are sysfs attributes specifically
for the INTC1092 device ?

If that is the case; and assuming that the new sysfs attributes API
is sane I don't see the API issue as blocking this driver.

But as both Andy and Enrico have pointed out the code needs a lot
of work.

Shravan, please post a new version addressing all remarks made
sofar and then I'll try to make some time to review the sysfs
userspace API for this (and later I'll also review the code).

Regards,

Hans




>> * "sar" name change for platform_device_id to "intc1092"
>> * sar_init and sar_exit is modified as per review to minimal initialization
>> * Inclusion of debug only enabling of device mode change parameters
> 
> You mixed up changelog / commit message / cover letter altogether.
> ...
> 
>> +config INTEL_SAR
>> +       tristate "Intel Specific Absorption Rate Driver"
>> +       depends on ACPI
>> +       help
>> +         This driver limit the exposure of human body to RF frequency by informing
>> +         the Intel M.2 modem to regulate the RF power based on SAR data obtained
>> +         from the sensorscaptured in the BIOS. ACPI interface exposes this data
> 
> sensors captured
> 
>> +         from the BIOS to SAR driver. The front end application in userspace
>> +         will interact with SAR driver to obtain information like the device mode,
>> +         Antenna index,baseband index, SAR table index and use available communication
>> +         like MBIM interface to enable data communication to modem for RF power regulation.
> 
> ...
> 
>> +static void sar_send_notify(void)
>> +{
>> +               if (!context) {
> 
>> +                       pr_alert("%s: context is null\n", __func__);
> 
> Is it dead code?
> 
>> +                       return;
>> +               }
>> +               pr_debug("%s: %d, %d, %d, %d\n", __func__, context->sar_data.device_mode,
>> +                        context->sar_data.bandtable_index, context->sar_data.antennatable_index,
>> +                        context->sar_data.sartable_index);
>> +               sysfs_notify(context->sar_kobject, NULL, "intc_data");
>> +}
> 
> ...
> 
>> +static void update_sar_data(void)
>> +{
>> +               pr_debug("%s: Update SAR data\n", __func__);
>> +               if (context->config_data[context->reg_value].device_mode_info &&
>> +                   context->sar_data.device_mode <=
>> +                   context->config_data[context->reg_value].total_dev_mode) {
>> +                       context->sar_data.antennatable_index =
>> +                       context->config_data[context->reg_value]
>> +                       .device_mode_info[context->sar_data.device_mode].antennatable_index;
>> +                       context->sar_data.bandtable_index =
>> +                       context->config_data[context->reg_value]
>> +                       .device_mode_info[context->sar_data.device_mode].bandtable_index;
>> +                       context->sar_data.sartable_index =
>> +                       context->config_data[context->reg_value]
>> +                       .device_mode_info[context->sar_data.device_mode].sartable_index;
> 
> Oy vey, this is quite hard to read, use temporary variables.
> 
>> +                       pr_debug("bandtable_index: %d\n", context->sar_data.bandtable_index);
>> +                       pr_debug("antennatable_index : %d\n", context->sar_data.antennatable_index);
>> +                       pr_debug("sartable_index: %d\n", context->sar_data.sartable_index);
> 
> No way. Drop debug prints from production code.
> 
> 
>> +               } else {
>> +                       pr_err("%s: sar data not assigned! Dev mode: %d, total_dev_mode: %d\n",
>> +                              __func__, context->sar_data.device_mode,
>> +                              context->config_data[context->reg_value].total_dev_mode);
>> +               }
>> +}
> 
> 
> --
> With Best Regards,
> Andy Shevchenko
> 

