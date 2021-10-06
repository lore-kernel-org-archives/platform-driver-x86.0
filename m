Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BE5C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2371A61163
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239358AbhJFUX5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:23:57 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46023 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229998AbhJFUX5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 16:23:57 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id A390A3200EFD;
        Wed,  6 Oct 2021 16:22:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 06 Oct 2021 16:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YK6P92
        tWXLBVYmMZH+313UzwPtadPxbTluW/jO+vglk=; b=LnQ+Hh6EWmuzK7bBBGn4Hq
        zPkaVjfe/Cak7qRPJeqWhnsWnCReVwvS2A8ZjeCwzS7YEaUSi9Sgfo3dMo7N3WQf
        MKd62S5081tdEi7J9wWS3zzUUNujKQwXUC+Yj/OyIXXHoWWe6qhPeGD7d8lsA3BI
        u5s9HwWNBNY/H6JqlApLHRhCk/pxF2wddxwMU4VOaqyx2yM10brU/wV7LDYzQliV
        AtJXIzu9lDv1uHjuwEA1bxddfv64VMSZGB/Je5x72qF7my2D3chi55WBe5G5t93C
        Q/2PYZLD8ryLHJ/N5hMq7sFQPN1NK/5jK0L81LrCY4Z87taxeWqogFdVhMJiNfnQ
        ==
X-ME-Sender: <xms:bAVeYStj4dyjr5S7tc--ltWdWddDk9Q9nn8qEnJ3lottX-Jr8vQMVQ>
    <xme:bAVeYXf3qYghp6OsIVnHJnz71YoH294xPYd2ZaAGQLC1gMjsrh8uUx5Y3G6zAUKEJ
    ksSFis9BOPbq1cf5Q>
X-ME-Received: <xmr:bAVeYdyfxy-2iO8T2eAzzNCNsa9SAB0r10aczoF_7lDEYPXLY_E8FNMWK_Tt5SqPTlE_teXHmnoZQ4mcyV6ISifzh35NERVPhj0pMMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhruges
    shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpedvieeuueejledtffeiie
    eviedvuddufeethfdtgfekleeltdfghfegteeugeeuhfenucffohhmrghinhepghhithhh
    uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:bAVeYdMkUh2b9yHyIw8VyTiOmc9cB9g3hpcxVNyZeKBKbeu9M3_yXQ>
    <xmx:bAVeYS8E13HLhuhFrWhb1docgE9ZMTlRycLKHPrVIUb-EhRXOJ7rzg>
    <xmx:bAVeYVWeicTBI5AJyHptElfk5ACQEVLNLf8WwDWsYhGyCIUSOageLg>
    <xmx:bAVeYXFcHgya15H_ZsSSjoJSH1ohteEjzINxMFMfZFe2R2Hs6nbw3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 16:22:03 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH v4 0/4] platform/x86: system76_acpi: Sync DKMS module changes
Date:   Wed,  6 Oct 2021 14:21:58 -0600
Message-Id: <20211006202202.7479-1-tcrawford@system76.com>
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

v4:
- Reverted DEV_ATTR macro change to keep custom `name`
- Added attribute groups for kb_led_color
- Set kd_led.groups instead of manually creating/removing the sysfs file
v3:
- Made use of DEV_ATTR macro for kb_led_color
- Used sysfs_emit() instead of sprintf() for kb_led_color
v2:
- Used input_set_capability() instead of setting bits directly in patch 2/3
- Used sysfs_emit() instead of sprintf() in patch 3/3
- Made use of device_{add,remove}_groups() in patch 3/3

[1]: https://github.com/pop-os/system76-acpi-dkms


Jeremy Soller (2):
  platform/x86: system76_acpi: Report temperature and fan speed
  platform/x86: system76_acpi: Replace Fn+F2 function for OLED models

Tim Crawford (2):
  platform/x86: system76_acpi: Add battery charging thresholds
  platform/x86: system76_acpi: Add attribute group for kb_led_color

 drivers/platform/x86/system76_acpi.c | 428 ++++++++++++++++++++++++++-
 1 file changed, 412 insertions(+), 16 deletions(-)

-- 
2.31.1

