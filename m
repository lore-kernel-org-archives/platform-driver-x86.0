Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD08C38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjAWNfo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjAWNfo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE51A10E5
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674480897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xUT6/zGIPc3GwuNn3l/4iMhblSRDyrBxcho5VS5gv14=;
        b=OEYO7rpjA+NJwkleJDqqtr7edGxWl1AugoNMxoCH2SQxVpIo1BMjY+TuDwPgk6tGr/lIw/
        eqhvPolytvjI2eaQ9wIGWy9TjO4tU9gQFsv+BR7Q4KEOA+YRi9iqV3pAbLNyhMddKBFl5K
        iu3mP4i5HU/O4t5kuYU5qMJyU0TUick=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-9RhBSQW3PgqSRKSII-pBng-1; Mon, 23 Jan 2023 08:34:54 -0500
X-MC-Unique: 9RhBSQW3PgqSRKSII-pBng-1
Received: by mail-ej1-f71.google.com with SMTP id qw29-20020a1709066a1d00b008725a1034caso7852333ejc.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUT6/zGIPc3GwuNn3l/4iMhblSRDyrBxcho5VS5gv14=;
        b=r2N4UinGJbYy2+s4aQRDnKuhgyVs5tlpI+nj6X8z9soAnYVssGoDGmpng0eKBuZF+c
         nVQe/UqQSzhBfDSu4Rr7huUMCie4NZfiL2MeQS7ehbMKGLTi4CNP/XMcI6A/Q2waRnNR
         vScxxGhj1A5hCJAU0BhD+ELywy134kbgm6vth8gsfypPXKz1FmlC5cAiWMJ8x2lA6dA7
         MvBkhb1VYj9vR7dZZbtg9b1pi9byc77lusj1M4BkyUI3JupNCR4BRJFvDjbYeW9ibRwK
         gnhIahllWjPTPobDtid6Nxh++7P7GL8Oodxise/0DydVpX/W9M6tCNo+0Ezt4zR5/UG8
         Wivw==
X-Gm-Message-State: AFqh2krezGzJRnfjKYGNNO5QASq7sZrwCbqdsTgiLDzFwK/ajczC3KrH
        +eXtA7vssinbMNZH46uH+7UacilKLT/RpJDxp8J9r6KWoQjncTdtmLGpeDiP+WJUF46NkQM2GKP
        nF6ex9CKi5yAroDxSLlCXVYCtflVi1eLXtQ==
X-Received: by 2002:a17:907:1a46:b0:84c:e89e:bb4c with SMTP id mf6-20020a1709071a4600b0084ce89ebb4cmr19026956ejc.49.1674480892238;
        Mon, 23 Jan 2023 05:34:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvVz1e+IQ7iriHxvELemZZDhErW9+SvqO4YhjbKOhGN5N4jCrBvnY+J4tjbGuXWBBj3uSFYyg==
X-Received: by 2002:a17:907:1a46:b0:84c:e89e:bb4c with SMTP id mf6-20020a1709071a4600b0084ce89ebb4cmr19026938ejc.49.1674480892013;
        Mon, 23 Jan 2023 05:34:52 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x3-20020a170906b08300b007c0688a68cbsm22600614ejy.176.2023.01.23.05.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:34:51 -0800 (PST)
Message-ID: <1d75815a-d3a4-0b82-5f4a-02caa01ba35a@redhat.com>
Date:   Mon, 23 Jan 2023 14:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: hp-wmi: Handle Omen Key event
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Rishit Bansal <rishitbansal0@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <Y8cjgu1ql+5+/NST@rishit-OMEN-Laptop-15-en0xxx>
 <919e1992-e1ca-cc7f-fcc1-23a01993b4b8@redhat.com>
In-Reply-To: <919e1992-e1ca-cc7f-fcc1-23a01993b4b8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/23/23 14:32, Hans de Goede wrote:
> Hi,
> 
> On 1/17/23 23:38, Rishit Bansal wrote:
>> Add support to map the "HP Omen Key" to KEY_PROG2. Laptops in the HP
>> Omen Series open the HP Omen Command Center application on windows. But,
>> on linux it fails with the following message from the hp-wmi driver:
>>
>> [ 5143.415714] hp_wmi: Unknown event_id - 29 - 0x21a5
>>
>> Signed-off-by: Rishit Bansal <rishitbansal0@gmail.com>
> 
> Thank you for your patch, I've applied this patch to my review-hans 
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.

I just noticed you send out a v2. I'll replace the patch in my
branch with v2 instead.

Regards,

Hans


>> ---
>>  drivers/platform/x86/hp/hp-wmi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>> index 0a99058be813..d8ba3c483901 100644
>> --- a/drivers/platform/x86/hp/hp-wmi.c
>> +++ b/drivers/platform/x86/hp/hp-wmi.c
>> @@ -91,6 +91,7 @@ enum hp_wmi_event_ids {
>>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
>>  	HPWMI_SANITIZATION_MODE		= 0x17,
>>  	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
>> +	HPWMI_OMEN_KEY				= 0x1D,
>>  };
>>  
>>  /*
>> @@ -219,6 +220,7 @@ static const struct key_entry hp_wmi_keymap[] = {
>>  	{ KE_KEY, 0x21a9,  { KEY_TOUCHPAD_OFF } },
>>  	{ KE_KEY, 0x121a9, { KEY_TOUCHPAD_ON } },
>>  	{ KE_KEY, 0x231b,  { KEY_HELP } },
>> +	{ KE_KEY, 0x21a5,  { KEY_PROG2 }}, /* HP Omen Key */
>>  	{ KE_END, 0 }
>>  };
>>  
>> @@ -810,6 +812,7 @@ static void hp_wmi_notify(u32 value, void *context)
>>  	case HPWMI_SMART_ADAPTER:
>>  		break;
>>  	case HPWMI_BEZEL_BUTTON:
>> +	case HPWMI_OMEN_KEY:
>>  		key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
>>  		if (key_code < 0)
>>  			break;

