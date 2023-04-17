Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAF3C77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 10:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjDQKRc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjDQKRb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 06:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9306819BA
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681726410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x3BdmzxoywrkKUTSRDGdHSxtk9iICx/e38Md1qTFCtg=;
        b=TDimpNvAY14WqUCa2pKCRcBs5EDWZ9eacGrPzzX3F3CoDmZVa3643TcfV30Fq1hXYj4fjd
        TvvxaiCnwUxdYiSYhhNTa6RDGSaSwzRXhlu5Zek97y6vmGWTuAwuKtPry6OwdMi2n3i3Ft
        McOIxjnNlS4OWNb0EbDfBOzZ1x25vBE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-Tif1K7bhP3yqJ7n8Exb-ZQ-1; Mon, 17 Apr 2023 06:13:29 -0400
X-MC-Unique: Tif1K7bhP3yqJ7n8Exb-ZQ-1
Received: by mail-ed1-f72.google.com with SMTP id q27-20020a50aa9b000000b00505034ae370so8242426edc.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726408; x=1684318408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3BdmzxoywrkKUTSRDGdHSxtk9iICx/e38Md1qTFCtg=;
        b=WYK5Bj1oWIwamiFxOYuEu+TpJveLtDORDINuWt6pXmlgwtfDbqT8SA/sGs+PLsHV1L
         nX5q6f7xG4oshFOdNRBWyw5JekyviBo5xEuU7ygsaWBmuF0UT3SMNfUna0Lalq9mf+jj
         JqSaqYuw3Ud404C6IBWl5Qcyf7P1j73BljOirHwWmqvit4wPDoA9AvmmpjN3joivwDHG
         FovmBpUGNy8mc9EYab6mJgsuUWPS8H6IKbvKLYikUV6sOt6R2HzxsZ+FlpTWIOuSsR6P
         1J4eBm7xujAfqv13I+zI7/+XOdg6chnTau5dviitAcJGLUh5jYxQshzCsvgGTRTLyzlG
         TEFA==
X-Gm-Message-State: AAQBX9cGEVUxDeLhhyIKKEK3Y3uZjB7C1CKTRdBghvcyua75HSBuEJBz
        0xZRyJButoe3NrhnXe0B16QwLvxatH5MchOnB/C5b33QZDLpd0WErd9fdTA2vCkuJK4CaF0v/3m
        tgxurKq7HXcLGxn/JmKNvryC9Sy0F+0MqEg==
X-Received: by 2002:a17:907:7f04:b0:94a:6229:8fc1 with SMTP id qf4-20020a1709077f0400b0094a62298fc1mr7596792ejc.31.1681726408376;
        Mon, 17 Apr 2023 03:13:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZG7MUoagK2Zv8rBbjt/w7V4BL29mCW5G60v9aS0IJtuCFzMyHVBlUn4bS+OVEmBx+4HNNv9Q==
X-Received: by 2002:a17:907:7f04:b0:94a:6229:8fc1 with SMTP id qf4-20020a1709077f0400b0094a62298fc1mr7596775ejc.31.1681726408077;
        Mon, 17 Apr 2023 03:13:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lh22-20020a170906f8d600b0094f6bf5ac9asm1634599ejb.22.2023.04.17.03.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:13:27 -0700 (PDT)
Message-ID: <0a9185f6-e369-c9ab-f855-54ac2741cc1c@redhat.com>
Date:   Mon, 17 Apr 2023 12:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86/intel/sdsi: Change mailbox timeout
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20230413013230.1521584-1-david.e.box@linux.intel.com>
 <66b5cf7-391-8d63-b7da-267fe8a639bd@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <66b5cf7-391-8d63-b7da-267fe8a639bd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/13/23 12:17, Ilpo Järvinen wrote:
> On Wed, 12 Apr 2023, David E. Box wrote:
> 
>> On some platforms, it may take up to 400ms for the ready bit to be set in a
>> successful mailbox transaction. Set the timeout to 500ms to cover the worst
>> case.
>>
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> ---
>>  drivers/platform/x86/intel/sdsi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
>> index 9e0ea2cdd704..556e7c6dbb05 100644
>> --- a/drivers/platform/x86/intel/sdsi.c
>> +++ b/drivers/platform/x86/intel/sdsi.c
>> @@ -49,7 +49,7 @@
>>  #define SDSI_MBOX_CMD_SUCCESS		0x40
>>  #define SDSI_MBOX_CMD_TIMEOUT		0x80
>>  
>> -#define MBOX_TIMEOUT_US			2000
>> +#define MBOX_TIMEOUT_US			500000
>>  #define MBOX_TIMEOUT_ACQUIRE_US		1000
>>  #define MBOX_POLLING_PERIOD_US		100
>>  #define MBOX_ACQUIRE_NUM_RETRIES	5
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you both for the patch + review, I've applied this patch
to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



