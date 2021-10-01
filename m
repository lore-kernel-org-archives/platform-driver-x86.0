Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E3EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8A8861452
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhJAQJ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Oct 2021 12:09:59 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46983 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231675AbhJAQJ7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 12:09:59 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 2FB8F3202363;
        Fri,  1 Oct 2021 12:08:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 01 Oct 2021 12:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NmlT8C
        55bBdyHU6Kx0FCIPHyAL1kulaGfxQ/tz8o00c=; b=fh09c2gU/YiGJVR/Kd/VBs
        WHCghNjz5DHHlmc2T/XwDquWw0Xflhfyi/WskWQm23Biz5xSlCrsnOD6opMYU+iU
        YF1qVBKsSkcWRTDjywzr+kf5wDbe9jTNI45mCFxRSzpoqv74OrfqDg7ZeCBy5o1q
        pZDvtcGaHwzWLhbrJP+JBQfWoplPo+uX9b5T8NttQsQywH+MJwLZHWmgkAMZpo4s
        KNwqI0jySKTRzDdiaJdG0LKFmIypLoOvoiWBscQ+EiF4mGQyl+h11t7ARhJyLpz3
        iEcl4jckh+/13ppc8m+cBdf1fzpnjDwHHenGW3HIUygJ92U7SamVwR/cjC2V/bsQ
        ==
X-ME-Sender: <xms:bTJXYV7f_vMuOnnZaaNnyfPuomT5FvUJob0T3G-Ny9iWYZvYfJ2z_w>
    <xme:bTJXYS6r0ZZRdcBJDCw7HeCswnMMIH0o8YFkanctxi1zpkHVIAhb0Uy9ptKFZ9b-F
    u1AS9hQlsQ9xKe0yw>
X-ME-Received: <xmr:bTJXYceO2UATMReDhftRFb34Ct7Lrgpe5kkd4worT23R00DFLXSVOxzD52hZTDZk2wE_TA54kzsNw5w8uKzc4hG-bc_lbyDmYpN8rfY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertd
    ertdejnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
    hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepvdeiueeujeeltdffieeive
    eivdduudeftefhtdfgkeelledtgffhgeetueeguefhnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:bTJXYeIAQIlP6TbC5ydOwReo0Tp_JuNGFFi19b4gCShtO1XfZTNqDQ>
    <xmx:bTJXYZIwp_nud7b4bjzYKHuvPjB7aeLa0dGqMf4_vSU8S4QFUfQZ0g>
    <xmx:bTJXYXx2UWUWkVizENNJG2O4bFl3OYM-srEfE_j1B837ahjSstGr9A>
    <xmx:bTJXYbwdyd-_6szwjhxnuxPdkCbOBK5yaNR1aKzOpO6tfc6K2JbKbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 12:08:13 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH v3 0/4] platform/x86: system76_acpi: Sync DKMS module changes
Date:   Fri,  1 Oct 2021 10:08:08 -0600
Message-Id: <20211001160812.22535-1-tcrawford@system76.com>
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
  platform/x86: system76_acpi: Use DEV_ATTR macro for kb_led_color

 drivers/platform/x86/system76_acpi.c | 382 +++++++++++++++++++++++++--
 1 file changed, 367 insertions(+), 15 deletions(-)

-- 
2.31.1

