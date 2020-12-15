Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5526FC4361B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Dec 2020 13:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 080DA224BE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Dec 2020 13:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgLONp5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 08:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60666 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726844AbgLONpq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 08:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608039858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FZvZIljvuGMS5JiLRLoZAAoB2NVgta8ANHSgVSADM2w=;
        b=hfTTZ01iRj8CsUhI4+iS88g2yA8l7TPuBPIQBGRuLb3n0IkgvwLh1ZuBl1KDwtli5i6Yh8
        wnf+KGclGZdfQDryZcGrlBWK2e2l3bFD2A9E6hS3bHdppDgkGz2EcNarJYU55LjBMZUSlQ
        3YTteoG5C5HNQKzePI9UHZJ0fc1kzLg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-0aPJ3LVGNbm-KEVAEHrowg-1; Tue, 15 Dec 2020 08:44:16 -0500
X-MC-Unique: 0aPJ3LVGNbm-KEVAEHrowg-1
Received: by mail-ed1-f72.google.com with SMTP id c24so10009982edx.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Dec 2020 05:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FZvZIljvuGMS5JiLRLoZAAoB2NVgta8ANHSgVSADM2w=;
        b=WU2cAx2McYqaITqOyuLtl/qywXzFCodJW2Bo9owYRe5rGzYvSVt9dagkvpydR1cTH+
         wcindR+czGQUgyLhmZPlk03bel/By25QyY3Yk+E0OjKucTJCgUwBHGWWPmz+epfPzd8M
         l5GOv01ulXFSDeJaBL9H/Kb511pJXJQk5EyuKmrp0aohuYqqzlbWHff/XSv3j8k3/mb8
         IFh+uHhyHb+2PYEGtHQpVFlJg7kEfdHUVmXmpacyxlT2ChCuIpd/eRjFAcdEIeayoFrM
         RLbkrM4zVOp/WsOUHFCkNzTed7OQZypsbrDsvzhsF2D5wzfBPgox3Zf0ds+r3tlWflyg
         AqYw==
X-Gm-Message-State: AOAM5332KdEJZ00VVR1+MJ0JTSCeq2rP7v5XxDfrgcaETL7ejoRzbW6Y
        n6jbD48YAzmDb9Cyg2qtpKBxsSu/a/uXXRJvzxHThLLxWzCGxE0CXlltNOj07cV6eDQqfzO9T7g
        9XTwaD7wZWrRuzcSxIjWrJ1CyNceWkG72PhIt7YylG9bikXPSPijnah3Tqr7f13UP+bWoFP/Kep
        9QA/At7RXOLA==
X-Received: by 2002:a05:6402:687:: with SMTP id f7mr29332898edy.314.1608039854177;
        Tue, 15 Dec 2020 05:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYMrvfMMJJXiaXhI5zAiadSb5jkBcN0x8yEg5+AwXc+BYgHqS7HZuF1pB+QcOqJ6wnslaV5Q==
X-Received: by 2002:a05:6402:687:: with SMTP id f7mr29332871edy.314.1608039853782;
        Tue, 15 Dec 2020 05:44:13 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id p24sm15508659edr.65.2020.12.15.05.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 05:44:13 -0800 (PST)
Subject: Re: [PATCH v2 3/9] platform/surface: aggregator: Add event item
 allocation caching
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Bla=c5=be_Hrastn?= =?UTF-8?Q?ik?= <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        platform-driver-x86@vger.kernel.org
References: <20201203212640.663931-1-luzmaximilian@gmail.com>
 <20201203212640.663931-4-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <979fd103-aaf7-13cf-296f-cb9b30627bdd@redhat.com>
Date:   Tue, 15 Dec 2020 14:44:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203212640.663931-4-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/3/20 10:26 PM, Maximilian Luz wrote:
> Event items are used for completing Surface Aggregator EC events, i.e.
> placing event command data and payload on a workqueue for later
> processing to avoid doing said processing directly on the receiver
> thread. This means that event items are allocated for each incoming
> event, regardless of that event being transmitted via sequenced or
> unsequenced packets.
> 
> On the Surface Book 3 and Surface Laptop 3, touchpad HID input events
> (unsequenced), can constitute a larger amount of traffic, and therefore
> allocation of event items. This warrants caching event items to reduce
> memory fragmentation. The size of the cached objects is specifically
> tuned to accommodate keyboard and touchpad input events and their
> payloads on those devices. As a result, this effectively also covers
> most other event types. In case of a larger event payload, event item
> allocation will fall back to kzalloc().
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  .../platform/surface/aggregator/controller.c  | 86 +++++++++++++++++--
>  .../platform/surface/aggregator/controller.h  |  9 ++
>  drivers/platform/surface/aggregator/core.c    | 16 +++-
>  3 files changed, 101 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 8d9811cc2943..89ffd8e45787 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -514,14 +514,74 @@ static void ssam_nf_destroy(struct ssam_nf *nf)
>   */
>  #define SSAM_CPLT_WQ_BATCH	10
> 
> +/*
> + * SSAM_EVENT_ITEM_CACHE_PAYLOAD_LEN - Maximum payload length for a cached
> + * &struct ssam_event_item.
> + *
> + * This length has been chosen to be accommodate standard touchpad and
> + * keyboard input events. Events with larger payloads will be allocated
> + * separately.
> + */
> +#define SSAM_EVENT_ITEM_CACHE_PAYLOAD_LEN	32
> +
> +static struct kmem_cache *ssam_event_item_cache;
> +
> +/**
> + * ssam_event_item_cache_init() - Initialize the event item cache.
> + */
> +int ssam_event_item_cache_init(void)
> +{
> +	const unsigned int size = sizeof(struct ssam_event_item)
> +				  + SSAM_EVENT_ITEM_CACHE_PAYLOAD_LEN;
> +	const unsigned int align = __alignof__(struct ssam_event_item);
> +	struct kmem_cache *cache;
> +
> +	cache = kmem_cache_create("ssam_event_item", size, align, 0, NULL);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	ssam_event_item_cache = cache;
> +	return 0;
> +}
> +
> +/**
> + * ssam_event_item_cache_destroy() - Deinitialize the event item cache.
> + */
> +void ssam_event_item_cache_destroy(void)
> +{
> +	kmem_cache_destroy(ssam_event_item_cache);
> +	ssam_event_item_cache = NULL;
> +}
> +
> +static void __ssam_event_item_free_cached(struct ssam_event_item *item)
> +{
> +	kmem_cache_free(ssam_event_item_cache, item);
> +}
> +
> +static void __ssam_event_item_free_generic(struct ssam_event_item *item)
> +{
> +	kfree(item);
> +}
> +
> +/**
> + * ssam_event_item_free() - Free the provided event item.
> + * @item: The event item to free.
> + */
> +static void ssam_event_item_free(struct ssam_event_item *item)
> +{
> +	item->ops.free(item);
> +}
> +
>  /**
>   * ssam_event_item_alloc() - Allocate an event item with the given payload size.
>   * @len:   The event payload length.
>   * @flags: The flags used for allocation.
>   *
> - * Allocate an event item with the given payload size. Sets the item
> - * operations and payload length values. The item free callback (``ops.free``)
> - * should not be overwritten after this call.
> + * Allocate an event item with the given payload size, preferring allocation
> + * from the event item cache if the payload is small enough (i.e. smaller than
> + * %SSAM_EVENT_ITEM_CACHE_PAYLOAD_LEN). Sets the item operations and payload
> + * length values. The item free callback (``ops.free``) should not be
> + * overwritten after this call.
>   *
>   * Return: Returns the newly allocated event item.
>   */
> @@ -529,9 +589,19 @@ static struct ssam_event_item *ssam_event_item_alloc(size_t len, gfp_t flags)
>  {
>  	struct ssam_event_item *item;
> 
> -	item = kzalloc(struct_size(item, event.data, len), flags);
> -	if (!item)
> -		return NULL;
> +	if (len <= SSAM_EVENT_ITEM_CACHE_PAYLOAD_LEN) {
> +		item = kmem_cache_alloc(ssam_event_item_cache, flags);
> +		if (!item)
> +			return NULL;
> +
> +		item->ops.free = __ssam_event_item_free_cached;
> +	} else {
> +		item = kzalloc(struct_size(item, event.data, len), flags);
> +		if (!item)
> +			return NULL;
> +
> +		item->ops.free = __ssam_event_item_free_generic;
> +	}
> 
>  	item->event.length = len;
>  	return item;
> @@ -693,7 +763,7 @@ static void ssam_event_queue_work_fn(struct work_struct *work)
>  			return;
> 
>  		ssam_nf_call(nf, dev, item->rqid, &item->event);
> -		kfree(item);
> +		ssam_event_item_free(item);
>  	} while (--iterations);
> 
>  	if (!ssam_event_queue_is_empty(queue))
> @@ -893,7 +963,7 @@ static void ssam_handle_event(struct ssh_rtl *rtl,
>  	memcpy(&item->event.data[0], data->ptr, data->len);
> 
>  	if (WARN_ON(ssam_cplt_submit_event(&ctrl->cplt, item)))
> -		kfree(item);
> +		ssam_event_item_free(item);
>  }
> 
>  static const struct ssh_rtl_ops ssam_rtl_ops = {
> diff --git a/drivers/platform/surface/aggregator/controller.h b/drivers/platform/surface/aggregator/controller.h
> index 5ee9e966f1d7..8297d34e7489 100644
> --- a/drivers/platform/surface/aggregator/controller.h
> +++ b/drivers/platform/surface/aggregator/controller.h
> @@ -80,12 +80,18 @@ struct ssam_cplt;
>   * struct ssam_event_item - Struct for event queuing and completion.
>   * @node:     The node in the queue.
>   * @rqid:     The request ID of the event.
> + * @ops:      Instance specific functions.
> + * @ops.free: Callback for freeing this event item.
>   * @event:    Actual event data.
>   */
>  struct ssam_event_item {
>  	struct list_head node;
>  	u16 rqid;
> 
> +	struct {
> +		void (*free)(struct ssam_event_item *event);
> +	} ops;
> +
>  	struct ssam_event event;	/* must be last */
>  };
> 
> @@ -273,4 +279,7 @@ int ssam_ctrl_notif_d0_entry(struct ssam_controller *ctrl);
>  int ssam_controller_suspend(struct ssam_controller *ctrl);
>  int ssam_controller_resume(struct ssam_controller *ctrl);
> 
> +int ssam_event_item_cache_init(void);
> +void ssam_event_item_cache_destroy(void);
> +
>  #endif /* _SURFACE_AGGREGATOR_CONTROLLER_H */
> diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
> index 77bc4c87541b..1a53d7ce66a1 100644
> --- a/drivers/platform/surface/aggregator/core.c
> +++ b/drivers/platform/surface/aggregator/core.c
> @@ -784,12 +784,23 @@ static int __init ssam_core_init(void)
> 
>  	status = ssh_ctrl_packet_cache_init();
>  	if (status)
> -		return status;
> +		goto err_cpkg;
> +
> +	status = ssam_event_item_cache_init();
> +	if (status)
> +		goto err_evitem;
> 
>  	status = serdev_device_driver_register(&ssam_serial_hub);
>  	if (status)
> -		ssh_ctrl_packet_cache_destroy();
> +		goto err_register;
> 
> +	return 0;
> +
> +err_register:
> +	ssam_event_item_cache_destroy();
> +err_evitem:
> +	ssh_ctrl_packet_cache_destroy();
> +err_cpkg:
>  	return status;
>  }
>  module_init(ssam_core_init);
> @@ -797,6 +808,7 @@ module_init(ssam_core_init);
>  static void __exit ssam_core_exit(void)
>  {
>  	serdev_device_driver_unregister(&ssam_serial_hub);
> +	ssam_event_item_cache_destroy();
>  	ssh_ctrl_packet_cache_destroy();
>  }
>  module_exit(ssam_core_exit);
> --
> 2.29.2
> 

