Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA80C7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 13:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjCTNvy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 09:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjCTNvw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 09:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF4717141
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679320259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3cXvDtzKrFJ8bnHtmDTEg1nHL2YCUCh/QeXr/0MY3ok=;
        b=T0+cxxAxLqDiFJt1la6giTI6PZVp09id6VyFBis8CpSNBhpfv1OFdOB2poCD5ua7K9qhzg
        XeKycfRItxZ5ZWn6Hpze3Qw66+MZ1ZrHggaYbfoYBoYyMVwagOWqYSiWbCukRVjtqSW36M
        IBSBsn6rXjNShwXzyORIP+3Lo1zUYR8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-N4w6sLf8NCyVmBKvrKOMQQ-1; Mon, 20 Mar 2023 09:50:56 -0400
X-MC-Unique: N4w6sLf8NCyVmBKvrKOMQQ-1
Received: by mail-ed1-f70.google.com with SMTP id f15-20020a50a6cf000000b0050050d2326aso8354691edc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679320255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cXvDtzKrFJ8bnHtmDTEg1nHL2YCUCh/QeXr/0MY3ok=;
        b=MRth3olkJnmFE7m5yebaWrdzvh1ZMsZKmGPV/tffFykMvGR5RfcHH+pJY2CwMlNWy/
         wv1ToURxD8R3XIoq6ji72oe2KB47wJtpgwVEi7pH6bM5KAqs2TMW89ntFn/uaSmM8gRk
         TZtIAQ8V36Oloes0ocrI0pQe0d67Nv84yemJ649UfDDl6SXa0BhQCgm4I84ElbNpDH2o
         hOo9KKA/VFu+HNULIl4rUk8RY55CpdVyDTgjOVrVzFTBI1wBQOPCDWsKHzREwxvuLYtO
         unxTWHRlvMMRQKA9XQjDxt/1zvlmVeTaoB3abyFDSKeyUpMyj7MInA6mbdsBYQ6J3u3X
         obKg==
X-Gm-Message-State: AO0yUKXApdSIaktpaAY6U/m4btwx7sz9BjxUSMaxY5Ev5XhSmattudiN
        T1oozNs5JmUIgrA0VRPFtxDjf1cUZqrisyowVo6oFqdcojDtUi1d38tIAyGiSSXt9Vkmq9cNQKY
        wUtZUTddETZHW36MBZJyH3Z3MtBQF30mxtvvEB3JIBA==
X-Received: by 2002:a17:906:5e4e:b0:931:32f5:1f31 with SMTP id b14-20020a1709065e4e00b0093132f51f31mr9457769eju.9.1679320255268;
        Mon, 20 Mar 2023 06:50:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set/oy/Pxy0ceMKMy3L+hJsQAwarTkauZ06l7nmkHjrGkuQJdj8a31m4++wgBT8aegPGIT0Gx0w==
X-Received: by 2002:a17:906:5e4e:b0:931:32f5:1f31 with SMTP id b14-20020a1709065e4e00b0093132f51f31mr9457744eju.9.1679320254934;
        Mon, 20 Mar 2023 06:50:54 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906251300b009312cc428e4sm4419360ejb.165.2023.03.20.06.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 06:50:54 -0700 (PDT)
Message-ID: <953fca38-ea86-21db-11f3-b8c8a207f910@redhat.com>
Date:   Mon, 20 Mar 2023 14:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/intel/vsec: Explicitly enable capabilities
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "David E. Box" <david.e.box@linux.intel.com>
Cc:     irenic.rajneesh@gmail.com, david.e.box@intel.com,
        markgross@kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230316224628.2855884-1-david.e.box@linux.intel.com>
 <CAHp75Vd6ee_uqPLHiOa8DX4huf7bB0CmWf4yRPN=0TQw_5JvgA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd6ee_uqPLHiOa8DX4huf7bB0CmWf4yRPN=0TQw_5JvgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/23 13:58, Andy Shevchenko wrote:
> On Fri, Mar 17, 2023 at 12:46 AM David E. Box
> <david.e.box@linux.intel.com> wrote:
>>
>> Discovered Intel VSEC/DVSEC capabilities are enabled by default and only
>> get disabled by quirk. Instead, remove such quirks and only enable support
>> for capabilities that have been explicitly added to a new capabilities
>> field. While here, also reorder the device info structures alphabetically.
> 
> This looks better indeed.
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you both for the patch and review, I've applied this patch
to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> 
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> ---
>>  drivers/platform/x86/intel/vsec.c | 69 ++++++++++++++-----------------
>>  drivers/platform/x86/intel/vsec.h |  9 +++-
>>  2 files changed, 38 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
>> index 13decf36c6de..01b1f6480e5c 100644
>> --- a/drivers/platform/x86/intel/vsec.c
>> +++ b/drivers/platform/x86/intel/vsec.c
>> @@ -67,14 +67,6 @@ enum intel_vsec_id {
>>         VSEC_ID_TPMI            = 66,
>>  };
>>
>> -static enum intel_vsec_id intel_vsec_allow_list[] = {
>> -       VSEC_ID_TELEMETRY,
>> -       VSEC_ID_WATCHER,
>> -       VSEC_ID_CRASHLOG,
>> -       VSEC_ID_SDSI,
>> -       VSEC_ID_TPMI,
>> -};
>> -
>>  static const char *intel_vsec_name(enum intel_vsec_id id)
>>  {
>>         switch (id) {
>> @@ -98,26 +90,19 @@ static const char *intel_vsec_name(enum intel_vsec_id id)
>>         }
>>  }
>>
>> -static bool intel_vsec_allowed(u16 id)
>> -{
>> -       int i;
>> -
>> -       for (i = 0; i < ARRAY_SIZE(intel_vsec_allow_list); i++)
>> -               if (intel_vsec_allow_list[i] == id)
>> -                       return true;
>> -
>> -       return false;
>> -}
>> -
>> -static bool intel_vsec_disabled(u16 id, unsigned long quirks)
>> +static bool intel_vsec_supported(u16 id, unsigned long caps)
>>  {
>>         switch (id) {
>> +       case VSEC_ID_TELEMETRY:
>> +               return !!(caps & VSEC_CAP_TELEMETRY);
>>         case VSEC_ID_WATCHER:
>> -               return !!(quirks & VSEC_QUIRK_NO_WATCHER);
>> -
>> +               return !!(caps & VSEC_CAP_WATCHER);
>>         case VSEC_ID_CRASHLOG:
>> -               return !!(quirks & VSEC_QUIRK_NO_CRASHLOG);
>> -
>> +               return !!(caps & VSEC_CAP_CRASHLOG);
>> +       case VSEC_ID_SDSI:
>> +               return !!(caps & VSEC_CAP_SDSI);
>> +       case VSEC_ID_TPMI:
>> +               return !!(caps & VSEC_CAP_TPMI);
>>         default:
>>                 return false;
>>         }
>> @@ -205,7 +190,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>>         unsigned long quirks = info->quirks;
>>         int i;
>>
>> -       if (!intel_vsec_allowed(header->id) || intel_vsec_disabled(header->id, quirks))
>> +       if (!intel_vsec_supported(header->id, info->caps))
>>                 return -EINVAL;
>>
>>         if (!header->num_entries) {
>> @@ -260,14 +245,14 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>>  static bool intel_vsec_walk_header(struct pci_dev *pdev,
>>                                    struct intel_vsec_platform_info *info)
>>  {
>> -       struct intel_vsec_header **header = info->capabilities;
>> +       struct intel_vsec_header **header = info->headers;
>>         bool have_devices = false;
>>         int ret;
>>
>>         for ( ; *header; header++) {
>>                 ret = intel_vsec_add_dev(pdev, *header, info);
>>                 if (ret)
>> -                       dev_info(&pdev->dev, "Could not add device for DVSEC id %d\n",
>> +                       dev_info(&pdev->dev, "Could not add device for VSEC id %d\n",
>>                                  (*header)->id);
>>                 else
>>                         have_devices = true;
>> @@ -402,14 +387,8 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>>         return 0;
>>  }
>>
>> -/* TGL info */
>> -static const struct intel_vsec_platform_info tgl_info = {
>> -       .quirks = VSEC_QUIRK_NO_WATCHER | VSEC_QUIRK_NO_CRASHLOG |
>> -                 VSEC_QUIRK_TABLE_SHIFT | VSEC_QUIRK_EARLY_HW,
>> -};
>> -
>>  /* DG1 info */
>> -static struct intel_vsec_header dg1_telemetry = {
>> +static struct intel_vsec_header dg1_header = {
>>         .length = 0x10,
>>         .id = 2,
>>         .num_entries = 1,
>> @@ -418,19 +397,31 @@ static struct intel_vsec_header dg1_telemetry = {
>>         .offset = 0x466000,
>>  };
>>
>> -static struct intel_vsec_header *dg1_capabilities[] = {
>> -       &dg1_telemetry,
>> +static struct intel_vsec_header *dg1_headers[] = {
>> +       &dg1_header,
>>         NULL
>>  };
>>
>>  static const struct intel_vsec_platform_info dg1_info = {
>> -       .capabilities = dg1_capabilities,
>> +       .caps = VSEC_CAP_TELEMETRY,
>> +       .headers = dg1_headers,
>>         .quirks = VSEC_QUIRK_NO_DVSEC | VSEC_QUIRK_EARLY_HW,
>>  };
>>
>>  /* MTL info */
>>  static const struct intel_vsec_platform_info mtl_info = {
>> -       .quirks = VSEC_QUIRK_NO_WATCHER | VSEC_QUIRK_NO_CRASHLOG,
>> +       .caps = VSEC_CAP_TELEMETRY,
>> +};
>> +
>> +/* OOBMSM info */
>> +static const struct intel_vsec_platform_info oobmsm_info = {
>> +       .caps = VSEC_CAP_TELEMETRY | VSEC_CAP_SDSI | VSEC_CAP_TPMI,
>> +};
>> +
>> +/* TGL info */
>> +static const struct intel_vsec_platform_info tgl_info = {
>> +       .caps = VSEC_CAP_TELEMETRY,
>> +       .quirks = VSEC_QUIRK_TABLE_SHIFT | VSEC_QUIRK_EARLY_HW,
>>  };
>>
>>  #define PCI_DEVICE_ID_INTEL_VSEC_ADL           0x467d
>> @@ -445,7 +436,7 @@ static const struct pci_device_id intel_vsec_pci_ids[] = {
>>         { PCI_DEVICE_DATA(INTEL, VSEC_DG1, &dg1_info) },
>>         { PCI_DEVICE_DATA(INTEL, VSEC_MTL_M, &mtl_info) },
>>         { PCI_DEVICE_DATA(INTEL, VSEC_MTL_S, &mtl_info) },
>> -       { PCI_DEVICE_DATA(INTEL, VSEC_OOBMSM, &(struct intel_vsec_platform_info) {}) },
>> +       { PCI_DEVICE_DATA(INTEL, VSEC_OOBMSM, &oobmsm_info) },
>>         { PCI_DEVICE_DATA(INTEL, VSEC_RPL, &tgl_info) },
>>         { PCI_DEVICE_DATA(INTEL, VSEC_TGL, &tgl_info) },
>>         { }
>> diff --git a/drivers/platform/x86/intel/vsec.h b/drivers/platform/x86/intel/vsec.h
>> index ae8fe92c5595..0fd042c171ba 100644
>> --- a/drivers/platform/x86/intel/vsec.h
>> +++ b/drivers/platform/x86/intel/vsec.h
>> @@ -5,6 +5,12 @@
>>  #include <linux/auxiliary_bus.h>
>>  #include <linux/bits.h>
>>
>> +#define VSEC_CAP_TELEMETRY     BIT(0)
>> +#define VSEC_CAP_WATCHER       BIT(1)
>> +#define VSEC_CAP_CRASHLOG      BIT(2)
>> +#define VSEC_CAP_SDSI          BIT(3)
>> +#define VSEC_CAP_TPMI          BIT(4)
>> +
>>  struct pci_dev;
>>  struct resource;
>>
>> @@ -27,7 +33,8 @@ enum intel_vsec_quirks {
>>
>>  /* Platform specific data */
>>  struct intel_vsec_platform_info {
>> -       struct intel_vsec_header **capabilities;
>> +       struct intel_vsec_header **headers;
>> +       unsigned long caps;
>>         unsigned long quirks;
>>  };
>>
>>
>> base-commit: 02c464b73645404654359ad21f368a13735e2850
>> --
>> 2.34.1
>>
> 
> 

