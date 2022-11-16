Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7379BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 15:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbiKPP0S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 10:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbiKPP0J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 10:26:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76198218
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668612307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=NP+pB0Kg2UQkpxmRPtc2ZePGILkhQkERytIj70eSLrk=;
        b=YIMUOiTVynopJ48XRaMrUkvwHmQWPB0e3aSwYtu5kDs/i/zTdWngWglBul7fgS4qPe8N1+
        PPxD2o0Yvt0u51s5S7vb73p9DGCi2UdtoPklmDkpuIqr1MUmmJ1x9fKAQ2al0ZZ9uX6llo
        ITqi4Dka2KNFCtnvQDDWsZqahd410G8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-C58weV0HNeWoJeGRQDV3Vg-1; Wed, 16 Nov 2022 10:25:02 -0500
X-MC-Unique: C58weV0HNeWoJeGRQDV3Vg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CCEC811E81;
        Wed, 16 Nov 2022 15:25:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.78])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 88A6C492B04;
        Wed, 16 Nov 2022 15:24:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/3] platform/x86: ideapad-laptop: Rework touchpad control code
Date:   Wed, 16 Nov 2022 16:24:45 +0100
Message-Id: <20221116152448.698707-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here are my proposed changes from the "ideapad-laptop touchpad handling
problems, request for help" email thread as proper patches:
https://lore.kernel.org/platform-driver-x86/bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com/

Note this applies on top of my review-hans branch which has seen a bunch
of other ideapad-laptop changes land recently:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

As suggested by Maxim, the third patch now has a module parameter to
allow users to easily re-enable the i8042 aux-port enabling/disabling
on models other then the Z570.

Eray, you mentioned in another email that you have some concerns about
the approach in this series?

Regards,

Hans


Hans de Goede (3):
  platform/x86: ideapad-laptop: Refactor ideapad_sync_touchpad_state()
  platform/x86: ideapad-laptop: Do not send KEY_TOUCHPAD* events on
    probe / resume
  platform/x86: ideapad-laptop: Rework touchpad control code

 drivers/platform/x86/ideapad-laptop.c | 89 +++++++++++++++------------
 1 file changed, 49 insertions(+), 40 deletions(-)

-- 
2.38.1

