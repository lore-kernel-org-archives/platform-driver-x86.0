Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7C6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 13:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349590AbiDDNib (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 09:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbiDDNia (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 09:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA0493B57F
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649079392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yM79sOHzynfx/DkWRAeCB4+/jNMi5A+NK8AOfH8zXlw=;
        b=Kgrf3HzSfDybglppcNDLKOeGtIHaEtD88I0HH61BS4WCJVJ3MJRPsI7b7jsmph56IawZXn
        IK7VJUEwYN4YdZeI6PQBZkBtJDFp6Xg/pitLqhc0Lp85SyGae/NkfbgSSm4Y6tL7ccWZg2
        Xxda723+2VvhPLy78lqmZj8DtHV23K4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-OtOsLqvIPSCHZoL10rBizw-1; Mon, 04 Apr 2022 09:36:31 -0400
X-MC-Unique: OtOsLqvIPSCHZoL10rBizw-1
Received: by mail-ej1-f71.google.com with SMTP id hz15-20020a1709072cef00b006dfeceff2d1so4524737ejc.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 06:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yM79sOHzynfx/DkWRAeCB4+/jNMi5A+NK8AOfH8zXlw=;
        b=eHnLibiFLXeOsXwNSM1ccLAN5obvZDQ5YXxT/oZwu0+2sM+GTg2Ci0tJDmvlYWnE57
         4ctSwIkCkCqIbKWq8q1uV4U18NFPxmI1ZkCRSco8z/QC6rNqFAmP5Bjg7NyiuVsxixna
         6JO+YSpBwrRiJ/FRruItabzeWRYCfttdhTAM4Q2a3Ma3kxGhOikuJjuC4FXIL2JQbqUw
         zru5g1dkf7i1gsTF5fgqniebkyza+99qahaTMUKHfMNrd1nCT8aTRnuGWP8mIEj0l0Dg
         39vg6ml7V1lJf1CHYBVA24/VysHyh5I1pQzWlqVqkDI9B4O/B207TXJ97yjFaOFfmDtO
         pZ1w==
X-Gm-Message-State: AOAM531K7zjTbPNR2+rqAIX7aGnL+IrzWIjN1RkJRQmGlmt894f2Bw66
        Hj8AtsW0ea2AMPYmIXi1j2ojUY4F63j5buSOvy33M1joZoEw41tXQj/vstKn4BCRHX/mwxSHkIJ
        j9E7pHJpotMVwDw+Rc4Muk+s+FF7RmktlwQ==
X-Received: by 2002:a05:6402:438f:b0:41b:51ca:f541 with SMTP id o15-20020a056402438f00b0041b51caf541mr94248edc.80.1649079390331;
        Mon, 04 Apr 2022 06:36:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlHeEgFaMArUydDWm0tYYmFCj07RLJm3JJwm788bBc1mZXG/NqWv7uRk4abOIhZEbhwYmEug==
X-Received: by 2002:a05:6402:438f:b0:41b:51ca:f541 with SMTP id o15-20020a056402438f00b0041b51caf541mr94233edc.80.1649079390079;
        Mon, 04 Apr 2022 06:36:30 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id qb10-20020a1709077e8a00b006dfedd50ce3sm4422268ejc.143.2022.04.04.06.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:36:29 -0700 (PDT)
Message-ID: <17ee6ddb-e31c-82bc-8b30-04d549afd5df@redhat.com>
Date:   Mon, 4 Apr 2022 15:36:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] Update hp_wmi_group to simplify feature addition
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220324153024.12662-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220324153024.12662-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 3/24/22 16:30, Jorge Lopez wrote:
> The purpose for this patch is introduce two minor changes.
> The first set of changes are style related reported by checkpatch.pl
> script.  Lastly, changes were introduced in preparation to submission of
> four new features.  The addition of hp_wmi_groups will simplify the
> integration of the upcoming driver security features with sysfs.
> 
> All changes were validated on a HP ZBook Workstation,
> HP EliteBook x360, and HP EliteBook 850 G8 notebooks.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0e9a25b56e0e..0c7d863b8aab 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -605,6 +605,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	for (i = 0; i < rfkill2_count; i++) {
>  		int num = rfkill2[i].num;
>  		struct bios_rfkill2_device_state *devstate;
> +

There is lots of unrelated whitespace addition, here.

>  		devstate = &state.device[num];
>  
>  		if (num >= state.count ||
> @@ -625,6 +626,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
>  	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
> +

and here.

>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -634,6 +636,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
>  	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> +

and here.

>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -643,6 +646,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
>  			char *buf)
>  {
>  	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
> +

and here.

>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -652,6 +656,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
>  	int value = hp_wmi_get_dock_state();
> +

etc.

>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -661,6 +666,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
>  	int value = hp_wmi_get_tablet_mode();
> +

and even more.

>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -671,6 +677,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
>  {
>  	/* Get the POST error code of previous boot failure. */
>  	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
> +

and even more.

>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "0x%x\n", value);
> @@ -733,7 +740,15 @@ static struct attribute *hp_wmi_attrs[] = {
>  	&dev_attr_postcode.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(hp_wmi);
> +
> +static const struct attribute_group hp_wmi_group = {
> +	.attrs = hp_wmi_attrs,
> +};
> +
> +static const struct attribute_group *hp_wmi_groups[] = {
> +	&hp_wmi_group,
> +	NULL,
> +};
>  
>  static void hp_wmi_notify(u32 value, void *context)
>  {
> @@ -1013,6 +1028,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  		struct rfkill *rfkill;
>  		enum rfkill_type type;
>  		char *name;
> +

and even more.

>  		switch (state.device[i].radio_type) {
>  		case HPWMI_WIFI:
>  			type = RFKILL_TYPE_WLAN;

Note these white-space conditions are a correct cleanup from a code-style
point of view, but please split this patch into 2 patches, 1 with the change from
the commit message and a new patch with all the whitespace patches.

Regards,

Hans


