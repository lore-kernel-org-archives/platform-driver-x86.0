Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B723C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 12:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjCVMmD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 08:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjCVMmC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 08:42:02 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6997C4D603
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 05:42:01 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso11390197wmq.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679488920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IpH05cMxjPhntoGosiFZbtHRUGYys2kuv27LTgTdH2E=;
        b=nqXJvxGYk2onooHHIZAhnCxK8dbnxusOD9y6TME9fV1IRrs+S/2ivosq1AO7w2RHEg
         5Tlwcn4wp/2MU+S3um1Sg0rMzkKdrEyYaweE4+aQA9DXpolKAj+I4NyAfZX1BFMtbItP
         /OZB02J4+lrvT1Jhf+YWT5mEIVcB0BAKfj/THHnqE0fBYzauJCv24jk8nbYxn2cVprYT
         fCRI2tkkI6KXFHdp+d5n3vECVY3qLGbKRepz2Z+Ks2TZcsrcYhzN4aGv38i2csvGCfu5
         OnMK6h5Rt2T+8CJZv65OXPpl96ZUl17Tdvg8iQ2ELLCXfCmO7feIUswblrWDSPdxZ4VN
         CwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679488920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpH05cMxjPhntoGosiFZbtHRUGYys2kuv27LTgTdH2E=;
        b=W7H0I20K1Mw7hsco6mdWpJ1xGfYw56FhHfkH3HmzbUojuvGA5oeJZk/FY9D619QiLS
         Qda82gkB8Dd/pbrm8qs/PtzrcW/0BZJEUyHW5puVwhghBTeE1Fa8OkaMQpSBZqfHg5u9
         d4Icn6Tx9Soa1/X8Ig46ow9Lv7TkFM9TPw7kuKbzFxAxagib86E7AArHBXdhN8RoQ+T7
         Eh8udvqZfdn1HJroyQo+0r5wfat6TkLf4l4Drm0HCUHfa/pbGmRUM2R7leoE0LLAbMZk
         mbVe4u9BW9+HWQgPmmEZE2+h/9Hptcs4Q6vgw0CpwLLEVwXQEznE4o1LuINrYzpEp1Mq
         vv7Q==
X-Gm-Message-State: AO0yUKV9VUoiFcd3ILr7Gxspg0l/HvsgbM+bNxsWTTe5HbqkE9MIdtNi
        AuGbB2nLiF/bMOJo+pTtOd0lm5l9KqI=
X-Google-Smtp-Source: AK7set8YnIqVAurinZxyZbJWL64koShhZMMFz3RMeNzWdHyVXpHdz+2BoSZDLBaevSwA5lEuOza0NQ==
X-Received: by 2002:a7b:c7c4:0:b0:3ea:ed4d:38f6 with SMTP id z4-20020a7bc7c4000000b003eaed4d38f6mr5255279wmk.4.1679488919780;
        Wed, 22 Mar 2023 05:41:59 -0700 (PDT)
Received: from [10.26.0.5] ([194.126.177.81])
        by smtp.gmail.com with ESMTPSA id n1-20020a7bc5c1000000b003db03725e86sm16922505wmk.8.2023.03.22.05.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 05:41:59 -0700 (PDT)
Message-ID: <9c417628-f110-97e4-ff3e-4a835a0b0b27@gmail.com>
Date:   Wed, 22 Mar 2023 13:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] platform/surface: aggregator: Add missing
 fwnode_handle_put()
To:     Liang He <windhl@126.com>, hdegoede@redhat.com,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <20230322033057.1855741-1-windhl@126.com>
Content-Language: en-US
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230322033057.1855741-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 3/22/23 04:30, Liang He wrote:
> In fwnode_for_each_child_node(), we should add
> fwnode_handle_put() when break out of the iteration
> fwnode_for_each_child_node() as it will automatically
> increase and decrease the refcounter.
> 
> Fixes: fc622b3d36e6 ("platform/surface: Set up Surface Aggregator device registry")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   drivers/platform/surface/aggregator/bus.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
> index de539938896e..b501a79f2a08 100644
> --- a/drivers/platform/surface/aggregator/bus.c
> +++ b/drivers/platform/surface/aggregator/bus.c
> @@ -485,8 +485,10 @@ int __ssam_register_clients(struct device *parent, struct ssam_controller *ctrl,
>   		 * device, so ignore it and continue with the next one.
>   		 */
>   		status = ssam_add_client_device(parent, ctrl, child);
> -		if (status && status != -ENODEV)
> +		if (status && status != -ENODEV) {
> +			fwnode_handle_put(child);
>   			goto err;
> +		}
>   	}
>   
>   	return 0;

Thanks for spotting this.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
