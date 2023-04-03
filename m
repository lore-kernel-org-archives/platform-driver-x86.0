Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B945C76196
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Apr 2023 09:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbjDCJqR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Apr 2023 05:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjDCJqB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2023 05:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323E31205C
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Apr 2023 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680515015;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+Nw8RQOwzXx7j209w1MoiZoGhjBw50UbeNbp6+/Psis=;
        b=Y5VNXsVuZGOTO2ze43D/OkMEt+OG4NNgwhz2fRuQnOv3dBk0ktfXCg9Kq4GQ4CQlHqA9Wf
        yywppET71SJi/9IAoZl+a3Fp+dYvAA6sQL/Hant4OIB3TYtjMgVpq+CINPm5w2iKVGXzz6
        5A6GNIOD9DDzpF4A0sQUqxy70B0QUY4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-Qh7lHO86MN6SEuzhfUWf2Q-1; Mon, 03 Apr 2023 05:43:34 -0400
X-MC-Unique: Qh7lHO86MN6SEuzhfUWf2Q-1
Received: by mail-ed1-f71.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso40272255edb.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Apr 2023 02:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680515013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nw8RQOwzXx7j209w1MoiZoGhjBw50UbeNbp6+/Psis=;
        b=FIgB/p0Rt7lhnVP2HNRuBaYoZV/cQms9lH4Ert8yokiBNplhe+kULIFV+QGV8wUEfe
         LqFqIwlZkyZpPIIkWsSyfjw9ciG23MNzt0df4vOOCmnYH/vfh2QWC82Mf1RaXER3ucft
         L2YfH33jinthVdOkYKwvKy7TbsTcGS3om5L2GxG+EwdMU/OPDJ/V1H0hWa1wf11dMOaB
         NVdQWCxTFlhyFWmbs3xtCpDwZjdMXwlp/gahdoEyYzTJVzRbACqBL6S8wuy1WNev21Al
         0n1sxARBrRVvz8P5WzO6txUmwWV8nGWTd9SsS1vwADcq1gexkpu3MXMfCc4Kof281pnr
         uGzA==
X-Gm-Message-State: AAQBX9cv6caXEopO/jUoBRqF2yUQheAidtBN/ye2uwlBnWnpcz3lWucM
        EBWkg2+e/W4rmZE0jweMRq2k0SUh5xpzoLmEnXdJQjrKQpG3RSD4JXTnhp4HiGEGOhyNyktaPPU
        DpjjSOkqQ1kOe/sw7jKNwvwAtnfhMOkeigg==
X-Received: by 2002:a17:906:ae96:b0:93b:1c78:5796 with SMTP id md22-20020a170906ae9600b0093b1c785796mr34009197ejb.43.1680515013233;
        Mon, 03 Apr 2023 02:43:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aCjSpFEG4yIY7UXk7+qX6baIEI/sKcZYyV35iTQt4Vrj8T/cMExE6jBz9NaDi45Z+PjXodjQ==
X-Received: by 2002:a17:906:ae96:b0:93b:1c78:5796 with SMTP id md22-20020a170906ae9600b0093b1c785796mr34009185ejb.43.1680515012982;
        Mon, 03 Apr 2023 02:43:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oq26-20020a170906cc9a00b009318ad4a583sm4279505ejb.210.2023.04.03.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:43:32 -0700 (PDT)
Message-ID: <ad7cd0bc-b451-f4b5-c4ed-620b4298c2e1@redhat.com>
Date:   Mon, 3 Apr 2023 11:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] platform/x86: think-lmi: Fix memory leaks when
 parsing ThinkStation WMI strings
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, W_Armin@gmx.de,
        mirsad.todorovac@alu.unizg.hr, linux@weissschuh.net,
        Mario.Limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230403013120.2105-1-mpearson-lenovo@squebb.ca>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230403013120.2105-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/3/23 03:31, Mark Pearson wrote:
> My previous commit introduced a memory leak where the item allocated
> from tlmi_setting was not freed.
> This commit also renames it to avoid confusion with the similarly name
> variable in the same function.
> 
> Fixes: 8a02d70679fc ("platform/x86: think-lmi: Add possible_values for ThinkStation")
> Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
> Link: https://lore.kernel.org/lkml/df26ff45-8933-f2b3-25f4-6ee51ccda7d8@gmx.de/T/
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> This patch series builds on top of the proposed patch from Armin Wolf
> "platform/x86: think-lmi: Fix memory leak when showing current settings"
> Changes in v2: None, but rebased series because of issues with second
> patch.

Thank you for your patch series, I've applied this series
to my fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> 
>  drivers/platform/x86/think-lmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 6034df6d577d..87f832142d8d 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1459,10 +1459,10 @@ static int tlmi_analyze(void)
>  			 * name string.
>  			 * Try and pull that out if it's available.
>  			 */
> -			char *item, *optstart, *optend;
> +			char *optitem, *optstart, *optend;
>  
> -			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID)) {
> -				optstart = strstr(item, "[Optional:");
> +			if (!tlmi_setting(setting->index, &optitem, LENOVO_BIOS_SETTING_GUID)) {
> +				optstart = strstr(optitem, "[Optional:");
>  				if (optstart) {
>  					optstart += strlen("[Optional:");
>  					optend = strstr(optstart, "]");
> @@ -1471,6 +1471,7 @@ static int tlmi_analyze(void)
>  							kstrndup(optstart, optend - optstart,
>  									GFP_KERNEL);
>  				}
> +				kfree(optitem);
>  			}
>  		}
>  		/*

