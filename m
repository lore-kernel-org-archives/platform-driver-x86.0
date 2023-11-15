Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC634C07548
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Nov 2023 12:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343807AbjKOMtE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Nov 2023 07:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343723AbjKOMtD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2023 07:49:03 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2299411F;
        Wed, 15 Nov 2023 04:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700052540; x=1731588540;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=SF+1geNN0bIT4JrgyKR8RRkZ5elaJ520dBZaV+2ASAI=;
  b=kdty0HuSUeuFkLhcuzZGs44v6Mcz4+QrA3eFXVqo1vzbBwhlVezj/b5m
   VQmc+pb0hG2g+Htr5ccL6OFPqz7daUc6a3qr+gxByB6TVAMHmfbbPIbKy
   h/rAAX2vWj575MIV4OVq7BUb2OLt8MW86vleId7fwa04YJQbSBymOZvM9
   7dFXYl/5R25gAm5s4eEWDz4rwarlnNCuCeMzJoq6qMBB5Ia1QJN7WI0W6
   79NvrHVk/PcVYJDI95jQgVulyl/3V5L/mDTiGClmHKkPMvKb5WuZpfcnU
   cyorIyCaw7nQi4XmSX/Rnu+C21dOLDsvtARJS7S++unrbjGD3bp3tZQ4B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393726212"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="393726212"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:48:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1012250245"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="1012250245"
Received: from rkhristx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.217])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:48:56 -0800
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     platform-driver-x86@vger.kernel.org,
        Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ike Panhc <ike.pan@canonical.com>, stable@vger.kernel.org
In-Reply-To: <20231114114055.6220-2-stuart.a.hayhurst@gmail.com>
References: <9f46c613-63c2-4bc7-b938-7c9ea862a55e@linux.intel.com>
 <20231114114055.6220-2-stuart.a.hayhurst@gmail.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Set max_brightness
 before using it
Message-Id: <170005252425.3220.12662660184359784558.b4-ty@linux.intel.com>
Date:   Wed, 15 Nov 2023 14:48:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 14 Nov 2023 11:38:08 +0000, Stuart Hayhurst wrote:

> max_brightness is used in ideapad_kbd_bl_brightness_get() before it's set,
> causing ideapad_kbd_bl_brightness_get() to return -EINVAL sometimes
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ideapad-laptop: Set max_brightness before using it
      commit: 7a3c36eef9a5d13b16aa954da54224c9c6bed339

--
 i.

