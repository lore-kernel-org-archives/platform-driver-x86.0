Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69B9C64E75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96B6D20866
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hHwfboIs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387698AbgKXNkc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 08:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46742 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388344AbgKXNka (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 08:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606225228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=375AcZQRIbngaOkTsEbs6TrLV3kscOAMnPTc3x+vtv4=;
        b=hHwfboIsVmWNSIAPu0NdhKHpFhHbQ+ZFJJ54ZtbfbpRaAQZ7k16VoQXGmLTuiolKAfGSA+
        DWGkloncqimEWHOt3U+E3ABnnQNCSyqg1k7Q2cw+BsdDLyu8RtECo4Bw0QbgE1+PS5lkBj
        poUKRlzWm6QwiF6SCJ3nEpPpBFfWsFA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-7S8iP046M2ydNMpYjuc-dw-1; Tue, 24 Nov 2020 08:40:26 -0500
X-MC-Unique: 7S8iP046M2ydNMpYjuc-dw-1
Received: by mail-ed1-f72.google.com with SMTP id l24so7922894edt.16
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 05:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=375AcZQRIbngaOkTsEbs6TrLV3kscOAMnPTc3x+vtv4=;
        b=mJUnNs4oquRSqDUGkOQJ4oz/K4dzcJdA9YsDAL9vzbu4wvBcjata80tfmmts/+RHCt
         vV1NDoaF91VVihPeCN3b5UbGVE6hXCRsvuF7N2W5vf5YXB5Q6tvwd3dkqDWjxqlo8XDD
         x5pqRkJeYTU79mr7HkanEd4VYOuwEPtcI5/UB8RibMlURsyfK5z53DGMh7Y44ylsiNIV
         u9Ccrf4WhMfaw3dvUbkue0ydAx1COjHZeNfaQf/B1g+mPBqT+w+TEaH5wqkA3KOnbFz5
         4n1IlnUBz4/C1FNGiv0el5TKMQUe72rF0mGVuvh7zYelNIOq64kLfm3FmvI/L/0COnqc
         ecCw==
X-Gm-Message-State: AOAM530qJC0e5lmL3ZZbLM/tQohgit/vNjH+rWtwunN/sJlVss1KmmDa
        EHf0bS5S77Wo9J8/EduYKHRZ/ODlAgSkxEVUINudPJ0hjfkXilN9m/Drh2gttj0FrRMwyD4p0z7
        tF5UN++9WF5t7X00sZAIZ3VGQlX9yhag1pLWlbHZdDa315cQBtVgcV8Nqdb41p+pe4O1CRdGAwr
        +92zjluTtVfg==
X-Received: by 2002:a50:e68b:: with SMTP id z11mr3947606edm.25.1606225225266;
        Tue, 24 Nov 2020 05:40:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+/HKENKzmOsUAtxIixvP7SR0lBhGGdv9A5NpI7IGnM1NCr06rEGIQW35E8FHjDT3pJ0b1cw==
X-Received: by 2002:a50:e68b:: with SMTP id z11mr3947583edm.25.1606225224997;
        Tue, 24 Nov 2020 05:40:24 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id rp28sm6987230ejb.77.2020.11.24.05.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 05:40:24 -0800 (PST)
Subject: Re: [PATCH 1/3] platform/x86: asus-wmi: Add userspace notification
 for performance mode change
To:     Vasiliy Kupriakov <rublag-ns@yandex.ru>,
        Corentin Chary <corentin.chary@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20200828214932.20866-1-rublag-ns@yandex.ru>
 <20200828214932.20866-2-rublag-ns@yandex.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d603515-e906-6f4f-3053-6343746f1486@redhat.com>
Date:   Tue, 24 Nov 2020 14:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20200828214932.20866-2-rublag-ns@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Quick self intro: I have take over drivers/platform/x86
maintainership from Andy; and I'm working my way through
the backlog of old patches in patchwork:
https://patchwork.kernel.org/project/platform-driver-x86/list/

On 8/28/20 11:49 PM, Vasiliy Kupriakov wrote:
> When user presses Fn-F5, the driver automatically changes throttle
> thermal policy (or fan boost mode, depending on laptop model).
> 
> It would be convenient for userspace software to be able to poll on
> corresponding sysfs variable. For example, to show a notification about
> mode change.
> 
> Note that there is currently no way to handle Fn-F5 from userspace
> directly, driver does not pass it.
> 
> Signed-off-by: Vasiliy Kupriakov <rublag-ns@yandex.ru>

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
>  drivers/platform/x86/asus-wmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8f4acdc06b13..71559d429ba0 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1660,6 +1660,10 @@ static int fan_boost_mode_write(struct asus_wmi *asus)
>  	pr_info("Set fan boost mode: %u\n", value);
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_FAN_BOOST_MODE, value,
>  				    &retval);
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
> +			"fan_boost_mode");
> +
>  	if (err) {
>  		pr_warn("Failed to set fan boost mode: %d\n", err);
>  		return err;
> @@ -1771,6 +1775,10 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
>  				    value, &retval);
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
> +			"throttle_thermal_policy");
> +
>  	if (err) {
>  		pr_warn("Failed to set throttle thermal policy: %d\n", err);
>  		return err;
> 

