Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F88AC19F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 14:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiG1OKZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 10:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbiG1OJ6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 10:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A81865D48
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659017379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R8tNJGpRUVa+0RVoHaY4CpXMCjo372fNVq0qXBMnG+s=;
        b=YUNcOjd0M/HEiQ0rGuaJzfizvYdQh4bS4kriCm8LSujCfRZnNmDWqGnK5xfWR3N14I3YgS
        es88GAwshDnRwsuS1l+uxsua04met2iSP5KvYZsmxJLgGO1hxhqGtBz4oiWT0m7xUTgRZu
        Zv/VXW1oJG7mUAbEnwXOvJDrtsWrH4I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-dhquUhVvMdOIl8HBIboFrA-1; Thu, 28 Jul 2022 10:09:37 -0400
X-MC-Unique: dhquUhVvMdOIl8HBIboFrA-1
Received: by mail-ed1-f72.google.com with SMTP id v9-20020a056402348900b0043bcd680e50so1159325edc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 07:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R8tNJGpRUVa+0RVoHaY4CpXMCjo372fNVq0qXBMnG+s=;
        b=Uib3DEPIRah6LGjFId2kYirx/sqsBqRROJxm5Kz5xYwBGjxdsoVGdJNNmkjjC5zMgm
         2RMh1rloaCQADvlsDgMNOUoX1n3B5rVx4EwUozCPyCQkXy+/TamHM3elnQIww8c67Z6m
         /Kbvd6vn+X1zoZ5VxhAJ3t59gI/8nQwL4Ir3xrQY5I/kst32+AjtpccMaoY5rO9HENBM
         4CTomcwNfooIVc09mseDFbwmks7HfIjjxSCVG6sF5kTzlFeBb9Iq3viZu4MwI60h6Vn7
         Qk/2IJ7OCYXPwOeNZjpAAlmTGat9x/swx2UrmYa8EW/0ppyLqZPb7OvrhT86hPlcvdop
         +ZjQ==
X-Gm-Message-State: AJIora+86au2b2YMKIxWIVukc3oE3L19BdCBRV9dND5qPzxDempIlhHZ
        DxgaZEl8tmeiOvOS4qbj0odGpVDa6olLdMzQxzw7KnmIr2eTYqTqCJyuys7c4Dw2VQiLzUN5R3G
        mV505oavLYMVK1sejw9MBa63PPP4Xbeu1hw==
X-Received: by 2002:a05:6402:518d:b0:43c:32b2:a0a with SMTP id q13-20020a056402518d00b0043c32b20a0amr16257617edd.388.1659017376397;
        Thu, 28 Jul 2022 07:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1up0OBZXoz1WkyWTBJO4wrrYrKfbhxJc4Q3pRmQ38qLgtITX4UUnQ4PnW5ekv/+uSsZs9Ai+Q==
X-Received: by 2002:a05:6402:518d:b0:43c:32b2:a0a with SMTP id q13-20020a056402518d00b0043c32b20a0amr16257578edd.388.1659017375899;
        Thu, 28 Jul 2022 07:09:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906775500b0072f9dc2c246sm448701ejn.133.2022.07.28.07.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 07:09:35 -0700 (PDT)
Message-ID: <ce75f2cc-0129-84f5-bbab-dae5ed9a7ea9@redhat.com>
Date:   Thu, 28 Jul 2022 16:09:34 +0200
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5500e911-22eb-08b3-c3fe-2a63cf22d7b8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 15:43, Limonciello, Mario wrote:
> On 7/28/2022 08:03, Hans de Goede wrote:
>> Hi,
>>
>> On 7/28/22 01:52, Limonciello, Mario wrote:
>>> On 7/27/2022 16:46, Hans de Goede wrote:
>>>> <resend with Cc list fixed>
>>>>
>>>> Hi,
>>>>
>>>> On 7/12/22 16:58, Shyam Sundar S K wrote:
>>>>> The transition to auto-mode happens when the PMF driver receives
>>>>> AMT (Auto Mode transition) event. transition logic will reside in the
>>>>> PMF driver but the events would come from other supported drivers[1].
>>>>>
>>>>> The thermal parameters would vary between when a performance "on-lap" mode
>>>>> is detected and versus when not. The CQL event would get triggered from
>>>>> other drivers, so that PMF driver would adjust the system thermal config
>>>>> based on the ACPI inputs.
>>>>>
>>>>> OEMs can control whether or not to enable AMT or CQL via other supported
>>>>> drivers[1] but the actual transition logic resides in the AMD PMF driver.
>>>>> When an AMT event is received the automatic mode transition RAPL algorithm
>>>>> will run. When a CQL event is received an performance "on-lap" mode will
>>>>> be enabled and thermal parameters will be adjusted accordingly.
>>>>>
>>>>> [1]
>>>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Fcommit%2F%3Fh%3Dreview-hans%26id%3D755b249250df1b612d982f3b702c831b26ecdf73&amp;data=05%7C01%7Cmario.limonciello%40amd.com%7Cf7d0a10b43444af391fa08da709993b3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637946102171795208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=GRSR4jEbQu7yaY6CS%2BKienSw7majkwcazo8xoKHd2pA%3D&amp;reserved=0
>>>>>
>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> ---
>>>>>    drivers/platform/x86/amd/pmf/acpi.c      | 90 +++++++++++++++++++++++-
>>>>>    drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++
>>>>>    drivers/platform/x86/amd/pmf/cnqf.c      |  4 +-
>>>>>    drivers/platform/x86/amd/pmf/core.c      | 18 ++++-
>>>>>    drivers/platform/x86/amd/pmf/pmf.h       | 29 +++++++-
>>>>>    5 files changed, 156 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>>> index e9f33e61659f..4bde86aeafa0 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>>> @@ -12,6 +12,8 @@
>>>>>    #include "pmf.h"
>>>>>      #define APMF_METHOD "\\_SB_.PMF_.APMF"
>>>>> +#define APMF_CQL_NOTIFICATION    2
>>>>> +#define APMF_AMT_NOTIFICATION    3
>>>>>      static unsigned long supported_func;
>>>>>    @@ -55,6 +57,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>>>>    {
>>>>>        func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>>>>>        func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>>>>> +    func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
>>>>>        func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>>>>>        func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>>>>>        func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
>>>>> @@ -292,6 +295,36 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>>>>>        return err;
>>>>>    }
>>>>>    +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req)
>>>>> +{
>>>>> +    union acpi_object *info;
>>>>> +    size_t size;
>>>>> +    int err = 0;
>>>>> +
>>>>> +    info = apmf_if_call(ampf_if, APMF_FUNC_SBIOS_REQUESTS, NULL);
>>>>> +    if (!info)
>>>>> +        return -EIO;
>>>>> +
>>>>> +    size = *(u16 *)info->buffer.pointer;
>>>>> +
>>>>> +    if (size < sizeof(union acpi_object)) {
>>>>> +        pr_err("PMF: buffer too small %zu\n", size);
>>>>> +        err = -EINVAL;
>>>>> +        goto out;
>>>>> +    }
>>>>> +
>>>>> +    size = min(sizeof(*req), size);
>>>>> +    memset(req, 0, sizeof(*req));
>>>>> +    memcpy(req, info->buffer.pointer, size);
>>>>> +
>>>>> +    pr_debug("PMF: %s: pending_req:%d cql:%d amt:%d\n", __func__,
>>>>> +         req->pending_req, req->cql_event, req->amt_event);
>>>>> +
>>>>> +out:
>>>>> +    kfree(info);
>>>>> +    return err;
>>>>> +}
>>>>> +
>>>>>    static acpi_handle apmf_if_probe_handle(void)
>>>>>    {
>>>>>        acpi_handle handle = NULL;
>>>>> @@ -312,18 +345,62 @@ static acpi_handle apmf_if_probe_handle(void)
>>>>>        return handle;
>>>>>    }
>>>>>    +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>>>> +{
>>>>> +    struct amd_pmf_dev *pmf_dev = data;
>>>>> +    struct apmf_if *apmf_if = pmf_dev->apmf_if;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (apmf_if->func.sbios_requests) {
>>>>> +        struct apmf_sbios_req req;
>>>>> +
>>>>> +        ret = apmf_get_sbios_requests(apmf_if, &req);
>>>>> +        if (ret) {
>>>>> +            dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>>>>> +            return;
>>>>> +        }
>>>>> +        if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>>>>> +            pr_debug("PMF: AMT is supported and notifications %s\n",
>>>>> +                 req.amt_event ? "Enabled" : "Disabled");
>>>>> +            if (req.amt_event)
>>>>> +                pmf_dev->is_amt_event = true;
>>>>> +            else
>>>>> +                pmf_dev->is_amt_event = !!req.amt_event;
>>>>> +        }
>>>>> +
>>>>> +        if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>>>>> +            pr_debug("PMF: CQL is supported and notifications %s\n",
>>>>> +                 req.cql_event ? "Enabled" : "Disabled");
>>>>> +            if (req.cql_event)
>>>>> +                pmf_dev->is_cql_event = true;
>>>>> +            else
>>>>> +                pmf_dev->is_cql_event = !!req.cql_event;
>>>>> +
>>>>> +            /* update the target mode information */
>>>>> +            amd_pmf_update_2_cql(pmf_dev);
>>>>> +        }
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>>>>    {
>>>>> +    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>>> +
>>>>>        if (pmf_dev->apmf_if->func.sbios_heartbeat)
>>>>>            cancel_delayed_work_sync(&pmf_dev->heart_beat);
>>>>> +
>>>>> +    if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
>>>>> +        acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>>>>> +                       apmf_event_handler);
>>>>>    }
>>>>>      int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>>>>    {
>>>>> +    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>>>        struct apmf_notification_cfg *n;
>>>>>        acpi_handle apmf_if_handle;
>>>>>        struct apmf_if *apmf_if;
>>>>> -    int ret;
>>>>> +    int ret, status;
>>>>>          apmf_if_handle = apmf_if_probe_handle();
>>>>>        if (!apmf_if_handle)
>>>>> @@ -360,6 +437,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>>>>            schedule_delayed_work(&pmf_dev->heart_beat, 0);
>>>>>        }
>>>>>    +    /* Install the APMF Notify handler */
>>>>> +    if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
>>>>> +        status = acpi_install_notify_handler(ahandle,
>>>>> +                             ACPI_ALL_NOTIFY,
>>>>> +                             apmf_event_handler, pmf_dev);
>>>>> +        if (ACPI_FAILURE(status)) {
>>>>> +            dev_err(pmf_dev->dev, "failed to install notify handler\n");
>>>>> +            return -ENODEV;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>>    out:
>>>>>        return ret;
>>>>>    }
>>>>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>>>>> index 954fde25e71e..a85ef4b95cdb 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>>>>> @@ -111,6 +111,13 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>>>>        bool update = false;
>>>>>        int i, j;
>>>>>    +    if (!dev->amt_running && dev->is_amt_event) {
>>>>> +        dev_dbg(dev->dev, "setting AMT thermals\n");
>>>>> +        amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>>>>> +        dev->amt_running = true;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>>        /* Get the average moving average computed by auto mode algorithm */
>>>>>        avg_power = amd_pmf_get_moving_avg(socket_power);
>>>>>    @@ -161,6 +168,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>>>>        }
>>>>>    }
>>>>>    +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
>>>>> +{
>>>>> +    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>>>>> +            dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
>>>>> +    if ((config_store.current_mode == AUTO_PERFORMANCE ||
>>>>> +         config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
>>>>> +        config_store.current_mode !=
>>>>> +        config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
>>>>> +        config_store.current_mode =
>>>>> +                config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
>>>>> +        amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>>>>> +    }
>>>>> +    dev_dbg(dev->dev, "updated CQL thermals\n");
>>>>> +}
>>>>> +
>>>>>    static void amd_pmf_get_power_threshold(void)
>>>>>    {
>>>>>        config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
>>>>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>>>>> index 2b03ae1ad37f..eba8f0d79a62 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>>>>> @@ -101,7 +101,7 @@ static const char *state_as_str(unsigned int state)
>>>>>        }
>>>>>    }
>>>>>    -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
>>>>> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
>>>>>    {
>>>>>        struct cnqf_tran_params *tp;
>>>>>        int src, i, j, index = 0;
>>>>> @@ -117,7 +117,7 @@ void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_
>>>>>        }
>>>>>          for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
>>>>> -        config_store.trans_param[src][i].timer += time_lapsed_ms;
>>>>> +        config_store.trans_param[src][i].timer += time_elapsed_ms;
>>>>>            config_store.trans_param[src][i].total_power += socket_power;
>>>>>            config_store.trans_param[src][i].count++;
>>>>>    diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>>>> index 674ddf599135..2a3dacfb2005 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>>> @@ -109,10 +109,15 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>>>>        enum platform_profile_option current_profile;
>>>>>        ktime_t time_elapsed_ms;
>>>>>        int socket_power;
>>>>> +    u8 mode;
>>>>>          /* Get the current profile information */
>>>>>        platform_profile_get(&current_profile);
>>>>>    +    if (!dev->is_amt_event)
>>>>> +        dev_dbg(dev->dev, "%s amt event: %s\n", __func__,
>>>>> +            dev->is_amt_event ? "Enabled" : "Disabled");
>>>>> +
>>>>>        /* Transfer table contents */
>>>>>        memset(&dev->m_table, 0, sizeof(dev->m_table));
>>>>>        amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>>>>> @@ -123,8 +128,17 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>>>>        socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>>>>>          if (current_profile == PLATFORM_PROFILE_BALANCED) {
>>>>
>>>> Hmm, I guess this is also why the platform_profile_get() is necessary ? Because
>>>> on Thinkpads thinkpad_acpi is expected to be the platform_profile provider and
>>>> then the PMF code wants to know the platform_profile setting from thinkpad_acpi ?
>>>>
>>>> Can you please explain the expected interactions between thinkpad_acpi and
>>>> this code here a bit more ?
>>>>
>>>> Since we now only call amd_pmf_trans_automode() based on the AMT flag and
>>>> that flag is controlled by the thinkpad BIOS/EC can we not expect that flag
>>>> to be cleared when the profile is not balanced and can we thus not just drop
>>>> the current_profile == PLATFORM_PROFILE_BALANCED check all together?
>>>>
>>>> It seems to me that if current_profile == PLATFORM_PROFILE_BALANCED
>>>> then enable AMT, else disable it, logic belongs inside thinkpad_acpi
>>>> and not here?
>>>>
>>>
>>> It actually already lives in thinkpad_acpi.
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Ftree%2Fdrivers%2Fplatform%2Fx86%2Fthinkpad_acpi.c%3Fh%3Dreview-hans%23n10489&amp;data=05%7C01%7Cmario.limonciello%40amd.com%7Cf7d0a10b43444af391fa08da709993b3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637946102171795208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=cGxN8GG6LXnk%2FPDi%2BS1zNAkWRH4AiTKqF0eebcfcTRA%3D&amp;reserved=0
>>>
>>> By the control point from thinkpad_acpi BIOS events will be emitted controlling whether AMT is running in a given mode.
>>>
>>> So yes; there is no need for this here anymore.
>>
>> Right. There still are some open questions / things which need fixing here though:
>>
>> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>>     will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>>     stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>>     the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>>     by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>>     register its platform_profile support. We cannot rely on module ordering ensuring
>>     that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>>     since there are no module load ordering guarantees.
> 
> This was my thought initially too while this was being developed, but actually there is some nuance here that is non-obvious.  The platform profile registering code in amd-pmf will examine bits set in the BIOS to decide whether or not to export platform profile support.  In Lenovo platforms that support thinkpad_acpi these bits are not set.  So platform profile support ONLY comes from thinkpad-acpi in those platforms.

Right, Shyam mentioned this in another part of the thread. As I
mentioned there IHMO it would still be good to check this in the driver
though. To catch cases where a BIOS for some reasons advertises an
unexpected combination of features.

>> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>>     enable AMT and then the periodically run workqueue function from amd-pmf
>>     will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>>     set to low-power or performance. Should the amd-pmf code then apply the static
>>     slider settings for low-power/performance which it has read from the ACPI
>>     tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
>>
> 
> When thinkpad_acpi changes platform profile then a BIOS event goes through and amd-pmf receives that and will run based on the event.

Hmm, I don't remember seeing anything for this in the patches. Actually this
reminds me that the code should probably reschedule (using mod_delayed_work)
the work to run immediately after a BIOS event, rather then waiting for
the next normally scheduled run.

But even then I don't remember seeing any code related to catching
platform-profile changes done outside amd-pmf... ?

There is this bit:

 	if (current_profile == PLATFORM_PROFILE_BALANCED) {
-		/* Apply the Auto Mode transition */
-		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+		if (dev->is_amt_event) {
+			/* Apply the Auto Mode transition */
+			amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+		} else if (!dev->is_amt_event && dev->amt_running) {
+			pr_debug("resetting AMT thermals\n");
+			mode = amd_pmf_get_pprof_modes(dev);
+			amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
+			dev->amt_running = false;
+		}
+	} else {
+		dev->amt_running = false;
 	}

But the new code here only applies the static slider settings on
is_amt_event edges (going from 1->0) and if the static slider support
bits are supposed to not be set then amd_pmf_load_defaults_sps() will
not have run because
is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR) will return
false.

So the values being set by amd_pmf_update_slider() will not have been
initialized and it will be setting everything to 0.

Also amd_pmf_get_pprof_modes() will always return POWER_MODE_POWER_SAVER
since pmf->current_profile is left at its 0 value (from kzalloc) in
this case.

So it seems that the code path where AMT is being disabled here is
buggy and it still is not clear to me where the limits get set
when thinkpad_acpi's platform_profile gets set to low-power
or performance.

Regards,

Hans


> 
> 
>> 3. If the answer to 2. is "Yes the amd-pmf code should apply the static-slider
>>     settings" then we will still need patch 1/15 to allow the amd-pmd code to
>>     read the platform-profile setting from the thinkpad_acpi platform-profile
>>     provider;
>>     And if the answer is "No, the thinkpad ACPI/EC will take care of this"
>>     then we should probably make sure that the static slider code never runs
>>     at all on thinkpads.
> 
> Yup, already handled.
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>   
>>
>>
>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>> -        /* Apply the Auto Mode transition */
>>>>> -        amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>>>>> +        if (dev->is_amt_event) {
>>>>> +            /* Apply the Auto Mode transition */
>>>>> +            amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>>>>> +        } else if (!dev->is_amt_event && dev->amt_running) {
>>>>> +            pr_debug("resetting AMT thermals\n");
>>>>> +            mode = amd_pmf_get_pprof_modes(dev);
>>>>> +            amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
>>>>> +            dev->amt_running = false;
>>>>> +        }
>>>>> +    } else {
>>>>> +        dev->amt_running = false;
>>>>>        }
>>>>>          if (dev->cnqf_feat) {
>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> index 0532f49e9613..9ae9812353cd 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> @@ -17,6 +17,7 @@
>>>>>    /* APMF Functions */
>>>>>    #define APMF_FUNC_VERIFY_INTERFACE            0
>>>>>    #define APMF_FUNC_GET_SYS_PARAMS            1
>>>>> +#define APMF_FUNC_SBIOS_REQUESTS            2
>>>>>    #define APMF_FUNC_SBIOS_HEARTBEAT            4
>>>>>    #define APMF_FUNC_AUTO_MODE                    5
>>>>>    #define APMF_FUNC_SET_FAN_IDX                7
>>>>> @@ -51,6 +52,7 @@
>>>>>    /* AMD PMF BIOS interfaces */
>>>>>    struct apmf_if_functions {
>>>>>        bool system_params;
>>>>> +    bool sbios_requests;
>>>>>        bool sbios_heartbeat;
>>>>>        bool auto_mode_def;
>>>>>        bool fan_table_idx;
>>>>> @@ -84,6 +86,24 @@ struct apmf_system_params {
>>>>>        u32 heartbeat_int;
>>>>>    } __packed;
>>>>>    +struct apmf_sbios_req {
>>>>> +    u16 size;
>>>>> +    u32 pending_req;
>>>>> +    u8 rsd;
>>>>> +    u8 cql_event;
>>>>> +    u8 amt_event;
>>>>> +    u32 fppt;
>>>>> +    u32 sppt;
>>>>> +    u32 fppt_apu_only;
>>>>> +    u32 spl;
>>>>> +    u32 stt_min_limit;
>>>>> +    u8 skin_temp_apu;
>>>>> +    u8 skin_temp_hs2;
>>>>> +    u8 dps_enable;
>>>>> +    u32 custom_policy_1;
>>>>> +    u32 custom_policy_2;
>>>>> +} __packed;
>>>>> +
>>>>>    struct apmf_fan_idx {
>>>>>        u16 size;
>>>>>        u8 fan_ctl_mode;
>>>>> @@ -171,6 +191,9 @@ struct amd_pmf_dev {
>>>>>    #endif /* CONFIG_DEBUG_FS */
>>>>>        bool cnqf_feat;
>>>>>        bool cnqf_running;
>>>>> +    bool is_amt_event;
>>>>> +    bool is_cql_event;
>>>>> +    bool amt_running;
>>>>>    };
>>>>>      struct apmf_sps_prop_granular {
>>>>> @@ -417,9 +440,11 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>>>>>    /* Auto Mode Layer */
>>>>>    void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
>>>>>    int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
>>>>> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
>>>>>    void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>>>>>    void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>>>>> -void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>>>>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
>>>>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>>>>>      /* CnQF Layer */
>>>>>    int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
>>>>> @@ -427,6 +452,6 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>>>>>    void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
>>>>>    void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>>>>>    void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
>>>>> -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>>>>> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>>>>>      #endif /* PMF_H */
>>>>
>>>
>>
> 

