Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C45C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 10:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390792AbiEFKIT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 06:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390787AbiEFKIT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 06:08:19 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98F0D5A2D5
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651831475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bHY4VDg+ah70TicV7Rfgy/3c2lRATR8HIfCmkjcH/Oc=;
        b=A2ROH/tA48H32okpISe/oD8E1sQFJZGKaWGmc8BgpECa15zB+veN7LNM8SCAHpICM3t4YL
        CSn2d8wooTHHfRfZClgfPlm5lLKoQLo4UhjLnTW5VcV5mvP5jFAabzjhmKAARmaWqKrQML
        AP/YgXJErk/1mEUPjnjR+nVGFf77mcU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-_6ftqGCPPy-LasAckytYnA-1; Fri, 06 May 2022 06:04:32 -0400
X-MC-Unique: _6ftqGCPPy-LasAckytYnA-1
Received: by mail-ed1-f69.google.com with SMTP id r30-20020a50d69e000000b00425e1e97671so3755535edi.18
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 03:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bHY4VDg+ah70TicV7Rfgy/3c2lRATR8HIfCmkjcH/Oc=;
        b=JsQE3wcRqSoHDCL0r+WBAycH7+hoGFz0kG4hDSk39lmKzQdp0isf0hZ2XbPMlPHVJH
         4LZNt09YKcvlJsy4tRNp7HCTpUVUCjhkxpQ7qH1Ofg/+v5+/Mrtg+4/Z3SI0d5c5w64L
         zRJaGuOXpOYkecJyRjNr2IPBm8pCG4PeQROMlmQZqpdCyjLdEgmc4CmjMwK7CTghyrBu
         iZOZtsXa76LxuyEGBaVyN0Zoi3yrCK6Lmwup0Yk+eThKX68SwluGP9/KO3gh18ms9c1x
         K35hW7bmwoeaCd74vSpzxcRnf2q+eUql4nADi3wojU/rrdfP6AvxsXY+plsHIXONqIds
         IuOw==
X-Gm-Message-State: AOAM533kx15/IXTdiAEm+ZPEgwE1U0kXRUSYPLxNGuU6B0lngdVFZ8HX
        baExp8jpDuxJ7HfckDc0IgDhwIyBdJdfcMFa/kt+OtDm2WeFKfIK77/BL7Bbap/NLv296rib/Wk
        B1Wqig2fP+piBPbfQJ01sKNNI2HWz7QFr0Q==
X-Received: by 2002:a17:906:2989:b0:6f3:a215:8426 with SMTP id x9-20020a170906298900b006f3a2158426mr2179952eje.725.1651831470961;
        Fri, 06 May 2022 03:04:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw00aYNt3RKDL8C1p1bUN4+NsjLxXRo4/823/OnQVTFKXu+rcbvHVRjmFNcVwCoe0MclOGQNA==
X-Received: by 2002:a17:906:2989:b0:6f3:a215:8426 with SMTP id x9-20020a170906298900b006f3a2158426mr2179940eje.725.1651831470771;
        Fri, 06 May 2022 03:04:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id zd9-20020a17090698c900b006f3ef214e28sm1814747ejb.142.2022.05.06.03.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 03:04:30 -0700 (PDT)
Message-ID: <0d048b50-ee27-b5d6-11e2-f2f11ae17b79@redhat.com>
Date:   Fri, 6 May 2022 12:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix compilation without
 CONFIG_SUSPEND
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:THINKPAD ACPI EXTRAS DRIVER" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "open list:THINKPAD ACPI EXTRAS DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20220503012700.1273-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220503012700.1273-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/3/22 03:27, Mario Limonciello wrote:
> When compiled without `CONFIG_SUSPEND` the extra s2idle quirk handling
> doesn't make any sense and causes a kernel build failure.
> 
> Disable the new code with `CONFIG_SUSPEND` not set.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, since the original patch was still in my review-hans
branch (and not yet in for-next) I've squashed this fix into
the original patch.

Regards,

Hans




> ---
>  drivers/platform/x86/thinkpad_acpi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index f385450af864..2833609fade7 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4482,6 +4482,7 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>  	{}
>  };
>  
> +#ifdef CONFIG_SUSPEND
>  /*
>   * Lenovo laptops from a variety of generations run a SMI handler during the D3->D0
>   * transition that occurs specifically when exiting suspend to idle which can cause
> @@ -4517,6 +4518,7 @@ static void thinkpad_acpi_amd_s2idle_restore(void)
>  static struct acpi_s2idle_dev_ops thinkpad_acpi_s2idle_dev_ops = {
>  	.restore = thinkpad_acpi_amd_s2idle_restore,
>  };
> +#endif
>  
>  static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
> @@ -11569,8 +11571,10 @@ static void thinkpad_acpi_module_exit(void)
>  
>  	tpacpi_lifecycle = TPACPI_LIFE_EXITING;
>  
> +#ifdef CONFIG_SUSPEND
>  	if (tp_features.quirks && tp_features.quirks->s2idle_bug_mmio)
>  		acpi_unregister_lps0_dev(&thinkpad_acpi_s2idle_dev_ops);
> +#endif
>  	if (tpacpi_hwmon)
>  		hwmon_device_unregister(tpacpi_hwmon);
>  	if (tp_features.sensors_pdrv_registered)
> @@ -11743,11 +11747,13 @@ static int __init thinkpad_acpi_module_init(void)
>  	dmi_id = dmi_first_match(fwbug_list);
>  	if (dmi_id) {
>  		tp_features.quirks = dmi_id->driver_data;
> +#ifdef CONFIG_SUSPEND
>  		if (tp_features.quirks->s2idle_bug_mmio) {
>  			if (!acpi_register_lps0_dev(&thinkpad_acpi_s2idle_dev_ops))
>  				pr_info("Using s2idle quirk to avoid %s platform firmware bug\n",
>  					dmi_id->ident ? dmi_id->ident : "");
>  		}
> +#endif
>  	}
>  
>  	return 0;

