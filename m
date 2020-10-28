Return-Path: <SRS0=JE7e=ED=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013EDC388F7
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 21:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD6F24680
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 21:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HP3Kjra6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgJ1VkZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52425 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725957AbgJ1VkX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 17:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603921222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wymB3yaPxNZhMixMCniEaWx/seo/S8VnG8VWpq2zAJg=;
        b=HP3Kjra6HE6FnF7YtPoYQJd9rHCP4EteP1Y8pkjrapj7JonFf4ar6H6dtLxbdsNbwZh9kY
        LBCvem5UUREYcDKAT/gIUdR7d3O13S8sgiRSy+eANjMtA2JEY8MfjHtVCKCThF/Vr64IXi
        gW06P+TT10p94+JbzUfBEWCda4qVmVQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-xOq5n5crMmGWubkFpAtbvw-1; Wed, 28 Oct 2020 07:37:38 -0400
X-MC-Unique: xOq5n5crMmGWubkFpAtbvw-1
Received: by mail-ed1-f69.google.com with SMTP id dm20so2019142edb.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 04:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wymB3yaPxNZhMixMCniEaWx/seo/S8VnG8VWpq2zAJg=;
        b=lqy1v9QP8NcIyCUFoU64uio3VoKru2qNhjXgLqcoBWN8HiMiIgx761M4qQ8epkXsu6
         3zPnunATbRrWhECvmfCo52UDwdwkVU34upuEU05g1AqPpkBkHp5mWye24oAg35ZYfR5u
         J5nK8+xDFHGvpjsX1NZsEA0MK1DW/qpfckGNNyBCdtslStEOrAapUSgDm8snKaEWu6V2
         QStIevGoILMoBqxsyUN4jRwb69sYteZvCJ6dgcn26Wh+xJs925Db9IvFpEss3ZH8d810
         aOg+J0MauKTtWphYauSYKxRlkoj6huhyee/6QyzsAHcRQeZ67fIBiwEoch/6T0XFwCCk
         MsJg==
X-Gm-Message-State: AOAM533ZXEpuqCivlzM/IZbRazRpBX7nKWKmwTiqQfq/7vNHgeVCgCNz
        /kaoAOLig8pzfEz6pyd1KhPdWIHSk5kKnliy7YprSDe/mHaWdJ+FgDihkv9W4z8BzFCJGpzuYQc
        7lFueBnehW11Y0RmOpWYKUSpb3LQnr5CwcQ==
X-Received: by 2002:a17:906:e42:: with SMTP id q2mr7137368eji.261.1603885057600;
        Wed, 28 Oct 2020 04:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNZoLFVFBOzkGDPJhBxYcOCfgBnPyO7i9zQqi6i5oTS4GzU6wBqoehZtloAJ818WnkGjra5g==
X-Received: by 2002:a17:906:e42:: with SMTP id q2mr7137352eji.261.1603885057417;
        Wed, 28 Oct 2020 04:37:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id h13sm2756203edz.43.2020.10.28.04.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 04:37:36 -0700 (PDT)
Subject: Re: [PATCH RFC UEK5 5/7] debugfs: Restrict debugfs when the kernel is
 locked down
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        eric.snowberg@oracle.com, john.haxby@oracle.com,
        todd.vierling@oracle.com
Cc:     David Howells <dhowells@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Thomas Gleixner <tglx@linutronix.de>, Greg KH <greg@kroah.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>
References: <20201020210004.18977-1-konrad.wilk@oracle.com>
 <20201020210004.18977-6-konrad.wilk@oracle.com>
 <20201020210808.GB21080@char.us.oracle.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cd3f2a50-685a-c4a9-606a-939d02f84ea3@redhat.com>
Date:   Wed, 28 Oct 2020 12:37:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201020210808.GB21080@char.us.oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/20/20 11:08 PM, Konrad Rzeszutek Wilk wrote:
> On Tue, Oct 20, 2020 at 05:00:02PM -0400, Konrad Rzeszutek Wilk wrote:
>> Disallow opening of debugfs files that might be used to muck around when
> 
> ..snip..
> 
>> [Backport:
>>  Since UEK5 by default is confidentiality we have to outright
>>  disallow debugfs if the default mode is selected. Hence the
>>  call to __kernel_is_confidentiality_mode to help us.
>>
>>  If we are in integrity lockdown mode, we can enable debugfs
>>  IF they match with the above 1-3 criteria]
> 
> <sigh>
> 
> And that is what I get for _not_ doing --suppress-cc=all
> 
> My apologies for spamming you all!

Actually I find this a quite interesting patch, I think it would be
good to get something like this done upstream, rather then relying
on a downstream distro specific patch.

Are there any plans to submit this upstream ?

Regards,

Hans

