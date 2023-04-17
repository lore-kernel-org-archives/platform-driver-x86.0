Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98F1C77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 10:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbjDQKQa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjDQKQ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 06:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21445FE7
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681726392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TWbOnCGMg+g2KMIHo6MRFBoLdJ5Yw+JkX3S6axmHUV0=;
        b=IkQAq8kXawf2YpWmBhSjjFJJApk1utYV+En7rbCby73nCsNaKl6FYaGjb/K18B+8lR3rsG
        hsULk+5IcW1Vtx3NWbmDNy5fE0RJpOW9hoCEEUjGgegnsZfm5RGCEeyZ9QuSRNh00wo+1y
        g5C1rTfuaWqaInyi6P+WHeg/Mcm9wRw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-x38KbDL6Pb2qm9yVfLk1xw-1; Mon, 17 Apr 2023 06:13:11 -0400
X-MC-Unique: x38KbDL6Pb2qm9yVfLk1xw-1
Received: by mail-ed1-f69.google.com with SMTP id v10-20020a50d08a000000b0050675b95c83so5970877edd.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726390; x=1684318390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWbOnCGMg+g2KMIHo6MRFBoLdJ5Yw+JkX3S6axmHUV0=;
        b=TaQGVV8QUjeFvyEfZoYVRxIEMlCdolEZI5OocUc/yTyIuK+jA0EZKQOmbkgVMFtS1Q
         i4BsOoclseyx7PlA5oLELM6DQcsOX4qlsPn87Xarnt83XexeXJ0ONTcuIsnCX1TdqNKc
         ZHghQOY6dYEuZdPwI37DMlrx6db3ULhIO0aCJvsrZCrR+zMRsSOvpKd0VknRXBwEOmhd
         ucHI9RL/gMFbAtsiDjkTfkT/etYiDGsJIl6EgF+txi373eQ7TXLH4hDiM9rXxuUs/ZI/
         veQA8wz5XFDSnOf7rTa9a6CkeS51NpSH4jdivSyo5qFn1anhpjtjCuX6VMc9J6eltlVX
         i+kw==
X-Gm-Message-State: AAQBX9dpzSnWtG/UnyQ0YF6f3mhRROllPRhxwEz2mE9TQq/np31rN2Aj
        FHpOs/gvWzakeHlTecux1HDQcoTBk5UCqgSVqBXF25MpTsiEVADmW+VTPCQgIYCcJh0wy57WBGX
        DtiaImUvW1eGH4JdlaTJZVJnqFw7KOOjFxg==
X-Received: by 2002:a17:906:2dd4:b0:94f:a03:3d3b with SMTP id h20-20020a1709062dd400b0094f0a033d3bmr5762028eji.20.1681726390562;
        Mon, 17 Apr 2023 03:13:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350akHc/S1wNwk9kDL+94i/OxY5JcMZnmuzDRYEkjj9sWtM7Oxf7LX4RBjEAAPOLk41yDz6szDQ==
X-Received: by 2002:a17:906:2dd4:b0:94f:a03:3d3b with SMTP id h20-20020a1709062dd400b0094f0a033d3bmr5762016eji.20.1681726390295;
        Mon, 17 Apr 2023 03:13:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gb32-20020a170907962000b0094f34fe27c6sm2854357ejc.170.2023.04.17.03.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:13:09 -0700 (PDT)
Message-ID: <ad2b3eed-ac33-c13a-5c43-27da89496d86@redhat.com>
Date:   Mon, 17 Apr 2023 12:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86/intel/pmt: Ignore uninitialized entries
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230413012922.1521377-1-david.e.box@linux.intel.com>
 <84f5952a-b64d-c3c8-d80-b9d59fe1ed40@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <84f5952a-b64d-c3c8-d80-b9d59fe1ed40@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/13/23 12:13, Ilpo Järvinen wrote:
> On Wed, 12 Apr 2023, David E. Box wrote:
> 
>> On Intel Xeon, unused PMT regions will have uninitialized discovery headers
>> containing all 0xF. Instead of returning an error, just skip the region.
>>
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/telemetry.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
>> index 71cdef42084a..39cbc87cc28a 100644
>> --- a/drivers/platform/x86/intel/pmt/telemetry.c
>> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
>> @@ -78,7 +78,7 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
>>  	 * reserved for future use. They have zero size. Do not fail
>>  	 * probe for these. Just ignore them.
>>  	 */
>> -	if (header->size == 0)
>> +	if (header->size == 0 || header->access_type == 0xF)
>>  		return 1;
>>  
>>  	return 0;
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


