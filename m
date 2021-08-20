Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B90C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 09:57:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F11261075
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 09:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbhHTJ6Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Aug 2021 05:58:16 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35027 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235321AbhHTJ6Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Aug 2021 05:58:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 138D33200A80;
        Fri, 20 Aug 2021 05:57:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 20 Aug 2021 05:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CfCw/ZeNoblI7uaS1
        4NFIKhhpVcANOaKc3OV06nLfKM=; b=Qyw0NBbGIt+FdY07hbK1DbRxoRm7iWmSX
        7XM5y9/vvnudq/8XsoyMORjhTH240OkLMHX+CQzMlOrY5KArT4lauL97RLcJULXn
        0JRrLtQsHv4yNEf1AB7lNgHzkYbNoJP3b8e+h5ZgSUiGUwtSCzA7loQXQr9g1rnW
        XrUlplxp9Iu7gZC1udgSjRDt8qphzOXMaDsLye8aLSWyC2YcfpiCR8OBMAFgw1Fh
        uJPvUEg3fH4iApnD6kGVMvSiJLiYooswIrnO16hMunJCqyc0iiYuVOERCV/69vTv
        B9PJ5kdwLK5dxiTNaE+jVgUqZ0KmvI/xGUodth3R263F/YQQ+sY0g==
X-ME-Sender: <xms:kXwfYb20_eroAxSXQtS1pWxwhWrAAwwGexS26Uh0-dO3KaU4_mDdfg>
    <xme:kXwfYaHemcrDhS_f4aOfLx6ZVr_gsXQvYqNAOFbQJnI__JtokR_R1MswjfBrKhEDB
    ZGaFKFdYYwNrJ5ezfA>
X-ME-Received: <xmr:kXwfYb7IVFOpjAmOqWLF27nlMjbzheNvifxuaeuFssk2ocxLqL6U8evxQz2T>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleelgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonhgv
    shdruggvvheqnecuggftrfgrthhtvghrnheplefflefhledthfdtveeugfevueeukeegte
    eigfeihffgjedvtedvueevtdfhvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:kXwfYQ2Zf7-JlTOhOx7KuxSAg9-cUmXkXT8ekWGk-YeM4ivUyLbnVg>
    <xmx:kXwfYeGcFcezrghy_jRBUYDVzZR1HrGmaKPS8dcF6JTxsIs2YZcfJg>
    <xmx:kXwfYR-OeG3QJtvd9cwZjs8iSczYLjhKGpWnZVDjwv6hJ1o9DEyEAA>
    <xmx:kXwfYTQFiT4nsWNWl9GUXOAmzUWlFM4HGJI2XR6fDqsbgEyhWRWaxg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Aug 2021 05:57:33 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     linux-kernel@vger.kernel.org
Cc:     hdegoede@redhat.com, hadess@hadess.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 0/1] asus-wmi: Add support for custom fan curves
Date:   Fri, 20 Aug 2021 21:57:25 +1200
Message-Id: <20210820095726.14131-1-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for custom fan curves found on some ASUS ROG laptops.

The patch has gone through a few revisions as others tested it and
requested bahaviour changes or reported issues. V4 should be considered
finalised for now and I won't submit a new version until V4 has been
reviewed.

- V1
  + Initial patch work
- V2
  + Don't fail and remove wmi driver if error from
    asus_wmi_evaluate_method_buf() if error is -ENODEV
- V3
  + Store the "default" fan curves
  + Call throttle_thermal_policy_write() if a curve is erased to ensure
    that the factory default for a profile is applied again
- V4
  + Do not apply default curves by default. Testers have found that the
    default curves don't quite match actual no-curve behaviours
  + Add method to enable/disable curves for each profile

Luke D. Jones (1):
  asus-wmi: Add support for custom fan curves

 drivers/platform/x86/asus-wmi.c            | 672 +++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |   2 +
 2 files changed, 674 insertions(+)

-- 
2.31.1

