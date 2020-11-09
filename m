Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FD8C4741F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20F7020731
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M9RMdatG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbgKILdu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28894 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729856AbgKILdt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 06:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604921628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I0y9une9dAd7wKCzC7dDx1PwHSDOlK9hwWFCmkAMcfk=;
        b=M9RMdatGOe/fqixK3OSIn3KyxUO3h5DMCaWTt+zDLJSBMCYGNx5+dGzVZWmQiqPfnzfXAK
        OqPyI5jQYv7DE83v2lw4hng/0s22RA49OZYfRFgpKRJAT56ghsHeJClUMfNgZaDEGz9+1l
        pVGfo6w6OHRy2yoicFiyCVfbGHGAPCA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-UQd455XiNH-A3mDS9JtYDA-1; Mon, 09 Nov 2020 06:33:46 -0500
X-MC-Unique: UQd455XiNH-A3mDS9JtYDA-1
Received: by mail-ed1-f70.google.com with SMTP id i89so2024875edd.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 03:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I0y9une9dAd7wKCzC7dDx1PwHSDOlK9hwWFCmkAMcfk=;
        b=BMalyFs/+ZIb1GJ8UqyLmxyIavG1sI8ZCJGFJoYO1Yfy4eQYuKKfKjJx8wfLiLzjbs
         bYUy7HCr3GFn144uqZA5Rjfy5iqeidm3BEIo9SNzB3hpjbVgGECYlX8M3fn3Kge17sP4
         /JlnWjdXPGG+NsaXl+XsqcPpd5t63EWIh0QQD7lIcuNp+oTzGp4SN8OHAqPO7fVMancg
         pEoeg8+TUVdt0YTYY/pzOpamHqch9ZjTJtgxcSstiNwEuTn/uSc5DXckYCUbMHzKlD7M
         lVpNXILmlje8NYKBxppVBEkZG+iZJulNk57dh8c4OfGft5u44yO2iNNNKdlUFPWZ3GHB
         lvNA==
X-Gm-Message-State: AOAM530EKLALnbW1sTA3wakhSbOLv10hoxDhApO+leo5R38zKV34UUc0
        KLTKowt8raUY1zmry5etRSpxFOPp8Po5q4SooVJNbfyslQr3CKuFoTlYER0G+0AMdgN3qvqsfBz
        vzolXMRqul3fMQN6+JNADoudOxECawxhtvA==
X-Received: by 2002:a17:906:a856:: with SMTP id dx22mr15307613ejb.134.1604921624266;
        Mon, 09 Nov 2020 03:33:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv+LZ1UaVjw8uypylORNMXf0QJe+HVoYGs+pFH/saLwYr720RtVw2WF/1rp7jTJs08Uyvd3g==
X-Received: by 2002:a17:906:a856:: with SMTP id dx22mr15307602ejb.134.1604921624076;
        Mon, 09 Nov 2020 03:33:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id us11sm8710712ejb.91.2020.11.09.03.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 03:33:43 -0800 (PST)
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20201105080014.45410-1-hdegoede@redhat.com>
 <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <81343662-aaac-a5e8-af86-1370951ff646@redhat.com>
Date:   Mon, 9 Nov 2020 12:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/20 11:38 AM, Andy Shevchenko wrote:
> On Thu, Nov 5, 2020 at 10:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> As the subject says this series is mostly about passing the ACPI fwnode to
>> i2c-clients instantiated by the i2c-multi-instantiate code.
>>
>> As discussed here:
>> https://bugzilla.kernel.org/show_bug.cgi?id=198671
>>
>> BOSC0200 ACPI devices may sometimes describe 2 accelerometers in a single
>> ACPI device, while working on this I noticed that BOSC0200 ACPI nodes
>> contain ACCEL_MOUNT_MATRIX info (unlike all the other ACPI ids for bmc150
>> accelerometers). Which is why I wanted to pass the fwnode so that we
>> could use this info in the bmc150-accel driver.
>>
>> The plan was to use i2c-multi-instantiate for this, but doing so will
>> change the modalias and /lib/udev/hwdb.d/60-sensor.hwdb matches on
>> the modalias for various quirks setting ACCEL_MOUNT_MATRIX. So then the
>> plan became to first add support for the mount-matrix provided inside
>> the BOSC0200 ACPI node, making the udev info unnecessary. But for at
>> least 1 model (and probably more) the BOSC0200 ACPI node and hwdb info
>> does not match and since the hwdb info is added by users of the actual
>> devices we can assume it is correct, so it seems that we cannot always
>> trust the ACPI provided info.  This is ok, the hwdb info overrides it
>> (iio-sensor-proxy prefers the udev provided mount-matrix over the
>> one provided by the driver) but this means that we MUST keep the
>> existing hwdb matches working, which means that we cannot use
>> i2c-multi-instantiate for this.
>>
>> Instead I will dust of an old patch for this from Jeremy Cline:
>> https://patchwork.kernel.org/project/linux-iio/patch/010001602cf53153-39ad69f1-1b39-4e6d-a748-9455a16c2fbd-000000@email.amazonses.com/
>>
>> Which deals with there being 2 accelerometers inside the bmc150-accel
>> driver.
>>
>> But before coming to the conclusion that i2c-multi-instantiate
>> would not work I had already written this series. Since this might
>> be useful for some other case in the future I'm sending this out
>> as a RFC now, mostly so that it gets added to the archives.
> 
> I think they are in pretty good shape (only the 4th required a bit of
> attention).

FWIW I agree with the changes which you suggest for the 4th patch.

> Please, send as non-RFC and also Cc Heikki (just in case if he has
> comments wrt INT3515).

But do we really want to land these changes, while ATM we do not
really have any need for them ?  Esp. the

"platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated I2C-clients"

Change is not without a chance of regressions. The acpi_device_is_first_physical_node()
behavior surprised me a bit while working on the BOSC0200 changes. So I'm not
100% sure I have managed to see / think of all implications of this change.

Heikki do you now (or in the near future) need access to the fwnode for
the TypeC controllers handled by the i2c-multi-instantiate code ?

Note that if we do decide to move forward with this set, it should probably
be merged in its entirety by Wolfram as it also makes i2c-core changes
(or Wolfram could just merge the i2c-core change and provide an immutable
branch for me to merge into pdx86/for-next.

And then your (Andy's) cleanup series can be applied on top of this once merged.

Regards,

Hans


