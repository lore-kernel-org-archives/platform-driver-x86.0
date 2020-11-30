Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DABC64E7B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Nov 2020 13:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5306620855
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Nov 2020 13:32:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRaBNsEk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgK3NcP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Nov 2020 08:32:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43567 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725859AbgK3NcO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Nov 2020 08:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606743048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uFI50pysPtLDcbBO0F/EBWr/g7sPZm/GGocK9h6QMHo=;
        b=eRaBNsEkJHgOKr37kBlcnL+LwHuAN+0UeYdz/WiYI/M/elB5csiLS9vkn/Nl7e+TUXd2yF
        4Odug9jVSRNNglljY7Qfvp62sjMuN/n+LlY9IzY62tdwQ7zfXtwDWtZPfPSpPk3CeLWMCS
        ZlDp4zT2ypJhaxV3fXdA6tWZj3f+wGc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-SaCMKQ1_NLS7-unSwKaj2Q-1; Mon, 30 Nov 2020 08:30:46 -0500
X-MC-Unique: SaCMKQ1_NLS7-unSwKaj2Q-1
Received: by mail-ed1-f69.google.com with SMTP id g13so284406eds.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Nov 2020 05:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uFI50pysPtLDcbBO0F/EBWr/g7sPZm/GGocK9h6QMHo=;
        b=dLlatDxuDkN5t82QM/5aePSGb0jmIPfqa0Mq6WopNBRwWbgMuN4no2E5l52Il30NBv
         +/kIgTO/UmKnJrcj82Ow60NZoo9wr6XFbEWfj/T/XwUws5HTpS7i6mkg4xy1nnFb6XQv
         G2IM454m9B0UxprSsZYJM7lFNELOBYEG7tFwTl2lTFTbiKIR1iBuNrnBGGr5zovKpKWK
         oOT0882+NTMYIgnmrBCI9xsCYsYBtDvwPQYoZ3jPRJJEWpYQwfqkK81tbmmbcIyUSvGq
         FofWaUqBv5JhjvCkC9C8pHpl9byNw2iq42kYecg+5SNS2924VUKVw+ENFERCcpaJY6gm
         ls8g==
X-Gm-Message-State: AOAM532IAhJJ8AV7I710mzdP+aNA+4Zu1uNC9wm+vSRvjIJ/8u2lGPAP
        gWZgdVaj81PlXFiJZfEJhUV7BUv2f7QLnNq1QBAkggECx2oDEDYEtlfsspCi/gu+f9d5eYShRxA
        q5jeSCWzCtfkSNYWfz0w9cJJF8ZglrnsMGg==
X-Received: by 2002:a17:906:b847:: with SMTP id ga7mr21231461ejb.200.1606743044503;
        Mon, 30 Nov 2020 05:30:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWfrETdz0fyA5rejX4p0uGY0CZmUOqPJZp556YEBoJVQ1EwdC/eVxo5hjPz4wNn2qj8edhxQ==
X-Received: by 2002:a17:906:b847:: with SMTP id ga7mr21231226ejb.200.1606743041998;
        Mon, 30 Nov 2020 05:30:41 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id da9sm433255edb.13.2020.11.30.05.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:30:41 -0800 (PST)
Subject: Re: [PATCH -next] x86/platform/uv: Mark some symbols with static
 keyword
To:     Zou Wei <zou_wei@huawei.com>, justin.ernst@hpe.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org
References: <1606734713-43919-1-git-send-email-zou_wei@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <55abc980-2493-5c29-da80-4bb1446fa37d@redhat.com>
Date:   Mon, 30 Nov 2020 14:30:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1606734713-43919-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

+Cc x86 folks

On 11/30/20 12:11 PM, Zou Wei wrote:
> Fix the following sparse warnings:
> 
> drivers/platform/x86/uv_sysfs.c:22:13: warning: symbol 'uv_pcibus_kset' was not declared. Should it be static?
> drivers/platform/x86/uv_sysfs.c:23:13: warning: symbol 'uv_hubs_kset' was not declared. Should it be static?
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Since this is a fix to a series merged through the x86/tip tree, this should be merged
to the x86/tip tree too (or I can pick it up after 5.11-rc1).

Here is my ack for merging this through the x86/tip tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/uv_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
> index 54c3425..c780a4b 100644
> --- a/drivers/platform/x86/uv_sysfs.c
> +++ b/drivers/platform/x86/uv_sysfs.c
> @@ -19,8 +19,8 @@
>  #define INVALID_CNODE -1
>  
>  struct kobject *sgi_uv_kobj;
> -struct kset *uv_pcibus_kset;
> -struct kset *uv_hubs_kset;
> +static struct kset *uv_pcibus_kset;
> +static struct kset *uv_hubs_kset;
>  static struct uv_bios_hub_info *hub_buf;
>  static struct uv_bios_port_info **port_buf;
>  static struct uv_hub **uv_hubs;
> 

