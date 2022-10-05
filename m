Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DE0C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Oct 2022 15:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiJEPCm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiJEPC0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Oct 2022 11:02:26 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7488F4C
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 08:00:50 -0700 (PDT)
Date:   Wed, 05 Oct 2022 15:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1664982046; x=1665241246;
        bh=GhFgu78eZ2flpdK/5tVb3/Qc4v0aQzigC4qbE4KAuak=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=kNjQ0+5oQE2PMR2Q8JXsLn8teUJ5zdEHPzbdv8Zov2vKOlaeGlu+KfEHJqEmQhXj2
         RwUZQDRjTpJW008y3GdEjOq/mTMKGxnqVAnxtb+S/aBcjhYwb3nA8DFXEP5Zj/heub
         G+WHfy7DedUBjaBVlf3/hZx7L6PXZSU/Yhn792rf3LzE8tfq15S6LzfFeM86JsyA/S
         0dxC5e7ln09plBuxHkBflYOCsLKQNqa5wCkgLHLhWhjxMck4Qvi3qBBwu+2XfxEQcI
         PyBBbbhIOhzobvywkfAALeFeaDipvYjM1CC3jUZ3yH9n9sxAIBjjIU5wQaTrFPj3iG
         UGFYawWyUjNdw==
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v1 1/3] platform/x86: huawei-wmi: do not hard-code sizes
Message-ID: <20221005150032.173198-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use `sizeof()` and `ARRAY_SIZE()` instead of
hard-coding buffer sizes and indices.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawe=
i-wmi.c
index eac3e6b4ea11..66b53b90188f 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -323,12 +323,12 @@ static int huawei_wmi_battery_get(int *start, int *en=
d)
 =09u8 ret[0x100];
 =09int err, i;

-=09err =3D huawei_wmi_cmd(BATTERY_THRESH_GET, ret, 0x100);
+=09err =3D huawei_wmi_cmd(BATTERY_THRESH_GET, ret, sizeof(ret));
 =09if (err)
 =09=09return err;

 =09/* Find the last two non-zero values. Return status is ignored. */
-=09i =3D 0xff;
+=09i =3D ARRAY_SIZE(ret) - 1;
 =09do {
 =09=09if (start)
 =09=09=09*start =3D ret[i-1];
--
2.38.0


