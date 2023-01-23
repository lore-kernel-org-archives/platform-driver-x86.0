Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC78C38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 12:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbjAWMji (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjAWMjg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 07:39:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB34EC62
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 04:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674477521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=500lft1xlkAA4ADQWJUKJkyLFfmb0OAXtKVLwPd2khs=;
        b=hor0KG/WfuJ0WEiWtwR70KzU/J6xfJPkeJZQXZO6gBV6O60XfeBSFNNfRE3lgIQAhklTAP
        elCV8xGGn9CZI7TE2pUQCRTt/rvvOhXHTp5Nmo5e0uc9IabzZn/deZyHZgwkTqaWYG6wGS
        b6kMOy8EKCKMCgzVPJjrrXld1P1U8n0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-qdyDS-flPhqpsaxG8IIGKA-1; Mon, 23 Jan 2023 07:38:39 -0500
X-MC-Unique: qdyDS-flPhqpsaxG8IIGKA-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640240d400b0049e1b5f6175so8319679edb.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 04:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=500lft1xlkAA4ADQWJUKJkyLFfmb0OAXtKVLwPd2khs=;
        b=xeaojYMLzdRslgs6hL21Jegc77W6nkw/QaEzH+WU0Tjv3YlvKqAwjScEvwCsQplV3O
         l2zgfc7xR80JYTX14nMMF0MtSN81yoFulgR4xJfP9FznQwgayyHOXBE6V4kQPiF04SUH
         RIRBD/zZPz81y1OUIgbtbUB7lQpWfzFO6yR6XQA7UYmB1c8liXvUBIyOHvH+tukp+JTt
         s/l5c99D6Cn/0tHmRt+yzvh0F01WS7V0rRr6XND8uwsVvHI8unPcgcAFfmyvasXje+0h
         i8j5RYc8sygWcmkZWk6pqVvwJR/D0sgmhVkYhviTQueeapurG+5pZjceojmVdDnNOLTl
         UCEg==
X-Gm-Message-State: AFqh2koeBEGIFq4IW4sdcSxlzHIySFU47nL16wh8J8QGwBa5XCt3igX4
        Yj/2Xix6hhXB+ZAoerTT6vNE7Am7l9ihyqoUsUnKX9fSLx0zUToPqKRk8VzhhAgCrgKm1TD5xBI
        SiycjagGOnSjR2QquRA6Zt9zojMc5YiVCLA==
X-Received: by 2002:a05:6402:3583:b0:49d:fd6d:925d with SMTP id y3-20020a056402358300b0049dfd6d925dmr33832285edc.23.1674477518754;
        Mon, 23 Jan 2023 04:38:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvuOWILWyIKpbGeiNOwF5AhkJTKcGJdZUmCOXgIzYZwrHUVKpSY4sy3Drynrny/vZdHXvm++Q==
X-Received: by 2002:a05:6402:3583:b0:49d:fd6d:925d with SMTP id y3-20020a056402358300b0049dfd6d925dmr33832267edc.23.1674477518562;
        Mon, 23 Jan 2023 04:38:38 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id t32-20020a056402242000b0049148f6461dsm21379946eda.65.2023.01.23.04.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:38:38 -0800 (PST)
Message-ID: <255bf66e-eb27-af2b-9a13-8b7d4b7b3c46@redhat.com>
Date:   Mon, 23 Jan 2023 13:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] ACPI: video/apple-gmux: Improve apple-gmux backlight
 detection
Content-Language: en-US
To:     Lukas Wunner <lukas@wunner.de>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Aditya Garg <gargaditya08@live.com>,
        Mark Gross <mgross@linux.intel.com>,
        linux-acpi@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20230123113750.462144-1-hdegoede@redhat.com>
 <20230123120900.GA1924@wunner.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230123120900.GA1924@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/23/23 13:09, Lukas Wunner wrote:
> On Mon, Jan 23, 2023 at 12:37:47PM +0100, Hans de Goede wrote:
>> Some apple laptop models have an ACPI device with a HID of APP000B
>> and that device has an IO resource (so it does not describe the new
>> unsupported MMIO based gmux type), but there actually is no gmux
>> in the laptop at all.
>>
>> This patch-series improves the drivers/acpi/video_detect.c so that
>> it no longer tries to use the non present gmux in this case.
>>
>> Note I'm still waiting for testing feedback from the reporter of
>> this problem. But from the logs the problem is clear
>> (the logs show: "apple_gmux: gmux device not present")
> 
> Please provide a link to the original report.  I would also like to
> know the exact MacBook model used and I would like to see full dmesg
> output as well as an acpidump.

I only have a report by private email. This does include full dmesg
output and an acpidump. I will forward this to you in a private
email.

The reporter describes their model as a macbookpro8,1.

> What you're saying here is that there's a fake APP000B device present
> in DSDT

Yes that is exactly what I'm saying.

> and I have a hard time believng that.

Yes that seems to be exactly what is happening. If you look at
the drivers/platform/x86/apple-gmux.c code that is pretty much
the only scenario which leads to the:

apple_gmux: gmux device not present

message getting logged; and it seems to me that the reason that
check is there likely is exactly because of such machines
actually existing.

And /sys/class/backlight contains only intel_backlight
suggesting that this is not a hybrid gfx machine. Which also
matches with the specs which I can find for the  macbookpro8,1.

Yet there is an APP000B device present in the DSDT, here is
the relevant bit of the DSDT:

                Device (GMUX)
                {
                    Name (_HID, EisaId ("APP000B"))  // _HID: Hardware ID
                    Name (_CID, "gmux")  // _CID: Compatible ID
                    Name (_STA, 0x0B)  // _STA: Status
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0700,             // Range Minimum
                            0x07FF,             // Range Maximum
                            0x01,               // Alignment
                            0xFF,               // Length
                            )
                    })
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x16, 
                        0x03
                    })
                    Scope (\_GPE)
                    {
                        Method (_L16, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
                        {
                            Notify (\_SB.PCI0.LPCB.GMUX, 0x80) // Status Change
                        }
                    }

                    Name (GMGP, 0x16)
                    Method (GMSP, 1, NotSerialized)
                    {
                        If ((Arg0 <= 0x01))
                        {
                            GP06 |= Arg0
                        }
                    }

                    Method (GMLV, 0, NotSerialized)
                    {
                        Return (GP06) /* \GP06 */
                    }
                }
            }

Regards,

Hans

