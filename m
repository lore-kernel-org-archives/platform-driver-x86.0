Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9CAC25B47
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Oct 2023 09:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbjJYJtL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Oct 2023 05:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbjJYJtJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Oct 2023 05:49:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEAAB4
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Oct 2023 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698227348; x=1729763348;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=0z5cfnCe07pQno+5AAE3R3OwChUm+hcUIJ2brVxHzxE=;
  b=ZpeAr6YbLhGTtp5ixFBmZTqSVsH95CjrQf6TLW5UlWaJXaB0z0T5qGzq
   EyUBx2DyR6wFUGOMpyNkm8BM2GPn5hYNC7VC1G2CQwglN8vbhr9cYMwJL
   JEV88IrCbu/VYkVQIPrRJ/GxXHr5iScl49xxPcRCWqycamCR3YtVT2HsZ
   EmAK1WSAZfPNXhX1ELqcRdFd+v68uCZ3WHyjSBwl/h5iqa4u1aIB3sCVW
   dQLT7cWbyrLNCD36dXr4ZlyrYF7UCZLSUmvUSEFw2WnQ+WCPAN1AShY9B
   Q20r79sHCiWkJmJKKiEiYqyPxrbbK1NFBC99egBJfBSrSKWqlgQ0dcinJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453746834"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="453746834"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6788594"
Received: from mariamih-mobl.ger.corp.intel.com (HELO localhost) ([10.251.212.124])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:48:56 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D . Jones" <luke@ljones.dev>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Kai Heng Feng <kai.heng.feng@canonical.com>,
        James John <me@donjajo.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
In-Reply-To: <20231021094841.7419-1-hdegoede@redhat.com>
References: <20231021094841.7419-1-hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Do not report brightness
 up/down keys when also reported by acpi_video
Message-Id: <169822733628.3766.17152721084128841872.b4-ty@linux.intel.com>
Date:   Wed, 25 Oct 2023 12:48:56 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, 21 Oct 2023 11:48:41 +0200, Hans de Goede wrote:

> For a long time now the acpi_video driver reports evdev brightness up/down
> key events for the brightness hotkeys on most (non ancient) laptops.
> 
> asus-wmi also reports evdev brightness up/down key events for these
> keys leading to each press being reported twice and e.g. GNOME increasing
> the brightness by 2 steps instead of 1 step.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

Once I've run some tests on the review-ilpo branch the patches
there will be added to the platform-drivers-x86/for-next branch
and eventually will be included in the pdx86 pull-request to
Linus for the next merge-window.

The list of commits applied:
[1/1] platform/x86: asus-wmi: Do not report brightness up/down keys when also reported by acpi_video
      commit: 858bd78c9d324781217bb42a87766ca9194809ca

--
 i.

