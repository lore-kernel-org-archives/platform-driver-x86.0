Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BA6C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 10:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjBMK2N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 05:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjBMK2M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 05:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EA99ED0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 02:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676284039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=3CE4eMa3FyiLCFaW2IEzgSX8SFgyrVdO0vnWlAIO6nA=;
        b=KtLqC/T6lblPbvys/TJAD2zGYAVz33AeFShPXhkFThIZgH6fUbcuwG42DDEQocxJYfk/cZ
        bvD+ESaAXhjXn3+fG8dn+8ga23VAoR/+QHXXUkrpQxEjLQd5O/O7B2jCRQ4rMjphgm90EF
        MFLLOZSMUWNXBaNvF0P7XBIDswOCbb0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-128-Bkq00NQBNuaJSrj7ez9-Ew-1; Mon, 13 Feb 2023 05:27:17 -0500
X-MC-Unique: Bkq00NQBNuaJSrj7ez9-Ew-1
Received: by mail-ej1-f71.google.com with SMTP id fy3-20020a1709069f0300b008a69400909fso7288757ejc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 02:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3CE4eMa3FyiLCFaW2IEzgSX8SFgyrVdO0vnWlAIO6nA=;
        b=PhabTSOwclMcRHfEqsI/Bbkl+sWzZ7OBJ4F88fVrXYcBnSpMGUo9JgwzFVhzUjMc6t
         gSirsLdoJoMPF07QcEt5ehblMmyGg5jr17iErNRLEW0FR053NNtweXKFiBFUfah+ySQC
         hzuc6Fl7292U45Tyep/a6fULH8+jIsLPvj6lKmTWRFPgJn48reO33IAJJpp6wBkiO2nm
         U1crlclNZyFrJqUV951yntOYkAiyeojJYw6nTezXqWR5YWq/9DVrcgdrkfKYRQl5b7I4
         xzwRhA03i65cFb17ILthKbLWwSdUMS6dC7w4Hv7ff4QU4eooPrmoRf28PP75jpmu+Qy2
         D+EQ==
X-Gm-Message-State: AO0yUKXUo60kqVfDmDf7rEcVujJkmrzY1bK1NJiB0/nCa2swoMXp3QoZ
        3ndT9luUIN/ZpH0Sx1vQHxGSuobqRJyzihUat4Zi2q1YdMhDVqHrguboPs/9ehLdR1hVeGTiDak
        PDW+9VoS32IC3Yin5Qg77cLSiKH7awxuekK4me2k=
X-Received: by 2002:a50:f68f:0:b0:4ac:bd71:c595 with SMTP id d15-20020a50f68f000000b004acbd71c595mr6052589edn.23.1676284036690;
        Mon, 13 Feb 2023 02:27:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9QGHi+YsmDnD9yqlqMdgEAeBYm8x6qQMbITvCHZ+TrYaMAuKZ6VJkCEQkGSU7621PEz/lV3Q==
X-Received: by 2002:a50:f68f:0:b0:4ac:bd71:c595 with SMTP id d15-20020a50f68f000000b004acbd71c595mr6052581edn.23.1676284036572;
        Mon, 13 Feb 2023 02:27:16 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id t18-20020a50c252000000b0049148f6461dsm6340025edf.65.2023.02.13.02.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:27:16 -0800 (PST)
Message-ID: <06020103-8bbb-c02f-f59a-b4cad88d9184@redhat.com>
Date:   Mon, 13 Feb 2023 11:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.2-5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the (hopefully) final platform-drivers-x86 fixes pull-req for 6.2.

This pull-req contains just 1 trivial change, a set of Intel vsec driver
Meteor Lake PCI id additions.

Regards,

Hans


The following changes since commit eecf2acd4a580e9364e5087daf0effca60a240b7:

  platform/x86: touchscreen_dmi: Add Chuwi Vi8 (CWI501) DMI match (2023-02-02 11:34:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-5

for you to fetch changes up to eb4b55f2f26fc8a7b7dc6f06f1de91480d53485b:

  platform/x86/intel/vsec: Add support for Meteor Lake (2023-02-06 14:40:47 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.2-5

Intel vsec driver Meteor Lake PCI ids addition.

The following is an automated git shortlog grouped by driver:

platform/x86/intel/vsec:
 -  Add support for Meteor Lake

----------------------------------------------------------------
Gayatri Kammela (1):
      platform/x86/intel/vsec: Add support for Meteor Lake

 drivers/platform/x86/intel/vsec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

