Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A36C83F11
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Aug 2023 09:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjH1JUf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 05:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjH1JUI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 05:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD59109
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693214356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xymSw+t/vP8y0DXU30BsI+ohlLbDzyxDKkuan19aoZY=;
        b=MJUlmO0NmL3ba/cF1lE+H8EbL76782KJUuXr/P43BB2Hv5hW1C00ITcUTnhh5oeKrAxyDC
        3NHOJLvkYa1RPp94g9yTHoeoFwiiIJ52yQmlhfGaDv3gAzM0yL8G2kFvPa93KV91Z9cNyg
        qvaE+b1k+9ohZALfiViDSXHp4NKT5KU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-Amd7x9BGOf-KDvRNZz2ibA-1; Mon, 28 Aug 2023 05:19:11 -0400
X-MC-Unique: Amd7x9BGOf-KDvRNZz2ibA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993d41cbc31so236173866b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 02:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693214349; x=1693819149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xymSw+t/vP8y0DXU30BsI+ohlLbDzyxDKkuan19aoZY=;
        b=CJn6hTBu5Wy5m+GJrr9t11drAoos0T4gehBdhbXVwHqwPmBTAARIVSH8iGdCaFBwvA
         VEB0bX2eJzEIcBg7bwdQcq1/YtuMBK++lakvQjDYoEj2Pk8iaCR0Zj5Tb3VaKAKJQo7Q
         8piLUX0bc8/kNltBK1LrnaQIaCf1ju1w5hnF+OOXHZQ1nuBqomoqsGuRzj8+ud5hNMVx
         9l289O0QIGSULxH6eC8vJLv70GnCBCYszUchoD9+yIXTn6lfUMxMS45Jn2peJPH31KRR
         O9rlvFTtY2LVjUvVW7zyjWtRNgD8fJeBTs8hF/Nxs7bGt1TrGgCGcbzukvW0RvYeTa/b
         QNZQ==
X-Gm-Message-State: AOJu0Yy3JRBcTvHURVYX/IyvbJY3Q38A5XE5jJ9Sfy9uxo+raHtCWcHO
        s83k4SeA70+scE0WdpYJ+zapgop5lKi4tQR2ahF1KS/BaFulKts80qbTWP+K9HNQI1G/UBMee9M
        etwXDL9J6qPHYUXG7SjMTy0HLqQwb36KUQ9qmbOZqaw==
X-Received: by 2002:a17:906:8a61:b0:9a1:aea8:d7cd with SMTP id hy1-20020a1709068a6100b009a1aea8d7cdmr13435607ejc.46.1693214348981;
        Mon, 28 Aug 2023 02:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh0RYUKMOb1oB+Q5xRNb2ImnHzcqrkps87lgWV0Q4FJ2Z22TFHY7IN2fK8dBWxRKSIuVLNkw==
X-Received: by 2002:a17:906:8a61:b0:9a1:aea8:d7cd with SMTP id hy1-20020a1709068a6100b009a1aea8d7cdmr13435594ejc.46.1693214348657;
        Mon, 28 Aug 2023 02:19:08 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i27-20020a170906115b00b0099bd0b5a2bcsm4403134eja.101.2023.08.28.02.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 02:19:08 -0700 (PDT)
Message-ID: <53d26a63-64f3-e736-99f5-32bf4b5ba31d@redhat.com>
Date:   Mon, 28 Aug 2023 11:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 2/2] platform/x86/amd: pmc: Don't let PCIe root ports
 go into D3
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Shyam-sundar.S-k@amd.com, bhelgaas@google.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        iain@orangesquash.org.uk
References: <20230828042819.47013-1-mario.limonciello@amd.com>
 <20230828042819.47013-2-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230828042819.47013-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 8/28/23 06:28, Mario Limonciello wrote:
> commit 9d26d3a8f1b0 ("PCI: Put PCIe ports into D3 during suspend")
> changed pci_bridge_d3_possible() so that any vendor's PCIe ports
> from modern machines (>=2015) are allowed to be put into D3.
> 
> Iain reports that USB devices can't be used to wake a Lenovo Z13
> from suspend. This is because the PCIe root port has been put
> into D3 and AMD's platform can't handle USB devices waking from
> a hardware sleep state in this case.
> 
> This problem only occurs on Linux, and only when the AMD PMC driver
> is utilized to put the device into a hardware sleep state. Comparing
> the behavior on Windows and Linux, Windows doesn't put the root ports
> into D3.
> 
> A variety of approaches were discussed to change PCI core to handle this
> case generically but no consensus was reached. To limit the scope of
> effect only to the affected machines introduce a workaround into the
> amd-pmc driver to only apply to the PCI root ports in affected machines
> when going into hardware sleep.
> 
> Link: https://lore.kernel.org/linux-pci/20230818193932.27187-1-mario.limonciello@amd.com/
> Fixes: 9d26d3a8f1b0 ("PCI: Put PCIe ports into D3 during suspend")
> Reported-by: Iain Lane <iain@orangesquash.org.uk>
> Closes: https://forums.lenovo.com/t5/Ubuntu/Z13-can-t-resume-from-suspend-with-external-USB-keyboard/m-p/5217121
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index eb2a4263814c..f7bfe704ce39 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -741,6 +741,21 @@ static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
>  	return 0;
>  }
>  
> +static int amd_pmc_rp_wa(struct amd_pmc_dev *pdev)
> +{
> +	struct pci_dev *pci_dev = NULL;
> +
> +	while ((pci_dev = pci_get_device(PCI_VENDOR_ID_AMD, PCI_ANY_ID, pci_dev))) {
> +		if (!pci_is_pcie(pci_dev) ||
> +		    !(pci_pcie_type(pci_dev) == PCI_EXP_TYPE_ROOT_PORT))
> +			continue;
> +		pci_dev->bridge_d3 = 0;
> +		dev_info_once(pdev->dev, "Disabling D3 for PCIe root ports\n");
> +	}
> +
> +	return 0;
> +}
> +
>  static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>  {
>  	struct rtc_device *rtc_device;
> @@ -893,6 +908,10 @@ static int amd_pmc_suspend_handler(struct device *dev)
>  	case AMD_CPU_ID_CZN:
>  		rc = amd_pmc_czn_wa_irq1(pdev);
>  		break;
> +	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_PS:
> +		rc = amd_pmc_rp_wa(pdev);
> +		break;
>  	default:
>  		break;
>  	}


I'm fine with moving this into the amd-pmc code, but I have some questions about the current approach:

1. The current approach sets pci_dev->bridge_d3 = 0 for all root ports, I assume this WA is indeed necessary for all root ports and not just for one specific root port ?

2. The current approach runs from the suspend pm-op for the PCI-device for the PMC. So when it runs we know that the root-port for the PMC will not have been suspended yet. But what is stopping other root ports, which already have had all their children run-time suspended before the system-suspend, from already being in suspended state and thus possibly in D3 state ?

And we also cannot just set pci_dev->bridge_d3 = 0 once on probe time since pci_bridge_d3_possible() is called every time pci devices are added/removed so then it may get reset to 1 again.

What I think is necessary here and what I hope will be acceptable to Bjorn, is for platform code to be able to register a callback to be called from pci_bridge_d3_possible() which can veto the decision to use d3. This way we don't pollute the PCI core with this, while still allowing platform specific tweaks.

If we make this a sorted list of callbacks (allowing to specify a priority at register time)
instead of just 1 callback the the 2015 BIOS date check could be move to arch/x86 and the DMI blacklist can probably also be moved there.

And the platform_pci_bridge_d3() check can then also be a callback registered by the ACPI code.

Regards,

Hans


