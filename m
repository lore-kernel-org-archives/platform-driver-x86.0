Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544B7C433C1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 065DA6193E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCUQlV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55713 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229784AbhCUQky (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 12:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616344853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JaU7q469pDtfZTpYvDQC8TnCmgKecG+htZT2onH8+7U=;
        b=cYwFf0DU+LSlNA7tpZun1O5UqvVe60yeTrqqQQoaZI96+zVr/ZTqsjBR85lPw1bECz5Icw
        uagPYrDFrWxStw6jPKOtCS6abarL/DM/vtDLS03u+njezDfWgvXBUgPxFfNi7hVu57zBsa
        iVTZYuTxYZ5fU+UN9qNW6oDJNHE6SmM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-InT10eM4Myi0xfayf_tbBQ-1; Sun, 21 Mar 2021 12:40:51 -0400
X-MC-Unique: InT10eM4Myi0xfayf_tbBQ-1
Received: by mail-ed1-f70.google.com with SMTP id r19so25593918edv.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 09:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JaU7q469pDtfZTpYvDQC8TnCmgKecG+htZT2onH8+7U=;
        b=PzPXxhZHt/9/yWR5WdUf7ZkE8+6xgRHSOrUlbz7bwhodYOpG/bRzvlQNtXM8dmR0Z9
         9HIUnvzJRc24vQ+yKNVPuf829seRV5fhxUrygTJOVDbiFcCddZCJxM/rolUTbWjIvetE
         Ji4bTzwEuzseA2jrPom4KHTjDJFDcpNA3UYVKAkVtscItlrO7UnG9yFTJSWp98Ti/hMh
         e45jjBh51V10lXE/4JX93QXAcPD08H6arKkXfZeSLJJIqF5EewnTMHp+o3XCKKPx0tnN
         ZXsugFBOmPV+NntfbpwCGNLdkMkLED9TuQubt26EsVp1AQ9FBnifaDjG9aM2zDgGrrT/
         Q0Yw==
X-Gm-Message-State: AOAM531SEs3cpi/nRy5ah3Z3p5nZD1CVxilyjfGQgyPpjw8uvHfG968d
        cnr3Rv9v3NZVAdQutfjG6NRN3ehaPyT9IYzHcuIfw94VXZ1dZLdQU9aMg7q0Msyyxrd5n3Q/WdD
        yW35+iQlmSLvtfkxEY9PJrSFC0vJbjarNqQ==
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr14798760ejc.133.1616344850291;
        Sun, 21 Mar 2021 09:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRI2PlUbpDsB+SIxt81VLswBq96mInu/zaTvdUTf5fuhDezdcT0ZxmOeDxqDTC585ltTY5YA==
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr14798744ejc.133.1616344850099;
        Sun, 21 Mar 2021 09:40:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j7sm8486368edv.40.2021.03.21.09.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 09:40:49 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Disable DYTC CQL mode around
 switching to balanced mode
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>
References: <20210321113108.7069-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5a1d7e61-47b0-49d3-36a8-3c0f91320b8a@redhat.com>
Date:   Sun, 21 Mar 2021 17:40:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210321113108.7069-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/21 12:31 PM, Hans de Goede wrote:
> Testing has shown that setting /sys/firmware/acpi/platform_profile to
> "balanced" when /sys/bus/platform/devices/thinkpad_acpi/dytc_lapmode
> reports 1, causes dytc_lapmode to get reset to 0 and then it becomes
> stuck at 0 for aprox. 30 minutes even if the laptop is used on a lap.
> 
> Disabling CQL (when enabled) before issuing the DYTC_CMD_RESET to get
> back to balanced mode and re-enabling it afterwards again, like the
> code already does when switching to low-power / performance mode fixes
> this.
> 
> Fixes: c3bfcd4c6762 ("platform/x86: thinkpad_acpi: Add platform profile support")
> Tested-by: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this patch to the pdx86/review-hans and pdx86/fixes branches,
so it should show up in linux-next soon and it will also be included
in my next pull-req to Linus for 5.12.

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index ab5155bec22e..a5df44bbb498 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10249,8 +10249,13 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  		return err;
>  
>  	if (profile == PLATFORM_PROFILE_BALANCED) {
> -		/* To get back to balanced mode we just issue a reset command */
> -		err = dytc_command(DYTC_CMD_RESET, &output);
> +		/*
> +		 * To get back to balanced mode we need to issue a reset command.
> +		 * Note we still need to disable CQL mode before hand and re-enable
> +		 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
> +		 * stuck at 0 for aprox. 30 minutes.
> +		 */
> +		err = dytc_cql_command(DYTC_CMD_RESET, &output);
>  		if (err)
>  			goto unlock;
>  	} else {
> 

