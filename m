Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D88C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 08:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbjEPIig (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 04:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbjEPIif (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 04:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BCB4EE8
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684226257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=siw2fbStubQ9cCqKAW/aPWM3GTA3DInzEYR9jop8Ufw=;
        b=eHJTW2E8F0h04Wcd9XzZiXa5eZqVE4mm1ShF/j51p1gh/KBNHkbBp0jZDQ28erBAoQXn0p
        /KvehgEzwtjYyq8LEkElewo8NEiHn6mwZG//TcGuwH62cnUcYgoy56VLCu6MKCHxPncLRN
        LgBzoUdAaTbzvGNyNi0WyeCjnAGgA+w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-XOQcpK4oM9OfureJTfSKGQ-1; Tue, 16 May 2023 04:37:25 -0400
X-MC-Unique: XOQcpK4oM9OfureJTfSKGQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51081f7b83dso680055a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 01:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684226244; x=1686818244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=siw2fbStubQ9cCqKAW/aPWM3GTA3DInzEYR9jop8Ufw=;
        b=YfNemMx4elZ8CT1DldPrbcDZBnmkMGOMMeMlqA1LMfaNxuobfotaRB8TDcUHm9NrqA
         zAeFOTQ6rFmhj9iYPUqKTQGIYcdyHR76UJjSt9ZyRIBVbsYU2oXTdDOsq6i4ZZJH64tx
         yBpjgiGB9jhLjq7hs+55MnWe0AUP0JvO7X9ijye2XLsyGdhPoh6Om7pU3Olv0fewdjfH
         XCe8iCF8xsRlodJNq7RNA0C+GazmeCKNSvkzM+zNpU3Kew8KYjmF+JfFwxYmC1oeHP3N
         uZy5AQJOa3CUljAs1eBMuestuWonCFzjP79+eGWLMY2E7atuD1HtpLbKcHVmMzbQGORJ
         9i4A==
X-Gm-Message-State: AC+VfDwO39GamnruQpNe3c2pAdbK6IOXZ3ALfn2uvl2e2h7ZCrZsh5mQ
        Gy4CZAKqmekV8UD5rEJiFutoZgMibHKzhYWN6szJvjGeToQnAD/x/1qnm277EVTfCc7jGJ1PkUL
        7wJB8GfwN3NwtpFrGKLox3prc1bEq+sQQ2QGIgJlS2w==
X-Received: by 2002:aa7:ca57:0:b0:50c:1e2:4a42 with SMTP id j23-20020aa7ca57000000b0050c01e24a42mr28642245edt.15.1684226243855;
        Tue, 16 May 2023 01:37:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74IzeR5u3sGMU3VC1TQrdqIZiI9JRz4zOqp33Mroy+wZC8YoqKBPk+pFm9YcXZdlSP7KI37g==
X-Received: by 2002:aa7:ca57:0:b0:50c:1e2:4a42 with SMTP id j23-20020aa7ca57000000b0050c01e24a42mr28642228edt.15.1684226243574;
        Tue, 16 May 2023 01:37:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7c695000000b0050bdd7fafd8sm8141512edq.29.2023.05.16.01.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 01:37:23 -0700 (PDT)
Message-ID: <d8ae1347-6d31-cb1e-4362-119765923281@redhat.com>
Date:   Tue, 16 May 2023 10:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix compiler warnings in static
 slider
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        Patil.Reddy@amd.com, mario.limonciello@amd.com,
        kernel test robot <lkp@intel.com>
References: <20230516074531.2885235-1-Shyam-sundar.S-k@amd.com>
 <27c54140-0db-4527-4b4a-65a3e3fe14@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <27c54140-0db-4527-4b4a-65a3e3fe14@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/16/23 10:20, Ilpo Järvinen wrote:
> On Tue, 16 May 2023, Shyam Sundar S K wrote:
> 
>> This patch fixes warnings with -Wmissing-prototypes:
>>
>> warning: no previous prototype for 'source_as_str' [-Wmissing-prototypes]
>> warning: no previous prototype for 'slider_as_str' [-Wmissing-prototypes]
>>
>> Fixes: a82ebb3d800d ("platform/x86/amd/pmf: Add PMF acpi debug support")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202305160220.REQc5T2y-lkp@intel.com/
>> Suggested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/sps.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
>> index 0a4d0549ea03..445ff053b4df 100644
>> --- a/drivers/platform/x86/amd/pmf/sps.c
>> +++ b/drivers/platform/x86/amd/pmf/sps.c
>> @@ -13,7 +13,7 @@
>>  static struct amd_pmf_static_slider_granular config_store;
>>  
>>  #ifdef CONFIG_AMD_PMF_DEBUG
>> -const char *slider_as_str(unsigned int state)
>> +static const char *slider_as_str(unsigned int state)
>>  {
>>  	switch (state) {
>>  	case POWER_MODE_PERFORMANCE:
>> @@ -27,7 +27,7 @@ const char *slider_as_str(unsigned int state)
>>  	}
>>  }
>>  
>> -const char *source_as_str(unsigned int state)
>> +static const char *source_as_str(unsigned int state)
>>  {
>>  	switch (state) {
>>  	case POWER_SOURCE_AC:
>>
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


