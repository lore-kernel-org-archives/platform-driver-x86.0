Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E6FC4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 01:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 377F2610E5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 01:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhHSBST (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 21:18:19 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40567 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235148AbhHSBST (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 21:18:19 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 9011C5C0183;
        Wed, 18 Aug 2021 21:17:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 18 Aug 2021 21:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/j3YKCvhOtVhKDIAz
        yA102kMMyo2akreesXVAihniqk=; b=Sj26ssPlwBFjpEKshWDIv3XT2VqF77RWi
        8jktQ6jsx+LENxqTCFEVUP2vSf3u6znCm8bEmqjF/A4W1psKQPz6P1/K/aQMO1S4
        FvwVId05lxVkI1oSWPhmRWTbiS0BMw48hGHVQON08gAQFiyN9jakT7qaSonuG/IA
        YW7AEsQ/4mGQUUFl3Wu6fHFVgkYhEo1cr/zX1LGH9RLON6Tr8sBPyj+yfy44INlh
        2QhzYDTi1U3U0m9qGvrNLYEzpF58CbKOq5ZE5FvyjOTMS2gkaZTeMRo/UbsYWsY7
        1XcS9khA8heUCBUH1BuGPGbdmMiYW0Io1mN2zVSvNSB5qM6IFEGXg==
X-ME-Sender: <xms:NbEdYRayS_3A0OjlrGbqcOXI1HnI6BqCrwKOjiDgpSZVadMCCHJ5wg>
    <xme:NbEdYYazeGP4AfVgSlQ-z88XKvX8bWeDux0ByfVyTAi6fi0GL8DgHiBt2wb3SX04P
    54ZOtwhoUj1MDR7dqc>
X-ME-Received: <xmr:NbEdYT8sl3awip-gI3AJ3ItyECYttI9r_O6fZb-p4EJjUgQDQG9otr3PYLoz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeigdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonhgv
    shdruggvvheqnecuggftrfgrthhtvghrnheplefflefhledthfdtveeugfevueeukeegte
    eigfeihffgjedvtedvueevtdfhvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:NbEdYfrcFQFeZfLP5Z0cCiTod6-q45FMNP_qkRAXXd9BY0cNiplDMg>
    <xmx:NbEdYcp2k9mEaPpGYa3XfKYDgllZWSZVZN7s9SQtM3ElL9y4ok0sHA>
    <xmx:NbEdYVSsoU9C6u8PBBQ_KeKktIk7rTDAhMHxHZVJNgrS62WB7R-i7g>
    <xmx:NrEdYT3TxgBK8PSUjN-TFvCs3raj5E1xO41b5_d5vKHbsnHm4_egxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 21:17:38 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     linux-kernel@vger.kernel.org
Cc:     hdegoede@redhat.com, hadess@hadess.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v2 0/1] asus-wmi: Add support for custom fan curves
Date:   Thu, 19 Aug 2021 13:17:32 +1200
Message-Id: <20210819011733.231756-1-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for custom fan curves found on some ASUS ROG laptops.

- V1
  + Initial patch work
- V2
  + Don't fail and remove wmi driver if error from
    asus_wmi_evaluate_method_buf() if error is -ENODEV

Luke D. Jones (1):
  asus-wmi: Add support for custom fan curves

 drivers/platform/x86/asus-wmi.c            | 498 +++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |   2 +
 2 files changed, 500 insertions(+)

-- 
2.31.1

