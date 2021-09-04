Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04576C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E21A1603E7
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237297AbhIDR5B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:01 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:59987 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR5A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:00 -0400
Date:   Sat, 04 Sep 2021 17:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778156;
        bh=ML+bFiDT8uKwEDgTby/Q6ZiVFNrU5Dm92qzCoSPh7Qg=;
        h=Date:To:From:Reply-To:Subject:From;
        b=uKn0qEKy4zAbEsrOvIfCIP91PTvd6R1DSE63BqGsTaM5kSsawnGRkA4Mq+5obJDVI
         XgNVbOugKK5mAHdMyYynzBvdJffal27psJ4YE0Pnhy4z2l9OAibBTZuBU2r+Y9HaxY
         PmmiTlubH13SPDKkLMDJ8b2rYtS2sdtJ6WYHVYgA=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 18/30] platform/x86: wmi: use !p to check for NULL
Message-ID: <20210904175450.156801-19-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Other parts of the code use the `!p` idiom to check
for NULL pointers, convert `find_guid_context()` to
do the same.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 979135a678e0..0e721d868bf7 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -141,10 +141,10 @@ static const void *find_guid_context(struct wmi_block=
 *wblock,
 =09const struct wmi_device_id *id;
 =09guid_t guid_input;

-=09if (wdriver->id_table =3D=3D NULL)
+=09id =3D wdriver->id_table;
+=09if (!id)
 =09=09return NULL;

-=09id =3D wdriver->id_table;
 =09while (*id->guid_string) {
 =09=09if (guid_parse(id->guid_string, &guid_input))
 =09=09=09continue;
--
2.33.0


