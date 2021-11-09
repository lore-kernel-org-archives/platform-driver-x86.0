Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6342C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 19:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E01060F4A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 19:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243617AbhKITzG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 14:55:06 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36619 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243249AbhKITzG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 14:55:06 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id BB8B55C0081;
        Tue,  9 Nov 2021 14:52:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 09 Nov 2021 14:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=owArnt98/GRER4DVBDgysZIjfL
        eAsl2BZjI4HwaojqQ=; b=aMFr7nCKpNNAs79tVgiSLCBIxBNRyECRRiRYDI6KAG
        wEzYyNhtxFI/Gj0PcnLJf36rBpbOYpkn2xbrxeU+ofPhpVTu8P6LENuPxp6nGZXB
        mzduhLIWWExsFJytbvukfJ2F637vTayQPviTaSum3vFrupUNI9GmYlra24OFANFX
        xfsVilPvCLSSKv6k3PHR/p5HgA+Pc+ty0ULsA13W2m3CPUigp0w03Yc6ETlmuM5C
        hgejkw23veH5i6wlVXBfFOYt1XAHogfKbxNgNO8hZbyETZ77PHNidf3kkjOF8T+K
        Mb6VqLlItoH3Ig7hQ3QgV19EoBLgQKNuOrbAll3ZBvXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=owArnt98/GRER4DVB
        DgysZIjfLeAsl2BZjI4HwaojqQ=; b=lRQ3kHCD/pdgro1O1e1lQRCIBIS40iXmN
        J61F6lVTf7IGq6h7med2GMAC4BsbrftcR0kwahv2xbML3RNd2yD1EeIch2eSV4rv
        KKITlN3zUpLt5bcWJN2dSuF60kVX1/MeKmUVlqIqEpFmFcUhjdzkUDwND/P1wt5w
        u1nMjptZ/rliTjn4RdAz7DjZ2LFgHwc0noo0oW+11S+kY/bA+etkwTueykIu1f8X
        kQxO9HrIRL6eN5sxw9kY4ZEEoGYt+P/oU7w52QljAG7JHDYnZrWEv1ezvr/lbXoK
        pj4905yykTj1kBMNsJV6Gooc2yjvlHs/TM7JCdZBhFYkx5IkBk9Kw==
X-ME-Sender: <xms:c9GKYXHAZCo-ewuC2Mj_LrlRE9MGdInVML2JO0-aXELgdV35AVcdaA>
    <xme:c9GKYUWS7T9QFHVirTMSfdIeoQ1OfHFykaoKBrucWX8GdRJAWWUKTnLRcg1NgIhE0
    NUANRM0QdY_MaapMUg>
X-ME-Received: <xmr:c9GKYZKdjU5pNdzt-jprjhkRztFhbIZWzjg41ocFb0CRPhZW08z_B5rpvL0OgoSg0GVqxPU_0wvY7WxcEb4t1RE0uEk55hiVT7W7xC7y7RTFkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeggdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepgghinhgtvghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggv
    rhhnrghtrdgthheqnecuggftrfgrthhtvghrnhepgfdvheeiiedutdffvdegvdegtdelke
    ffleegkeetueefleetgeduieehgfeljeehnecuffhomhgrihhnpehlvghnohhvohdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsvg
    hrnhgrtheslhhufhhfhidrtgig
X-ME-Proxy: <xmx:c9GKYVGvWNGgRaCduH8jM7HwWkMwIcsY2P3T7t2Lx_N632BPxew5RQ>
    <xmx:c9GKYdUvNel0xYmL2Qm_QGhKzc7IiX16egDV5nRrAKpXpKebIirVag>
    <xmx:c9GKYQNY4WMr6FhaV-aPd4VDhpYYy5aYxenecJEbF81tGOKxKVf03g>
    <xmx:c9GKYaiCJAqwtCZVxVof2boXjIM2vHg3OViUFxdnyXbfEefPOcxuUQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Nov 2021 14:52:19 -0500 (EST)
Received: by neo.luffy.cx (Postfix, from userid 500)
        id CF44F2A2B; Tue,  9 Nov 2021 20:52:17 +0100 (CET)
From:   Vincent Bernat <vincent@bernat.ch>
To:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     Vincent Bernat <vincent@bernat.ch>
Subject: [PATCH] platform/x86: thinkpad_acpi: fix documentation for adaptive keyboard
Date:   Tue,  9 Nov 2021 20:52:09 +0100
Message-Id: <20211109195209.176905-1-vincent@bernat.ch>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The different values were offset by 1. 0 is for "home mode", 1 for
"web-browser mode", etc. Moreover, the URL to the laptop's user guide
did not work anymore.

Signed-off-by: Vincent Bernat <vincent@bernat.ch>
---
 Documentation/admin-guide/laptops/thinkpad-acpi.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 6721a80a2d4f..475eb0e81e4a 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1520,15 +1520,15 @@ This sysfs attribute controls the keyboard "face" that will be shown on the
 Lenovo X1 Carbon 2nd gen (2014)'s adaptive keyboard. The value can be read
 and set.
 
-- 1 = Home mode
-- 2 = Web-browser mode
-- 3 = Web-conference mode
-- 4 = Function mode
-- 5 = Layflat mode
+- 0 = Home mode
+- 1 = Web-browser mode
+- 2 = Web-conference mode
+- 3 = Function mode
+- 4 = Layflat mode
 
 For more details about which buttons will appear depending on the mode, please
 review the laptop's user guide:
-http://www.lenovo.com/shop/americas/content/user_guides/x1carbon_2_ug_en.pdf
+https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/x1carbon_2_ug_en.pdf
 
 Battery charge control
 ----------------------
-- 
2.33.1

