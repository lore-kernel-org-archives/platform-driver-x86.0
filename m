Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBD2C001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 19:57:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbjHIT5v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 15:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232072AbjHIT5u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 15:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51B3121
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691611023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lPHMyNLDaR02OzBYjtsZg32Ipz1ZGWqu3H9EpNDtpVY=;
        b=AYaCDGENVhamJK6THYn3HFObFEzfRBtqBSfOcqgqe6oocy67kgiS3yB/lQ+dh3FjTeq3EV
        oqdBXOKguPwr78zzFKffLqGIJ5Fqbyk454H79sjHZjairPdwbc8kUrunq7pXkC16k2ZsFK
        oNLZGH3QK4St5ZwQcInlZRMcNgHZKXY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-XLe7b2r6NyGVUDCq9acLyQ-1; Wed, 09 Aug 2023 15:57:01 -0400
X-MC-Unique: XLe7b2r6NyGVUDCq9acLyQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993831c639aso15229566b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Aug 2023 12:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611020; x=1692215820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPHMyNLDaR02OzBYjtsZg32Ipz1ZGWqu3H9EpNDtpVY=;
        b=IMesGKvoA080UUbd3a5MBI9RARRcjoJjEsZ01LRTmAQZRyo/3J5hTK36R/bfYTK6iK
         1sKEyd3v+KP9WFVL6Mxzjj8qzggWtKCW5n/FohHg1Ub5Pv8uybGmwaXHiGWM9gV+mULY
         mM84B9cO9H1uzYmJQ0Us3mYbosnSOP+aqXMGZFhw0uvK9losUCmnLD4QO6gQZU92v17s
         GhxE3EdDBUXz/KifuE62zZkq9jvFNiSN8CYuH4L/cPE2x4FPA25Hv8/m8PGElb1nJeo4
         pJ4Lg9h1z3KewOACA1u+aYkdH/0VuuGUU1OM/Xvfd5SL+gQjzD2xcjIMW/I5pv8bxA/7
         gWYg==
X-Gm-Message-State: AOJu0YymmzO4Xjk285lbDdE2VR+Qdyvb/ZIoXWg3+V1A6tUg+ZkkbJ3p
        r4yWN7VLssIeGQnQQ+KW5EKpLZ9Pcs98IxPuJJVmBLbmo7CX1b4WJg6lJsWrrMmbCtsflYgtcfL
        2Jr0BEIGUSEWw/NGlflxx3ynv0tTiUjQN5+E89lHKVA==
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id n7-20020aa7c687000000b005224cd7efb0mr187057edq.17.1691611020248;
        Wed, 09 Aug 2023 12:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGaR9QteGG4w7+R1wWFEtO29lCW4h18/v7EOASdFBQBSeGo9W7bZNifqMJ8jVFEdUuyohnvA==
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id n7-20020aa7c687000000b005224cd7efb0mr187048edq.17.1691611019960;
        Wed, 09 Aug 2023 12:56:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z22-20020a170906715600b0098cf565d98asm8329947ejj.22.2023.08.09.12.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 12:56:59 -0700 (PDT)
Message-ID: <d10e5e17-920d-de61-b6a5-bfd8acb6fa04@redhat.com>
Date:   Wed, 9 Aug 2023 21:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: dell-sysman: Fix reference leak
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, prasanth.ksr@dell.com,
        markgross@kernel.org
Cc:     Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230805053610.7106-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230805053610.7106-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/5/23 07:36, Armin Wolf wrote:
> If a duplicate attribute is found using kset_find_obj(),
> a reference to that attribute is returned. This means
> that we need to dispose it accordingly. Use kobject_put()
> to dispose the duplicate attribute in such a case.
> 
> Compile-tested only.
> 
> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

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
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index b68dd11cb892..b929b4f82420 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -393,6 +393,7 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  	struct kobject *attr_name_kobj; //individual attribute names
>  	union acpi_object *obj = NULL;
>  	union acpi_object *elements;
> +	struct kobject *duplicate;
>  	struct kset *tmp_set;
>  	int min_elements;
> 
> @@ -451,9 +452,11 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  		else
>  			tmp_set = wmi_priv.main_dir_kset;
> 
> -		if (kset_find_obj(tmp_set, elements[ATTR_NAME].string.pointer)) {
> -			pr_debug("duplicate attribute name found - %s\n",
> -				elements[ATTR_NAME].string.pointer);
> +		duplicate = kset_find_obj(tmp_set, elements[ATTR_NAME].string.pointer);
> +		if (duplicate) {
> +			pr_debug("Duplicate attribute name found - %s\n",
> +				 elements[ATTR_NAME].string.pointer);
> +			kobject_put(duplicate);
>  			goto nextobj;
>  		}
> 
> --
> 2.39.2
> 

