Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B1BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 12:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbiKGMSl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 07:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbiKGMS0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 07:18:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1215C140FC
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 04:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667823432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZTWKAuVDT83fFNqwk1O5ig1lK6i4L5TSFkF7nc/9Uwc=;
        b=BzDNDSvw6Kryl7ljz/DNFRTqe+3js1ruTxAXZF4QFPhtsq6JfGXcRGSeGCJpmhiXSbOZLd
        WOksM+fsWKMgAK5WLL2wqvZav5IBC3g5hM5HoGQrVlThSDndQj9gZLJsEQGfFpt7Dnkp+U
        WfKCMy0K6QIwzsAjJg0NRJVCNYo66bE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-vkkFpT1RPA-JA2h8zlozuQ-1; Mon, 07 Nov 2022 07:17:11 -0500
X-MC-Unique: vkkFpT1RPA-JA2h8zlozuQ-1
Received: by mail-ed1-f71.google.com with SMTP id v18-20020a056402349200b004622e273bbbso8130776edc.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 04:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTWKAuVDT83fFNqwk1O5ig1lK6i4L5TSFkF7nc/9Uwc=;
        b=HDaMMHX7k88pw4UacZhJaXqcYP6X2oKlhwcMMeBA8hg/sjPIU10D2DDb8WKjcinVFV
         NX6G1ETfkkuRrXsQ2iUiueyfRmkyWYuzFdT9b5Vt4txgn2wE+l8m+F3TRoRnQi+JIa1h
         bXytzrHn5cVEPAff6A67ThRDVJFpuhv2k+niZN3bzywRMGlOtBdmZiaSFP9RXIuS5Any
         YTNeeEgVvbbxSng7j0ziNhxBx1z/nRg8I4q2IPdgE4nVEiAK5IUY6sG62OxwmWgfboLL
         yG7oEN5jYFieElvbA7MRT5sXJlKSJLzduPFNhEZIz7OgdMqRFnC52RPzKZzEGMOZBEs4
         H/lw==
X-Gm-Message-State: ANoB5plQTBKKli5daJ8RwqCXp3hdPqybH5lOY9W0YBrFE3NASXPIKfZ7
        rpXmoUvsndjLtYipArE2n0dAqOKW6ROwbN4FIui54V5ukB8g9O23pnZ+goGNgAmDLQwUlXO3MRI
        xSLviQz+d7gozLQewHTZQ8jzaQp4daiwhyg==
X-Received: by 2002:a17:906:4ecc:b0:7ae:4f8e:1d7 with SMTP id i12-20020a1709064ecc00b007ae4f8e01d7mr10050770ejv.339.1667823429503;
        Mon, 07 Nov 2022 04:17:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf57HiGsXfdZdGvP8OHlSyBlkc1l75EKYj1DzSKjHrWdu2vtsPjQLjOzLsvrMyaqctPFhUF06Q==
X-Received: by 2002:a17:906:4ecc:b0:7ae:4f8e:1d7 with SMTP id i12-20020a1709064ecc00b007ae4f8e01d7mr10050750ejv.339.1667823429238;
        Mon, 07 Nov 2022 04:17:09 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v6-20020a50a446000000b00463597d2c25sm4195864edb.74.2022.11.07.04.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:17:08 -0800 (PST)
Message-ID: <bab3412a-6328-953e-81c2-cea423908c21@redhat.com>
Date:   Mon, 7 Nov 2022 13:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.1-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the second round of fixes for platform-drivers-x86 for 6.1.

The most important fixes here are a set of fixes for the ACPI backlight
detection refactor which landed in 6.1. These fix regressions reported
on some laptop models by making acpi_video_backlight_use_native() always
return true for now, which in essence undoes some of the changes.

Note I plan to take another shot at having only 1 /sys/class/backlight
class device per panel with 6.2, with modified detection heuristics
to avoid the (known) regressions.

I just realized I forgot to add Rafael's Acked-by to the 3 "ACPI: video: ..."
patches, since I already have pushed out the signed tag I cannot
(easily/cleanly) fix this now, sorry. Rafael's Ack for these is here:
https://lore.kernel.org/linux-acpi/CAJZ5v0h8FvqLwTixFALfOT2xbgiSqbT3XCMCbubwad4fHpK0hQ@mail.gmail.com/

Other then that nothing special to report just various small fixes
and hardware-id additions.

Regards,

Hans


The following changes since commit e9cf4d9b9a6fdb1df6401a59f5ac5d24006bfeae:

  ACPI: video: Fix missing native backlight on Chromebooks (2022-10-24 17:02:13 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.1-3

for you to fetch changes up to 53eb64c88f17b14b324fbdfd417f56c5d3fa6fee:

  platform/x86: p2sb: Don't fail if unknown CPU is found (2022-11-07 12:33:49 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.1-3

Highlights:
 -  ACPI: video: Fix regressions from 6.1 backlight refactor by making
    acpi_video_backlight_use_native() always return true for now
 -  Misc. other bugfixes and HW id additions

The following is an automated git shortlog grouped by driver:

ACPI:
 -  video: Add backlight=native DMI quirk for Dell G15 5515
 -  video: Make acpi_video_backlight_use_native() always return true
 -  video: Improve Chromebook checks

hp_wmi:
 -  Fix rfkill causing soft blocked wifi

ideapad-laptop:
 -  Disable touchpad_switch

p2sb:
 -  Don't fail if unknown CPU is found

platform/x86/intel/hid:
 -  Add some ACPI device IDs

platform/x86/intel/pmt:
 -  Sapphire Rapids PMT errata fix

touchscreen_dmi:
 -  Add info for the RCA Cambio W101 v2 2-in-1

----------------------------------------------------------------
Andy Shevchenko (1):
      platform/x86: p2sb: Don't fail if unknown CPU is found

David E. Box (1):
      platform/x86/intel/pmt: Sapphire Rapids PMT errata fix

Hans de Goede (4):
      ACPI: video: Improve Chromebook checks
      ACPI: video: Make acpi_video_backlight_use_native() always return true
      ACPI: video: Add backlight=native DMI quirk for Dell G15 5515
      platform/x86: touchscreen_dmi: Add info for the RCA Cambio W101 v2 2-in-1

Ivan Hu (1):
      platform/x86/intel/hid: Add some ACPI device IDs

Jorge Lopez (1):
      platform/x86: hp_wmi: Fix rfkill causing soft blocked wifi

Manyi Li (1):
      platform/x86: ideapad-laptop: Disable touchpad_switch

 drivers/acpi/video_detect.c            | 41 ++++++++++++++++++++++++++--------
 drivers/platform/x86/hp-wmi.c          | 12 ++++++++--
 drivers/platform/x86/ideapad-laptop.c  | 25 ++++++++++++++++++++-
 drivers/platform/x86/intel/hid.c       |  3 +++
 drivers/platform/x86/intel/pmt/class.c | 31 ++++++++++++++++++++++++-
 drivers/platform/x86/p2sb.c            | 15 +++++--------
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++
 7 files changed, 130 insertions(+), 22 deletions(-)

