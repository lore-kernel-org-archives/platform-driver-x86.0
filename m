Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79467C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 07:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D36E23A77
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 07:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgLHHBa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 02:01:30 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:32801 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgLHHB3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 02:01:29 -0500
Received: from mail-pg1-f199.google.com ([209.85.215.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <alex.hung@canonical.com>)
        id 1kmWzP-0001Zo-9z
        for platform-driver-x86@vger.kernel.org; Tue, 08 Dec 2020 07:00:47 +0000
Received: by mail-pg1-f199.google.com with SMTP id a27so11174161pga.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 23:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=47Fgb0nBCKeT0ZOluv2uCui5bEVwNjaO6RjaZDy/2s4=;
        b=T72KXXM/iR18ESlsbWPaGNG5gCmGn+kn/BkaPwo+ahYtFMlBKFFfkKQowdPQUvo5JE
         8CEocpZufKyuqmGF21Xrx4RB0iL8oQmda2d9NjdZOnsdsPgtvPA/exdFqXB2bX86JeVX
         NcUXSc7wkpgmUfeBgb78ejvZKM8Q5ulcWlxEnPlynhn29+PQLWbt7rJxHMOARQRoB+BK
         dGCTsgcvWwMRGNSoinEhu2a9AOTQK2SctckWR34zIFo9YbePVXVPKgpoePiExHyRm9+G
         s3sraSPZp2WCbj5LivlwYMZFXanuDhTH8GDhTGw4uTWW9JZZNPfrbw4NEElMzPfLKt8J
         ZBFw==
X-Gm-Message-State: AOAM531kVP5yIs6oF1QBWhUthKFbFXf/zJKGgza/UpVJFkyjwG/W/fdR
        OgjP2Vijnxo1DLKByIHjzRG4au7yqOcbsG0fcgdfQORiSjvhp2gQ63bitAjriLoDllg2ewsVKdb
        Iby3nHZMNgbyggLTSJpo+YsWYu+rsxNybWR1aWiXHS5j0kPWDFQw=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr2889704pjb.87.1607410845456;
        Mon, 07 Dec 2020 23:00:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP8T+SG1LPBoINzAYjCPL9TZGhovE0HwhBe/J9icXm04I5dTAvdpzseLk5IuzJmU/h1u6qsg==
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr2889672pjb.87.1607410845129;
        Mon, 07 Dec 2020 23:00:45 -0800 (PST)
Received: from [192.168.0.119] (d198-53-221-123.abhsia.telus.net. [198.53.221.123])
        by smtp.gmail.com with ESMTPSA id s189sm15808915pfb.60.2020.12.07.23.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 23:00:44 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel-hid: add Rocket Lake ACPI device ID
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20201208020620.101455-1-alex.hung@canonical.com>
 <DM6PR19MB26360845CD83725620DA1A06FACD0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Alex Hung <alex.hung@canonical.com>
Message-ID: <52c019c9-e08e-7909-1df6-4aa6f72f3300@canonical.com>
Date:   Tue, 8 Dec 2020 00:00:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26360845CD83725620DA1A06FACD0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2020-12-07 11:27 p.m., Limonciello, Mario wrote:
>> Rocket Lake has a new ACPI ID for Intel HID event filter device.
> 
> Isn't RKL a "desktop" CPU?  IIRC all the existing events were mobile
> oriented.  Are there new events that come through for desktop?

Resent with plain text

The ID was for an AIO system so it is a desktop CPU indeed. I don't know
whether there are new events but the ID is needed to handle existing
events, such as power button events, that were handled in INT33D5
previously.

