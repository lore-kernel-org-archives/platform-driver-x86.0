Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96359CDB465
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Oct 2023 15:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbjJPPfN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Oct 2023 11:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbjJPPfM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Oct 2023 11:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A10B4
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Oct 2023 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697470464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RPRhpPC18KaMGaT72RRJQ/JKOBjEh62LPYtBWm6lGZQ=;
        b=Ak4efHATXomna6a6wOq23SaF3lNdLEy2prJgysEW3cRS62SGYT+j/HRU+Lp1LTJe1LEvup
        F3ydR9bI/Wg4JuvRiGGhY3mdc89eB5YrN+ZLXl+bBYqFW4sE4i2kwxJSA0YXe5liyZoVDT
        OY/gHfuCmglOj4Xs/W20zQeIBktjTXk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-yd_Gb9VpP0qWVEHOheXtBg-1; Mon, 16 Oct 2023 11:34:13 -0400
X-MC-Unique: yd_Gb9VpP0qWVEHOheXtBg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9bd7c682b33so352528266b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Oct 2023 08:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470452; x=1698075252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPRhpPC18KaMGaT72RRJQ/JKOBjEh62LPYtBWm6lGZQ=;
        b=O0rafYgl+4zS+9dlBF736t6lPlyrqYHb3Uje/zvw+4kiJzTnKVNj2qsnI4+Pnjx10X
         L7k95Ld+37ChbLEqQnpODoeYKJwDF9mlQF1EFCsTUNe3yWalJVe3QE1FsgmNpa64Z9FN
         9UfePYJ3Kj4jTzO2+UDHxCUE/XiTg8YeWvVTv19hUJCah20SZ/mK4y1ttDOqUUjSmqlF
         iJrJHX/Z97ItARKiH9TKym9vGa7vXSfcyJekBWzlfAaf4yt2G3LV2ydP1b0I2KPmjSqm
         IMWgkmfq+suJ9c3SsR69i3p8HZ78IAEfHfnJut1iUNVg6uN/qAKkgKWDBERHB5Vu+pmK
         VFQA==
X-Gm-Message-State: AOJu0YwyDmrrAs8B6wJ6PQDlQJkP58UTzLyeRKGO0XOu9uwGYA96hbVj
        Q7J7459TAZaGdDN/u0cCeCWMb/wH1Xdfp57Z5MyyjtgN+h11jCDw/SUAlcczmIbI+rA/PQR8sKQ
        Hp5MpwP7758xQ0VbfdMFtl06fFv3GRcZ5DQ==
X-Received: by 2002:a17:906:7949:b0:9bd:ff07:a58a with SMTP id l9-20020a170906794900b009bdff07a58amr7765769ejo.53.1697470452096;
        Mon, 16 Oct 2023 08:34:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7c5VXHjpz6kDDov4qHMw6C/Oj6MjxdvABy2uuy5M+drjyXqut4Nr8/fIvCZH9LvhdZmXptA==
X-Received: by 2002:a17:906:7949:b0:9bd:ff07:a58a with SMTP id l9-20020a170906794900b009bdff07a58amr7765756ejo.53.1697470451787;
        Mon, 16 Oct 2023 08:34:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dk6-20020a170906f0c600b009c3827134e5sm2641958ejb.117.2023.10.16.08.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 08:34:11 -0700 (PDT)
Message-ID: <7d3f0ecc-bbd7-41c3-413b-c024563e2941@redhat.com>
Date:   Mon, 16 Oct 2023 17:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] platform/x86: x86-android-tablets: Add audio codec
 info for Lenovo Yoga Tab 3 Pro YT3-X90F
To:     Mark Brown <broonie@kernel.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-spi@vger.kernel.org
References: <20231014205314.59333-1-hdegoede@redhat.com>
 <20231014205314.59333-5-hdegoede@redhat.com>
 <5d777654-4700-46ad-bec2-3921d0b7d0fc@sirena.org.uk>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5d777654-4700-46ad-bec2-3921d0b7d0fc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/16/23 16:47, Mark Brown wrote:
> On Sat, Oct 14, 2023 at 10:53:14PM +0200, Hans de Goede wrote:
> 
>> +	.micd_force_micbias = 1,
>> +	.micd_configs = lenovo_yt3_wm5102_micd_config,
>> +	.num_micd_configs = ARRAY_SIZE(lenovo_yt3_wm5102_micd_config),
>> +        .micbias={
>> +           [0]={ /*MICBIAS1*/
>> +                 .mV =2800 ,
>> +                 .ext_cap=1,
> 
> The indentation of this section seems weird - .micbias is indented and
> the lack of spaces around =s is odd.  There's also an extra space before
> the , consistently on the mV lines.

Right this is a copy and paste fail on my side, I've fixed this up
locally already, so this will be fixed in the next version.

Regards,

Hans


