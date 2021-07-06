Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4697EC07E9B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 10:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27D6861483
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 10:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhGFKT7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 06:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48465 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231284AbhGFKT6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 06:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625566639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=INwuWCTHwJkWzRGLe4lZtLxvqZwOmxhVQyrISiNn7GA=;
        b=a9H5+rW4CuiTk+YRCom+GjR+SEfOAU4zXpatzkNobHFTAB4W2KB1SAPqtJDgeKglo1fjNU
        w/n0RPcDPf5TkO1BHFbiAC/JFAwg5136ThW5oO/1FQlXDZKDeo9iqrVYGNXX0eg8cSX3I/
        s9j8r4sCoyvs32+IU7eUGxCHCVd6NJ0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-NNmkEqhJOg-qp2nPP9Y63A-1; Tue, 06 Jul 2021 06:17:15 -0400
X-MC-Unique: NNmkEqhJOg-qp2nPP9Y63A-1
Received: by mail-ed1-f72.google.com with SMTP id m10-20020aa7c2ca0000b0290399df423df0so2329872edp.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 03:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=INwuWCTHwJkWzRGLe4lZtLxvqZwOmxhVQyrISiNn7GA=;
        b=QVGvFWARP/3X2qxemZDg44uI+wGHyE5JHbFAQRII06UQVPg2WDCFEgzuvtldRbmEML
         jfIG9SHCQf9kPHgv9Wvt1pYsrAypNHOSEvJG3vv6YR8b7Vjgfwb09HYzL09EYS/aPQJr
         /99tGII/080KqrqP9LUMPRmF5rlbnzWCqH6SM3XqrI8ALmoqHVfxO1cVaanMpsukMUnH
         XqFqAtJvAQ03HUDJD4Ui5MDMrfy/1BoaNXpoZ4SaYhLiC+5A0HrxIb3JpFcIjMLX4UXP
         Ya21Zgml5NOjzPxYbW5oqPVU+1hzkWvFbnTunmyp7lgHX8KGlVSVE847Fp+ed9Ih5eH5
         kDfA==
X-Gm-Message-State: AOAM5331Hfz7lCN/ELNCd8oB9qFzpsGrGrIurtMF7HNGJ6qXXc5sRVKg
        nnKmHmWhKt9cwgzEUIhP/HYzJwy1RBGCfoyqrX1aknKjNwxV7bKrQMPNxz5e/OsTprlnsdOekkj
        oa7wpldJBmAzlpzUIzu5FUBs+xTnPp2VQ8Q==
X-Received: by 2002:a17:907:2cc7:: with SMTP id hg7mr17836138ejc.214.1625566634580;
        Tue, 06 Jul 2021 03:17:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzODed5Lb8yuTqOS3XYtFe5hErRKmr4FBZqB2ys62JHdkriDCMOZx6jCuBdpWFd6OUr/kVCQQ==
X-Received: by 2002:a17:907:2cc7:: with SMTP id hg7mr17836102ejc.214.1625566634231;
        Tue, 06 Jul 2021 03:17:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id x18sm5481719ejb.111.2021.07.06.03.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:17:13 -0700 (PDT)
Subject: Re: [PATCH 2/3] asus-wmi: Add dgpu disable method
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, mgross@linux.intel.com,
        jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210704222148.880848-1-luke@ljones.dev>
 <20210704222148.880848-3-luke@ljones.dev>
 <knw744OJB1AYrrFpo77N1Eei0JZC3SjKzg6SMoMhOsEchAiE8-klOIPTyFCAUSiVeTopPNqgFSefQJ2av6Gs_cS4TuIRXVQcHUxvw8YvSl0=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e933f74e-50d3-8de9-258a-a4000f3b6403@redhat.com>
Date:   Tue, 6 Jul 2021 12:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <knw744OJB1AYrrFpo77N1Eei0JZC3SjKzg6SMoMhOsEchAiE8-klOIPTyFCAUSiVeTopPNqgFSefQJ2av6Gs_cS4TuIRXVQcHUxvw8YvSl0=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Barnabás made some good points which I missed.

See me reply inline.

On 7/5/21 2:47 AM, Barnabás Pőcze wrote:
> Hi
> 
> I have added a couple comments inline.
> 
> 
> 2021. július 5., hétfő 0:21 keltezéssel, Luke D. Jones írta:
> 

<snip>

>> +static ssize_t dgpu_disable_store(struct device *dev,
>> +				    struct device_attribute *attr,
>> +				    const char *buf, size_t count)
>> +{
>> +	int result;
>> +	u8 disable;
>> +	struct asus_wmi *asus = dev_get_drvdata(dev);
>> +
>> +	result = kstrtou8(buf, 10, &disable);
> 
> You could use `kstrtobool()`. I think that would be better since it accepts
> 'y', 'n', etc. in addition to 0 and 1.

Good point and the same applies to patch 1/3.

>> +	if (result < 0)
>> +		return result;
>> +
>> +	if (disable > 1 || disable < 0)
>> +		return -EINVAL;
>> +
>> +	asus->dgpu_disable_mode = disable;
>> +	/*
>> +	 * The ACPI call used does not save the mode unless the call is run twice.
>> +	 * Once to disable, then once to check status and save - this is two code
>> +	 * paths in the method in the ACPI dumps.
>> +	*/
>> +	dgpu_disable_write(asus);
>> +	dgpu_disable_write(asus);
> 
> Is there any reason the potential error codes are not returned?

Good question.

<snip>

>> @@ -2699,6 +2792,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>>  	if (err)
>>  		goto fail_platform;
>>
>> +	err = dgpu_disable_check_present(asus);
>> +	if (err)
>> +		goto fail_dgpu_disable;
>> +
> 
> Should this really be considered a "fatal" error?

Well dgpu_disable_check_present() does already contain:

		if (err == -ENODEV)
			return 0;

IOW it only returns an error on unexpected errors and asus_wmi_add()
already contains a couple of other foo_present() checks which are
dealt with in the same way, so this is consistent with that and
being consistent is good, so I think this is fine.

Regards,

Hans


