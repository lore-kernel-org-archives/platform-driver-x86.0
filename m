Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2F0C001E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 14:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjGYOic (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 10:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbjGYOiJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 10:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4E991
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690295847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GlLyTOX+0T4BQUjuuprKNGe/wk35wQO5DAolXb81K+Q=;
        b=iWHvCD160U4A3zGiW7cUtE7N/dSKWF7BUPVuCtJKFByhRT/1gkZfeB+FsxTHwbPGS+0h4+
        SVhUPoQG5S37yeStIkbm3fpAHayuh0frn4NQm1YJo4ebUNPsXX5CaMdKvgvPQeXEjh6EC4
        an54X8K8eUSZpEUZEp9LRi/ogvdGSnk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-lJoieR1yPlyg3tgKSF82aw-1; Tue, 25 Jul 2023 10:37:25 -0400
X-MC-Unique: lJoieR1yPlyg3tgKSF82aw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99b8e056607so168894766b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 07:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295843; x=1690900643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlLyTOX+0T4BQUjuuprKNGe/wk35wQO5DAolXb81K+Q=;
        b=Rz6qRVKVmVrINXectOO/w7VZjOn1HCx1Fp2sDYM4ZIZf19hHroSI5eT4ir79QsyY6R
         1JZgHMKSIv4h4aJJ92fZMUOeqY+lxf7A1/odIlRvw8D8GMQiSgxfL0FDyGSBS2d2Dach
         ck3FRCol3kTeUhVIpOwMr1x8PUWPF0m7zwOC3IGilA4mMHnSW99P3SLMsdC+pDUy/av9
         P84xleRcRXzoAuH3UP/x+8bVpUiiBbKFDRbZqgW5PuG9ko7b7X0g+N/q2hN0eXzcrSPO
         0l5Du/yZEvLZONDbWc1r272W+7Cd9VI6kW5CEuwRvA3XRHv5Pqt/FuUQx+vh3tLZ+u23
         a9yA==
X-Gm-Message-State: ABy/qLYryNCr89/5OS27JTZ3O9upSOCqrcwXPTcaWZECUcAc99Y6yQQl
        fLEbKTZA2iCxT5qLolYCnSE1NuluLB5w4xiauCOZ/jd1J1gyp1GkslYemz08IPWUkD25HdcMeLQ
        tc9I2cyjqwdrCzhhBJxnHvAWFmplgLsSjNIlphhxRRg==
X-Received: by 2002:a17:906:3059:b0:994:673:8afa with SMTP id d25-20020a170906305900b0099406738afamr12186713ejd.28.1690295843572;
        Tue, 25 Jul 2023 07:37:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHGJIAXNFgHb9mK33McQ2AcRw5kTac2VE6oPd4LHiNpSDEBlQj+eKP35q0/qcpTTPNQ1A5OeQ==
X-Received: by 2002:a17:906:3059:b0:994:673:8afa with SMTP id d25-20020a170906305900b0099406738afamr12186701ejd.28.1690295843297;
        Tue, 25 Jul 2023 07:37:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qx26-20020a170906fcda00b00982cfe1fe5dsm8320354ejb.65.2023.07.25.07.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:37:22 -0700 (PDT)
Message-ID: <8ceb0052-f402-0217-2889-f9ef48a5f11f@redhat.com>
Date:   Tue, 25 Jul 2023 16:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: msi-laptop: Fix rfkill out-of-sync on MSI
 Wind U100
Content-Language: en-US, nl
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Mark Gross <markgross@kernel.org>
Cc:     Matthew Garrett <matthew.garrett@nebula.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230721145423.161057-1-maxtram95@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230721145423.161057-1-maxtram95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/21/23 16:54, Maxim Mikityanskiy wrote:
> Only the HW rfkill state is toggled on laptops with quirks->ec_read_only
> (so far only MSI Wind U90/U100). There are, however, a few issues with
> the implementation:
> 
> 1. The initial HW state is always unblocked, regardless of the actual
>    state on boot, because msi_init_rfkill only sets the SW state,
>    regardless of ec_read_only.
> 
> 2. The initial SW state corresponds to the actual state on boot, but it
>    can't be changed afterwards, because set_device_state returns
>    -EOPNOTSUPP. It confuses the userspace, making Wi-Fi and/or Bluetooth
>    unusable if it was blocked on boot, and breaking the airplane mode if
>    the rfkill was unblocked on boot.
> 
> Address the above issues by properly initializing the HW state on
> ec_read_only laptops and by allowing the userspace to toggle the SW
> state. Don't set the SW state ourselves and let the userspace fully
> control it. Toggling the SW state is a no-op, however, it allows the
> userspace to properly toggle the airplane mode. The actual SW radio
> disablement is handled by the corresponding rtl818x_pci and btusb
> drivers that have their own rfkills.
> 
> Tested on MSI Wind U100 Plus, BIOS ver 1.0G, EC ver 130.
> 
> Fixes: 0816392b97d4 ("msi-laptop: merge quirk tables to one")
> Fixes: 0de6575ad0a8 ("msi-laptop: Add MSI Wind U90/U100 support")
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/msi-laptop.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index 6b18ec543ac3..f4c6c36e05a5 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -208,7 +208,7 @@ static ssize_t set_device_state(const char *buf, size_t count, u8 mask)
>  		return -EINVAL;
>  
>  	if (quirks->ec_read_only)
> -		return -EOPNOTSUPP;
> +		return 0;
>  
>  	/* read current device state */
>  	result = ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
> @@ -838,15 +838,15 @@ static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
>  static void msi_init_rfkill(struct work_struct *ignored)
>  {
>  	if (rfk_wlan) {
> -		rfkill_set_sw_state(rfk_wlan, !wlan_s);
> +		msi_rfkill_set_state(rfk_wlan, !wlan_s);
>  		rfkill_wlan_set(NULL, !wlan_s);
>  	}
>  	if (rfk_bluetooth) {
> -		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
> +		msi_rfkill_set_state(rfk_bluetooth, !bluetooth_s);
>  		rfkill_bluetooth_set(NULL, !bluetooth_s);
>  	}
>  	if (rfk_threeg) {
> -		rfkill_set_sw_state(rfk_threeg, !threeg_s);
> +		msi_rfkill_set_state(rfk_threeg, !threeg_s);
>  		rfkill_threeg_set(NULL, !threeg_s);
>  	}
>  }

