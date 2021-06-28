Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A6EC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:56:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EBD261584
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhF1J7C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23108 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230256AbhF1J7C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 05:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624874196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EDFS3CEJU5dreo6hNX0WrjPWKG3+DYOm4DLbLDT7TQQ=;
        b=bnhEsJR6eklP3YJ87RTHyaEOQnFM3rVH6foo5b4NZQk9qYofvsMJGiOvdbBI2aCmSCQRA3
        L7YaLhFehxeLt6gbZu/yySbMeVSlSX2MvDkBDExikPzQmsrBUP3wQgH2J5gAouJwo6Dfj5
        OEzb6jV/BBkfgRsfJClrrM/zu/errVM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-dAUbjQ9JNryUQhmil35e1Q-1; Mon, 28 Jun 2021 05:56:34 -0400
X-MC-Unique: dAUbjQ9JNryUQhmil35e1Q-1
Received: by mail-ej1-f70.google.com with SMTP id f8-20020a1709064dc8b02904996ccd94c0so4136688ejw.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 02:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EDFS3CEJU5dreo6hNX0WrjPWKG3+DYOm4DLbLDT7TQQ=;
        b=aUlRYgevwmKr+/plPHYiVd3tPkHPlj8qubCme7nr2ycQC36soRs8P0F0jhAJ36seiQ
         miC59kdaEODohHW7iZTdmh4Sj4+Lfq891LxA4TSWixHY080e7ZQuPFPmWtBsxQqnN2cQ
         gtFS29OXWrAqmp4Y+OKVrsqOookNsXov3lznP+GMgZxd7ueQbDzZE08DGN8ebGT1haEn
         GXG2ZdcOBRprR2LSRqjWY71cTVLO19H3GswVqoe/MQJSJ/bvHGMOaj4AEYnVCs+X8HTM
         lNbaoXIXeyl98rNWf6myZPbK/k2czmI967tvfrm8Poxs6mk1ASfw2IR0qOYlNk0h0wr7
         CM3Q==
X-Gm-Message-State: AOAM533PKxvGc3PfIxz0POeGVpac08YUCBuRfLErF0QFTuL4sg9b6kXV
        k1jFA5MJd0BKvsHKvfCbxcAzz7onXyjiUJmRmYVUGqFISMZb6TrvWEOrJMrw4YWoTyXxzTC/v0m
        RBBz+1OUG5OHwibuhly2QdigS0m8PJhjpKE+SD+JTmj/wxZ5naqFBLokPvWTDJRFTsX2pqL+pYx
        /LMmth68RgtA==
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr11112436edc.125.1624874193319;
        Mon, 28 Jun 2021 02:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPuN0gni3iTyE7wzy5NzS9zeGVa3z+uGg2XgjT7nW+FtH6XOSPIFZvQfeNQpvH9NSflo/aPQ==
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr11112394edc.125.1624874192952;
        Mon, 28 Jun 2021 02:56:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e28sm9311063edc.24.2021.06.28.02.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 02:56:32 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: think-lmi: Move
 kfree(setting->possible_values) to tlmi_attr_setting_release()
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210628095230.319726-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <15fcef87-5efc-0cab-9ef5-cd4ea2b26ea3@redhat.com>
Date:   Mon, 28 Jun 2021 11:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628095230.319726-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/28/21 11:52 AM, Hans de Goede wrote:
> We must not free the possible_values string before we have called
> sysfs_remove_group(kobj, &tlmi_attr_group) otherwise there is a race
> where a sysfs read of possible_values could reference the free-ed
> memory.
> 
> Move the kfree(setting->possible_values) together with the free of the
> actual tlmi_attr_setting struct to avoid this race.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've merged this into my review-hans branch.

Regards,

Hans


> ---
>  drivers/platform/x86/think-lmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 4cab341a3538..3671b5d20613 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -626,6 +626,7 @@ static void tlmi_attr_setting_release(struct kobject *kobj)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>  
> +	kfree(setting->possible_values);
>  	kfree(setting);
>  }
>  
> @@ -654,7 +655,6 @@ static void tlmi_release_attr(void)
>  	/* Attribute structures */
>  	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
>  		if (tlmi_priv.setting[i]) {
> -			kfree(tlmi_priv.setting[i]->possible_values);
>  			sysfs_remove_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
>  			kobject_put(&tlmi_priv.setting[i]->kobj);
>  		}
> 

