Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B15C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 08:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D89A760F4B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 08:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238002AbhIMInu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44545 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237831AbhIMInt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 04:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631522554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aO2xQjg0KcRXo5KeF8og49d9mzYqlTv+tnksdu2gqf4=;
        b=d+EbYI4hzfY3fk3JESY5CUaqxxlqgauhT/TLvU348IpFAbOzCQVDD+arH14qecLSpJPkMY
        6pKRUyUntS8y2Txo+c411ne0QgCTJPFU6OBziTT1b2/6vC6MwbktamaTcrAO+qJSMkuxFF
        moFOrRTcfpkUGll8ayMOUOXTW6+Udaw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-gkO_cTZTN8K4Zyen8BTk-A-1; Mon, 13 Sep 2021 04:42:33 -0400
X-MC-Unique: gkO_cTZTN8K4Zyen8BTk-A-1
Received: by mail-ej1-f72.google.com with SMTP id jg32-20020a170907972000b005e801aed08aso3346919ejc.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 01:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aO2xQjg0KcRXo5KeF8og49d9mzYqlTv+tnksdu2gqf4=;
        b=Zo08KcrwxGoicxe+iOArzmjl97Fm1nivJ9dP78qeudLjhhDACnNoxUk/uylb3xf4Bo
         3wYcM52TDkOM3IJ4IBeDt2masDztx6L4WJqCv6e4AIE0ZbkdQ1sBbsmvdkXE+e4fG5Mp
         H71f5GYquMkgf3XPCZgndg5jBVzxDljHe2yMOyIoPpqKornJ+1c8OGLu+0MANZ4sQVUj
         IOIyLZsrnMfQFsBFjowJ0MHu6Tq62u8jtvVp1/NZ9ZSB4fOHJtUlvvA8xlTQbTBNKzKR
         QEKywyVkdfeqmEgA4WRzfQsU2fdXHXDFIV6jxX+BYwTpoc1/2qU2JQ80UILvlcw7IbX/
         6hNQ==
X-Gm-Message-State: AOAM532Aed51aDaDOdnjz1zWcyPhS9vpMrSERQKvUEV5agNpBSG2XQRU
        q+JkK0hc8sdh+8pJrctl7gxrfV9lXnpaIRwjbMm45jJ61tPC6nlH7D2kWHhe7hBOw58PrUXvCKu
        ITc+yerWwqy/9l57SH+VeABJ3KyYN/PH0VVhu6eHeiVvBLiRmdIoZUDhtxxYWgJUheJRHdwQnWC
        i9BagVATmIVg==
X-Received: by 2002:a17:906:7848:: with SMTP id p8mr11531248ejm.212.1631522551637;
        Mon, 13 Sep 2021 01:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4Q4Jpt5NvnnWk4ZLeLctw6heZ7NrYKI0l2Gh05PVc5u0ykWGiHtRw61TZdrZXhivE4DJEMA==
X-Received: by 2002:a17:906:7848:: with SMTP id p8mr11531228ejm.212.1631522551322;
        Mon, 13 Sep 2021 01:42:31 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id c2sm3549827edk.50.2021.09.13.01.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 01:42:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Add info for the Chuwi
 HiBook (CWI514) tablet
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210905130210.32810-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c759c67-7a29-781e-284d-9093bec2dc72@redhat.com>
Date:   Mon, 13 Sep 2021 10:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905130210.32810-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 9/5/21 3:02 PM, Hans de Goede wrote:
> Add touchscreen info for the Chuwi HiBook (CWI514) tablet. This includes
> info for getting the firmware directly from the UEFI, so that the user does
> not need to manually install the firmware in /lib/firmware/silead.
> 
> This change will make the touchscreen on these devices work OOTB,
> without requiring any manual setup.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added both these patches to my review-hans and fixes branches now.

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 37 ++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 0e1451b1d9c6..1f9cb756b103 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -141,6 +141,33 @@ static const struct ts_dmi_data chuwi_hi10_pro_data = {
>  	.properties     = chuwi_hi10_pro_props,
>  };
>  
> +static const struct property_entry chuwi_hibook_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 30),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 4),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1892),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1276),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hibook.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data chuwi_hibook_data = {
> +	.embedded_fw = {
> +		.name	= "silead/gsl1680-chuwi-hibook.fw",
> +		.prefix = { 0xf0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00 },
> +		.length	= 40392,
> +		.sha256	= { 0xf7, 0xc0, 0xe8, 0x5a, 0x6c, 0xf2, 0xeb, 0x8d,
> +			    0x12, 0xc4, 0x45, 0xbf, 0x55, 0x13, 0x4c, 0x1a,
> +			    0x13, 0x04, 0x31, 0x08, 0x65, 0x73, 0xf7, 0xa8,
> +			    0x1b, 0x7d, 0x59, 0xc9, 0xe6, 0x97, 0xf7, 0x38 },
> +	},
> +	.acpi_name      = "MSSL0017:00",
> +	.properties     = chuwi_hibook_props,
> +};
> +
>  static const struct property_entry chuwi_vi8_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
>  	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
> @@ -979,6 +1006,16 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
>  		},
>  	},
> +	{
> +		/* Chuwi HiBook (CWI514) */
> +		.driver_data = (void *)&chuwi_hibook_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
> +			/* Above matches are too generic, add bios-date match */
> +			DMI_MATCH(DMI_BIOS_DATE, "05/07/2016"),
> +		},
> +	},
>  	{
>  		/* Chuwi Vi8 (CWI506) */
>  		.driver_data = (void *)&chuwi_vi8_data,
> 

