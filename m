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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133DBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC99A61946
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhCUMga (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 08:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20720 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229840AbhCUMgJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 08:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616330168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gFMkTh0ML/omIFEnLyjjjzDHbWoUExuKqtEMhXhKd5o=;
        b=OGCTKUmjxk5CDjSCPYWYFCsv3cFY74P+h8Wn2QGUVyoY8iCKngPxh8Nv9YUThfQe39BQ4U
        1H3KD7csOlfclX74aKnu04oBJT1UOpJdMWWFfv0Y/elfZjSjbwypttugi4K+if0nFxWjpG
        tLSCPzY5WW/k71ApiGlkV8qRp4vE2lc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-a3zhh9bcOfareiXyQjPQag-1; Sun, 21 Mar 2021 08:36:07 -0400
X-MC-Unique: a3zhh9bcOfareiXyQjPQag-1
Received: by mail-ed1-f70.google.com with SMTP id r19so25343806edv.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 05:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gFMkTh0ML/omIFEnLyjjjzDHbWoUExuKqtEMhXhKd5o=;
        b=lFrisI3Rg8HuRUvzHBBc2GnT0Ye/xa0LVU5fSsTvfGd7Mr6kk+63y6hGbiO6KJ62FT
         zsv5E/gsHd8nepxWp0vijpe9BrNo/U0YfwkAHS/rngeRsguf/6fJlBKBE1la8S3Y2tKg
         JBANcV1FSbqQb27ci75uaBHIfVpt3X1YPPprjqPiCYf+Y7HkY7WwXgfH3PdV+kdZWD/1
         e28PeWS/kfdGFahNQOAlAXr31F73A/sLRRPu8k3e6a2hD5hgZQ+noc8iOYmNn2NTxV0w
         o9UFoQM0tfUzyjWFHAi4ZHHb0B3CV4q7T0Bng5s5LNs9sNN8JSHkPf9prGhpDvOELLP6
         7mOQ==
X-Gm-Message-State: AOAM531WCP1dGxgqZgj2WloycKkxqlGgDflnrq5M+gr7fX8fMvFWNEgd
        K5xkizPGuX4MMn2UHKnl+8e5mYJHLobzq4l2ZxZww+EiEg1N0/hN35uiUd2p12FxzNXXlN0z93Q
        fmEL5rgHUmTvl/9uPtXlbD6oitaYsQKe8hE23LSiwswgSHm7G4OwSPPeLdU0qeJHGKO9oAOCGAD
        ute3V8DGqHQg==
X-Received: by 2002:a05:6402:5255:: with SMTP id t21mr20412203edd.91.1616330165697;
        Sun, 21 Mar 2021 05:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF5Vh4A2PMx2YVpzLUoh3qbo7wnKaY31I1yUTrlnnW3LwA5kzEtdj52XzSbC3flR3w9cpRiQ==
X-Received: by 2002:a05:6402:5255:: with SMTP id t21mr20412182edd.91.1616330165454;
        Sun, 21 Mar 2021 05:36:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k9sm8322248edn.68.2021.03.21.05.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 05:36:05 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Make
 init_bios_attributes() ACPI object parsing more robust
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
References: <20210321121607.35717-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bdbbe7e6-7a6b-fa9d-426a-e88135e3c7f5@redhat.com>
Date:   Sun, 21 Mar 2021 13:36:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210321121607.35717-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/21 1:16 PM, Hans de Goede wrote:
> Make init_bios_attributes() ACPI object parsing more robust:
> 1. Always check that the type of the return ACPI object is package, rather
>    then only checking this for instance_id == 0
> 2. Check that the package has the minimum amount of elements which will
>    be consumed by the populate_foo_data() for the attr_type
> 
> Note/TODO: The populate_foo_data() functions should also be made more
> robust. The should check the type of each of the elements matches the
> type which they expect and in case of populate_enum_data()
> obj->package.count should be passed to it as an argument and it should
> re-check this itself since it consume a variable number of elements.
> 
> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
> Cc: Divya Bharathi <Divya_Bharathi@dell.com>
> Cc: Mario Limonciello <mario.limonciello@dell.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Restore behavior of returning -ENODEV when the get_wmiobj_pointer() call
>   for instance_id == 0 returns NULL. Otherwise
>   /sys/class/firmware-attributes/dell-wmi-sysman will get created with an
>   empty attributes dir (empty except for pending_reboot and reset_bios)

So the reason for this change in v2 is that testing on a Dell Latitude E5570:
https://bugzilla.redhat.com/show_bug.cgi?id=1936171

With v1 of this patch results in an empty attributes dir (empty except for
pending_reboot and reset_bios), interestingly enough there are both
System and Admin dirs created under Authentication, so the BIOS of this
device seems to have the GUIDs for both the attributes and the authentication
interfaces; and it has the 2 standard authentication objects, theoretically
allowing changing the BIOS passwords from within Linux, but it does not
advertise any attributes which can be changed.

With the new v2 patch, the driver will now simply refuse to load
(and it should no longer crash during cleanup because of the other patches).

But I wonder what is actually the right thing to do here ?  Arguably
being able to change the BIOS passwords has some value on its own ?

Mario, what is your take on this?

Regards,

Hans



> ---
>  .../x86/dell/dell-wmi-sysman/sysman.c         | 32 ++++++++++++++++---
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 7410ccae650c..a90ae6ba4a73 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -399,6 +399,7 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  	union acpi_object *obj = NULL;
>  	union acpi_object *elements;
>  	struct kset *tmp_set;
> +	int min_elements;
>  
>  	/* instance_id needs to be reset for each type GUID
>  	 * also, instance IDs are unique within GUID but not across
> @@ -409,14 +410,38 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  	retval = alloc_attributes_data(attr_type);
>  	if (retval)
>  		return retval;
> +
> +	switch (attr_type) {
> +	case ENUM:	min_elements = 8;	break;
> +	case INT:	min_elements = 9;	break;
> +	case STR:	min_elements = 8;	break;
> +	case PO:	min_elements = 4;	break;
> +	default:
> +		pr_err("Error: Unknown attr_type: %d\n", attr_type);
> +		return -EINVAL;
> +	}
> +
>  	/* need to use specific instance_id and guid combination to get right data */
>  	obj = get_wmiobj_pointer(instance_id, guid);
> -	if (!obj || obj->type != ACPI_TYPE_PACKAGE)
> +	if (!obj)
>  		return -ENODEV;
> -	elements = obj->package.elements;
>  
>  	mutex_lock(&wmi_priv.mutex);
> -	while (elements) {
> +	while (obj) {
> +		if (obj->type != ACPI_TYPE_PACKAGE) {
> +			pr_err("Error: Expected ACPI-package type, got: %d\n", obj->type);
> +			retval = -EIO;
> +			goto err_attr_init;
> +		}
> +
> +		if (obj->package.count < min_elements) {
> +			pr_err("Error: ACPI-package does not have enough elements: %d < %d\n",
> +			       obj->package.count, min_elements);
> +			goto nextobj;
> +		}
> +
> +		elements = obj->package.elements;
> +
>  		/* sanity checking */
>  		if (elements[ATTR_NAME].type != ACPI_TYPE_STRING) {
>  			pr_debug("incorrect element type\n");
> @@ -481,7 +506,6 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  		kfree(obj);
>  		instance_id++;
>  		obj = get_wmiobj_pointer(instance_id, guid);
> -		elements = obj ? obj->package.elements : NULL;
>  	}
>  
>  	mutex_unlock(&wmi_priv.mutex);
> 

