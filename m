Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D52371B4B
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jan 2024 20:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706646037; cv=none; b=fu5ArwmMRYwD7l3olPVSdupgofI/pZG0+SXpdu+UKUjodse4TEMJjQ8iWOTDgpI6a9jINDdx8sLESJW7K+kxiRqutDxwRZHx+xQpKzIMGN/wkgw93Axh/KPXe5KLdFBz0GTUXmlYb5RhgauJ/bzROkNM9craOrj9GSJFkUKPtW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706646037; c=relaxed/simple;
	bh=XiURD5Lezv3XwchZWnbdqgq+CcpDV9Z1Dnc98eA/fgQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKgo853Sk8pP8PaQFeJYsw+kwq8Lx9KQMyXoRHWCDfGm+mXkOguPTW2pB2p22Ip8wcfgyE95GpgJpOrR9awhPFlIJrjcCx1Op8r0FHcFGM/y0JROstiqOrLbS5fO39Sct74Q7eMPAUYk5UTGztpbnjdFUyvSO8dpuOCzrc0u9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=T3NqGPxz; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="T3NqGPxz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706646935; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=8368D8z1eEkQD/cZQwmaxiWunf6TOnN4X5l5eqfxAEY=; b=T3NqGPxz
	p/ICpjbWStosv78aXatz4c4ScZy95OJqKtcIb4o5vXUoQL3KU+spxKBdbZVZm5LQy+QPnHZRezsOH
	wgNTAgfnWdYkUgjvDQya1w1g3B0Qdy7C62uLb7WEuRg3C+VkZW+op+/ZsSkxiML6rGsqxmPkABIsJ
	XZYcvjbuwPqAKyydfrsz4Jo2IM93Dc9uLGGDbicfq7P8lzgvXZeYhiChuNbTUsuyfNmF+JAaA/+Qz
	y97WK+2KLmkBIbpDAD6Ul9EuX3KAeTNQhhEDsyUw+e7l6XkgYmH0WJdItz2Tp/SOBbkFJOb5/lVkQ
	mrUHrhHPKDw8iPDMp6zBamLoPg==;
Received: from [10.45.33.53] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rUuar-l1jdpR-GU; Tue, 30 Jan 2024 20:20:29 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rUuap-rlnZTf-0R;
 Tue, 30 Jan 2024 20:20:28 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Tue, 30 Jan 2024 15:20:24 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Tue, 30 Jan 2024 15:20:24 -0500
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <ZblaCCl_OYKENzqW@panther>
References: <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de>
 <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de>
 <Za8xL39m1X22f2Bb@panther> <Za9DQdLg2d_CnrZG@panther>
 <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
 <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de>
 <Za_Xss52DlydJOOO@panther>
 <e53a660b-f766-479c-8507-ffe25ca0e26e@redhat.com>
 <57df06ee-3aa1-4501-9dc6-a7bc57d770be@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57df06ee-3aa1-4501-9dc6-a7bc57d770be@gmx.de>
X-Smtpcorp-Track: 1rlIapr_nZTf0R.IEomvsaNGWYiS
Feedback-ID: 498822m:498822aoToIo_:498822sZEw92SIK9
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 23 Jan 20:58, Armin Wolf wrote:
> Am 23.01.24 um 16:34 schrieb Hans de Goede:
> 
> > Hi,
> >
> > On 1/23/24 16:13, Dennis Nezic wrote:
> >> On 23 Jan 15:22, Armin Wolf wrote:
> >>> Am 23.01.24 um 09:58 schrieb Armin Wolf:
> >>>
> >>>> Am 23.01.24 um 05:40 schrieb Dennis Nezic:
> >>>>
> >>>>> On 22 Jan 22:23, Dennis Nezic wrote:
> >>>>>> On 22 Jan 11:44, Armin Wolf wrote:
> >>>>>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
> >>>>>>>
> >>>>>>>> On 21 Jan 16:16, Armin Wolf wrote:
> >>>>>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
> >>>>>>>>>
> >>>>>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
> >>>>>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
> >>>>>>>>>>>
> >>>>>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop
> >>>>>>>>>>>> "doesn't
> >>>>>>>>>>>> work", showkey doesn't report any keycode or scancode. I don't
> >>>>>>>>>>>> see any
> >>>>>>>>>>>> wmi related error messages from dmesg. All the other illuminated
> >>>>>>>>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
> >>>>>>>>>>>> debug-events" report that they're coming through the event
> >>>>>>>>>>>> interface
> >>>>>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
> >>>>>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
> >>>>>>>>>>>>
> >>>>>>>>>>>> hp-wmi.c does seem to reference it:
> >>>>>>>>>>>>
> >>>>>>>>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
> >>>>>>>>>>> it can be possible that your machine does not use hp-wmi to
> >>>>>>>>>>> deliver keycodes
> >>>>>>>>>>> to the operating system, but instead emulates a standard
> >>>>>>>>>>> keyboard controller.
> >>>>>>>>>>>
> >>>>>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14
> >>>>>>>>>>> device are being
> >>>>>>>>>>> received?
> >>>>>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I
> >>>>>>>>>> press that
> >>>>>>>>>> touchkey, but it does when I press all the other touchkeys. (I
> >>>>>>>>>> do get
> >>>>>>>>>> lots of accelerometer noise.)
> >>>>>>>>>>
> >>>>>>>>> Interesting, can you please share the output of:
> >>>>>>>>> - "kacpimon" while you where pressing the buttons
> >>>>>>>>> - "acpidump"
> >>>>>>>> ...
> >>>>>>> Those events are touchscreen events, maybe your mouse is
> >>>>>>> responsible for them.
> >>>>>> Right, of course, woops, these must have been the touchpad press
> >>>>>> events,
> >>>>>> as I was moving the mouse around :P
> >>>>>>
> >>>>>>> Instead they look like this:
> >>>>>>>
> >>>>>> I'm definitely not seeing anything like that, just "^Input Layer:
> >>>>>> Type"'s
> >>>>>>
> >>>>>>> Can you try to use kacpimon again but without root privileges? This
> >>>>>>> way only netlink events show up.
> >>>>>>> You might also stop acpid while you are using kacpimon.
> >>>>>> 0 output from/with netlink, even though kacpimon said:
> >>>>>>
> >>>>>> Netlink ACPI Family ID: 24
> >>>>>> Netlink ACPI Multicast Group ID: 5
> >>>>>> netlink opened successfully
> >>>>>>
> >>>>>> Remember all my other fancy hotkeys "work", but they appear as regular
> >>>>>> keypress events from an "AT Translated Set 2 keyboard".
> >>>>>>
> >>>>>>> If you still cannot receive any netlink events, then i might need
> >>>>>>> to take a look at your ACPI tables
> >>>>>>> via acpidump.
> >>>>>> https://dennisn.mooo.com/stuff/dump.txt
> >>>>>>
> >>>>>>> Thanks,
> >>>>>>> Armin Wolf
> >>>>>> Thank you again sir!
> >>>>> A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
> >>>>> 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
> >>>>> 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
> >>>>> 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
> >>>>>
> >>>>> (Btw that "info" key does get illuminated when I touch/press it, even
> >>>>> though no codes are seen.)
> >>>> These warnings in dmesg are harmless, they are informing you that some
> >>>> WMI devices are unavailable.
> >>>>
> >>>> I took a look at your ACPI tables and it seems that the WMI device
> >>>> used by hp-wmi is indeed unused.
> >>>> What is the model name of your HP notebook?
> >> HP Compaq 8710p
> >>
> >>> Also i just noted that your notebook might contain a PNP0C32 quickstart button device.
> >>> Can you tell me the output of "cat /sys/bus/acpi/devices/PNP0C32\:00/status"?
> >> 15
> > Interesting.
> >
> > There have been several attempts to add support for this
> > in the past. The last one being:
> >
> > https://lore.kernel.org/platform-driver-x86/20220922182424.934340-1-lkml@vorpal.se/
> >
> > Note that in this case this also required some vender
> > specific poking in toshiba_acpi to get things to work.
> >
> > I see that the HP Compaq 8710p is about the same vintage
> > as the Toshiba Z830 on which the last attempt to do
> > something about the quick start buttons was done.
> >
> > So this might very well explain the missing button issue.
> >
> > Regards,
> >
> > Hans
> >
> I can try to upstream the necessary changes. But i cannot test the changes concerning the toshiba_acpi driver.
> Would it be ok if i omit those changes?
> 
> Dennis, can you check that your device runs the latest BIOS? And if this is not the case, could you do a BIOS
> update and send me an updated acpidump?
> 
> The reason for this is that currently, the button device receives only system wake events, but no button press
> events during runtime. Maybe this is a BIOS bug, although this could also be intentional (fancy power button).

Updated acpidump: https://dennisn.mooo.com/stuff/dump2.txt.gz
