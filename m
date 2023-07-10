Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8D7EB64D9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Jul 2023 09:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjGJJXe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Jul 2023 05:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGJJXd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2023 05:23:33 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A28D92
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jul 2023 02:23:32 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="344623591"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="344623591"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 02:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865279841"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="865279841"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 02:23:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1qIn7C-001VqK-0Q;
        Mon, 10 Jul 2023 12:23:30 +0300
Date:   Mon, 10 Jul 2023 12:23:29 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Add intel_bytcrc_pwrsrc driver
Message-ID: <ZKvOEXaS6OElB0Tq@smile.fi.intel.com>
References: <20230303221928.285477-1-hdegoede@redhat.com>
 <CAHp75VfOUnVVr=_VcTch4-=KTv6v5yG3g+adgn2CtnjKCV0YYw@mail.gmail.com>
 <68a17e4e-a9ee-fe8b-abcd-7ccb4932e72a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a17e4e-a9ee-fe8b-abcd-7ccb4932e72a@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 04, 2023 at 11:00:59AM +0100, Hans de Goede wrote:
> On 3/3/23 23:41, Andy Shevchenko wrote:
> > On Sat, Mar 4, 2023 at 12:19 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Add a new driver for the power-, wake- and reset-source functionality
> >> of the Bay Trail (BYT) version of the Crystal Cove PMIC.
> >>
> >> The main functionality here is detecting which power-sources (USB /
> >> DC in / battery) are active. This is normally exposed to userspace as
> >> a power_supply class charger device with an online sysfs attribute.
> >>
> >> But if a charger is online or not is already exposed on BYT-CRC devices
> >> through either an ACPI AC power_supply device, or through a native driver
> >> for the battery charger chip (e.g. a BQ24292i).
> >>
> >> So instead of adding duplicate info under the power_supply class this
> >> driver exports the info through debugfs and likewise adds debugfs files
> >> for the reset- and wake-source info / registers.
> >>
> >> Despite this driver only exporting debugfs bits it is still useful to
> >> have this driver because it clears the wake- and reset-source registers
> >> after reading them. Not clearing these can have undesirable side-effects.
> > 
> > Hmm... Why is the existing regmap debugfs not enough? OK, maybe adding
> > something (clearing bits) to the actual CRC PMIC driver.
> > (You also can add a write callback so regmap will provide the write
> > access to the registers).
> 
> I did consider adding clearing the bits to the actual CRC PMIC driver,
> but this seemed like a cleaner solution and it gives a much nicer
> (debug) interface then raw register access.
> 
> Also after clearing the wake + reset reasons they are gone and cannot
> be retreived using debugfs regmap accesses.
> 
> This driver caches the values before clearing them.

One can always print them before clearing for debug purposes.

> >> Specifically if the WAKESRC register contains 0x01 (wake by powerbutton)
> >> on reboot then the firmware on some tablets turns the reboot into
> >> a poweroff. I guess this may be necessary to make long power-presses turn
> >> into a poweroff somehow?
> > 
> > Have not a doc at hand. Next week I will try to dig into it to see if
> > there is anything regarding it.
> 
> Note this seems to be a thing on BYT tablets which shipped with Android
> and lack an EC compared to other BYT tablets with an CRC PMIC. So I think
> things have been hacked around a bit here to deal with the lack of an EC.
> 
> I doubt this will be in the official docs, with that said thank you for
> the offer to look this up.
> 
> Note for later BYTCR (Cost Reduced) tablets not having an EC is normal,
> but these are pre BYTCR Android tablets actually AFAICT and their
> Windows counterparts (same motherboard with some different components
> do have an EC).

Sorry, seems slipped in cracks. I have checked the doc, below is the citation.

5.6.4
 Wake Source Indicators
 The PMIC contains one register which is intended to store the cause of a wake event,
 so that software can determine why the system was woken from Cold Off. These bits
 are write-1-to-clear.
 If the WAKESRC register is not cleared by the SOC, stale bits (from past wakes) will
 auto-clear. This is to ensure that only the most recent wake reason is flagged for SW

 Table 5-51: Wake Source Register
 Register Name R/W D7 D6 D5 D4 D3 D2 D1 D0 Initial Address
 WAKESRC R RSVD WAKE WAKU WAKE WAKE 0X00 TBD
		ADPT SB BAT PBTN
 BIT NAME FUNCTION DEFAULT
 D[7:4]	  Reserved
 		  Reserved
 0
 D[3]	  WAKEADPT
 		  0 = No wake by an AC/DC adapter insertion
 		  1 = Wake was triggered by an AC/DC adapter
 		  insertion.
 0
 D[2]	  WAKEUSB
 		  0 = No wake by a USB charger insertion
 		  1 = Wake was triggered by a USB charger insertion.
 0
 D[1]	  WAKEBAT
 		  0 = No wake by a battery insertion
 		  1 = Wake was triggered by a battery insertion.
 0
 D[0]	  WAKEPBTN
 		  0 = No wake by user pressing the power button
 		  1 = Wake was triggered by user pressing the power
 		  button.
 0

-- 
With Best Regards,
Andy Shevchenko


