Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA509CCA47C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 21:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379073AbiFGVci (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 17:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380595AbiFGVbC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 17:31:02 -0400
X-Greylist: delayed 604 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Jun 2022 12:03:11 PDT
Received: from 20.mo583.mail-out.ovh.net (20.mo583.mail-out.ovh.net [91.121.55.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B0723BC3
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 12:03:11 -0700 (PDT)
Received: from player796.ha.ovh.net (unknown [10.110.208.220])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id 8F49D245C9
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 18:47:29 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player796.ha.ovh.net (Postfix) with ESMTPSA id 5FF732B43742E;
        Tue,  7 Jun 2022 18:47:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-100R0036d2f136e-90d2-4dc0-b8df-64c2249e2f69,
                    38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH 3/4] platform/x86: compal-laptop: Use backlight helper
Date:   Tue,  7 Jun 2022 20:46:34 +0200
Message-Id: <20220607184635.1127913-4-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220607184635.1127913-1-steve@sk2.org>
References: <20220607184635.1127913-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11331338138328008326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedguddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeghffhleeigffhteeiffelveefhfeiudehkedtgefhgedvleffgfejgfdtveeigeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeef
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Instead of manually checking the power state in struct
backlight_properties, use backlight_is_blank().

Signed-off-by: Stephen Kitt <steve@sk2.org>
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <markgross@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/compal-laptop.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index ab610376fdad..0942f50bd793 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -324,9 +324,7 @@ static int bl_update_status(struct backlight_device *b)
 	if (ret)
 		return ret;
 
-	set_backlight_state((b->props.power == FB_BLANK_UNBLANK)
-		&&    !(b->props.state & BL_CORE_SUSPENDED)
-		&&    !(b->props.state & BL_CORE_FBBLANK));
+	set_backlight_state(!backlight_is_blank(b));
 	return 0;
 }
 
-- 
2.30.2

