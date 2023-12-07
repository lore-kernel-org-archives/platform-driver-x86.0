Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE57784
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Dec 2023 08:07:49 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1082806"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1082806"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 08:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889794317"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889794317"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 08:07:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rBGuc-00000003pjh-2puS;
	Thu, 07 Dec 2023 18:07:42 +0200
Date: Thu, 7 Dec 2023 18:07:42 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Add intel_bytcrc_pwrsrc driver
Message-ID: <ZXHtzpgCks1Ix-0o@smile.fi.intel.com>
References: <20230303221928.285477-1-hdegoede@redhat.com>
 <CAHp75VfOUnVVr=_VcTch4-=KTv6v5yG3g+adgn2CtnjKCV0YYw@mail.gmail.com>
 <68a17e4e-a9ee-fe8b-abcd-7ccb4932e72a@redhat.com>
 <ZKvOEXaS6OElB0Tq@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZKvOEXaS6OElB0Tq@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jul 10, 2023 at 12:23:30PM +0300, Andy Shevchenko wrote:
> On Sat, Mar 04, 2023 at 11:00:59AM +0100, Hans de Goede wrote:
> > On 3/3/23 23:41, Andy Shevchenko wrote:
> > > On Sat, Mar 4, 2023 at 12:19 AM Hans de Goede <hdegoede@redhat.com> wrote:
> > >>
> > >> Add a new driver for the power-, wake- and reset-source functionality
> > >> of the Bay Trail (BYT) version of the Crystal Cove PMIC.
> > >>
> > >> The main functionality here is detecting which power-sources (USB /
> > >> DC in / battery) are active. This is normally exposed to userspace as
> > >> a power_supply class charger device with an online sysfs attribute.
> > >>
> > >> But if a charger is online or not is already exposed on BYT-CRC devices
> > >> through either an ACPI AC power_supply device, or through a native driver
> > >> for the battery charger chip (e.g. a BQ24292i).
> > >>
> > >> So instead of adding duplicate info under the power_supply class this
> > >> driver exports the info through debugfs and likewise adds debugfs files
> > >> for the reset- and wake-source info / registers.
> > >>
> > >> Despite this driver only exporting debugfs bits it is still useful to
> > >> have this driver because it clears the wake- and reset-source registers
> > >> after reading them. Not clearing these can have undesirable side-effects.
> > > 
> > > Hmm... Why is the existing regmap debugfs not enough? OK, maybe adding
> > > something (clearing bits) to the actual CRC PMIC driver.
> > > (You also can add a write callback so regmap will provide the write
> > > access to the registers).
> > 
> > I did consider adding clearing the bits to the actual CRC PMIC driver,
> > but this seemed like a cleaner solution and it gives a much nicer
> > (debug) interface then raw register access.
> > 
> > Also after clearing the wake + reset reasons they are gone and cannot
> > be retreived using debugfs regmap accesses.
> > 
> > This driver caches the values before clearing them.
> 
> One can always print them before clearing for debug purposes.
> 
> > >> Specifically if the WAKESRC register contains 0x01 (wake by powerbutton)
> > >> on reboot then the firmware on some tablets turns the reboot into
> > >> a poweroff. I guess this may be necessary to make long power-presses turn
> > >> into a poweroff somehow?
> > > 
> > > Have not a doc at hand. Next week I will try to dig into it to see if
> > > there is anything regarding it.
> > 
> > Note this seems to be a thing on BYT tablets which shipped with Android
> > and lack an EC compared to other BYT tablets with an CRC PMIC. So I think
> > things have been hacked around a bit here to deal with the lack of an EC.
> > 
> > I doubt this will be in the official docs, with that said thank you for
> > the offer to look this up.
> > 
> > Note for later BYTCR (Cost Reduced) tablets not having an EC is normal,
> > but these are pre BYTCR Android tablets actually AFAICT and their
> > Windows counterparts (same motherboard with some different components
> > do have an EC).
> 
> Sorry, seems slipped in cracks. I have checked the doc, below is the citation.
> 
> 5.6.4
>  Wake Source Indicators
>  The PMIC contains one register which is intended to store the cause of a wake event,
>  so that software can determine why the system was woken from Cold Off. These bits
>  are write-1-to-clear.
>  If the WAKESRC register is not cleared by the SOC, stale bits (from past wakes) will
>  auto-clear. This is to ensure that only the most recent wake reason is flagged for SW
> 
>  Table 5-51: Wake Source Register
>  Register Name R/W D7 D6 D5 D4 D3 D2 D1 D0 Initial Address
>  WAKESRC R RSVD WAKE WAKU WAKE WAKE 0X00 TBD
> 		ADPT SB BAT PBTN
>  BIT NAME FUNCTION DEFAULT
>  D[7:4]	  Reserved
>  		  Reserved
>  0
>  D[3]	  WAKEADPT
>  		  0 = No wake by an AC/DC adapter insertion
>  		  1 = Wake was triggered by an AC/DC adapter
>  		  insertion.
>  0
>  D[2]	  WAKEUSB
>  		  0 = No wake by a USB charger insertion
>  		  1 = Wake was triggered by a USB charger insertion.
>  0
>  D[1]	  WAKEBAT
>  		  0 = No wake by a battery insertion
>  		  1 = Wake was triggered by a battery insertion.
>  0
>  D[0]	  WAKEPBTN
>  		  0 = No wake by user pressing the power button
>  		  1 = Wake was triggered by user pressing the power
>  		  button.
>  0

Did it help anyhow?

-- 
With Best Regards,
Andy Shevchenko


