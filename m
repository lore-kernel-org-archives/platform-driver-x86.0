Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF67C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 24 Jun 2022 09:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbiFXJY4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 24 Jun 2022 05:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbiFXJYw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Jun 2022 05:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 705B26F786
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jun 2022 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656062686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=awq7smJYxC/5cXZj8CxP/8yQKN5NiZWVjiHjPog1uuI=;
        b=Kh5qXhdrKHjk/GomEHJ7RQ6IQf6ZEsZRAk/F+VWXz0ydFMEN7+5m6FFj1+Bs1UAy5imHYT
        +/nMHfxolg3rCr5gWy7ozo4GACeZEK4vfTl86R3ypH2wvekZovbPx4pQboS/lBAjHBaf82
        VjOZ3Nmh3vP8wjodgXys0A54JSZPAxY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-0FMnkycFMdWROzJIp7ZSoA-1; Fri, 24 Jun 2022 05:24:45 -0400
X-MC-Unique: 0FMnkycFMdWROzJIp7ZSoA-1
Received: by mail-ed1-f72.google.com with SMTP id c20-20020a05640227d400b004369cf00c6bso1252474ede.22
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jun 2022 02:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=awq7smJYxC/5cXZj8CxP/8yQKN5NiZWVjiHjPog1uuI=;
        b=YSb+pSH1yojOcRx4RR343yTbnC2Gv1+U34iV1uuYd4DlD0z5M9Mzw1BUNJweP37gcV
         jsOGJsW5nHtwLjJgEPuBT4mgfeiKLeTbishzAYnIoW2x0uTds6Q9xPCLaBWznVCtGlHv
         rB8C7RYLiX00Cfq2Sjg5qCDIFvQVe+3/7LByX+CGp4KJZsoduSMzUZoOlhE6OggDoK2r
         iXO24HpXtAWxr6TPlJ+THI1/cwMqFCYVghR2W2tq9WCvmHUNZnUv50O0rs3rplIL8vx6
         /fhxlUqNAynxayQNwuuU0/CgFTV9Nzr6hMgaw9ICzwHz/JFY39kByaX6XbYypYS8Oc4s
         jOFw==
X-Gm-Message-State: AJIora95/1i+OO69ptESOIQGuZP3zTnP/WRQOxpfCaTaINbj5ypJmydF
        j1nqCWESFDrjQLA1IY1kLO5Z3NAsu1MENWGHNUQg8YtoSMLzmYGAP7KiIXPl/NuEURsWft0njba
        VNQBnXqEhQ6b1cn/zJ/pTptlxqQ5r0olc5g==
X-Received: by 2002:a17:907:8a06:b0:71c:3f80:ad7c with SMTP id sc6-20020a1709078a0600b0071c3f80ad7cmr12327314ejc.567.1656062684011;
        Fri, 24 Jun 2022 02:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6LavcroHg1dlZetb+o0GN+NHzxQcLL8WatWzTRQsIXfpIwWJ+T6AH+GvczQVc8nf7+eXz+A==
X-Received: by 2002:a17:907:8a06:b0:71c:3f80:ad7c with SMTP id sc6-20020a1709078a0600b0071c3f80ad7cmr12327286ejc.567.1656062683757;
        Fri, 24 Jun 2022 02:24:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jw12-20020a170906e94c00b00722e8827c53sm770424ejb.208.2022.06.24.02.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 02:24:43 -0700 (PDT)
Message-ID: <0866e4bf-13f6-dc01-30bb-e63e106e4490@redhat.com>
Date:   Fri, 24 Jun 2022 11:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] platform/x86: panasonic-laptop: allow to use all
 hotkeys
Content-Language: en-US
To:     Kenneth Chan <kenneth.t.chan@gmail.com>
Cc:     Stefan Seyfried <stefan.seyfried@googlemail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Seyfried <seife+kernel@b1-systems.com>
References: <20200821181433.17653-8-kenneth.t.chan@gmail.com>
 <20220612090507.20648-1-stefan.seyfried@googlemail.com>
 <20220612090507.20648-3-stefan.seyfried@googlemail.com>
 <CAHp75Ve+vrfSu6pD+AKe-eCVA2pC5o520y4gVwLNg9Dtk0U5bw@mail.gmail.com>
 <CAHp75VdFPUHTeDBY5ukFgVqJJn7BbTHxrxKUGOLB6P1UX-utAg@mail.gmail.com>
 <d80789bc-a8fc-de5f-164a-75adf7097311@message-id.googlemail.com>
 <6969ca0e-4a4c-c995-02a2-6645f875338c@redhat.com>
 <CAPqSeKu9csK_u0S6MiRay_mvfYejUhKbb=wvJO7F_Z-JL6F7DA@mail.gmail.com>
 <5f03f5b9-87bb-e27d-ce51-9c1572221f21@redhat.com>
 <CAPqSeKtqORkhW4dAMsd2b6e3OwhHZ107znwJtoBADE1h2-dsVA@mail.gmail.com>
 <e5701e68-1b15-97b7-51e4-8d3c8a7c3c86@redhat.com>
 <CAPqSeKsfujjOKPg9nrs0XXt4Bbxt8j_+rY4VCT--NZZ-7XfgiQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPqSeKsfujjOKPg9nrs0XXt4Bbxt8j_+rY4VCT--NZZ-7XfgiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/24/22 07:14, Kenneth Chan wrote:
> Hi Hans,
> 
> 
> On Tue, 21 Jun 2022 at 17:34, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>
>>> The mute, volume up/down keys are still duplicated by atkbd after
>>> applying 0005-platform-x86-panasonic-laptop-filter-out-duplicate-v.patch.
>>
>> Hmm, can you add a couple of:
>>
>>  pr_info("data 0x%02x\n", data);
>>
>> at the top of the new panasonic_i8042_filter() function
>> and then check in dmesg what is output for the volume keys.
>>
> 
> Volume Down 0xe0 0x2e / 0xe0 0xae
> Mute 0xe0 0x20 / 0xe0 0xa0
> Volume Up 0xe0 0x30 / 0xe0 0xb0
> 
> I replaced those values with these and it filters out the duplicate keys. Yay!!!

That is great.

>> The patch should filter out those duplicate keys, unless
>> I got the codes wrong somehow.
>>
>> Also can you please try the attached 2 patches on top of my
>> last series, this should hide the broken panasonic backlight
>> device and otherwise it should make no difference (but maybe
>> double check the duplicate brightness keys are not back.
>>
> 
> The last 2 patches crash as soon as the panasonic-laptop module is
> loaded. It's compiled against kernel v5.18.5. Please see the
> attachment. I'm going to compile it against the latest and see if it
> works.

No need to compile against the latest, I messed things up, sorry.

To fix the crash the following diff is necessary:

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 0fa7695089e2..b8fa0a64698b 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -1011,10 +1011,10 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 			result = PTR_ERR(pcc->backlight);
 			goto out_input;
 		}
-	}
 
-	/* read the initial brightness setting from the hardware */
-	pcc->backlight->props.brightness = pcc->sinf[SINF_AC_CUR_BRIGHT];
+		/* read the initial brightness setting from the hardware */
+		pcc->backlight->props.brightness = pcc->sinf[SINF_AC_CUR_BRIGHT];
+	}
 
 	/* Reset initial sticky key mode since the hardware register state is not consistent */
 	acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, 0);

I'm going to send out a whole new version of my entire series, including
an updated i8042 filter. Please drop all my previous patches and try
the new version (I'll put on you in the Cc of the upstream submission of
the series).

Regards,

Hans



