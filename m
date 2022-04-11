Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAF8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 12:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242888AbiDKMuF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 08:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235615AbiDKMuF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 08:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0762929C87
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649681270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BsCMCkVqMfZuz3QVeWh/diZihLT2aKusufxWiQqCybE=;
        b=Pz3X6Gb1sb5MKUDdQNnq38RpEBTBu2AsbLgE0QMA7fBc8Bo19PmGp4gdVIuZayXQFfcCzf
        TO8It8RTR2+uAhf6Of2b3SQK9xgkseI4DTxf5h5qN8PCPoip4PSZPBM9TnAbo4oCAM41W7
        lEDq0dxVFtTb/OALhHTUCjN6xt+q75I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-jWhdFV5fPdSkA_Dn1zXgTQ-1; Mon, 11 Apr 2022 08:47:48 -0400
X-MC-Unique: jWhdFV5fPdSkA_Dn1zXgTQ-1
Received: by mail-ed1-f71.google.com with SMTP id cz22-20020a0564021cb600b0041d7e11fbfeso1575703edb.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 05:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BsCMCkVqMfZuz3QVeWh/diZihLT2aKusufxWiQqCybE=;
        b=SOeIPxEzf8/u5eA6LylTCX50Plv0ZLIfYE4/ENbwgapNSDRbwRDAkLt7vqEN1zx1zo
         hqFxJ/kcso0HQucI/W6vORyKLuFpX97n3xFAQp4cAffxdRxNRRFb4G3gIe7gRlYktbk6
         WJZElXC3tsPKSXbI/beCFPaV1UbpyERpSWRLuXnLAfILhsk/bKFRSBeRAMVzdYWSCu5w
         1t0bxPRs3fqZQhGO2pkd1BAnLfa7f7bx+3IdkUhpy6Ez08Q54tM/w0WVeezCBLaMOHlZ
         6+ly2PqbpmucZk1zYaDE98p3wB+v2CVma4Y6r/MLngFHDD0Mg8ZC69s0LQXzyK2Nw+9B
         0HRQ==
X-Gm-Message-State: AOAM530ZMtHIWMjqo42xwWL3bUwvMHxk8nV+xbKY3tre3FTOZheGKaAX
        2qr+4G6qLf6D+niTLI6DhPy6oUxysGm1b5qAShizzpkzxDpajxvjbsSuESj3+CwwhECQKDkDuA+
        oxS5I8MwsHsUleEFLs3L9ECQebHkpc12IQg==
X-Received: by 2002:a17:907:c284:b0:6e8:45d7:d124 with SMTP id tk4-20020a170907c28400b006e845d7d124mr15669482ejc.569.1649681267698;
        Mon, 11 Apr 2022 05:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqmIrXVQ742a9Z/lE7HSiXj5X+p9Z28pqQwkBR7nhgVO/QyfyuWrZDEGSooTtdWIkNABNxkg==
X-Received: by 2002:a17:907:c284:b0:6e8:45d7:d124 with SMTP id tk4-20020a170907c28400b006e845d7d124mr15669473ejc.569.1649681267505;
        Mon, 11 Apr 2022 05:47:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y26-20020a1709063a9a00b006e0c272e263sm11919046ejd.71.2022.04.11.05.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 05:47:47 -0700 (PDT)
Message-ID: <337981fc-3041-fd18-5d22-62584233e730@redhat.com>
Date:   Mon, 11 Apr 2022 14:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/6] Correct code style related issues in hp-wmi
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
 <20220404203626.4311-2-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220404203626.4311-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/4/22 22:36, Jorge Lopez wrote:
> Update hp-wmi driver to address all code style issues reported
> by checkpatch.pl script.
> 
> All changes were validated on a HP ZBook Workstation,
> HP EliteBook x360, and HP EliteBook 850 G8 notebooks.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

p.s.

Note I've decided to not merge the "Update hp_wmi_group to simplify
feature addition" patch for now, since this may turn out to not
be necessary when you change things to use the firmware-atrributes
class.



> ---
> Based on the latest platform-drivers-x86.git/for-next
> 
> v1-0001-Update-hp_wmi_group-to-simplify-feature-addition patch was
> broken in two separate patches.  This patch is patch 1 of 2
> ---
>  drivers/platform/x86/hp-wmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0e9a25b56e0e..667f94bba905 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -605,6 +605,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	for (i = 0; i < rfkill2_count; i++) {
>  		int num = rfkill2[i].num;
>  		struct bios_rfkill2_device_state *devstate;
> +
>  		devstate = &state.device[num];
>  
>  		if (num >= state.count ||
> @@ -625,6 +626,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
>  	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
> +
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -634,6 +636,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
>  	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> +
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -643,6 +646,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
>  			char *buf)
>  {
>  	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
> +
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -652,6 +656,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
>  	int value = hp_wmi_get_dock_state();
> +
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -661,6 +666,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
>  	int value = hp_wmi_get_tablet_mode();
> +
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -671,6 +677,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
>  {
>  	/* Get the POST error code of previous boot failure. */
>  	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
> +
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "0x%x\n", value);
> @@ -1013,6 +1020,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  		struct rfkill *rfkill;
>  		enum rfkill_type type;
>  		char *name;
> +
>  		switch (state.device[i].radio_type) {
>  		case HPWMI_WIFI:
>  			type = RFKILL_TYPE_WLAN;

