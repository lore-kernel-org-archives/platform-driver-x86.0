Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B96C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 10:44:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C5B523339
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 10:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgLGKos (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 05:44:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46819 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726273AbgLGKos (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 05:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607337801;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pwKlCP/t2sQULfcoxLw2Zg751ofmdpjb51ZHupMe4Mc=;
        b=d9vs0E0z1FhAPAz2HCcVC8mB3mPj3rUJPT0+OV/zaYY5NsHg5ouHKRkGS+3vPnxAus0IJt
        LMmAZhNFdpP4l3xImM+cZeQLX8QKbEA7yL016A6ls2tgAbCQdgOUbq7i/9pjvZw8CSQY5k
        w2ZnCuTNmFL1LpfNGfNQ+BTJVmCG3N4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-lL-AgSkMNu2RZfV9ww5n7Q-1; Mon, 07 Dec 2020 05:43:20 -0500
X-MC-Unique: lL-AgSkMNu2RZfV9ww5n7Q-1
Received: by mail-ej1-f69.google.com with SMTP id ny19so2908162ejb.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 02:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pwKlCP/t2sQULfcoxLw2Zg751ofmdpjb51ZHupMe4Mc=;
        b=EalEifcxKl3Yfo9iQcaMTKyfQzZCHcuvof65e/jQ5n794kJdmJZTe1yJ+QXnnEq9m5
         F+lD8xFBl9yJWTa/74XGkzqAaLPS2TdgHhkvzbo+F2uqwHJpBgi4T8zSrKtS+Pq4uGXY
         PJ7cW22X2PAEfqR3R2pOTEfxwBHkFUPB0mz1WkmtoeodzPrR+OKsqVdF70Lv6xMAXvMU
         W9ne0TsqfwB4hCYQP5+l8kryIzyN2bw2REIL2iP3aKuhyCJkMUPcBEtaJ3My20K43qdE
         8T5VdWyl7jRsnOBzSPuCgV3psNRqBOGIia//81xOsYzWGfT+LXcmdOYOJt4zpKGD16+D
         MQkQ==
X-Gm-Message-State: AOAM5323fMoKvx6nOxW7oRK476qSrQMVtmCYd1rVPwrwVf1uD8QUSafM
        VhT3dYbtE8/xrNlYc4Wt4k85J2m0UGLjNWdre218KXn/bRN0sUNHch/FiNV0VeF5sy9RrZkZO5g
        XauBEWb9AZcCT+0CWFCWvD9ifT+vNpChlSg==
X-Received: by 2002:a17:906:c087:: with SMTP id f7mr12651108ejz.492.1607337798864;
        Mon, 07 Dec 2020 02:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8JoAbJ32CqoOcnxFU/qzKXyjlj3mNwmNSdY9XWaaUcbruFvVgrRWFEt76gKFin9C0Bq5aZA==
X-Received: by 2002:a17:906:c087:: with SMTP id f7mr12651095ejz.492.1607337798716;
        Mon, 07 Dec 2020 02:43:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u23sm11668922ejy.87.2020.12.07.02.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 02:43:18 -0800 (PST)
Subject: Re: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
To:     "Ernst, Justin" <justin.ernst@hpe.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Borislav Petkov <bp@suse.de>,
        "Wahl, Steve" <steve.wahl@hpe.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
References: <X8eoN/jMAJb3H3iv@mwanda>
 <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9e3c4e1c-b7fa-1b1f-342d-cb23e0065a56@redhat.com>
Date:   Mon, 7 Dec 2020 11:43:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/2/20 9:50 PM, Ernst, Justin wrote:
>> Return -ENOMEM on allocation failure instead of returning success.
>>
>> Fixes: 4fc2cf1f2daf ("x86/platform/uv: Add new uv_sysfs platform driver")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thank you for taking the time to find this.
> 
> Reviewed-by: Justin Ernst <justin.ernst@hpe.com> 
> (With an acknowledgement of Boris's 's/success/random stack memory contents/' comment)

ATM the drivers/platform/x86/uv_sysfs.c only exists in the tip/x86 tree -next
branch, so this fix needs to be merged through the tip/x86 tree, here is my ack
for merging it that way:

Acked-by: Hans de Goede <hdegoede@redhat.com>

(either with a fixed up commit-msg as suggested by Borislav, or feel
free to add it to a fixed v2 of the patch)

Regards,

Hans



> 
>> ---
>>  drivers/platform/x86/uv_sysfs.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
>> index 54c342579f1c..e17ce8c4cdad 100644
>> --- a/drivers/platform/x86/uv_sysfs.c
>> +++ b/drivers/platform/x86/uv_sysfs.c
>> @@ -248,6 +248,7 @@ static int uv_hubs_init(void)
>>  		uv_hubs[i] = kzalloc(sizeof(*uv_hubs[i]), GFP_KERNEL);
>>  		if (!uv_hubs[i]) {
>>  			i--;
>> +			ret = -ENOMEM;
>>  			goto err_hubs;
>>  		}
>>
>> --
>> 2.29.2
> 

