Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F8DC433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 11:12:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA0AA64D74
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 11:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhBLLMW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Feb 2021 06:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25778 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229653AbhBLLMV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Feb 2021 06:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613128254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OENvUVzCZ3R+KnxV80GYMiM19+R4rUbcegcf+XB7PRg=;
        b=ZXERatr9/b9zdGGGjggsTzVpU3AvBIcqKkrUWsk7v8bf+rYYaIHflCdzwBUdTcDuq/i1Qw
        owLZePml7HeXLZXznc/aYFova95A1fqQ6/lS2Ep0RhdKUTOlN3tk7OOqLXHXhMRhuY3tKC
        X4AXGv17pI1I98HnEDNh0pyFBC6HAWs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-IGjkWFtsN8KOI7-4Mzn5Rg-1; Fri, 12 Feb 2021 06:10:52 -0500
X-MC-Unique: IGjkWFtsN8KOI7-4Mzn5Rg-1
Received: by mail-ej1-f69.google.com with SMTP id gv53so6512331ejc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Feb 2021 03:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OENvUVzCZ3R+KnxV80GYMiM19+R4rUbcegcf+XB7PRg=;
        b=H9A5+pbaNW/RBRkuhqfcwWZ9QULOp0xhQ/QHabws/TEZI7BgwSvl2eJVdne+vSBUnX
         MScFWvRoJQf+lj+pIMmoOLWf1L2GYMn+b0DN7TXAR24g3tG7eUapXEyIntXnPVmeGn88
         Tp1OUKfMsSS/U2LkfH2dUKcbjVfyKsWCgEMwL+omycyDIhvM0oT347+94dWi8qZKnUSo
         VnwjJDWFbaPXDaNTx9+gm3ZZi9SCx+I6PKuTDkacJ4axFM9TuyakSWNaXEzXT6AWqCHN
         DX/nRRGdyvoCeMREn+TU3ERLcpN4d8gQ4crxktaW9tvTVOwu9F7l4fvieY3M9SsUeyKg
         twaA==
X-Gm-Message-State: AOAM532UtCrTuPF+RLYHotlQM2OIE9+t2Etc46jmq62c07h2CTFjGr/G
        RUb08YrJb8hX2rGyjjSUL+HpADFwj6zwc1b2uo/IQh/PNR2qkU7bAHp2x5UcwaYSJdNPMRDrToo
        nWPGf0BQ3kDBdGVnL5FAggbjHcC8Cn7uwrg==
X-Received: by 2002:a17:906:d8ca:: with SMTP id re10mr2498083ejb.18.1613128250656;
        Fri, 12 Feb 2021 03:10:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqK+TrCsn9JuUQBgxbd9Yvl0tKNCLantrMvTih2q6NVdiwR1oj6/ditQHmbqFjpWtR+YRX/Q==
X-Received: by 2002:a17:906:d8ca:: with SMTP id re10mr2498070ejb.18.1613128250445;
        Fri, 12 Feb 2021 03:10:50 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f6sm5622320edr.72.2021.02.12.03.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 03:10:50 -0800 (PST)
Subject: Re: [RFC PATCH 0/2] platform/x86: thinkpad_acpi/ideapad-laptop: move
 into subfolder and extract common DYTC code
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210204203933.559752-1-pobrn@protonmail.com>
 <0ba8d0b2-222b-3ac2-b84a-d623b7c6badc@redhat.com>
 <X16Aff5XNZJUdPgCctMfdEHS4iaksw387ELGh5uKz9FXoJka4upg3Fsnw1j9RdkJVVeHrEiA3DYZ-TySG8GBrFyv-YcILAz_lnw92QK65Mo=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b278be3c-685b-e4cb-f338-8ed9b3262564@redhat.com>
Date:   Fri, 12 Feb 2021 12:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <X16Aff5XNZJUdPgCctMfdEHS4iaksw387ELGh5uKz9FXoJka4upg3Fsnw1j9RdkJVVeHrEiA3DYZ-TySG8GBrFyv-YcILAz_lnw92QK65Mo=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/12/21 10:21 AM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. február 12., péntek 9:40 keltezéssel, Hans de Goede írta:
> 
>> [...]
>> I like the series but I would like to see the 3th patch to go even
>> further wrt removing duplication between thinkpad_acpi and ideapad-laptop.
>>
>> The big difference between the 2 drivers is thinkpad_acpi relying on global
>> variables while ideapad-laptop stores everything in a driver data-struct.
>>
>> What you can do is add a struct which holds all the necessary data for the
>> dytc code, struct ideapad_dytc_priv is a start for this I guess. Lets say
>> we rename struct ideapad_dytc_priv to struct dytc_priv, then thinkpad_acpi.c
>> can have a:
>>
>> static struct dytc_priv *dytc_priv;
>>
>> And there can be a shared dytc probe function like this:
>>
>> static int dytc_profile_init(struct dytc_priv **dytc_priv_ret)
>> {
>> 	struct dytc_priv *dytc_priv;
>>
>> 	...
>>
>> 	*dytc_priv_ret = dytc_priv;
>> 	return NULL;
>>
>> error:
>> 	// clean stuff
>> 	*dytc_priv_ret = NULL;
>> 	return err;
>> }
>>
>> Which thinkpad_acpi can then call on its global dytc_priv pointer:
>>
>> 	err = dytc_profile_init(&dytc_priv);
>>
>> Where as ideapad_laptop would use the pointer inside its data struct:
>>
>>         err = dytc_profile_init(&priv->dytc);
>>
>>
>> I think this way we should be able to share almost all of the dytc code
>> not just the 2 convert functions.
>>
> 
> How exactly do you imagine that? In separate (e.g. "lenovo-dytc") kernel module?

That would be an option in that case this module should have a non user
selectable Kconfig option and then be select-ed by both the thinkpad_acpi
and ideapad-laptop Kconfig bits. Note that the plan is to move to select for
ACPI_PLATFORM_PROFILE too, see:
https://github.com/linux-surface/kernel/commit/d849e0e069042cbc83636496f66c09e52db4eb01

But I'm fine with just having everything as static inline in a header too,
the overhead of having another module is likely going to mean that there
will be no disk-space saving and only one of the 2 will ever be loaded in
memory. So arguably just having a header with everything static inline
is more efficient and it means a simpler/cleaner Kconfig so I have a slight
preference for just having a header with all the functions as static inline
functions.

The goal here is source-code size reduction, compiled-code size reduction
is less important.

> And I assume platform profile registration/etc. should be done by shared code as well?

Yes (if possible).

Regards,

Hans

