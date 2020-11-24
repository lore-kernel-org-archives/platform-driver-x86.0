Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357F4C64E8A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 10:20:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D25E1206E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 10:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GeREepxd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731900AbgKXKUO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 05:20:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39302 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731890AbgKXKUL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 05:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606213210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vy/Gw8bB9fhUPk3FfaNofmLnce/kpqLJ4s+2s6pSLsU=;
        b=GeREepxdxNZOkUsc6tPd48TU0E/MM9KcWmbIJbXqiRUwMuVWo6OaBc9W21rnQpjSew0O2t
        qoVNZXtO1sDHk8wgZgyfyknfyWvexuouYo+PcA1e0xnWWTkEPPbxD3GhAz/hdy1bcr8UWE
        uKOYmqrtlZdlIv8DE0H/nzsBPZYx/iw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-PpR0BVT-PVKOAHUP7zi4KA-1; Tue, 24 Nov 2020 05:20:08 -0500
X-MC-Unique: PpR0BVT-PVKOAHUP7zi4KA-1
Received: by mail-ed1-f71.google.com with SMTP id x15so7731559edr.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 02:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vy/Gw8bB9fhUPk3FfaNofmLnce/kpqLJ4s+2s6pSLsU=;
        b=pdbfMwheYKJqqohF6ovy8CSIDrQsFhG4g62LGyRLYXXi7XoVlTAWa30u6W1jlsWDL1
         oHoJjK/wEn1dGHNTNwn8IQ1UA7l8n4ln7x4OwiYWbZn1Ds+I/r6McCXkFx0vuTql6viI
         kRlNokIuRaoMNwQcXog3HAzBcoNs2EABJP1nr3afu34uY54gzbBnCrmVDMxUNi60BkJk
         XW4q1wShq5ZVZtU5FbvefmHPDS1CTVEGwFEdPHYkAFWs9LAF49LzLvAKV38TMTZz3v6G
         3iFxr4n4M0LpjeJ6Moxh0Oeps+AtysN6KS60cKfIXAunVmxTKsAsJYM0dIBZXvKGKRAS
         4Aog==
X-Gm-Message-State: AOAM530V/I4AfaCxdZGTCluxtReqNCzEAVTt2dPGNkXxNabd0hvzkeZe
        h9L/i1ZtZ4Y0nSA5WlcCS8BQAsve0901ITN/8n/6iWR1ZAxBYUHlHTMVuvbXqE7ylwWeSIs/8jp
        rtCQqPEVAYZWkhgk27nJIpMrGM/8g24UqDA==
X-Received: by 2002:aa7:ce82:: with SMTP id y2mr3369997edv.6.1606213206555;
        Tue, 24 Nov 2020 02:20:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSaB4e4Uh4qiCBbMuR5bIbqmlMdCJcwS/qJzB0TJTxA27bO+7Xy4I1KRLqe/PjLwd08PzYwQ==
X-Received: by 2002:aa7:ce82:: with SMTP id y2mr3369987edv.6.1606213206377;
        Tue, 24 Nov 2020 02:20:06 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id t14sm6559269eds.0.2020.11.24.02.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 02:20:05 -0800 (PST)
Subject: Re: [PATCH] xhci-pci: Allow host runtime PM as default for Intel
 Alpine Ridge LP
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20201124101845.11155-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cccea520-cc06-4c42-8834-70497da48172@redhat.com>
Date:   Tue, 24 Nov 2020 11:20:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124101845.11155-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

Ugh, wrong list of addresses and I forgot to add v2 to the Subject,
I will resend this with this fixed, sorry about the noise.

Regards,

Hans


On 11/24/20 11:18 AM, Hans de Goede wrote:
> The xHCI controller on Alpine Ridge LP keeps the whole Thunderbolt
> controller awake if the host controller is not allowed to sleep.
> This is the case even if no USB devices are connected to the host.
> 
> Add the Intel Alpine Ridge LP product-id to the list of product-ids
> for which we allow runtime PM by default.
> 
> Fixes: 2815ef7fe4d4 ("xhci-pci: allow host runtime PM as default for Intel Alpine and Titan Ridge")
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Fixup commit msg (add missing Ridge in a few places, caps)
> -Add Mika's Reviewed-by
> ---
>  drivers/usb/host/xhci-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index bf89172c43ca..5f94d7edeb37 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -47,6 +47,7 @@
>  #define PCI_DEVICE_ID_INTEL_DNV_XHCI			0x19d0
>  #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI	0x15b5
>  #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI	0x15b6
> +#define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_XHCI	0x15c1
>  #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI	0x15db
>  #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI	0x15d4
>  #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI		0x15e9
> @@ -232,6 +233,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>  	    (pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI ||
>  	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI ||
> +	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_XHCI ||
>  	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI ||
>  	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
>  	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
> 

