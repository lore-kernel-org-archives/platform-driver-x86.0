Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEB0E732C5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Sep 2023 12:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjI1Mk5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Sep 2023 08:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjI1Mk4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2023 08:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21B9198
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695904809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0hFRSmhC1yPSbB9D3RIWwpqfVPBnoWuA9Kbk89H68FA=;
        b=dPR3MpKXYU2jh/XHlITpGolXpvOp7nMNlFvC4Gbs5DkJ1MADet4vM+Svi80JCleiex2kqb
        t1bb5QswJ8C5NDJMj3+o/wWgvRbeOYI46D76g3yPc1FtZY2tYMIU/4/S2iyLE3+IODE67e
        lDrlbVX60402T2R6V5xe2GSfvx8UqCM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-GfLgYsmnPzqu3aOL_DKOCA-1; Thu, 28 Sep 2023 08:40:07 -0400
X-MC-Unique: GfLgYsmnPzqu3aOL_DKOCA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a5d86705e4so1129703866b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904806; x=1696509606;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hFRSmhC1yPSbB9D3RIWwpqfVPBnoWuA9Kbk89H68FA=;
        b=vhp/Vb1fFiHqOxMejP2ZR+dAXF/FaqjB3TwrvMTzXmsEntGUSRaNu6a86OU4TlFApC
         ZnYQ5W46+wP3kloWd2skgsyvYMzETLfVj2RsIl9wP/ZD81XyBeySApvb75BpVdRZiMl5
         dhYWQiRLfUe5ZqoOhl/+pLHhSCSgtUXDkOWF2lL/eVR/U4+m6G761DJIJZJSE2x9e3eY
         Dwx0F5oBp/AAtnLrTzSe59XrcDLxO2dmrN0S4ARl5zZIyFAKGiNjDweYWtiA7lLGqLV8
         wOtqoIVL0FnkOtqiX8/JLCoC5+LRVvtW7o6io0xPLa9kebSpFLv57qK6gtJib4IXJA40
         62tw==
X-Gm-Message-State: AOJu0YxQoPMUTjDvWURNFxYw//KhHrf9ofHqAacJRGyAOEGyLJACvBCc
        M/5cOBSh9hPnR5kmZvtsFEXJRIK9TK6kMd/s7/wCrmfhbmT8yjGZPhMK+LVdMWxo8Fywlf2M77m
        dvlrgwA55CfIS/RwDXzW+af5hm5FrnW6HNQ==
X-Received: by 2002:a17:907:7712:b0:9ae:82b4:e309 with SMTP id kw18-20020a170907771200b009ae82b4e309mr1192194ejc.0.1695904806732;
        Thu, 28 Sep 2023 05:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7O5uFQTyzH0jhxnRyyPH5q1RHCxAi7qglSAjZirKqTUvUvzw5yk0NoQa8J3TDppGiJS+YHQ==
X-Received: by 2002:a17:907:7712:b0:9ae:82b4:e309 with SMTP id kw18-20020a170907771200b009ae82b4e309mr1192176ejc.0.1695904806392;
        Thu, 28 Sep 2023 05:40:06 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.103])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906374800b0099cf840527csm10843051ejc.153.2023.09.28.05.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:40:05 -0700 (PDT)
Message-ID: <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
Date:   Thu, 28 Sep 2023 14:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 0/5] platform/x86: int3472: don't use
 gpiod_toggle_active_low()
In-Reply-To: <20230926145943.42814-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is a v2 of Bartosz' "don't use gpiod_toggle_active_low()" series.

New in v2:
- Rework to deal with ACPI path vs gpiod_lookup.key differences:
  acpi_get_handle(path) -> acpi_fetch_acpi_dev(handle) -> acpi_dev_name(adev)

Regards,

Hans


Bartosz Golaszewski (2):
  platform/x86: int3472: Add new
    skl_int3472_gpiod_get_from_temp_lookup() helper
  gpio: acpi: remove acpi_get_and_request_gpiod()

Hans de Goede (3):
  platform/x86: int3472: Add new skl_int3472_fill_gpiod_lookup() helper
  platform/x86: int3472: Stop using gpiod_toggle_active_low()
  platform/x86: int3472: Switch to devm_get_gpiod()

 drivers/gpio/gpiolib-acpi.c                   |  28 -----
 .../x86/intel/int3472/clk_and_regulator.c     |  54 ++--------
 drivers/platform/x86/intel/int3472/common.h   |   7 +-
 drivers/platform/x86/intel/int3472/discrete.c | 101 ++++++++++++++----
 drivers/platform/x86/intel/int3472/led.c      |  24 +----
 include/linux/gpio/consumer.h                 |   8 --
 6 files changed, 93 insertions(+), 129 deletions(-)

-- 
2.41.0

