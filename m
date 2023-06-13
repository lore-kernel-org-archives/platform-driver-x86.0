Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB749C7EE29
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 10:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240768AbjFMKmo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 06:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235279AbjFMKmm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 06:42:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDAF1AA
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686652918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=irXa5/MVUXutU2yje0SPChb0/2Blm8SZbdJ2XPx6hj8=;
        b=JHv9tUaceiuqMGU73jj9SIK+B2+VwKQbAS/yktTD0zHo22Gy/13L40ns2j967ZPLpKI9Tx
        nrmc9F8KlgG9xVjOu7NeEZCPrJg6vDYuDbz1+zgt+C6Y5v1bJoX0HvKWa44SnoQP2+9Uj6
        lXDY68VmJ62+3LmYqhz/kxOmoLeqjrE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-CstchuebNcCMYWfYdvV7Ew-1; Tue, 13 Jun 2023 06:41:56 -0400
X-MC-Unique: CstchuebNcCMYWfYdvV7Ew-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a355cf318so611196566b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652916; x=1689244916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irXa5/MVUXutU2yje0SPChb0/2Blm8SZbdJ2XPx6hj8=;
        b=ei1aF0fEVsvpjYdrTGRIoksnUGuoh8ufAXAuJDYCA7dwTwLpOqEKYEE4qES9rzKIGG
         dAc5T/4pq14P1cWf+mW3HUbJTx60SPoECVxDqILl0z3pZ92OrExzmL2jQ6UGoJ5k2d8G
         AlGCghJc6KpFgjz76irMAEUZDb1rl2lbgbQ7V2L/15OVdts/WJ2VQON1UuwcGWGxiWNM
         Qa7uvGqXtPTSOwVxinX+z1i1rDLw55jIQtuO9GrXdYUGwf/alLuGYjF41VDJ6JQpB4E6
         M3aFLOtTZiP5f3d4hgYY0hEbH1QJIZ09S5TJRH4LdlLdhn4RT+lPKa7oiVQGDe5hjv/3
         CjuQ==
X-Gm-Message-State: AC+VfDzcwxGcWmc8NrZu1UzxcNP3o+MeRO1YuGKT2e09dHpcy60Z1X6x
        C71DA+O5aEZSZpQRAys6xR/KdMgscdLRD+4+EWvAEQhipPGK1yTZ6DEng03CfwNLbITuWMLFYf8
        R/PnvmU+QInU/WdRiFmHe23zI4rLMnFPaPQ==
X-Received: by 2002:a17:907:25cc:b0:94f:6218:191d with SMTP id ae12-20020a17090725cc00b0094f6218191dmr11871319ejc.32.1686652915837;
        Tue, 13 Jun 2023 03:41:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ649gXkCgdxRxAB5x48am3xL6yj+0ReYQgIhb6mbtLS6zRHULE7BFRMjEl/xK8VH+IPs/zLgg==
X-Received: by 2002:a17:907:25cc:b0:94f:6218:191d with SMTP id ae12-20020a17090725cc00b0094f6218191dmr11871305ejc.32.1686652915511;
        Tue, 13 Jun 2023 03:41:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ce23-20020a170906b25700b0097887b68c17sm6490324ejb.98.2023.06.13.03.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:41:54 -0700 (PDT)
Message-ID: <066c16a1-265f-e3f9-a8c9-25115aad9451@redhat.com>
Date:   Tue, 13 Jun 2023 12:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] platform/x86/dell/dell-rbtn: Fix resources leaking on
 error path
Content-Language: en-US, nl
To:     Michal Wilczynski <michal.wilczynski@intel.com>,
        linux-acpi@vger.kernel.org
Cc:     rafael@kernel.org, andriy.shevchenko@intel.com,
        ilpo.jarvinen@linux.intel.com, pali@kernel.org,
        markgross@kernel.org, fengguang.wu@intel.com,
        dvhart@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230613084310.2775896-1-michal.wilczynski@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230613084310.2775896-1-michal.wilczynski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/13/23 10:43, Michal Wilczynski wrote:
> Currently rbtn_add() in case of failure is leaking resources. Fix this
> by adding a proper rollback. Move devm_kzalloc() before rbtn_acquire(),
> so it doesn't require rollback in case of failure. While at it, remove
> unnecessary assignment of NULL to device->driver_data and unnecessary
> whitespace, plus add a break for the default case in a switch.
> 
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Fixes: 817a5cdb40c8 ("dell-rbtn: Dell Airplane Mode Switch driver")
> Signed-off-by: Michal Wilczynski <michal.wilczynski@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> ---
> v2:
>  - move devm_kzalloc before rbtn_acquire as suggested


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




>  drivers/platform/x86/dell/dell-rbtn.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-rbtn.c b/drivers/platform/x86/dell/dell-rbtn.c
> index aa0e6c907494..c8fcb537fd65 100644
> --- a/drivers/platform/x86/dell/dell-rbtn.c
> +++ b/drivers/platform/x86/dell/dell-rbtn.c
> @@ -395,16 +395,16 @@ static int rbtn_add(struct acpi_device *device)
>  		return -EINVAL;
>  	}
>  
> +	rbtn_data = devm_kzalloc(&device->dev, sizeof(*rbtn_data), GFP_KERNEL);
> +	if (!rbtn_data)
> +		return -ENOMEM;
> +
>  	ret = rbtn_acquire(device, true);
>  	if (ret < 0) {
>  		dev_err(&device->dev, "Cannot enable device\n");
>  		return ret;
>  	}
>  
> -	rbtn_data = devm_kzalloc(&device->dev, sizeof(*rbtn_data), GFP_KERNEL);
> -	if (!rbtn_data)
> -		return -ENOMEM;
> -
>  	rbtn_data->type = type;
>  	device->driver_data = rbtn_data;
>  
> @@ -420,10 +420,12 @@ static int rbtn_add(struct acpi_device *device)
>  		break;
>  	default:
>  		ret = -EINVAL;
> +		break;
>  	}
> +	if (ret)
> +		rbtn_acquire(device, false);
>  
>  	return ret;
> -
>  }
>  
>  static void rbtn_remove(struct acpi_device *device)
> @@ -442,7 +444,6 @@ static void rbtn_remove(struct acpi_device *device)
>  	}
>  
>  	rbtn_acquire(device, false);
> -	device->driver_data = NULL;
>  }
>  
>  static void rbtn_notify(struct acpi_device *device, u32 event)

