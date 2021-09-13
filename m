Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15254C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 13:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0074A61A71
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 13:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242506AbhIMNkf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 09:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20951 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241869AbhIMNiZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 09:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631540228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bjFYHg65tqjKEZiKvQMDCUW4YwiT0ZdGTDTVBXYGaW0=;
        b=RIqz+o0PFv1O6y979mlOiyKy7t1IwLHlCAK9WtIxxXzzU7B1xnPetU5NbqCsSq1HMy1wIi
        nTfI+AAFJCodwNHr/pPZvo0ALI9QVOAqWjxf9tE5YthhupetOCxzh0nYb9PN55mQBep+vh
        6pvDgehuZlnGgw9G9MBkZBEPNaFmRVw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-3e8aDsfLN6q7IabKP1StRQ-1; Mon, 13 Sep 2021 09:37:06 -0400
X-MC-Unique: 3e8aDsfLN6q7IabKP1StRQ-1
Received: by mail-ej1-f69.google.com with SMTP id c25-20020a170906341900b005eea9bf6f4aso2204691ejb.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 06:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bjFYHg65tqjKEZiKvQMDCUW4YwiT0ZdGTDTVBXYGaW0=;
        b=sfR9FViWndD4OwUH7wYrwLO32tUN6oWQYjH4Z2YmoplUyZQO8KXeV8Y4iSaVvZDuOC
         u4+HPRbgLTCo3O4bn3UXMylOOOqzpjj4EPOtAA07f2i5TqlDPNjA8RwOcQSBC7pu3KYx
         LiloisY5Zmm7RFByxA1jg8SHM1ryBKczvWlQ4cGSar3V/1yXqMpNinOLR0VRvvt49BZ7
         5e7JT9c6PbFcPvUfRFEFFgWbuhhPFg/TN/WdEsgsHGHKI/f9wyBpTaVolqPFbiOVc9Kl
         3OCAPlDl7EGsbLGT1wSgJrkEv9hOvEAE87E6+vfLN9i4MTg4xa2ySNz8otGpXrwhKOo7
         EKoA==
X-Gm-Message-State: AOAM533qPmFeD3v6jCk8lq5+Jv/xQ6etwzXEKMHnR3nYbsPM7jJsoOKC
        UScS5ZZGUFJCVyykbovplyGsYnMuJcAbMWLTnEDvm3fatS4U3DwGl7gy/8CXfv1bniSMBBJuZRu
        W6i5EH83QKyx1Ou9ciPFv8aEkfH+3lP0FJw==
X-Received: by 2002:a17:906:2345:: with SMTP id m5mr806417eja.557.1631540225615;
        Mon, 13 Sep 2021 06:37:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz69ArpVr5fjX6Qv/alZZF0AteWRQzT/mCPlyPxjrPJNBDptBfIFDgcECjVPZ1ZMhYgePGXoA==
X-Received: by 2002:a17:906:2345:: with SMTP id m5mr806401eja.557.1631540225390;
        Mon, 13 Sep 2021 06:37:05 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id x13sm3469083ejv.64.2021.09.13.06.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 06:37:04 -0700 (PDT)
Subject: Re: [PATCH] acer-wmi: use __packed instead of __attribute__((packed))
To:     Jules Irenge <jbi.octave@gmail.com>, jlee@suse.com
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210912011741.30495-1-jbi.octave@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <caff24a5-f6ef-edb6-2b0b-0411fadb2e8f@redhat.com>
Date:   Mon, 13 Sep 2021 15:37:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912011741.30495-1-jbi.octave@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/21 3:17 AM, Jules Irenge wrote:
> checkpatch.pl tool warns about using __attribute__((packed))
> "WARNING: __packed is preferred over __attribute__((packed))"
> To fix this __attribute__((packed)) is replaced by __packed
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

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


> ---
>  drivers/platform/x86/acer-wmi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 694b45ed06a2..9c6943e401a6 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -138,7 +138,7 @@ struct event_return_value {
>  	u16 reserved1;
>  	u8 kbd_dock_state;
>  	u8 reserved2;
> -} __attribute__((packed));
> +} __packed;
>  
>  /*
>   * GUID3 Get Device Status device flags
> @@ -172,33 +172,33 @@ struct func_input_params {
>  	u8 app_status;          /* Acer Device Status. LM, ePM, RF Button... */
>  	u8 app_mask;		/* Bit mask to app_status */
>  	u8 reserved;
> -} __attribute__((packed));
> +} __packed;
>  
>  struct func_return_value {
>  	u8 error_code;          /* Error Code */
>  	u8 ec_return_value;     /* EC Return Value */
>  	u16 reserved;
> -} __attribute__((packed));
> +} __packed;
>  
>  struct wmid3_gds_set_input_param {     /* Set Device Status input parameter */
>  	u8 function_num;        /* Function Number */
>  	u8 hotkey_number;       /* Hotkey Number */
>  	u16 devices;            /* Set Device */
>  	u8 volume_value;        /* Volume Value */
> -} __attribute__((packed));
> +} __packed;
>  
>  struct wmid3_gds_get_input_param {     /* Get Device Status input parameter */
>  	u8 function_num;	/* Function Number */
>  	u8 hotkey_number;	/* Hotkey Number */
>  	u16 devices;		/* Get Device */
> -} __attribute__((packed));
> +} __packed;
>  
>  struct wmid3_gds_return_value {	/* Get Device Status return value*/
>  	u8 error_code;		/* Error Code */
>  	u8 ec_return_value;	/* EC Return Value */
>  	u16 devices;		/* Current Device Status */
>  	u32 reserved;
> -} __attribute__((packed));
> +} __packed;
>  
>  struct hotkey_function_type_aa {
>  	u8 type;
> @@ -210,7 +210,7 @@ struct hotkey_function_type_aa {
>  	u16 display_func_bitmap;
>  	u16 others_func_bitmap;
>  	u8 commun_fn_key_number;
> -} __attribute__((packed));
> +} __packed;
>  
>  /*
>   * Interface capability flags
> 

