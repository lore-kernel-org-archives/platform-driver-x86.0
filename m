Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CC5FBA6
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706022843; cv=none; b=Rm1UebNEjJGjfYXKvt00sIY2vxisXoHaL0ioL1Fp8Ib+PQdsCO4Ml8ZOYkTKmoCJ1JzVRDraig+4/W4fCsM5HLjtjqdhfxevPOUHYAZbNSc9CxxjTfUCW2StPOhAJRrOjWXI1oKrZUjN0rBOBybfyxbxb77Kt8E+XhKoZWUv17g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706022843; c=relaxed/simple;
	bh=LGkcPMlyACDc73oQ2SsRwUXOafg+5JLQecAN9g5aUh0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLRGz740vPr2Kga/maHUGnt3Kxbz/FOxuPaWSK03tt38/43CXaUmID2tU8vwiB/InI+ewEFEpqu14pEtzIDtw2cJ4FpAML05CCnnKIceRG3eKZjLxnj9ApkgoCsO8T4UujLjWGLSom+LtvWJcY7nnm+qtdisNxhAyS1BBcAuXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=LubuRTOK; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="LubuRTOK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706023740; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=c/ik6wn8NhwWS+ok5ggGn1RTh3x3eqvmaQ24JKSj/jc=; b=LubuRTOK
	hZ1F8Jq0IVlvhvTkUn+7lKXcBJtJiz/A4tBVYgHKZad1lyaNoo7H/6S/tz6m8eASIrDy3lqHpIfK6
	cA6krtGn2qvtUjk9oXHr6QrE2K48m4VfbP4X6T5OfM4Wth5Y7LGC9lxpdIuWRZ5zFRr7D/VqYtYBJ
	PaspQUl4nHxD6OpP/arNliaKtDkDJdLN/LYOoKM1ztt/xyh6plRDL4j5EeMepE5vguaRiXqDzY/sA
	9cvkMoN2aD3N7xe3qI9tsm6pg1035oI4quTGqiGm12XYJuxM7MDkuSjKwwGWMOh7lGn9Rh0zaJ+7r
	i8+UsGcSb0A35kFSK+3BvUOuEA==;
Received: from [10.66.228.43] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rSITN-l1jk1Y-64; Tue, 23 Jan 2024 15:13:57 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rSITL-wSPiDp-2c;
 Tue, 23 Jan 2024 15:13:56 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 10:13:54 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Tue, 23 Jan 2024 10:13:54 -0500
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <Za_Xss52DlydJOOO@panther>
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de>
 <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de>
 <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de>
 <Za8xL39m1X22f2Bb@panther> <Za9DQdLg2d_CnrZG@panther>
 <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
 <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de>
X-Smtpcorp-Track: 1rSmTLwSeiDp2c.rs-xqEs1dKfEb
Feedback-ID: 498822m:498822aoToIo_:498822sZEw92SIK9
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 23 Jan 15:22, Armin Wolf wrote:
> Am 23.01.24 um 09:58 schrieb Armin Wolf:
> 
> > Am 23.01.24 um 05:40 schrieb Dennis Nezic:
> >
> >> On 22 Jan 22:23, Dennis Nezic wrote:
> >>> On 22 Jan 11:44, Armin Wolf wrote:
> >>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
> >>>>
> >>>>> On 21 Jan 16:16, Armin Wolf wrote:
> >>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
> >>>>>>
> >>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
> >>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
> >>>>>>>>
> >>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop
> >>>>>>>>> "doesn't
> >>>>>>>>> work", showkey doesn't report any keycode or scancode. I don't
> >>>>>>>>> see any
> >>>>>>>>> wmi related error messages from dmesg. All the other illuminated
> >>>>>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
> >>>>>>>>> debug-events" report that they're coming through the event
> >>>>>>>>> interface
> >>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
> >>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
> >>>>>>>>>
> >>>>>>>>> hp-wmi.c does seem to reference it:
> >>>>>>>>>
> >>>>>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
> >>>>>>>> it can be possible that your machine does not use hp-wmi to
> >>>>>>>> deliver keycodes
> >>>>>>>> to the operating system, but instead emulates a standard
> >>>>>>>> keyboard controller.
> >>>>>>>>
> >>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14
> >>>>>>>> device are being
> >>>>>>>> received?
> >>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I
> >>>>>>> press that
> >>>>>>> touchkey, but it does when I press all the other touchkeys. (I
> >>>>>>> do get
> >>>>>>> lots of accelerometer noise.)
> >>>>>>>
> >>>>>> Interesting, can you please share the output of:
> >>>>>> - "kacpimon" while you where pressing the buttons
> >>>>>> - "acpidump"
> >>>>> ...
> >>>> Those events are touchscreen events, maybe your mouse is
> >>>> responsible for them.
> >>> Right, of course, woops, these must have been the touchpad press
> >>> events,
> >>> as I was moving the mouse around :P
> >>>
> >>>> Instead they look like this:
> >>>>
> >>> I'm definitely not seeing anything like that, just "^Input Layer:
> >>> Type"'s
> >>>
> >>>> Can you try to use kacpimon again but without root privileges? This
> >>>> way only netlink events show up.
> >>>> You might also stop acpid while you are using kacpimon.
> >>> 0 output from/with netlink, even though kacpimon said:
> >>>
> >>> Netlink ACPI Family ID: 24
> >>> Netlink ACPI Multicast Group ID: 5
> >>> netlink opened successfully
> >>>
> >>> Remember all my other fancy hotkeys "work", but they appear as regular
> >>> keypress events from an "AT Translated Set 2 keyboard".
> >>>
> >>>> If you still cannot receive any netlink events, then i might need
> >>>> to take a look at your ACPI tables
> >>>> via acpidump.
> >>> https://dennisn.mooo.com/stuff/dump.txt
> >>>
> >>>> Thanks,
> >>>> Armin Wolf
> >>> Thank you again sir!
> >>
> >> A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
> >> 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
> >> 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
> >> 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
> >>
> >> (Btw that "info" key does get illuminated when I touch/press it, even
> >> though no codes are seen.)
> >
> > These warnings in dmesg are harmless, they are informing you that some
> > WMI devices are unavailable.
> >
> > I took a look at your ACPI tables and it seems that the WMI device
> > used by hp-wmi is indeed unused.
> > What is the model name of your HP notebook?

HP Compaq 8710p

> Also i just noted that your notebook might contain a PNP0C32 quickstart button device.
> Can you tell me the output of "cat /sys/bus/acpi/devices/PNP0C32\:00/status"?

15
