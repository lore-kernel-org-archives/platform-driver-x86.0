Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66F9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 15:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiGJPrA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 11:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGJPrA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 11:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E04ADFF1
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657468018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VPYVKIx9+vkBBxCA3VpGwrUiwn2ACrXmzlpvp/uFY4A=;
        b=R807I60nyuallpl+ZBpqv5I11FwFreMmT5BiDDJYFwCkXntW2PfMqeeCBoWjyq18H0fQff
        Jhkm9vF6JzDf6Gvmuu51IoL6wFecqFbu8Tpgh8xWtRDsLeRO29m5HU12zoseFnX8qwxrtm
        FJOPRDGy8ef9ZsKEw3rSf9a5KYKj3HQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-kN1N5w3hMdSD54wMNSyaCg-1; Sun, 10 Jul 2022 11:46:57 -0400
X-MC-Unique: kN1N5w3hMdSD54wMNSyaCg-1
Received: by mail-ed1-f69.google.com with SMTP id z13-20020a056402274d00b004357fcdd51fso2680763edd.17
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=VPYVKIx9+vkBBxCA3VpGwrUiwn2ACrXmzlpvp/uFY4A=;
        b=ZXZJyi3A4JOzM1vc1hyXQT4Z+JHH+RLlLO9QGyucfs/M8gi8lX2NQFqrtVNVCmpc31
         kLJzfAFC3ASeeKLFRc/0uhRvE7EJMAb4CpVUNUU03A607cYPZmgMxW8rht9aAMFyq0bw
         mhXSqBF0lt3t9C2i42Ii/SKMybA6jWBl1/XXh0HKoZPIrvNep837Pd4G4Ad9PTHu9cBW
         72Bn9z9fMkQ3m/SEh3lgeTGyPFWeDCntL8tIwOVC1R/qp687kPH7R9e5a7PRTuR9Ibvd
         Q+rAQebrrJdtZzGvKOqtOhcvKGT+Ys8mNouVohHIPdSaN9YoMl4xH3R7ikPVwSKvZWhT
         YTSg==
X-Gm-Message-State: AJIora8T9njs5zVAPAYo291RDnLq51VeVE6ebcPeFLAMRYihGjZ9H0Rf
        mcB4YMa9hSlly1fS7O4V9xS5TiAP9ILS1LrWTVRfu/RVTIDjblqQL5PWB0ixqc17fs4Tk5fZn5O
        En699kUdfZak8a+v0fr7sQmRVJGygMqh5aA==
X-Received: by 2002:a17:906:b1c1:b0:726:b009:4b63 with SMTP id bv1-20020a170906b1c100b00726b0094b63mr14618446ejb.24.1657468016057;
        Sun, 10 Jul 2022 08:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u4udJzq5lowtdTThnyvA4QbL00JloyCK6+SIag0ljVhpHv2TdMV8zc8+X1zL3W+z9u6Q+Dpg==
X-Received: by 2002:a17:906:b1c1:b0:726:b009:4b63 with SMTP id bv1-20020a170906b1c100b00726b0094b63mr14618430ejb.24.1657468015882;
        Sun, 10 Jul 2022 08:46:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p20-20020a056402155400b0043a896048basm2911115edx.85.2022.07.10.08.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 08:46:55 -0700 (PDT)
Message-ID: <be4d90b2-b7d2-9f9b-7a2b-55da21c97840@redhat.com>
Date:   Sun, 10 Jul 2022 17:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: Add key mappings
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Misaka19465 <misaka19465@olddoctor.net>, corentin.chary@gmail.com,
        markgross@kernel.org
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220710113727.281634-1-misaka19465@olddoctor.net>
 <1e8d2cb2-8417-d9aa-72dc-6e698771979e@redhat.com>
In-Reply-To: <1e8d2cb2-8417-d9aa-72dc-6e698771979e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/10/22 17:34, Hans de Goede wrote:
> Hi,
> 
> On 7/10/22 13:37, Misaka19465 wrote:
>> On laptops like ASUS TUF Gaming A15, which have hotkeys to start Armoury
>> Crate or AURA Sync, these hotkeys are unavailable. This patch add
>> mappings for them.
>>
>> Signed-off-by: Misaka19465 <misaka19465@olddoctor.net>
> 
> Thank you for your patch, I've applied this patch to my review-hans 
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.

I just noticed that this patch submission is not using your real name
in "<Firstname> <Lastname>" format as required by the kernel submission
guidelines:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Since this is a very trivial patch I'm going to keep it in my
tree anyways, but for future kernel submissions please use your
real name.

Regards,

Hans




>> ---
>>  drivers/platform/x86/asus-nb-wmi.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index 57a07db65..478dd300b 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -522,6 +522,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>>  	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
>>  	{ KE_KEY, 0x32, { KEY_MUTE } },
>>  	{ KE_KEY, 0x35, { KEY_SCREENLOCK } },
>> +	{ KE_KEY, 0x38, { KEY_PROG3 } }, /* Armoury Crate */
>>  	{ KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
>>  	{ KE_KEY, 0x41, { KEY_NEXTSONG } },
>>  	{ KE_KEY, 0x43, { KEY_STOPCD } }, /* Stop/Eject */
>> @@ -574,6 +575,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>>  	{ KE_KEY, 0xA5, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV + HDMI */
>>  	{ KE_KEY, 0xA6, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV + HDMI */
>>  	{ KE_KEY, 0xA7, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + HDMI */
>> +	{ KE_KEY, 0xB3, { KEY_PROG4 } }, /* AURA */
>>  	{ KE_KEY, 0xB5, { KEY_CALC } },
>>  	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>>  	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },

