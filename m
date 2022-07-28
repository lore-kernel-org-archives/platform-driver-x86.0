Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28E7C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbiG1Rqs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiG1Rqr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:46:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 273F113D1B
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659030404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tFXcnM00tdZf0rjJx1mtStMQPBmZiMGjklKuiEkxJus=;
        b=IPs2rjsEwKZM7Q350jPb+hFReO+630oXWnLDtiwc2W/l/jtf+DBZaxrMfipBrvGdI4Dtaw
        F0HPqELg/GLEKbSkKYoGYio4pwxxLT+yEnhZFDOwSl2bEkVZfyqaQfafY63ThOZD5lY/tv
        WghrVTn+ijYWbce43fSwE7ZERqC8KfM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-_KKGpS7HOAy7oLYrTgRYKQ-1; Thu, 28 Jul 2022 13:46:43 -0400
X-MC-Unique: _KKGpS7HOAy7oLYrTgRYKQ-1
Received: by mail-ed1-f71.google.com with SMTP id o2-20020a056402438200b0043ccb3ed7dfso1540529edc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tFXcnM00tdZf0rjJx1mtStMQPBmZiMGjklKuiEkxJus=;
        b=4DdBWP+rIfH+SwB2nylAGMuwJ+1cxGrW6D71gQA/z2tnAMgf+PQKtCY+dH1ywnFkGZ
         j5gPiJ6mXgY8p6vAsfszkK6OAUAFoGXEXSu0mw9JmyM87+bfio+K2NjefS0etM4jOLv8
         BCX5/GqhZagKVtpu4T+dF3GaVT5dpYZLnv1gNNr0S8IwoUeZ1GPHmQKuIfc89ctks6Iy
         y0RnhnGVD9zZsvOhj05mON/mE6s5UDAaOeXpfhdRkQb6GQKnH4TQXYdc0lLSdZ2ceF+h
         PF9S2WPGOzbsCm2EkEmoeRG9Vu1Z+Cr7YTw/Y9Peb2B4j2xRHi24GDnPkDxHS9aM53Fr
         dL/g==
X-Gm-Message-State: AJIora+nczPv0UvDdzJlH9HxqAoMgxW/ae8XynJCmGgqdJYMuYNDRdlV
        ywRT4V2dj63CSpwouploWy3Aq9XK1KHunDx5rw+WvaXUcVkbcvpN6Vh+Z5P4cA267M5ZdI532tx
        FnLPL8GljRVjiA7XFVELZBdoV6SwwHG6dVg==
X-Received: by 2002:a05:6402:239a:b0:43b:c72a:fa4d with SMTP id j26-20020a056402239a00b0043bc72afa4dmr46611eda.389.1659030401856;
        Thu, 28 Jul 2022 10:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u49VT3+GTRXI7w3SxUpS2JLAtvjaRUF2yqr5qKmwGTjqRrXo/xDNiGMW5XG6QoF+TZxGh9Iw==
X-Received: by 2002:a05:6402:239a:b0:43b:c72a:fa4d with SMTP id j26-20020a056402239a00b0043bc72afa4dmr46585eda.389.1659030401385;
        Thu, 28 Jul 2022 10:46:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b0043a4de1d421sm1045006eds.84.2022.07.28.10.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 10:46:40 -0700 (PDT)
Message-ID: <81fae6a4-4859-bc15-4edc-2c4df953cc12@redhat.com>
Date:   Thu, 28 Jul 2022 19:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mark Pearson <markpearson@lenovo.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
 <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
 <d01e52cb-31c5-7d20-4f18-1e4bb70c1355@amd.com>
 <828a7b8e-2375-a9d0-7b00-d59e84cfaa2b@redhat.com>
 <5500e911-22eb-08b3-c3fe-2a63cf22d7b8@amd.com>
 <ce75f2cc-0129-84f5-bbab-dae5ed9a7ea9@redhat.com>
 <f351a921-3b7f-d8c9-10e5-816f83f22775@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f351a921-3b7f-d8c9-10e5-816f83f22775@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 16:38, Limonciello, Mario wrote:
> 
>>>> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>>>>      will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>>>>      stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>>>>      the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>>>>      by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>>>>      register its platform_profile support. We cannot rely on module ordering ensuring
>>>>      that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>>>>      since there are no module load ordering guarantees.
>>>
>>> This was my thought initially too while this was being developed, but actually there is some nuance here that is non-obvious.  The platform profile registering code in amd-pmf will examine bits set in the BIOS to decide whether or not to export platform profile support.  In Lenovo platforms that support thinkpad_acpi these bits are not set.  So platform profile support ONLY comes from thinkpad-acpi in those platforms.
>>
>> Right, Shyam mentioned this in another part of the thread. As I
>> mentioned there IHMO it would still be good to check this in the driver
>> though. To catch cases where a BIOS for some reasons advertises an
>> unexpected combination of features.
>>
>>>> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>>>>      enable AMT and then the periodically run workqueue function from amd-pmf
>>>>      will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>>>>      set to low-power or performance. Should the amd-pmf code then apply the static
>>>>      slider settings for low-power/performance which it has read from the ACPI
>>>>      tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
>>>>
>>>
>>> When thinkpad_acpi changes platform profile then a BIOS event goes through and amd-pmf receives that and will run based on the event.
>>
>> Hmm, I don't remember seeing anything for this in the patches. Actually this
>> reminds me that the code should probably reschedule (using mod_delayed_work)
>> the work to run immediately after a BIOS event, rather then waiting for
>> the next normally scheduled run.
>>
>> But even then I don't remember seeing any code related to catching
>> platform-profile changes done outside amd-pmf... ?
> 
> It's not a platform profile change - it's an ACPI event.
> 
> When a user changes a platform profile then thinkpad_acpi will see whether it's balanced or not.  When changing to/from balanced thinkpad_acpi sends an AMT event.  amd-pmf reacts to said AMT event.
> 
> This is the code you're looking for (in this specific patch):
> 
> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> +{
> +    struct amd_pmf_dev *pmf_dev = data;
> +    struct apmf_if *apmf_if = pmf_dev->apmf_if;
> +    int ret;
> +
> +    if (apmf_if->func.sbios_requests) {
> +        struct apmf_sbios_req req;
> +
> +        ret = apmf_get_sbios_requests(apmf_if, &req);
> +        if (ret) {
> +            dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
> +            return;
> +        }
> +        if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
> +            pr_debug("PMF: AMT is supported and notifications %s\n",
> +                 req.amt_event ? "Enabled" : "Disabled");
> +            if (req.amt_event)
> +                pmf_dev->is_amt_event = true;
> +            else
> +                pmf_dev->is_amt_event = !!req.amt_event;
> +        }
> +
> +        if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
> +            pr_debug("PMF: CQL is supported and notifications %s\n",
> +                 req.cql_event ? "Enabled" : "Disabled");
> +            if (req.cql_event)
> +                pmf_dev->is_cql_event = true;
> +            else
> +                pmf_dev->is_cql_event = !!req.cql_event;
> +
> +            /* update the target mode information */
> +            amd_pmf_update_2_cql(pmf_dev);
> +        }
> +    }
> +}
> +

Right this is the AMT on/off path that bit I understand.
This happens when switching to / away from balanced mode.

My question is what does the equivalent of these lines:

+		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
+		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
+				 config_store.prop[src][idx].sppt_apu_only, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+				 config_store.prop[src][idx].stt_min, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);

When the profile is switched (by userspace, or through the hotkeys on
the laptop) to low-power or to performance mode ?

Regards,

Hans

