Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE147C77B78
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 10:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDQKmW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjDQKmV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 06:42:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5776486BF
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681728001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SDk3y6YL8NcrP7qt8pUV/GZMMEBmQX45ZIgP7zWBk7U=;
        b=DAVFovligpm4K5m+7swwKkNmkqikkzyFC/3M/MSMOkXRHMzmAEuGiH9QHjC/FFS3mD+T4K
        jvt3NrnZPCchfrtHS3L09ae2DHUi0Hn6uB7gOr8kh35E/uecEP/wiw85dT6In2yi5E0aAv
        GfoxzD0RgUxjDcMj4pHiH8DkN2P++98=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-Fq91YCzpNtSYh48ZjWy6UQ-1; Mon, 17 Apr 2023 06:23:06 -0400
X-MC-Unique: Fq91YCzpNtSYh48ZjWy6UQ-1
Received: by mail-ed1-f71.google.com with SMTP id v10-20020a50d08a000000b0050675b95c83so5983206edd.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726985; x=1684318985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDk3y6YL8NcrP7qt8pUV/GZMMEBmQX45ZIgP7zWBk7U=;
        b=cocFiUYPRXVhRyaEG2RKCLJ/20rGl955CNgQywwRf9oWlfsgkhDDMjMUoaij9GndJE
         VEmxF1ZBk9+QLjqmA+QkYp+PKN4T02z/R9t7EIDJtB10ZaxpDz3paviUMMnoAdlaX7uU
         3mYh4+KQONs3CIpwU9+HFfYl43UvNQk/4fysQmxdz8UZnlJ8hLIBFXM0r09vrKeJtebb
         LI4pBh2f0/faLLClvg+cHOtZlrnxiNxtNQWnNvTQei+SvA6sODDAppvYgTT5ecGYqqrY
         r3rhtHbQNnFcyh+l66vqwyk22wuG+VEMgdi/llQtGWIvyM0o27bV3siVtpTH5Ss38a2K
         t0mw==
X-Gm-Message-State: AAQBX9edoPQlu5p30PL/xAZ/WBFhvbxHR5rVC76ebiDVq19MaL3Ynb/7
        9Fr8qDCENE6ixkB9vknAlDp495gt8U1M1/on+2qa8FBRmsECwxdk4qUpQlvazPPUdO2lw0y8VPt
        gudM0T5KyPb0GV/8dWjYdlxXbsxVlmdjKbg==
X-Received: by 2002:a17:906:847b:b0:870:58ae:842e with SMTP id hx27-20020a170906847b00b0087058ae842emr6583227ejc.24.1681726985680;
        Mon, 17 Apr 2023 03:23:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350YGUTVdM6CneYScPti+UqjkD+DXhvZvk6sKHWxt1tRef5U+FyZox7r7aBvtrU9acQmYQj4y4A==
X-Received: by 2002:a17:906:847b:b0:870:58ae:842e with SMTP id hx27-20020a170906847b00b0087058ae842emr6583211ejc.24.1681726985366;
        Mon, 17 Apr 2023 03:23:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090601ce00b0094a671c2298sm959213ejj.62.2023.04.17.03.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:23:04 -0700 (PDT)
Message-ID: <077df234-1872-c3f1-fc7d-1f935f6e5864@redhat.com>
Date:   Mon, 17 Apr 2023 12:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller
 access on X380 Yoga
Content-Language: en-US, nl
To:     Daniel Bertalan <dani@danielbertalan.dev>,
        Mark Gross <markgross@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, liavalb@gmail.com
References: <20230414180034.63914-1-dani@danielbertalan.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230414180034.63914-1-dani@danielbertalan.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/14/23 20:02, Daniel Bertalan wrote:
> On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used for
> accessing the Embedded Controller: instead of a method that reads from
> the EC's memory, `ECRD` is the name of a location in high memory. This
> meant that trying to call them would fail with the following message:
> 
>   ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-method
>   ACPI object (RegionField)
> 
> With this commit, it is now possible to access the EC and read
> temperature and fan speed information. Note that while writes to the
> HFSP register do go through (as indicated by subsequent reads showing
> the new value), the fan does not actually change its speed.
> 
> Signed-off-by: Daniel Bertalan <dani@danielbertalan.dev>

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
>  drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7191ff2625b1..6fe82f805ea8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -11699,6 +11699,7 @@ static int __init thinkpad_acpi_module_init(void)
>  {
>  	const struct dmi_system_id *dmi_id;
>  	int ret, i;
> +	acpi_object_type obj_type;
>  
>  	tpacpi_lifecycle = TPACPI_LIFE_INIT;
>  
> @@ -11724,6 +11725,21 @@ static int __init thinkpad_acpi_module_init(void)
>  	TPACPI_ACPIHANDLE_INIT(ecrd);
>  	TPACPI_ACPIHANDLE_INIT(ecwr);
>  
> +	/*
> +	 * Quirk: in some models (e.g. X380 Yoga), an object named ECRD
> +	 * exists, but it is a register, not a method.
> +	 */
> +	if (ecrd_handle) {
> +		acpi_get_type(ecrd_handle, &obj_type);
> +		if (obj_type != ACPI_TYPE_METHOD)
> +			ecrd_handle = NULL;
> +	}
> +	if (ecwr_handle) {
> +		acpi_get_type(ecwr_handle, &obj_type);
> +		if (obj_type != ACPI_TYPE_METHOD)
> +			ecwr_handle = NULL;
> +	}
> +
>  	tpacpi_wq = create_singlethread_workqueue(TPACPI_WORKQUEUE_NAME);
>  	if (!tpacpi_wq) {
>  		thinkpad_acpi_module_exit();

