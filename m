Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D04C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFCE564DE7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbhBCKZ2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 05:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31017 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233740AbhBCKZ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 05:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612347839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=PgAz4MrsS+zW5N77zXxwS56AukbM+WtnyJF1hzHWECk=;
        b=ARYDso+SqMqa0IFVB2qsUhbyHVyxI1lfjK+/ai+fuo0WT3552J/f1gtBH4CwJ7rVqUJo0d
        cpjl4+9Mi7fCCBu9MwMoeqRhdeFHpJLdaTkjdqWm80bZ2u72ikMkmLn9Cp9LCe7BTr0Zkc
        wrSqEEfpRzb92wgfDVLUo960LJF2FVA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-eRfDZja8OTyGTHDNq4Z8VQ-1; Wed, 03 Feb 2021 05:23:55 -0500
X-MC-Unique: eRfDZja8OTyGTHDNq4Z8VQ-1
Received: by mail-ej1-f69.google.com with SMTP id n25so11690987ejd.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 02:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=PgAz4MrsS+zW5N77zXxwS56AukbM+WtnyJF1hzHWECk=;
        b=GkRzqYNxoSrCA1H9jHQzmXrXqPY+QTslI7zeevvvedBExw2aojx1d4E8Mx1MShwoLX
         LKXCIN1OvcNlePLGoeO9Vud6py0wkkfZk49EiPItUx/RzsdNC1/TuX/uGyEtfIsTXdsE
         XQu90GqGYvdt6gMCW7Xbritvo7Ii583HA1b6+LWnDVDNBkU0oNrScSyTk2Prk3UKgFCO
         IlNBHIyzY1wONbZxtgm9Goy+TjW2sNDI4c7fidfYGXVL9q0mtApqFyOYdnlLH5siSdZO
         XGFe6TIzxIqkmbZaH6QuFlQ81BqHEI8wjFzVvQVtVuIC7rMGh0dl5igaVdtKmJAgTPZa
         ym/A==
X-Gm-Message-State: AOAM530AgUNWkuBJfC8sQ6QusFThy0Z+bLZHHhZIPQh+APhZ5ENXfux0
        GoxMTjwo5R0Q1iq39Bq5qs+AbgZypjomV4pudOTBjDtM58hYeA88aAn4SoIz/nMbTgCXjOk9aIF
        pKQSEA0dwOCPPLMbMKXBuAhoeJb37rg6JylGqTqJm91nGabnwFNhp4Br3Xfvv8KvrxecaP4Fjas
        1EZKCJe19/Qw==
X-Received: by 2002:aa7:cdcd:: with SMTP id h13mr2186448edw.11.1612347834467;
        Wed, 03 Feb 2021 02:23:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx012jsD6tLqDqC6mBh2rOnYXYjs2Fy2dpQH3GcInyos9pCyFxbGKsOMvEmvYsfA6UWY4tM8Q==
X-Received: by 2002:aa7:cdcd:: with SMTP id h13mr2186434edw.11.1612347834221;
        Wed, 03 Feb 2021 02:23:54 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id lz27sm793054ejb.50.2021.02.03.02.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:23:53 -0800 (PST)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.11-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <368c6b64-1e5b-743d-e255-7e9bade23238@redhat.com>
Date:   Wed, 3 Feb 2021 11:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Sorry about the last-minute pull-req. This pull-req contains 2 small but
important bug fixes.

The hp-wmi change fixes an issue which is actively being hit by users:
https://bugzilla.redhat.com/show_bug.cgi?id=1918255
https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/3564

And the dell-wmi-sysman patch fixes a bug in the new dell-wmi-sysman
driver which causes some systems to hang at boot when the driver loads.

Regards,

Hans


The following changes since commit 173aac2fef96972e42d33c0e1189e6f756a0d719:

  platform/x86: thinkpad_acpi: Add P53/73 firmware to fan_quirk_table for dual fan control (2021-01-18 21:42:01 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.11-3

for you to fetch changes up to 215164bfb7144c5890dd8021ff06e486939862d4:

  platform/x86: dell-wmi-sysman: fix a NULL pointer dereference (2021-01-31 22:05:35 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v5.11-3

2 last minute small but important fixes for v5.11 .

The following is an automated git shortlog grouped by driver:

dell-wmi-sysman:
 -  fix a NULL pointer dereference

hp-wmi:
 -  Disable tablet-mode reporting by default

----------------------------------------------------------------
Hans de Goede (1):
      platform/x86: hp-wmi: Disable tablet-mode reporting by default

Mario Limonciello (1):
      platform/x86: dell-wmi-sysman: fix a NULL pointer dereference

 drivers/platform/x86/dell-wmi-sysman/sysman.c |  6 +++++-
 drivers/platform/x86/hp-wmi.c                 | 14 ++++++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

