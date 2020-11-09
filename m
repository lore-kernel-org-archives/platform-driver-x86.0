Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CC5C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 937CE206B6
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXR1ksL2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgKILjw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38928 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727311AbgKILjv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 06:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604921989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zJ/pm1Rhq+SYw3pOc2hg4U2clmldd5giIwp8gvaCfKs=;
        b=PXR1ksL2hLH2Ieyb7EZuD9K9gXpDJtpHY+/qUqwkY50XomDugxJL9ufV+ptlS5tOdQrMr+
        cbczQcCMJVhFZc2SbUIkqNfIcwnHOgddvNYwqT8tJKBETWHbLdTOUT8nogMTbWSzx0G3xK
        fXoMbXD0H/JbDz37zcsQBBtnN83Dwqo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-67DxWcavNCGGhvHpmtKO3w-1; Mon, 09 Nov 2020 06:39:48 -0500
X-MC-Unique: 67DxWcavNCGGhvHpmtKO3w-1
Received: by mail-ed1-f69.google.com with SMTP id v7so2626240edy.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 03:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zJ/pm1Rhq+SYw3pOc2hg4U2clmldd5giIwp8gvaCfKs=;
        b=a7S/yquwV2aluz6pi0+HKfINWKK72m7ei7WmGrn/wTRPTKbk+23L+TxxnIzrfMIb4t
         6cH/Lz14WG/vGE0adCksZUM3kmMaNwn9ZpzZM0lWsoPiUir+h8mLU1xPt6swkWkVx763
         MSEk4mmEyRfYBnFhebtS5rkyL0UonmLRfNSzZaQCj4s/GPyW9RVEIXOOlNGrjbinpqWF
         0TUCARv+Ij38FO4vp3L1x39Rf3rAgaboNrWvY1bIKWA4cUSBZiwaPKlDq0U+7n6uki8Z
         GznNyw1KNZ8n5UJ8h9yPdhMilc60JwTnwHdKdSpUPB0Fm3qQZD18tvLVKlO39xYhJIfC
         kGtQ==
X-Gm-Message-State: AOAM5310ToJPugb572uUhUIYY05PNS2FgYPj4v8ynqbW7b2gEcv/Uw94
        YUmTglsrf8+f+Q7ySwJYlVW0WC4F52+vZRrFHBiHg0YMQgjedi62BTIrMVHOJ+CAeRh3MWdh+Vf
        f9W1swbEF40bxIibVa18OU83xtXJ6vE0KVg==
X-Received: by 2002:aa7:c313:: with SMTP id l19mr10108778edq.293.1604921986441;
        Mon, 09 Nov 2020 03:39:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXrKZQh1DPx2ic97TeTmJswtuX1LtBaBGo1Y39UsyClRRZ6OuMg/ZY84UzgVrFRir2n5spxA==
X-Received: by 2002:aa7:c313:: with SMTP id l19mr10108769edq.293.1604921986274;
        Mon, 09 Nov 2020 03:39:46 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id f24sm8681238edx.90.2020.11.09.03.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 03:39:45 -0800 (PST)
Subject: Re: [PATCH v1 3/4] platform/x86: i2c-multi-instantiate: Make number
 of clients unsigned
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
 <20201105110530.27888-3-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f1ca37a0-85db-0edd-7f4c-14143254ebfe@redhat.com>
Date:   Mon, 9 Nov 2020 12:39:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105110530.27888-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/20 12:05 PM, Andy Shevchenko wrote:
> There is no need to use signed type for number of clients. Moreover,
> it's cleaner to show that we never go negative there.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I'm not a big fan of this change, it feels like needless churn to me.

Integers are signed by default and just because a value cannot become
negative is not really a reason to make it unsigned. E.g. your typical
"int i" is often used as an array index so it cannot go negative, still
it almost always is an "int i" not an "unsigned int i".

IMHO good reasons for deviating from the default signedness and
making a value unsigned are:

1. Because the value cannot go negative and we need more range.
2. To avoid sign-extension when upcasting it to a larger integer type.

Neither is the case here.

I do like the other 3 patches, thank you for those. I'm going to wait
a bit with applying them though, to see where things go with the
"[RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated i2c-clients"

Merging them now may get in the way with merging that series if
Wolfram wants to pick up the entire series (since it also involves
an i2c-core change).

Regards,

Hans




> ---
>  drivers/platform/x86/i2c-multi-instantiate.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index ce4d921c3301..422fa88da643 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.cHi,
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -27,7 +27,7 @@ struct i2c_inst_data {
>  };
>  
>  struct i2c_multi_inst_data {
> -	int num_clients;
> +	unsigned int num_clients;
>  	struct i2c_client *clients[];
>  };
>  
> @@ -64,8 +64,9 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  	struct i2c_board_info board_info = {};
>  	struct device *dev = &pdev->dev;
>  	struct acpi_device *adev;
> +	unsigned int i;
>  	char name[32];
> -	int i, ret;
> +	int ret;
>  
>  	match = acpi_match_device(dev->driver->acpi_match_table, dev);
>  	if (!match) {
> @@ -90,7 +91,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  	for (i = 0; i < multi->num_clients && inst_data[i].type; i++) {
>  		memset(&board_info, 0, sizeof(board_info));
>  		strlcpy(board_info.type, inst_data[i].type, I2C_NAME_SIZE);
> -		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
> +		snprintf(name, sizeof(name), "%s-%s.%u", dev_name(dev),
>  			 inst_data[i].type, i);
>  		board_info.dev_name = name;
>  		switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
> @@ -119,12 +120,12 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  		multi->clients[i] = i2c_acpi_new_device(dev, i, &board_info);
>  		if (IS_ERR(multi->clients[i])) {
>  			ret = dev_err_probe(dev, PTR_ERR(multi->clients[i]),
> -					    "Error creating i2c-client, idx %d\n", i);
> +					    "Error creating i2c-client, idx %u\n", i);
>  			goto error;
>  		}
>  	}
>  	if (i < multi->num_clients) {
> -		dev_err(dev, "Error finding driver, idx %d\n", i);
> +		dev_err(dev, "Error finding driver, idx %u\n", i);
>  		ret = -ENODEV;
>  		goto error;
>  	}
> @@ -133,7 +134,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error:
> -	while (--i >= 0)
> +	while (i--)
>  		i2c_unregister_device(multi->clients[i]);
>  
>  	return ret;
> @@ -142,7 +143,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  static int i2c_multi_inst_remove(struct platform_device *pdev)
>  {
>  	struct i2c_multi_inst_data *multi = platform_get_drvdata(pdev);
> -	int i;
> +	unsigned int i;
>  
>  	for (i = 0; i < multi->num_clients; i++)
>  		i2c_unregister_device(multi->clients[i]);
> 

