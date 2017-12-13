From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH 0/3] platform/x86: dell-laptop: All the warnings are resolved.
Date: Wed, 13 Dec 2017 13:43:06 +0530
Message-ID: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ma1ind01on0113.outbound.protection.outlook.com ([104.47.100.113]:29640
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750785AbdLMION (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 03:14:13 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>

There are total three types of warnings are resolved.
First patch  : Block comments use * on subsequent lines
Second patch : Missing a blank line after declarations
third patch  : braces {} are not necessary for single statement blocks.

Dhaval Shah (3):
  platform/x86: dell-laptop: Block comments use * on subsequent lines
  platform/x86: dell-laptop: Missing a blank line after declarations
  platform/x86: dell-laptop: braces {} are not necessary for single
    statement blocks

 drivers/platform/x86/dell-laptop.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.11.0
