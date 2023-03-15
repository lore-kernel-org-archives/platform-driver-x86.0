Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905A4C7618A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 11:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbjCOLjX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Mar 2023 07:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjCOLjX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 07:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24DBE1AF
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678880309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d8y/tpfaJxyCeRo089Yz1NWVwWn2dFz/cip9V11vIfw=;
        b=Ua/4Ie5x5DNx9sx9XfmOyl9pRFp0j4xjFoBN10S5c0xuKd5GbPikrw6GHlMVX40Gus2Hic
        MyEhx49KInpZoKFmMmurFhxYm9ycBJnCB3W9S9sd7zqkbC4yagFHDIG2xW+in+MEEWG0wx
        8X6VZooI8xRItxn2hJ7Nn7FevFxeALc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-EmtutuBkMnu58ydP_zVtqw-1; Wed, 15 Mar 2023 07:38:28 -0400
X-MC-Unique: EmtutuBkMnu58ydP_zVtqw-1
Received: by mail-ed1-f71.google.com with SMTP id er23-20020a056402449700b004fed949f808so4213341edb.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 04:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678880307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8y/tpfaJxyCeRo089Yz1NWVwWn2dFz/cip9V11vIfw=;
        b=D4eEbewVsKOcU7h1+9YLQUcF4ppm4H79AQwYaLHEpGuCPoCBr1KfgEfh/8HNPViEln
         OakRQLjYzQ3WU5RIZJZfsWmuo35NEwFmqiEqcBosyGEhNtiB/RFXJc+z8N61EMC06wja
         xWQnl6Hzo+Hkg+1SGYNsjDYl/nXpKXDuLnUuE5hg/TnkqgeTCyyApuxFQ3iSkJ3rqO0H
         fd93dU4lAhn5RyOt00htD8pFe2YqfCwb6sRFrnH31ySlCTLW1rwAk6EBvOkgQqIqCAsE
         ruWFewwsTwLv+B0yRR6CgjMgn3JUwVJ1xik3L+j4AIie2Jz74yKTAwNgF6/ac5XQVRTJ
         hB3Q==
X-Gm-Message-State: AO0yUKWXe9bmcjWJzPEIb8XJPBDicNmP6Mm8LI20hMGMCdkzN3jPs8yo
        jvd5hTStektEbf7hcjUT0svyHGn1e+2n7DNHaSQW3/9L890HLeHlOooTDiHo8e4/vuzePDT1NO+
        eOfSQsExRJTbsnT4CpsZ76/JD5pLSvWmZ3kDpp/7mqA==
X-Received: by 2002:aa7:d8c4:0:b0:4fd:298a:fa12 with SMTP id k4-20020aa7d8c4000000b004fd298afa12mr2304287eds.3.1678880306991;
        Wed, 15 Mar 2023 04:38:26 -0700 (PDT)
X-Google-Smtp-Source: AK7set+GW/yVokU7WNXA7NoRTEgtH4YObh8FT+xacbzGn4ekI4qj9WvwPcgdd+PsiKbWE8m/jNq4fg==
X-Received: by 2002:aa7:d8c4:0:b0:4fd:298a:fa12 with SMTP id k4-20020aa7d8c4000000b004fd298afa12mr2304272eds.3.1678880306735;
        Wed, 15 Mar 2023 04:38:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v1-20020a170906488100b008d8f1b238fdsm2391768ejq.149.2023.03.15.04.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 04:38:26 -0700 (PDT)
Message-ID: <badebe08-7c9b-6f34-b938-b14c06a57985@redhat.com>
Date:   Wed, 15 Mar 2023 12:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] platform/x86: Add new msi-ec driver
To:     Nikita Kravets <teackot@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Jose Angel Pastrana <japp0005@red.ujaen.es>,
        Aakash Singh <mail@singhaakash.dev>
References: <20230311144054.8754-1-teackot@gmail.com>
 <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
 <CAPXvF05AurS89f6bNg_5-VCS=vX=qMXbKgSdv5-wwBb8J3Xdcw@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPXvF05AurS89f6bNg_5-VCS=vX=qMXbKgSdv5-wwBb8J3Xdcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/11/23 21:35, Nikita Kravets wrote:
> Hi,
> 
>> The above two functions are inconsistent with the rest of the file because
>> they have the return type in a separate line.
> 
> I believe it was originally made to not exceed the limit of 80 columns
> 
>> It's a small thing, but usually /* ... */ comments are preferred.
>> Hans will tell you if you need to change it.
> 
> Okay

Yes I noticed these too during my review, but I'm fine with them as long as a single driver uses a single comment style consistently.

Note most drivers/platform/x86 drivers do indeed use /* ... */, so I would not mind if you convert the comments, but this is not a blocker for merging the driver.

>> Previously you said `match_string()` works here. Has something changed?
> 
> No, I implemented it in the main repo but forgot to do it in the kernel patch..
> I'll do it in the v3 after we're finished reviewing v2

Thanks, sounds good.

Only remark which I have is that the driver still has no modaliases so if this gets enabled as a module by distros, which is what most distros will do it will never load.

I think you should add a dmi_system_id table together with MODULE_DEVICE_TABLE() e.g. something like this:

static const struct dmi_system_id msi_dmi_table[] __initconst = {
	{
		matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
		}
	},
	{
		matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
		}
	},
	{}
};
MODULE_DEVICE_TABLE(dmi, msi_dmi_table);

To make the module auto-load. But I guess it might be better to put that on the TODO list somewhere and do it once the module has had some more testing.

E.g. I should really test this on my desktop's MSI B550M PRO-VDH board and see what it does there (hopefully nothing).

Regards,

Hans

