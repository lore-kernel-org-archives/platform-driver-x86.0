From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad-acpi: recognize Lenovo as
 version string in newer V-series BIOS
Date: Mon, 12 Mar 2012 20:02:13 -0300
Message-ID: <20120312230213.GA20690@khazad-dum.debian.net>
References: <1331335944-4662-1-git-send-email-manoj.iyer@canonical.com>
 <1331335944-4662-2-git-send-email-manoj.iyer@canonical.com>
 <20120310042844.GA14972@khazad-dum.debian.net>
 <1331387907.2833.33.camel@scapa>
 <20120310160609.GA6254@khazad-dum.debian.net>
 <alpine.DEB.2.02.1203121558340.3458@lazy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53737 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757583Ab2CLXCS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 19:02:18 -0400
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1C6F62118B
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Mar 2012 19:02:18 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1203121558340.3458@lazy>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Manoj Iyer <manoj.iyer@canonical.com>
Cc: Yves-Alexis Perez <corsac@debian.org>, ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, 12 Mar 2012, Manoj Iyer wrote:
> Yes, the V series systems are listed under Ideapad series on
> Lenovo's website. I initially was looking at why the Fn+F5 hotkey
> was not reporting a key event. Looking at the bios dsdt.dsl data on
> V480 I see
> 
> Device (HKEY)
>                     {
>                         Mutex (BFWM, 0x07)
>                         Name (INDV, Zero)
>                         Name (_HID, EisaId ("LEN0068"))
>                         Method (_STA, 0, NotSerialized)
> 
> and it does not have the acpi_device_id of VPC2004 like other
> ideapads that I have seen, and seemed like the HKEY could be handled
> by thinkpad_acpi module. Product version string in DMI says "Lenovo
> V480" instead of "ThinkPad" and this was not recognized by the
> thinkpad_acpi module, thus my quirk to load the module.
> 
> After loading the module on the V480 I see:
> 
> [14511.946260] thinkpad_acpi: ThinkPad ACPI Extras v0.24
> [14511.946262] thinkpad_acpi: http://ibm-acpi.sf.net/
> [14511.946264] thinkpad_acpi: ThinkPad BIOS H5ET23WW (0.23 ), EC unknown
> [14511.946265] thinkpad_acpi: Lenovo Lenovo V480, model 14TD010
> [14511.946707] thinkpad_acpi: detected a 8-level brightness capable
> ThinkPad
> [14511.952009] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw:
> radio is unblocked
> [14511.953099] Registered led device: tpacpi::thinklight
> [14511.953156] Registered led device: tpacpi::power
> [14511.953203] Registered led device: tpacpi::standby
> [14511.953247] Registered led device: tpacpi::thinkvantage
> [14511.953262] thinkpad_acpi: Standard ACPI backlight interface
> available, not loading native one
> [14511.953420] thinkpad_acpi: Console audio control enabled, mode:
> monitor (read only)
> [14511.955196] input: ThinkPad Extra Buttons as
> /devices/platform/thinkpad_acpi/input/input17
> 
> Fn+F15 now reports key press event, 00000080 00001005, and it
> reported nothing before when the module was not loaded. So prior to
> loading thinkpad_acpi, /lib/udev/findkeyboards == input/event3,
> /lib/udev/keymap -i input/event3 returned no valid values for Fn+F5
> combo.
> 
> I am trying to get this patched module tested on other thinkpad and
> ideapads that we have to see if there are any regression or other
> issues. So, please let me know if this something worth supporting.

Yes, it looks like it is worth supporting alright.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
