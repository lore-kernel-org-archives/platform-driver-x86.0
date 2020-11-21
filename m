Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6036FC63697
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Nov 2020 14:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17DC3221F8
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Nov 2020 14:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGRVSb+N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbgKUO1o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 21 Nov 2020 09:27:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51534 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727968AbgKUO1n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Nov 2020 09:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605968861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I6J3CFPa6tD+HSofD8tcjcXRTFclUnvVy0S97JTMikM=;
        b=CGRVSb+Nw1IEkXuYxa7YEUpW7OBFDrnmv6lC/NYZdV/Tk0rwu7Dtk0UiXRDNZbiHEsmfgu
        CnoY5XB0ER372sxOqfIJEkf1uXZPJa0Se4h/CxefduUyOYk/5v/FVlk+sh/V6vTaoaSXsU
        9DNz+78t/18B52yI83Pj1Oe3Ojs95/c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-cOn1TDi3MTi4f0XTNHZfkw-1; Sat, 21 Nov 2020 09:27:40 -0500
X-MC-Unique: cOn1TDi3MTi4f0XTNHZfkw-1
Received: by mail-ed1-f70.google.com with SMTP id h11so3675874edw.14
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2020 06:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I6J3CFPa6tD+HSofD8tcjcXRTFclUnvVy0S97JTMikM=;
        b=dgkKp+stN8wkatiIKW4Tl/4Ie3Iy9SXNTrpJWifSmKIAkwPUwj8Rm584us89TWho3G
         D6XzcyE8EIaeWWLPOfwH9ML9w7mXEAxv37KrNVIAPeLlppfpp54H+E8qGPN3GdwfZWtg
         otR3bVN5BuOyQVRkR0rjzcO2oqgQeLUSfE2UqBvM2u7Ss3fRPSQCtxw2a2eLBS1EcuN2
         3QRXdNUirHvginXuIJC0jGGrq/Z93zw6pNFAHYGt0M7JC3jjWhuBdwI3tuKG00A7JkhD
         DDgzGdWA9Zu6XiR6H4WGhUsG82nLslU0Hzg5/+6DG8i5wLqVydLZkUm1bB8VpfD9A/3f
         X/TA==
X-Gm-Message-State: AOAM533zHP31flMM+8Iu5NlpOo8hMgVPn394V2gi59/VP8tA3W9gMYUa
        Y1TmsWT1h38l9Mj/d83Kzp3an10rXKpOM09W9aZTGnUWYix0H/0feIpdWDaUuOAdg7LO4Xrma8v
        eEBv3qJOpEGOxgxOfniwOFubc0Wup5ZVQZw==
X-Received: by 2002:a17:906:4712:: with SMTP id y18mr35993629ejq.51.1605968858827;
        Sat, 21 Nov 2020 06:27:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1qAnebKymK+pyT4JAQ5QTkWsY3FZNVj7U9WtSJWXKnvEvq3hI5rxyzxkfklLG94YQhKHa8A==
X-Received: by 2002:a17:906:4712:: with SMTP id y18mr35993611ejq.51.1605968858623;
        Sat, 21 Nov 2020 06:27:38 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id b21sm2504825ejg.93.2020.11.21.06.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2020 06:27:38 -0800 (PST)
Subject: Re: [PATCH v3] ACPI: platform-profile: Add platform profile support
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "mario.limonciello@dell.com" <mario.limonciello@dell.com>,
        "eliadevito@gmail.com" <eliadevito@gmail.com>,
        "hadess@hadess.net" <hadess@hadess.net>,
        "bberg@redhat.com" <bberg@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
References: <markpearson@lenovo.com>
 <20201115004402.342838-1-markpearson@lenovo.com>
 <nRyY5CKaU6WrkbMiM25gTT_bJlrQjTY_UCcQkj8ty-2mPEMVZd4BB9KwrRp7z4GaE3TTOFCXuXnt0_7J_Tj50syusBxTmS5yNZAvYX02X74=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <761671b3-ad26-230b-e709-05ce3bd69498@redhat.com>
Date:   Sat, 21 Nov 2020 15:27:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <nRyY5CKaU6WrkbMiM25gTT_bJlrQjTY_UCcQkj8ty-2mPEMVZd4BB9KwrRp7z4GaE3TTOFCXuXnt0_7J_Tj50syusBxTmS5yNZAvYX02X74=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/20/20 8:50 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2020. november 15., vasárnap 1:44 keltezéssel, Mark Pearson írta:
> 
>> [...]
>> +int platform_profile_register(struct platform_profile_handler *pprof)
>> +{
>> +	mutex_lock(&profile_lock);
>> +	/* We can only have one active profile */
>> +	if (cur_profile) {
>> +		mutex_unlock(&profile_lock);
>> +		return -EEXIST;
>> +	}
>> +
>> +	cur_profile = pprof;
>> +	mutex_unlock(&profile_lock);
>> +	return sysfs_create_group(acpi_kobj, &platform_profile_group);
>> +}
>> +EXPORT_SYMBOL_GPL(platform_profile_register);
>> +
>> +int platform_profile_unregister(void)
>> +{
>> +	mutex_lock(&profile_lock);
>> +	sysfs_remove_group(acpi_kobj, &platform_profile_group);
>> +	cur_profile = NULL;
>> +	mutex_unlock(&profile_lock);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(platform_profile_unregister);
>> [...]
> 
> 
> I just realized that the sysfs attributes are only created if a profile provider
> is registered, and it is removed when the provide unregisters itself. I believe
> it would be easier for system daemons if those attributes existed from module load
> to module unload since they can just just open the file and watch it using poll,
> select, etc. If it goes away when the provider unregisters itself, then I believe
> a more complicated mechanism (like inotify) would need to be implemented in the
> daemons to be notified when a new provider is registered. Thus my suggestion
> for the next iteration is to create the sysfs attributes on module load,
> and delete them on unload.
> 
> What do you think?

Actually I asked Mark to move this to the register / unregister time since
having a non functioning files in sysfs is a bit weird.

You make a good point about userspace having trouble figuring when this will
show up though (I'm not worried about removal that will normally never happen).

I would expect all modules to be loaded before any interested daemons load,
but that is an assumption and I must admit that that is a bit racy.

Bastien, what do you think about Barnabás' suggestion to always have the
files present and use poll (POLL_PRI) on it to see when it changes, listing
maybe "none" as available profiles when there is no provider?

Regards,

Hans

