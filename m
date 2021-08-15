Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E13CC4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 Aug 2021 23:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2611261244
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 Aug 2021 23:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhHOXGi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 15 Aug 2021 19:06:38 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60441 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229814AbhHOXGi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Aug 2021 19:06:38 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 9638C320085B;
        Sun, 15 Aug 2021 19:06:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 15 Aug 2021 19:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XHbBRH0L3KAymBDA9
        G00PGhNL9yADvJ8zwNcZhydFZw=; b=UWad02sNDVnmhJK+bQj3HIjk+UBoKd6XZ
        W6lqRwYCQIcQu8m3YelLGsanteFdpQpMr800UbtFS/cZ6hESbRE0tkZ1nXbTqOTN
        /SuRKDGtSIjWSwF0GBEgVEfBGoxu4yeom7V1+byNSS1gltFAsvgnN6lcC0iN+Ogj
        gtFyDJyod7TYH4O86WRtZrTZlfd1X1P+F/GU34ArZzSyxEADPw1w0u9BCJ/ingAV
        mmv7cepkovqPAuWB2VSyICjPVOBqrjgFEALIjrQugZAWN0kxLbSZRUC7/D/AxHqP
        S7kQAaygZIzw3Jsp4pC2nuFXqXqDmCHhpjPJMVZFXEWaBna5pTunA==
X-ME-Sender: <xms:3p0ZYbKMzHpDj1DDeOgUS2kRfHx1TQj2BnfewhvNabpDSfvgrnh99A>
    <xme:3p0ZYfLvjWc_7qBLdkHS9O3wbbJJPSwESYSJvjEIfNq4KI8ztffaxGzomXgFXbASU
    II83-eH-Dt6bfOMv6c>
X-ME-Received: <xmr:3p0ZYTvueqMIgm5vmYyzgFLu1hUR749S1VdhadGVtHzrEAYL95rX7FTfaHdr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledtgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonhgv
    shdruggvvheqnecuggftrfgrthhtvghrnheplefflefhledthfdtveeugfevueeukeegte
    eigfeihffgjedvtedvueevtdfhvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:3p0ZYUbdpxruyVNjmQAnuhAy5oSVkk3xCi2Lhs5JLqmQc27JUocp5w>
    <xmx:3p0ZYSbfERcVuwlQO-ZUiQvguq2oW2cw21XJW6G0Bzy-hmX1g6iVdw>
    <xmx:3p0ZYYDDBg2pTyNLL903pniOFT99CtL3iGdvqB_9F12rpabL9j412g>
    <xmx:350ZYRlrL6rUJaiaXNJHkDKqLV1iRPMlgoei4vbFZJ686ZYRtdEnkg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Aug 2021 19:06:04 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     linux-kernel@vger.kernel.org
Cc:     hdegoede@redhat.com, hadess@hadess.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 0/1] asus-wmi: add platform_profile support
Date:   Mon, 16 Aug 2021 11:05:57 +1200
Message-Id: <20210815230558.5860-1-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Changelog:
- V2
  + Correctly unregister from platform_profile if
    throttle_thermal_policy fails
  + Do platform_profile_notify() in both throttle_thermal_policy_store()
    and in throttle_thermal_policy_switch_next()
  + Remove unnecessary prep for possible fan-boost modes as this
    doesn't match expected platform_profile behaviour
- V3
  + Add missing declaration for err in
    throttle_thermal_policy_switch_next
- V4
  + Update some return codes to use -ENODATA
  + Switch pr_info() to dev_info()
  + Restructure some if/else blocks
  + Add "select ACPI_PLATFORM_PROFILE" to ASUS_WMI kconfig

Luke D. Jones (1):
  asus-wmi: Add support for platform_profile

 drivers/platform/x86/Kconfig    |   1 +
 drivers/platform/x86/asus-wmi.c | 138 +++++++++++++++++++++++++++++++-
 2 files changed, 135 insertions(+), 4 deletions(-)

-- 
2.31.1

