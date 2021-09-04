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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9379EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6416A6056B
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237311AbhIDR5O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:14 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:56485 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237305AbhIDR5O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:14 -0400
Date:   Sat, 04 Sep 2021 17:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778170;
        bh=ZdXpvskwolJs4yhYD/N0m1S46yAiNrFSEd70Yu1Oi+s=;
        h=Date:To:From:Reply-To:Subject:From;
        b=LnPDPvqxGojhOcW7Nm6DO+6eloeOiYX/7VBK3gOSaJ6K9M1UziS8o2SiD+6BeQDX+
         c5Hm0hroy2xknYCdYErOrzc6poVwx11Mkgh41rAVe8Utzn2mgDyPaMW6xg3hPdW7Ju
         suEs1palOlKLmCLw00kJSKiqlfbKy7+rz3h8F4OA=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 20/30] platform/x86: wmi: remove variable
Message-ID: <20210904175450.156801-21-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The `block` variable is assigned and only used once, the code
shorter and probably clearer without it; so remove it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7f7dfb7f9aa8..261a6b68240e 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -118,15 +118,12 @@ static bool find_guid(const char *guid_string, struct=
 wmi_block **out)
 {
 =09guid_t guid_input;
 =09struct wmi_block *wblock;
-=09struct guid_block *block;

 =09if (guid_parse(guid_string, &guid_input))
 =09=09return false;

 =09list_for_each_entry(wblock, &wmi_block_list, list) {
-=09=09block =3D &wblock->gblock;
-
-=09=09if (guid_equal(&block->guid, &guid_input)) {
+=09=09if (guid_equal(&wblock->gblock.guid, &guid_input)) {
 =09=09=09if (out)
 =09=09=09=09*out =3D wblock;
 =09=09=09return true;
--
2.33.0


