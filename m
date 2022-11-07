Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62923C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 19:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbiKGTvD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 14:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbiKGTvB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 14:51:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534241D643
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667850601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mfstZJTiUDyeaBhCh0xWrV/hqY+utwsaONHljzcYKLc=;
        b=CEbIr5+k7ZfCPzBOidV9B09UhPN3S0tKdPwVDvmi1Bo77m/PnWfxzZeoYBk/CRLk5aC6nJ
        TFeBPRd3fMX6kAkK3ZNrmw7HO6NkN6gB2gWTXNsUHGsifC8n1OBxNIqwZEZzab/IxL6Ftu
        KfgVHXM9Y2r06rqYPQQj8HxppTJwjRU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-go__m9JAPFW9g6A5z_Uc9Q-1; Mon, 07 Nov 2022 14:49:52 -0500
X-MC-Unique: go__m9JAPFW9g6A5z_Uc9Q-1
Received: by mail-ej1-f72.google.com with SMTP id jg27-20020a170907971b00b007ad9892f5f6so6963921ejc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 11:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfstZJTiUDyeaBhCh0xWrV/hqY+utwsaONHljzcYKLc=;
        b=2mnRSXdhlXhwZDmllTixSAbDCzKCkujB2J0bMVZlVNtCdRjg8kmpCr1g4rFJfukaPF
         ksN9xEbH2W5vqt4zd9/vjaGANyygNmI9RsjbldVi/tst8gKCo7tT5IUDEUnLNCyf9XCp
         znKu2s3g5Xs+gDA11M7Cu4GmnjRD3DYfFQP+rmtXLkYIdZIo9/nekZycu41Sht4HApUH
         7g+exZCiqOTscEflsRRq1MxFRQCVtGrUgiOVI8dX2auiXO5a9sErPZ3uJetmLo65i/Ag
         cWeUvJY6YvqhJ+VxzYZ7XGUjINjsoNLffzL0oEy+IDtF+82OrpyriC5Xk+b5XfRCS566
         uydQ==
X-Gm-Message-State: ACrzQf039Q6l61ncO62k03r89y5xbHuFVuAjsWIYwjmjlipWyE7a51SG
        0yXfXS8Dsct7DLQ571Wj2Qng4171WtIZCJNDx9dmsz05VQBuSfZK9czrh9wfCS8gfOCN53EQrKL
        F4NcxTTYmsDBZWY57HjYm4xHC4qcaAPJFLg==
X-Received: by 2002:a17:907:7e85:b0:7ad:bf64:b5de with SMTP id qb5-20020a1709077e8500b007adbf64b5demr48236529ejc.20.1667850591398;
        Mon, 07 Nov 2022 11:49:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4E1Fvtd8z51QzCn/rLExSTDJhJpiYEhAFEvj0h9q+IbHl+NSQVIvMRhMHtUTgh8PGVID8pBQ==
X-Received: by 2002:a17:907:7e85:b0:7ad:bf64:b5de with SMTP id qb5-20020a1709077e8500b007adbf64b5demr48236509ejc.20.1667850591165;
        Mon, 07 Nov 2022 11:49:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c14-20020aa7df0e000000b00461e4498666sm4639195edy.11.2022.11.07.11.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 11:49:50 -0800 (PST)
Message-ID: <b84e5dfd-4908-ab85-469d-aed8af37ce91@redhat.com>
Date:   Mon, 7 Nov 2022 20:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] platform/x86: dell-ddv: Improve buffer handling
Content-Language: en-US, nl
To:     david.e.box@linux.intel.com, Armin Wolf <W_Armin@gmx.de>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221102212336.380257-1-W_Armin@gmx.de>
 <fc480d25aabaa3923f24bbaa9b0f329f78c40abb.camel@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fc480d25aabaa3923f24bbaa9b0f329f78c40abb.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/22 19:54, David E. Box wrote:
> On Wed, 2022-11-02 at 22:23 +0100, Armin Wolf wrote:
>> When the DDV interface returns a buffer, it actually
>> returns a acpi buffer containing an integer (buffer size)
>> and another acpi buffer (buffer content).
>> The size of the buffer may be smaller than the size of
>> the buffer content, which is perfectly valid and should not
>> be treated as an error.
> 
> Is there documentation for this that you can refer to?
> 
>> Also use the buffer size instead of the buffer content size
>> when accessing the buffer to prevent accessing bogus data.
>>
>> Tested on a Dell Inspiron 3505.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>  drivers/platform/x86/dell/dell-wmi-ddv.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c
>> b/drivers/platform/x86/dell/dell-wmi-ddv.c
>> index 699feae3c435..1a001296e8c6 100644
>> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
>> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
>> @@ -129,9 +129,9 @@ static int dell_wmi_ddv_query_buffer(struct wmi_device
>> *wdev, enum dell_ddv_meth
>>  	if (obj->package.elements[1].type != ACPI_TYPE_BUFFER)
>>  		goto err_free;
>>
>> -	if (buffer_size != obj->package.elements[1].buffer.length) {
>> +	if (buffer_size > obj->package.elements[1].buffer.length) {
>>  		dev_warn(&wdev->dev,
>> -			 FW_WARN "ACPI buffer size (%llu) does not match WMI
>> buffer size (%d)\n",
>> +			 FW_WARN "WMI buffer size (%llu) exceeds ACPI buffer
>> size (%d)\n",
>>  			 buffer_size, obj->package.elements[1].buffer.length);
>>
>>  		goto err_free;
>> @@ -271,15 +271,17 @@ static int dell_wmi_ddv_buffer_read(struct seq_file
>> *seq, enum dell_ddv_method m
>>  	struct device *dev = seq->private;
>>  	struct dell_wmi_ddv_data *data = dev_get_drvdata(dev);
>>  	union acpi_object *obj;
>> -	union acpi_object buf;
>> +	u64 size;
>> +	u8 *buf;
>>  	int ret;
>>
>>  	ret = dell_wmi_ddv_query_buffer(data->wdev, method, 0, &obj);
>>  	if (ret < 0)
>>  		return ret;
>>
>> -	buf = obj->package.elements[1];
>> -	ret = seq_write(seq, buf.buffer.pointer, buf.buffer.length);
>> +	size = obj->package.elements[0].integer.value;
>> +	buf = obj->package.elements[1].buffer.pointer;
>> +	ret = seq_write(seq, buf, size);
> 
> Okay, so the buffer may provide more space than what should actually be used
> according to the size field. This looks like a bug that should have a fixes tag
> on the original commit.

I have already merged this and both the original commit as well as
this fix will land in 6.2, so I don't think a Fixes commit is
really necessary in this case.

Also the old code checked that the 2 sizes matched, so it was more
strict and as such running only the original patch should not lead
to buffer overruns or anything like that.

Regards,

Hans


