Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EADDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 15:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D633611CE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 15:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241441AbhI1PIA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 11:08:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51991 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241438AbhI1PIA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 11:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632841580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JutwIHPMterm2rMTiWjPlrXFqo8OkmzIcaHsda28WOk=;
        b=MBPTvKJrRPGOk7ywDcUJx/IJaUzKyrvvzuICQk1fC0FPTRVIYmoh8d32kFYzAQPqxj9AQ2
        QofjodQvaEFnEaAYDZWTiU27ZhKJXMUJu59kuSVFIWQTHs9zANtw6Ir4NaShHfnWkwtn10
        cpv1+Nc6LComi1nSNWJzGqcsRlbXmCQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-u-hUfvEpM8u4eAtHH25Rpw-1; Tue, 28 Sep 2021 11:06:19 -0400
X-MC-Unique: u-hUfvEpM8u4eAtHH25Rpw-1
Received: by mail-ed1-f70.google.com with SMTP id 1-20020a508741000000b003da559ba1eeso12100148edv.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 08:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JutwIHPMterm2rMTiWjPlrXFqo8OkmzIcaHsda28WOk=;
        b=SUyvd0Z9CQKx5xL2vjo/LCVwsWWLbQpklgCHVwCGFIYz6FiZbEXxekxWKJcJNafPog
         1cERlcTA5AoLydQ7F/mN2mb+aNMXs8Hh5RP6XQ6WYxRqzQSoDYa2zfooSRjGHYsVhSkS
         u8KWjNHvg0KeUKzkQGMeIJUYRHC0ff80NZUz46ag4f9/yccYBD+nPKd5xxgRDpvb1blR
         7Oh+5iZPLCxYBHx4zsqMhfu7jnBStoUWSAjGwFpSdwtVqTZvqqB3xsIfBhS4Wc/APVaN
         NqwP44+6o4Vln3SWSy902ln8zS7ADBDR4DNprueHT6JlYpb9ZnY8+R1U5tTS/nSXsHb2
         pzHQ==
X-Gm-Message-State: AOAM531Q54i13NtaRgeeRmGELtBCe0y4db68mf4+MRh5WLiZP1Oql752
        wlxam07MTz+mSwvFXkOqfcoVhUJSKfPwVbMluCmE6uPmjfjXYk9dk487C4a0PaBY28XNvMbdADe
        pwjEZxAjvXH28lyBnNuQaDZEZCRa/PBislw==
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr7449587ejb.5.1632841576965;
        Tue, 28 Sep 2021 08:06:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWDShWRgciNMRsVNYzBD+4v29McI2dz3Vr4HdCS/OwL0IFQ4yjfhQD6Aad5uRHGCkiZ6u70Q==
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr7449443ejb.5.1632841575151;
        Tue, 28 Sep 2021 08:06:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e13sm10650851eje.95.2021.09.28.08.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 08:06:14 -0700 (PDT)
Subject: Re: [PATCH v2] add platform support for Ideapad 5 Pro 16ACH6-82L5
To:     Kelly Anderson <kelly@xilka.com>, ike.pan@canonical.com,
        pobrn@protonmail.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        markpearson@lenovo.com
References: <11840239.O9o76ZdvQC@comer.internal>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f7f2c94-4144-0f74-d3f8-b675c92e10eb@redhat.com>
Date:   Tue, 28 Sep 2021 17:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <11840239.O9o76ZdvQC@comer.internal>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/26/21 6:39 AM, Kelly Anderson wrote:
> V2 - Addressed issues brought up by Barnabás Pőcze.
> 
> Adding support specifically for Ideapad 5 Pro 16ACH6-82L5 by adding a
> whitelist function that can validate notebooks for which dytc_version
> is less than 5, and seem to work fine at dytc_version 4. This code has
> been tested to work properly on the specified system.
> 
> Signed-off-by: Kelly Anderson <kelly@xilka.com>
> 
>  drivers/platform/x86/ideapad-laptop.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index e7a1299e3776..fc54f6ab614f 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -868,6 +868,18 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
>  	}
>  }
>  
> +static const struct dmi_system_id ideapad_dytc_v4_whitelist_table[] = {

Documentation/process/coding-style.rst chapter 4 "Naming" says:

"""
For symbol names and documentation, avoid introducing new usage of
'master / slave' (or 'slave' independent of 'master') and 'blacklist /
whitelist'.

Recommended replacements for 'master / slave' are:
    '{primary,main} / {secondary,replica,subordinate}'
    '{initiator,requester} / {target,responder}'
    '{controller,host} / {device,worker,proxy}'
    'leader / follower'
    'director / performer'

Recommended replacements for 'blacklist/whitelist' are:
    'denylist / allowlist'
    'blocklist / passlist'
"""

So I've done a s/whitelist/allow/ on your patch.


> +	{
> +		/* Ideapad 5 Pro 16ACH6 */
> +		.ident = "LENOVO 82L5",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82L5")
> +		}
> +	},
> +	{}
> +};
> +
>  static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  {
>  	int err, dytc_version;
> @@ -882,12 +894,20 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  		return err;
>  
>  	/* Check DYTC is enabled and supports mode setting */
> -	if (!test_bit(DYTC_QUERY_ENABLE_BIT, &output))
> +	if (!test_bit(DYTC_QUERY_ENABLE_BIT, &output)) {
> +		dev_info(&priv->platform_device->dev, "DYTC_QUERY_ENABLE_BIT returned false\n");
>  		return -ENODEV;
> +	}
>  
>  	dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
> -	if (dytc_version < 5)
> -		return -ENODEV;
> +
> +	if (dytc_version < 5) {
> +		if ( dytc_version < 4 || ! dmi_check_system(ideapad_dytc_v4_whitelist_table) ) {

There is a bunch of extra spaces here which go against the codingstyle, I've fixed this up
while applying this to my tree:

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





> +			dev_info(&priv->platform_device->dev,
> +				"DYTC_VERSION is less than 4 or is not whitelisted: %d\n", dytc_version);
> +			return -ENODEV;
> +		}
> +	}
>  
>  	priv->dytc = kzalloc(sizeof(*priv->dytc), GFP_KERNEL);
>  	if (!priv->dytc)
> 

