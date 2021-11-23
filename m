Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F148C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 17:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237417AbhKWRIw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 12:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57176 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235834AbhKWRIw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 12:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637687143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pGOFNnsq6hQbfSzZ1S8QHSbquiLsz2uf/jFzpbBf870=;
        b=YI/seXBblx4cvLZvLILxGCtdt/qjqgNqwq2xB9Zlmu6ht1hImRNXKN0raPP2y0pD/7luzp
        tEYMddcEYblA1bNCKsCz5K4aVgOP4r8Hzo3UoUVIjfWw7/x+0PghpNdHntVYBL05AQko4f
        7PeagI8VmqYJMGNBtIAhZllttfBJM6k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-etRPdBazNnur4CCm-2ad2A-1; Tue, 23 Nov 2021 12:05:42 -0500
X-MC-Unique: etRPdBazNnur4CCm-2ad2A-1
Received: by mail-ed1-f71.google.com with SMTP id p4-20020aa7d304000000b003e7ef120a37so18373210edq.16
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Nov 2021 09:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pGOFNnsq6hQbfSzZ1S8QHSbquiLsz2uf/jFzpbBf870=;
        b=sx8P2fdj8txoPrQJJ9sWEPrsyRNFn2g2p6hw67Ocfi147CZMrKG8yEVu3GBp5tpubO
         V8gR14JFImnQeJK/GHWSQPT/G7NbXxK0m4LMq0yzaSjwrCaXf1EdMrG99QQM9+PZIHvI
         g0B5kcYBCq3qn9aJsa5o4ylH3wbCiFv9tVaDhzQltQzsk145aWjROoma9BBIZ3NbRcwZ
         7q0AK2JcTHawQ1pH4tzoPCRaeeAGV3lJDV72vrCZcAzjsgmRVUWOiBSrNqi9MCnapHN2
         +gTe+W1O79ihKp2edYh9N7jgY5anIyDbFW4hwqzQmjGzA8ZwnEM4QfxHiQnkknJwmj9D
         bwDg==
X-Gm-Message-State: AOAM5306sC8RJ6R+PWL8Yw3sdU5ambuFSytk1Tph8iycK1y5qHSW7Kog
        DmyifVSxRPzpUdEg7A30iQF13SVxJHmvmRZWS17w63UeiI+ugyyshCwsh/awx2iKsJfdAOxwEkb
        PbUbX1HheII7sKn3cQtr2kOXP+OBz7Xslcg==
X-Received: by 2002:a17:906:961a:: with SMTP id s26mr9623839ejx.494.1637687141323;
        Tue, 23 Nov 2021 09:05:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4G1bs09BzbVicSMtyElfOMBCmrs0kGMkLPlLLrABuxLB8dcws6JHPaJbut24ePtrSUngUcw==
X-Received: by 2002:a17:906:961a:: with SMTP id s26mr9623786ejx.494.1637687141113;
        Tue, 23 Nov 2021 09:05:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gs15sm5423945ejc.42.2021.11.23.09.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 09:05:40 -0800 (PST)
Message-ID: <87af37a2-dc02-2ae0-a621-b82c8601c16c@redhat.com>
Date:   Tue, 23 Nov 2021 18:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/11] ACPI / scan: Create platform device for CLSA0100
 ACPI nodes
Content-Language: en-US
To:     Lucas Tanure <tanureal@opensource.cirrus.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Kailang Yang <kailang@realtek.com>,
        Shuming Fan <shumingf@realtek.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc:     Jeremy Szu <jeremy.szu@canonical.com>,
        Hui Wang <hui.wang@canonical.com>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        Cameron Berkenpas <cam@neo-zeon.de>,
        Sami Loone <sami@loone.fi>, Elia Devito <eliadevito@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jack Yu <jack.yu@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        alsa-devel@alsa-project.org, linux-acpi@vger.kernel.org,
        patches@opensource.cirrus.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Lucas,

On 11/23/21 17:31, Lucas Tanure wrote:
> The ACPI device with CLSA0100 is a sound card with multiple
> instances of CS35L41.
> 
> We add an ID to the I2C multi instantiate list to enumerate
> all I2C slaves correctly.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>  drivers/acpi/scan.c                          | 1 +
>  drivers/platform/x86/i2c-multi-instantiate.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 2c80765670bc..16827a33e93b 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1708,6 +1708,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  		{"BSG2150", },
>  		{"INT33FE", },
>  		{"INT3515", },
> +		{"CLSA0100", },
>  		{}
>  	};
>  
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index 4956a1df5b90..ed25a0adc656 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
>  	{}
>  };
>  
> +static const struct i2c_inst_data clsa0100_data[]  = {
> +	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },

This suggests that both amplifiers are using the same GPIO pin as shared
IRQ, is that correct ? Can you share an acpidump of the laptop's DSDT tables ?

Regards,

Hans




> +	{}
> +};
> +
>  /*
>   * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -155,6 +161,7 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)bsg1160_data },
>  	{ "BSG2150", (unsigned long)bsg2150_data },
>  	{ "INT3515", (unsigned long)int3515_data },
> +	{ "CLSA0100", (unsigned long)clsa0100_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
> 

