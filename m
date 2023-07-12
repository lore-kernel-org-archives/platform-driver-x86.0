Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04333EB64DA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 14:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjGLO75 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjGLO74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 10:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513EB1BC5
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689173944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XyZS2nlr2eMi1kRH99kg7hVqiv5OOY3BmMOh1X5/FTo=;
        b=aFt1w4dhp94xd0KJXt7EaeDjqp7JaJXmaOgcB/8vqjWuu18qvp1NLKvbuH2nod7Lj+KdTq
        R8etcQ0ocFz3dAlBsC4k3xTRNBbaXjmJNCQ2mT02GV8eyNfFSJXLKhT/ImEplALd7WAa7N
        KSkrj8jP15P1hzR0J6qpzY1ir+RAXY8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-cHNhrBjNODirAYP72BJYMw-1; Wed, 12 Jul 2023 10:59:02 -0400
X-MC-Unique: cHNhrBjNODirAYP72BJYMw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b703a076ceso69800701fa.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173940; x=1691765940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyZS2nlr2eMi1kRH99kg7hVqiv5OOY3BmMOh1X5/FTo=;
        b=kgadGai9tvx5tDdRcfntxg/yQpanH/9XNeKU4XTWcpAO6l7LqhiS2RpSMsVJXCdOv0
         lOJEo4FT6q0uBJ13Ssipq9F/qQlwoKWhEpzb9h1RIeuaT/CzASg4eFcu7tcoUq4N/MNk
         1tJEoggHca8O+ufPkgoC/kbHf5hRF5YFNKIertVqstEM9Hiu10raQpNNj2QprdqrfXlX
         +Z9FZ+OvN9FFh/fmeB8O2Hz4q8Ws7LXV8AoP+gK2WaIqw6KR+ra3NqCQ4oGhM0pYBTMP
         Yx0CbI7QtPOLrRrliROnYR+kwvn7I/yB69A9Q+fOV0A+X0i7ghLGa6D/id2JyaLphbE1
         CRRQ==
X-Gm-Message-State: ABy/qLbpCc1NwG6/vZfS7VBl4FYBvx7yPdDmpc7qwtigklfHrmvQFuUx
        MipUIgwCbjIb4l4gI4LbGeetTtHDIo6zlaXpP1GqJnAom02njT4RicFcIPhZt15usngikpA742N
        8ONi3Qe8vXVWFQqODCe57FeJjo31670UChA==
X-Received: by 2002:a2e:8809:0:b0:2b7:15d:24 with SMTP id x9-20020a2e8809000000b002b7015d0024mr16055183ljh.41.1689173940647;
        Wed, 12 Jul 2023 07:59:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMbqBhX05PrTpjyq5wgeFLOdY+bK+gPQoN3mUn4+tZ1lFRpvGGS9gaLuzGslF3lz5YP4qiBQ==
X-Received: by 2002:a2e:8809:0:b0:2b7:15d:24 with SMTP id x9-20020a2e8809000000b002b7015d0024mr16055167ljh.41.1689173940309;
        Wed, 12 Jul 2023 07:59:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g18-20020a1709064e5200b009930042510csm2647453ejw.222.2023.07.12.07.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:58:59 -0700 (PDT)
Message-ID: <1122525e-1567-f7e1-cefc-dacd938220e3@redhat.com>
Date:   Wed, 12 Jul 2023 16:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86/amd/pmf: Add new ACPI ID AMDI0103
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230711100903.384151-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230711100903.384151-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/11/23 12:09, Shyam Sundar S K wrote:
> Add new ACPI ID AMDI0103 used by upcoming AMD platform to the PMF
> supported list of devices.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I have already included this patch in my first fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/amd/pmf/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index d5bb775dadcf..730b22457117 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -40,6 +40,7 @@
>  /* List of supported CPU ids */
>  #define AMD_CPU_ID_RMB			0x14b5
>  #define AMD_CPU_ID_PS			0x14e8
> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
>  
>  #define PMF_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
> @@ -242,6 +243,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>  static const struct pci_device_id pmf_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>  	{ }
>  };
>  
> @@ -312,6 +314,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>  	{"AMDI0100", 0x100},
>  	{"AMDI0102", 0},
> +	{"AMDI0103", 0},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);

