Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8683FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 21:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68BAB60EE7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 21:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236212AbhI0VIL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 17:08:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:47999 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230046AbhI0VIK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 17:08:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id DF04532009C3;
        Mon, 27 Sep 2021 17:06:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Sep 2021 17:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tKb8wP
        5SYxRx6sWdP/TyrzWBGjuUAj/IoToXxUXQE/4=; b=YdCRcyXzuUpI9zAiA1uqNN
        TqbiJZRAl7FHKKWOrrrUhB0F1UdVJd/ychOHOCrIfbtwUQXpPY+z7KfDc+IBM7uU
        2OVMss33iYwXipXYIvoxZkn9B4fSNfO1bfnzUUrzyPZhdF9AvMuVI9s33cxFQCwH
        D4tgJyIhPufD/ERFZwkXCxeSL/PZRUsyN6HTi2Gl9vtIOprlKsN7uOScE/p3goVL
        Phh9lHO5aUw0JatuWYm96IfXa+CWtrHHY9EZ1rh3w/RfLl7wK6zseSElP6nczHr6
        FxUi1WvYLRRzer/1Ep+tc3Z3f1IOWtIU08G7jJzswfrVQGoP12vK9nYCEs66ssrw
        ==
X-ME-Sender: <xms:VzJSYSsZrdnYzCv9NPZhprKIKzCewD_JRRt5Ve3XRyt925zzEhC2IA>
    <xme:VzJSYXd16vhwrZlxmPU0_J91vokGr1D7C-TdgwayJmvzzRit8J6sayP-9bhAEVopH
    -uFLEiu00uwg_Bvjg>
X-ME-Received: <xmr:VzJSYdxFcRThsQIEYq5hO5TuuH456lrMJc9y2s9n_8oxKK0AaARHcgbjmeUVV8J0jFoqb3ok6SeJ6howXsFndhdse21Y8xY2UMZcgv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhruges
    shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpedvieeuueejledtffeiie
    eviedvuddufeethfdtgfekleeltdfghfegteeugeeuhfenucffohhmrghinhepghhithhh
    uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:VzJSYdPSsezjlhsn1ERVSm3RVoVE_9qhr0LKJmgzG_N9fE5DRuDn8w>
    <xmx:VzJSYS8a6Bt-58ae-T2xziA5F5WMK8mxYXCsAA3lSVGaUKdbvBs2rA>
    <xmx:VzJSYVX8k88rvDNiKfzAS8kdm6T7Nsp2G6UGPxnMmr5bK6ML-sW8WA>
    <xmx:VzJSYXHCFuJSo8qzCYtU-Fea0U6vLH0TME42QoWOpkCxPgMz77Y8bQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 17:06:31 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH 0/3] platform/x86: system76_acpi: Sync DKMS module changes
Date:   Mon, 27 Sep 2021 15:06:26 -0600
Message-Id: <20210927210629.37966-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Sync the in-tree system76_acpi module with changes made to the DKMS
module [1]. This introduces/exposes new functionality implemented in the
open source BIOS and EC firmware for System76 laptops.

[1]: https://github.com/pop-os/system76-acpi-dkms

Jeremy Soller (2):
  platform/x86: system76_acpi: Report temperature and fan speed
  platform/x86: system76_acpi: Replace Fn+F2 function for OLED models

Tim Crawford (1):
  platform/x86: system76_acpi: Add battery charging thresholds

 drivers/platform/x86/system76_acpi.c | 356 ++++++++++++++++++++++++++-
 1 file changed, 355 insertions(+), 1 deletion(-)

-- 
2.31.1

