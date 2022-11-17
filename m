Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C30AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 11:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239465AbiKQLFl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239495AbiKQLFe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 06:05:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8666DCDF
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=isqvfBWvlrEem73O91mTxaskWRCdfkt1zVyIHVtesT4=;
        b=ehxeE9p7ZvrW5svUWQoM9Ijcb5zH/CBMOMG/eafHCdH1vixNulgvM5CyByxM4awuN3V7M8
        XusK2K8R1/QISUJXlckpEvZB3lgyThexLvV6InsKWn/YIH2clAjF8QFuADbBOt7iwSNx+g
        H48PHg//evfcUFDS3TSeAxCng0M/GZ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-IzjVTXS1NhC3lwYS-PWSXw-1; Thu, 17 Nov 2022 06:02:51 -0500
X-MC-Unique: IzjVTXS1NhC3lwYS-PWSXw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B864802C16;
        Thu, 17 Nov 2022 11:02:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E7749492B0E;
        Thu, 17 Nov 2022 11:02:46 +0000 (UTC)
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
Subject: [PATCH v2 0/6] platform/x86: ideapad-laptop: Rework touchpad control code
Date:   Thu, 17 Nov 2022 12:02:38 +0100
Message-Id: <20221117110244.67811-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is v2 of my series to rework the ideapad-laptop touchpad control code.

New in v2:
- Split patch 3/3 in to 3 patches (3-5/6) since it was doing to much at once
  - Update r_touchpad_val on sysfs read/writes
  - Drop the write(VPCCMD_W_TOUCHPAD, 1) call at probe in a separate patch
    and document why this is done in the commit msg
- Add a new patch (6/6) to hide the touchpad sysfs attribute behind a
  module-parameter which is disabled by default, see the commit message
  for why this is done.

Note this applies on top of my review-hans branch which has seen a bunch
of other ideapad-laptop changes land recently:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Regards,

Hans


Hans de Goede (6):
  platform/x86: ideapad-laptop: Refactor ideapad_sync_touchpad_state()
  platform/x86: ideapad-laptop: Do not send KEY_TOUCHPAD* events on
    probe / resume
  platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on
    select models
  platform/x86: ideapad-laptop: Send KEY_TOUCHPAD_TOGGLE on some models
  platform/x86: ideapad-laptop: Stop writing VPCCMD_W_TOUCHPAD at probe
    time
  platform/x86: ideapad-laptop: Make touchpad_ctrl_via_ec a module
    option

 drivers/platform/x86/ideapad-laptop.c | 98 +++++++++++++++++----------
 1 file changed, 61 insertions(+), 37 deletions(-)

-- 
2.38.1

