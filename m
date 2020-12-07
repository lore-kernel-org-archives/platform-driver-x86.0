Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B8FC0018C
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7BD1235E4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgLGOHY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 09:07:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24606 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725917AbgLGOHY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 09:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607349957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=afa9i0Bef4Cb3mOnPuAfy6fMFqpa+/My9xmYdxXU/TQ=;
        b=Je4Qnlb5UV1uNBOBZfZCtxoLXZedsdLvEFE479HKbCBH6z4Y19xbhR+g/bMJpPtjgHjWX7
        uN+tCli/Rh1DvXc3eae6URzETAZ7iXsARaXX4agyKkffggGWC0WH7g7I8D7/hUZtvZI3V3
        Q5gPGfPjwGqUqaquqz44Xk10GuMgnVA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-K8VzEiknM7a5lVnB3vH-Kw-1; Mon, 07 Dec 2020 09:05:55 -0500
X-MC-Unique: K8VzEiknM7a5lVnB3vH-Kw-1
Received: by mail-ed1-f72.google.com with SMTP id d12so3509691edx.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 06:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=afa9i0Bef4Cb3mOnPuAfy6fMFqpa+/My9xmYdxXU/TQ=;
        b=U3IfJSHtuMsEsGXtn1Nsf4EjurFAvj+hwknnl47k6kKyWERn0ZEMOLYPtlste9zDok
         qQ8YpA8XVW9fxCEro8qP+i7ufdfW7OYoobThsqlr/vpxv9h/5UChlDR3aY9AMcO9Ojqz
         V0hWqregNRn66kPYsIxXqMob95IcPc/eyVH2rirKe//CsTjowwPP7mFSKupk4jF4JzAt
         YzbJM3ZON2og+3HJXRai1zto1LzSQvv4Bw6l9n82Fxb/f7+LPXk7XILRlzuYG6t2EnPz
         VzwWbo/vDfpx6wQZiDQC43Z1CJ04vx5WP8vsxYk8s8ICoRerqWHfzgHgBS+UP/qngCkl
         J0lg==
X-Gm-Message-State: AOAM532i9fK+eNMfTpTu4S5QXjvSDzilzmO+PLQHHclFOvHR3Hb1jHdf
        15MEkSOs+bFaAL1C1vkcGqYbR26zt8v+HPauthPp1EoXKRDYLB5LGtkC5+SnhCq/MasNuyPhbQN
        1ZKn90FFvKSlVvLW2qnpRDYIcYY+78u+fYg==
X-Received: by 2002:a17:906:1199:: with SMTP id n25mr18736559eja.293.1607349954377;
        Mon, 07 Dec 2020 06:05:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwraVwT1JcG9eO2qX/pyTXO58k7gNNbrJ+XGPs1jOdznikQXAjUUeHwWvUuK1v++EvFYzp4fg==
X-Received: by 2002:a17:906:1199:: with SMTP id n25mr18736540eja.293.1607349954217;
        Mon, 07 Dec 2020 06:05:54 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id cb21sm13461039edb.57.2020.12.07.06.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 06:05:53 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: work around for BIOS bug
To:     Divya Bharathi <divya27392@gmail.com>, dvhart@infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Divya Bharathi <divya.bharathi@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
References: <20201202131935.307372-1-divya.bharathi@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <39f8a3a5-88ff-7e1d-8ce3-ebec8c01427e@redhat.com>
Date:   Mon, 7 Dec 2020 15:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202131935.307372-1-divya.bharathi@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/2/20 2:19 PM, Divya Bharathi wrote:
> BIOS sets incorrect value (zero) when SET value passed for integer attribute
> with + sign. Added workaround to remove + sign before passing input to BIOS
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@dell.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Co-developed-by: Prasanth KSR <prasanth.ksr@dell.com>
> Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>
> Signed-off-by: Divya Bharathi <divya.bharathi@dell.com>

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
>  drivers/platform/x86/dell-wmi-sysman/int-attributes.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> index ea773d8e8d3a..75aedbb733be 100644
> --- a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> +++ b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> @@ -39,7 +39,7 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
>   * @instance_id: The instance on which input is validated
>   * @buf: Input value
>   */
> -static int validate_integer_input(int instance_id, const char *buf)
> +static int validate_integer_input(int instance_id, char *buf)
>  {
>  	int in_val;
>  	int ret;
> @@ -51,6 +51,12 @@ static int validate_integer_input(int instance_id, const char *buf)
>  			in_val > wmi_priv.integer_data[instance_id].max_value)
>  		return -EINVAL;
>  
> +	/* workaround for BIOS error.
> +	 * validate input to avoid setting 0 when integer input passed with + sign
> +	 */
> +	if (*buf == '+')
> +		memmove(buf, (buf + 1), strlen(buf + 1) + 1);
> +
>  	return ret;
>  }
>  
> 

