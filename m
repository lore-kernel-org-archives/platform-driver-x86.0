Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D1CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 644596139D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243127AbhI1WRU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 18:17:20 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:57587 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243128AbhI1WRP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 18:17:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 345063201D0B;
        Tue, 28 Sep 2021 18:15:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 28 Sep 2021 18:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=jb9ApOK/9zR+dCu5B7yb6APOEJJ+re7x1oUMVWVQK
        l8=; b=ROj21CzL+TZvP1ZEVTVuQNCBLuecbAZEoV1fcoWavMED1ErU8W+7xO9Kx
        NXzhcgyJOEzt1KZpeK1iuU9+kKTRERWn3Mcf8TjyCUMlCyBMVVduTfnp8mOtKylD
        ZNa3DlU5YnQ7wCEq8Nx+EuFvF9aUPX/+z+v1F88c+sSZft35xD5v1EI9U63hwtBy
        zy5JgBnRPd25vlqTLreVAqXc+YeDlpGzAQQSwAbOtKvsHwZX6vaxhvQynUbkqhRh
        A7N0OM17kagGCTLGU1mNnZjOwXu+Y9cz1Zc8Yf2yvgA37MT3PZI/1KjmlolAGIKM
        71lIeOVUI+gv4eKfy8lTJ3KldY8Dg==
X-ME-Sender: <xms:ApRTYXpFyTg5HmolJyHSQB1Z_oQrTI3Klc1Dz214-hVCm8GwQD6mEA>
    <xme:ApRTYRpNjCIjJeWVpHXP2LtFmVka1xDgA7JDUEYywduYnAjugfLXrTQ-4XhzotkT_
    jxFsQ719Mkx4QrCpw>
X-ME-Received: <xmr:ApRTYUOIWlpAlPTeY6COIEBAhwVyDt1o6EKaIsNtfcyV4X5Oiid5NtxqU5_8dmy6SFFQa70NyjiQRd39_xS_AsGZht698IRWTldN8eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekuddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtke
    ertdertdejnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgu
    sehshihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepueeljedvueegieeugf
    ehffffhfdtheejleekgedvieduveduhfefvdejveetlefgnecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:ApRTYa6in8urwuRZmo-VZ8R3W9DIh-9ewbnmKsDAPDopKTyrwqn2sQ>
    <xmx:ApRTYW5czDfoddwh6CEyB4NmyTDLwIdnkoSZOx5zURk8Z85xiIDMog>
    <xmx:ApRTYSjLXHck9AgmQYenypmlLM5b7PuQuQMfLuGHvtfgUrOzqWzxmw>
    <xmx:ApRTYbhKSVcvLEzk13o4owybilSO2j_cR_WMXoNZ8E9zinjtkBHvKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 18:15:30 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH v2 0/3] platform/x86: system76_acpi: Sync DKMS module changes
Date:   Tue, 28 Sep 2021 16:15:26 -0600
Message-Id: <20210928221529.70176-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210927210629.37966-1-tcrawford@system76.com>
References: <20210927210629.37966-1-tcrawford@system76.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Sync the in-tree system76_acpi module with changes made to the DKMS
module [1]. This introduces/exposes new functionality implemented in the
open source BIOS and EC firmware for System76 laptops.

v2:
- Used input_set_capability() instead of setting bits directly in patch 2/3
- Used sysfs_emit() instead of sprintf() in patch 3/3
- Made use of device_{add,remove}_groups() in patch 3/3

[1]: https://github.com/pop-os/system76-acpi-dkms

Jeremy Soller (2):
  platform/x86: system76_acpi: Report temperature and fan speed
  platform/x86: system76_acpi: Replace Fn+F2 function for OLED models

Tim Crawford (1):
  platform/x86: system76_acpi: Add battery charging thresholds

 drivers/platform/x86/system76_acpi.c | 364 ++++++++++++++++++++++++++-
 1 file changed, 363 insertions(+), 1 deletion(-)

-- 
2.31.1

