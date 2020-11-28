Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189EFC71156
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D363E221FD
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OC7MbmA6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388869AbgK1Vtq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40646 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729302AbgK1SCq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Nov 2020 13:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606586479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g0Uzf4pAsQuv1a9e7whOvDp6GQhXQtJ5XUD1/+tNrqo=;
        b=OC7MbmA6phGqJMov7BgL9jneZxK1NM7fVZ4Vw/HdwDnPxXh/MnQtDRFMQsvCm2G9l0/tZa
        KCy6/w2Q+rYuSercW1HQvZOlOpKuA4XeJgGHw5wno2fXHlfX26PSxv/czx2pWPa3QM1adB
        +YI6qRUMnbudItl5S8717QnxpT4qXLo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-8Yl9-qs1Mvm3Lc8af_pG_g-1; Sat, 28 Nov 2020 10:00:53 -0500
X-MC-Unique: 8Yl9-qs1Mvm3Lc8af_pG_g-1
Received: by mail-ej1-f72.google.com with SMTP id f21so3296325ejf.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2020 07:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g0Uzf4pAsQuv1a9e7whOvDp6GQhXQtJ5XUD1/+tNrqo=;
        b=ErDbQi0EN4N0WhcwPViEPLnXv/+6r/8DnyGhUbvSaYT2QoKUFwjQ0OB+/UY7bD5LQM
         Qyq1SLBn1Z7lWXowHfppXEh5QdtO6KmkJjCasr5GbgEolYlzdHHci2a6yzLbLUBYepZw
         vkB+1GMurKDJ8OmOF9u5xUwoSWjwZtxX8TcZfDRF8IY4Xr8iatKYlnkblvOVrDxgOxob
         fV4XfsfnHZ9hb5rd3Oasg/1Mixn9UlUoFifcOr3vwP2vom302EHFphkQPU8XuUvHNm7K
         cfWHa0MwLSVeTBK1cfSzt4dHtAKvS8UsTTYnxUKilXv/oKDA11jQ+QjQUBzLqnzu6SB5
         W37Q==
X-Gm-Message-State: AOAM533Jh4frF+kyELjvV9vhi1AwZzJ2b3tretiETZhSDqH6MiK3cRCj
        g3oOynSO/J3gysxs198XHK+SpIo/r3QBoSSDYZiVvHGdEadHqbbyw41pANuSBMd4C25oBChE7N8
        ccvETSsqqzOmlowfUgeVWpUsh3FgaE4628A==
X-Received: by 2002:a17:906:46d2:: with SMTP id k18mr12477888ejs.33.1606575652424;
        Sat, 28 Nov 2020 07:00:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfCaEjCJZ8RA6kpCFwaIt0E5UjjQ61/sW6/NOcJ/+g1B9zaWkPV7DDZl8fsGZdctVGN3RpgA==
X-Received: by 2002:a17:906:46d2:: with SMTP id k18mr12477862ejs.33.1606575652170;
        Sat, 28 Nov 2020 07:00:52 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id pk19sm4011141ejb.32.2020.11.28.07.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 07:00:51 -0800 (PST)
Subject: Re: [PATCH v4 3/3] platform/x86: thinkpad_acpi: Add platform profile
 support
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "hadess@hadess.net" <hadess@hadess.net>,
        "mario.limnociello@dell.com" <mario.limnociello@dell.com>,
        "eliadevito@gmail.com" <eliadevito@gmail.com>,
        "bberg@redhat.com" <bberg@redhat.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
References: <markpearson@lenovo.com>
 <20201126165143.32776-1-markpearson@lenovo.com>
 <20201126165143.32776-3-markpearson@lenovo.com>
 <ioprVbNER4h0HTVvyj2ElXiuNaSPjl8ycgp4XtOtj-Iwe4_6qnNRLYuvxIJKE2ULGPTRURY-1Dr9plCocTnx2S_ugBn7INWZScnn4-pTq4c=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e738a62-2d1b-0357-7ef6-fb080d365064@redhat.com>
Date:   Sat, 28 Nov 2020 16:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ioprVbNER4h0HTVvyj2ElXiuNaSPjl8ycgp4XtOtj-Iwe4_6qnNRLYuvxIJKE2ULGPTRURY-1Dr9plCocTnx2S_ugBn7INWZScnn4-pTq4c=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/27/20 8:22 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2020. november 26., csütörtök 17:51 keltezéssel, Mark Pearson írta:
> 
>> [...]
>> +static bool dytc_ignore_next_event;
> 
> As a sidenote: can the profile switching be triggered by means that's not the
> `/sys/firmware/acpi/platform_profile` attribute (e.g. a physical button)?
> Because if so, then I'm not sure if `dytc_ignore_next_event` achieves its purpose
> robustly, although I believe it won't cause issues in practice. I think it could
> be made more robust using a mutex to serialize and synchronize access to the DYTC
> interface, but I'm not sure if the effort is worth it.
> 
> 
>> +static bool dytc_profile_available;
>> +static enum platform_profile_option dytc_current_profile;
>> [...]
>> +static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>> +{
>> +	int err, output;
>> +
>> +	dytc_profile_available = false;
>> +	dytc_ignore_next_event = false;
>> +
>> +	err = dytc_command(DYTC_CMD_QUERY, &output);
>> +	/*
>> +	 * If support isn't available (ENODEV) then don't return an error
>> +	 * and don't create the sysfs group
>> +	 */
>> +	if (err == -ENODEV)
>> +		return 0;
>> +	/* For all other errors we can flag the failure */
>> +	if (err)
>> +		return err;
>> +
>> +	/* Check DYTC is enabled and supports mode setting */
>> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
>> +		/* Only DYTC v5.0 and later has this feature. */
>> +		int dytc_version;
>> +
>> +		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
>> +		if (dytc_version >= 5) {
>> +			dbg_printk(TPACPI_DBG_INIT,
>> +				   "DYTC version %d: thermal mode available\n", dytc_version);
>> +			/* Create platform_profile structure and register */
>> +			do {
>> +				err = platform_profile_register(&dytc_profile);
>> +			} while (err == -EINTR);
>> [...]
> 
> I'm wondering if this loop is really necessary?

It is the result of using mutex_interruptible inside platform_profile_register(),
once that is fixed (as I just requested in my review of patch 2/3) then this loop
can go away.

Regards,

Hans

