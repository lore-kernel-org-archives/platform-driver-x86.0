Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4377AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 18:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 160BB23A59
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 18:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733150AbhAOS5O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Jan 2021 13:57:14 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47965 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733214AbhAOS5O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 13:57:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 266245C007B;
        Fri, 15 Jan 2021 13:56:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 15 Jan 2021 13:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=A8sO8RCTv7PgF40lOhCMmLrMZ0
        +/H/yvkRj83/HH5Vw=; b=dfaoaQrku4RR5O7XqOk5qJawWIZUubwcN8dOQEH0DB
        S8jzuw3I/YvvdrknEDs4g6NLkU0zkPcXQSLSWITNe+oXrxoiRvb/x4Tv3JjQ+f5F
        lzHpaiJ8u6CjLCwZ9/OfDPq0rgXzefq32luokyDYFzeFIK7fZh2DCMWl+Zbd+k5s
        CDvkD2KEVgeUBafRdPrZAULoSYWT+8eN8qHePBrdG4xFwfEz1B9fH+q+hckuqIYZ
        7svoLlWV3z8qqc9lq5Hj6ekttY4PK3RUxB+uJwa709ZiCSPQp4ZXBT4n2mTaQvPL
        Df953MhrP13AxYg0iOo1tm90CVKr+ayAx53IUKnap3+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=A8sO8RCTv7PgF40lO
        hCMmLrMZ0+/H/yvkRj83/HH5Vw=; b=CdEuDwZyhRbxrgvsfJDLzpl/cdMbLPeDz
        f3XjPRqxIst3ocWXD9wAUVWcZbY+iiF8P238BNzHwMWRcxgMD88jVGk3FYwVqk+1
        mEenM6mGWt22FrOscPkhQDSqaviIdAOl2Dzpr4x6LS1Ev2+LaFM9uA+XitiU9R78
        9mj5pFOa8UrYjO0ty2s8Bg2UUNw9Pq4FQx822rDNFYVlzO5xlrPhvl8ZdNkJ8Oc/
        4K7/Y+kJbUMsIbAYQ6ZWdKnOwmfHVA+vLnhJhJQtEQnpbB6zU6hgYhWhEZPErlXg
        UIR9hHb0UN+W5x78peLj/FKsxS32EAybZN+AFLP6iAV8uz9N9XOTg==
X-ME-Sender: <xms:R-UBYL3FzdMc05L2BsvzXmhCb1NuFwpXHCzW-lILCGRC7pPnA-k2iA>
    <xme:R-UBYKEbd4Z_Z3bITU5hS62KHJ-h3LxydBfaFFT_udF3ReFQEd8IM0j3uIYhenGPf
    dE3gJFA1iDaPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepjfgvnhhrihhquhgv
    ucguvgcuofhorhgrvghsucfjohhlshgthhhuhhcuoehhmhhhsehhmhhhrdgvnhhgrdgsrh
    eqnecuggftrfgrthhtvghrnheptdelheefkeejiefhudegueeihfevhefhveffhfdvkefh
    heejudfhffekkeffieffnecukfhppedujeejrdduleegrdejrdefvdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehhmhhhsehhmhhhrdgvnhhg
    rdgsrh
X-ME-Proxy: <xmx:R-UBYL7BVVENkxzqrvx0YKiIsGQZAT1-_sxd3c98ZXV2ueHNfRJ2pw>
    <xmx:R-UBYA2en1H3pk-RyE39qabg4-AQXIza0XbMhRlmfzx5K80KBDub1A>
    <xmx:R-UBYOG9NV8GKLvH0YPOSVu3uLrIPP8LO6GRmD4p4wkC0a5SmgrBqQ>
    <xmx:SOUBYJzBjLyLYllXqk6oorbHenpbE_I2E-1xeH74CQPA1BEuVG_jnA>
Received: from khazad-dum.debian.net (unknown [177.194.7.32])
        by mail.messagingengine.com (Postfix) with ESMTPA id A4AEC240062;
        Fri, 15 Jan 2021 13:56:07 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by localhost.khazad-dum.debian.net (Postfix) with ESMTP id C0983340041E;
        Fri, 15 Jan 2021 15:47:31 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
        by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id DtaHUGVSxZyx; Fri, 15 Jan 2021 15:47:21 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
        id 95B0D340017A; Fri, 15 Jan 2021 15:47:21 -0300 (-03)
From:   Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update email address for Henrique de Moraes Holschuh
Date:   Fri, 15 Jan 2021 15:47:21 -0300
Message-Id: <20210115184721.32546-1-hmh@hmh.eng.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update my email address in MAINTAINERS to the one I have been using for
commits, Signed-off-by and Acked-by tags.  Only two ancient commits had
the old ibm-acpi@hmh.eng.br, so it is unlikely to justify a .mailmap
entry.

Note that ibm-acpi@hmh.eng.br does work as a way to contact me, but
apparently it is best when MAINTAINERS entries match commit email
addresses ;-)

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 79b400c97059..b7980a752c28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17637,7 +17637,7 @@ F:	drivers/thermal/gov_power_allocator.c
 F:	include/trace/events/thermal_power_allocator.h
 
 THINKPAD ACPI EXTRAS DRIVER
-M:	Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
+M:	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
 L:	ibm-acpi-devel@lists.sourceforge.net
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-- 
2.20.1

