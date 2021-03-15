Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E785C433E9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Mar 2021 10:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3427C64E99
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Mar 2021 10:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhCOKT7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Mar 2021 06:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25843 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229524AbhCOKTb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Mar 2021 06:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615803571;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4H0t9R5LNgdt6oohPgmQ6W+xH6IrAfJheLo0PRTerkM=;
        b=HDQTRXiOtJarGyzkGzCFOklVVDhcTw/7IZe0N353uLZyacic7/ExgVWjjGB7SMQ4Qvg7+7
        hf8pJXiWYjtPgIERW0UHWvQI4vMI6UVrINiNjk1et17m+TGI6czDnNZvScUS8TYXt350ku
        ZSUPWUWg93FdPqt7zZiuOVg4ByIpomk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-656GuxZeOY-lsrJVinvR1w-1; Mon, 15 Mar 2021 06:19:27 -0400
X-MC-Unique: 656GuxZeOY-lsrJVinvR1w-1
Received: by mail-ej1-f69.google.com with SMTP id en21so11755588ejc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Mar 2021 03:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4H0t9R5LNgdt6oohPgmQ6W+xH6IrAfJheLo0PRTerkM=;
        b=BYkbYinqxkVwzXuog/zBapr8bZkUzbpqt01e2rlMStopZ290RE/Sq4ZRs7wxzfQIkc
         O1squx/q8ACkq4w7ezD53RsIBDUlePItQZ5CbByPaka+tsl9QY2UTDlxEx/0vRMASx/h
         jeryA/fybIOsiN8n/ASZqiLwl22r0YlfD6fG/JwdTw03TT6L2is8qVWgZZKAxBEsQ7Bb
         se91viKkROmO5OVPPbUpX2Bh9HZL02JO9K9lFvqXrt/p2BPfWY1+/fzE2XYoDJPN3zji
         Q1dmBeiGRrs8wGeutg+tVhDQHgGHOVB/15jYcab1kYwEpFlb9CNFRERUy/KInSUkhJYw
         s5lg==
X-Gm-Message-State: AOAM530G94bb8Jkx8o4BEGCkW/Q4P/I0+BRr4mBs+8MlscaexbKcU81y
        ZfZy4iTDhHwEUDGI2/nggE+PeXFG14xIODsoaEB0jQLkHrOcuxU93Lqn6OyAjWQPQrBs2EfrvDs
        IkDMMAxSXCSXtwuO4YIl+6h+ZcOSpoZw4Dw==
X-Received: by 2002:a05:6402:304b:: with SMTP id bu11mr28119348edb.157.1615803566154;
        Mon, 15 Mar 2021 03:19:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKU1fbWoKqnF953DlzDBdbMwkCPOiePU1adCsKRZqOcav3wtyGBKCQsBBzqea6uLH9+r+/Yg==
X-Received: by 2002:a05:6402:304b:: with SMTP id bu11mr28119331edb.157.1615803565998;
        Mon, 15 Mar 2021 03:19:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n6sm2530343eji.37.2021.03.15.03.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 03:19:25 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] platform/x86: pmc_atom: improve critclk_systems
 matching for Siemens PCs
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Haener <michael.haener@siemens.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-5-henning.schild@siemens.com>
 <20210315111434.413137b5@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ef5fe493-285d-145c-8d05-7f9bd0cb47c5@redhat.com>
Date:   Mon, 15 Mar 2021 11:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315111434.413137b5@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/15/21 11:14 AM, Henning Schild wrote:
> Am Mon, 15 Mar 2021 10:57:10 +0100
> schrieb Henning Schild <henning.schild@siemens.com>:
> 
>> Siemens industrial PCs unfortunately can not always be properly
>> identified the way we used to. An earlier commit introduced code that
>> allows proper identification without looking at DMI strings that could
>> differ based on product branding.
>> Switch over to that proper way and revert commits that used to collect
>> the machines based on unstable strings.
>>
>> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as
>> CLK_IS_CRITICAL") Fixes: e8796c6c69d1 ("platform/x86: pmc_atom: Add
>> Siemens CONNECT ...") Fixes: f110d252ae79 ("platform/x86: pmc_atom:
>> Add Siemens SIMATIC ...") Fixes: ad0d315b4d4e ("platform/x86:
>> pmc_atom: Add Siemens SIMATIC ...") Tested-by: Michael Haener
>> <michael.haener@siemens.com> Signed-off-by: Henning Schild
>> <henning.schild@siemens.com> ---
>>  drivers/platform/x86/pmc_atom.c | 47
>> +++++++++++++++++++-------------- 1 file changed, 27 insertions(+),
>> 20 deletions(-)
>>
>> diff --git a/drivers/platform/x86/pmc_atom.c
>> b/drivers/platform/x86/pmc_atom.c index ca684ed760d1..38542d547f29
>> 100644 --- a/drivers/platform/x86/pmc_atom.c
>> +++ b/drivers/platform/x86/pmc_atom.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/io.h>
>>  #include <linux/platform_data/x86/clk-pmc-atom.h>
>>  #include <linux/platform_data/x86/pmc_atom.h>
>> +#include <linux/platform_data/x86/simatic-ipc.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pci.h>
>>  #include <linux/seq_file.h>
>> @@ -362,6 +363,23 @@ static void pmc_dbgfs_register(struct pmc_dev
>> *pmc) }
>>  #endif /* CONFIG_DEBUG_FS */
>>  
>> +static bool pmc_clk_is_critical = true;
>> +
>> +static int siemens_clk_is_critical(const struct dmi_system_id *d)
>> +{
>> +	u32 st_id;
>> +
>> +	if (dmi_walk(simatic_ipc_find_dmi_entry_helper, &st_id))
>> +		goto out;
>> +
>> +	if (st_id == SIMATIC_IPC_IPC227E || st_id ==
>> SIMATIC_IPC_IPC277E)
>> +		return 1;
>> +
>> +out:
>> +	pmc_clk_is_critical = false;
>> +	return 1;
>> +}
>> +
>>  /*
>>   * Some systems need one or more of their pmc_plt_clks to be
>>   * marked as critical.
>> @@ -424,24 +442,10 @@ static const struct dmi_system_id
>> critclk_systems[] = { },
>>  	},
>>  	{
>> -		.ident = "SIMATIC IPC227E",
>> -		.matches = {
>> -			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
>> -			DMI_MATCH(DMI_PRODUCT_VERSION, "6ES7647-8B"),
>> -		},
>> -	},
>> -	{
>> -		.ident = "SIMATIC IPC277E",
>> -		.matches = {
>> -			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
>> -			DMI_MATCH(DMI_PRODUCT_VERSION, "6AV7882-0"),
>> -		},
>> -	},
>> -	{
>> -		.ident = "CONNECT X300",
>> +		.callback = siemens_clk_is_critical,
>> +		.ident = "SIEMENS AG",
>>  		.matches = {
>>  			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
>> -			DMI_MATCH(DMI_PRODUCT_VERSION,
>> "A5E45074588"), },
>>  	},
>>  
>> @@ -453,7 +457,7 @@ static int pmc_setup_clks(struct pci_dev *pdev,
>> void __iomem *pmc_regmap, {
>>  	struct platform_device *clkdev;
>>  	struct pmc_clk_data *clk_data;
>> -	const struct dmi_system_id *d =
>> dmi_first_match(critclk_systems);
>> +	const struct dmi_system_id *d;
>>  
>>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>>  	if (!clk_data)
>> @@ -461,9 +465,12 @@ static int pmc_setup_clks(struct pci_dev *pdev,
>> void __iomem *pmc_regmap, 
>>  	clk_data->base = pmc_regmap; /* offset is added by client */
>>  	clk_data->clks = pmc_data->clks;
>> -	if (d) {
>> -		clk_data->critical = true;
>> -		pr_info("%s critclks quirk enabled\n", d->ident);
>> +	if (dmi_check_system(critclk_systems)) {
> 
> Had to switch to check_system to get the callback to work.
> 
>> +		clk_data->critical = pmc_clk_is_critical;
>> +		if (clk_data->critical) {
>> +			d = dmi_first_match(critclk_systems);
>> +			pr_info("%s critclks quirk enabled\n",
>> d->ident);
> 
> Now need a double match here just to print the ident. Not too happy
> with that but proposing it like this to keep the ident printing.
> 
> I guess it could be improved by not printing the ident or having a
> global variable and global callback to remember the ident to print
> later. I would propose to not print the ident if the double-match does
> not find traction.

IMHO it would be best to add another callback for the non Siemens
entries which just prints the ideent and returns 1 to avoid needsly
looping over the rest of the array.

And then just set the callback member of all the non Siemens entries
to this new callback. The space for the callback pointer is already
reserved in the struct anyways, so actually setting it does not take
up any space.

Regards,

Hans

