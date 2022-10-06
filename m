Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9FAC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Oct 2022 21:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbiJFVML (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Oct 2022 17:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiJFVMK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Oct 2022 17:12:10 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227AEB0B37
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Oct 2022 14:12:09 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 7473F14293;
        Thu,  6 Oct 2022 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1665090727; bh=UogwOzuJfWV6OspFXBAnbU9QztngzYK73PpnuPQwaHk=;
        h=Date:To:Cc:From:Subject:From;
        b=cQEb4XKSWrorOJGdvpqKbd7jWPbi8Rr2phC0p8W2oRexwmKZRvCAWsuTIldeV3Nqa
         My6Y6OW964zFUPIhAas8ENjlFkU1Ca5TgSZGZIYrW7rbefs2xGLQ+Agi8C38YGXFwS
         CVKeo7VQm7j/SWWGUXyvlD3S92NPpdq9St53BwbA7PJPvka+uMEDc4oW69dnqNV7gs
         BHkzmUznGkfT8vYn2ypC3Cgj+GEluVU/lCBdzqTJhsX5iy/LNrM3rukhxHBhQVN/8S
         e7b3k12BC0CujA43bjjOUIgyz4LbrFEWGE7pN+J9aPrOfpXYaOJwkV9LnjfchF4qKO
         qC9KjcvZAq7Jw==
Message-ID: <5c917c78-610b-96fa-8cf3-81f8d3dc505f@vorpal.se>
Date:   Thu, 6 Oct 2022 23:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Arvid Norlander <lkml@vorpal.se>
Subject: Issue with toshiba fan sensors & missing feedback on patch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Two things:
* I have discovered that reading the fan RPM in toshiba_acpi is slow,
  around 50 ms. I didn't notice it at first, but after adding some more
  sensors I found (current and voltage for AC and battery) it started to
  make running "sensors" visibly slow.
  
  I don't know what proper fix to this would be. Feel free to revert the
  fan RPM for now if it is not acceptable for reading sensors to block for
  ~50 ms (as opposed to the 100s of micro-seconds that other sensors such
  as coretemp and acpitz take to read on that laptop).

* I never got any feedback from you on the cover letter of this patch
  series: https://www.spinics.net/lists/platform-driver-x86/msg34818.html

  In a reply to the one of the patches in the series you alluded to that
  you would write a reply to the cover letter as well. Instead you sent
  the response to patch 1/2 twice. We are already halfway through the merge
  window soon, so I would appreciate getting that feedback soon.

Best regards,
Arvid Norlander
