Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A4746E
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705907167; cv=none; b=OGNBExm3olja78YuyIwjrtFZq+QFsnATCvfNZfShh57NJgjHTR+5SwJ5cc4Abchn+dh9MYy30Qq1uQ3ZX3hWVnoznDqB641GGP947HhEl2NcSzXzFI1dAPnlnaF4twKI1DVgIev/8TEjnA7521D7gY52+fXgGZG+apmnZ6cRUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705907167; c=relaxed/simple;
	bh=RqcHq3KW1yUEezJpZM2rv3XDbJjJ3ddlC97V6bkPPtA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxqn/vv0BEFo0lLPNrsa0qQzcKbEylRJB3JcwAAEAIfX89oor2N/MqfJxMRUGnMhd/S7PWucNaSVwrHPHPRrQL3lg2E82MmJHyTQguD7ctuyn/JnIofzeObeIqN+1lfR8Q2q8h7M4yVhFi3zkA+McmVzboMtaSNAKClQR4JXrx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=mNSJU4d7; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="mNSJU4d7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1705908062; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=GlaY/j3YXmB7D8SiUGSTk0zrn0e9iu0zJlBnSM47Yxc=; b=mNSJU4d7
	KTub1Z1YCp98LxD8UFt0rgkgfDN+tdCf6eigATyXNlegC47r6N4yJkswBGby3Lm+NH4HS6TJoerG7
	tXo0n4B8bcTDO1dDio7+XP+Y+6p6TY+l0INwxZtmwbRX+KsF/b1SWCQcTaHgUANjdZDSqclh7M4Ud
	0QQP67Tf1otIrYa0nzwm5E/XwhAF5XpJt5q3k+VHQpccW+ybnrEdmX8kpuMhpRe/vtmxXiAnw80Tz
	IVyXVBDzESJVm/ItA7cWkXPkvDaV6gOSZFd1FEyneZiuXNkJ0CpWq7iu0/J7Nm2nlK9BqskEgXt9i
	QVmOY8+QTVG9DL0kZiYrlc4vyQ==;
Received: from [10.45.33.53] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rRoNa-l1jklU-SC; Mon, 22 Jan 2024 07:05:58 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rRoNY-rlazn6-21;
 Mon, 22 Jan 2024 07:05:57 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Mon, 22 Jan 2024 02:05:53 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Mon, 22 Jan 2024 02:05:53 -0500
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <Za4T0RwClHOoCPCy@panther>
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de>
 <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de>
X-Smtpcorp-Track: 1rRoNYr_azn621.rweWqY9SoRgCF
Feedback-ID: 498822m:498822aoToIo_:498822sZEw92SIK9
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 21 Jan 16:16, Armin Wolf wrote:
> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
> 
> > On 20 Jan 21:52, Armin Wolf wrote:
> >> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
> >>
> >>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop "doesn't
> >>> work", showkey doesn't report any keycode or scancode. I don't see any
> >>> wmi related error messages from dmesg. All the other illuminated
> >>> "hotkeys" work fine, although confusingly evtest and "libinput
> >>> debug-events" report that they're coming through the event interface
> >>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
> >>> hotkeys", but hey, as long as I receive them I'm okay :p.
> >>>
> >>> hp-wmi.c does seem to reference it:
> >>>     { KE_KEY, 0x213b,  { KEY_INFO } },
> >>>
> >>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
> >> it can be possible that your machine does not use hp-wmi to deliver keycodes
> >> to the operating system, but instead emulates a standard keyboard controller.
> >>
> >> Can you check with "kacpimon" that events concerning a PNP0C14 device are being
> >> received?
> > Very possible indeed. "kacpimon" doesn't show anything when I press that
> > touchkey, but it does when I press all the other touchkeys. (I do get
> > lots of accelerometer noise.)
> >
> Interesting, can you please share the output of:
> - "kacpimon" while you where pressing the buttons
> - "acpidump"

Actually I was finally able to detect something via kacpimon, but it was
elusive, and it's scaring me now! It wouldn't immediately show on live
stdout (the way the other touch-hotkeys, and normal keys, do), and I
even had trouble seeing it when trying to redirect stdout to a file!
Ctrl-C'ing would prematurely truncate the output, sometimes not
capturing it, even the more graceful Escape-exit wouldn't capture it
unless I waited or padded it with mouse movements. Ie. there is some
very weird delay going on, and maybe repetition, or something.

For example, I swear I only touched that info key 5 times here, and then
AFTERWARDS pressed the 'A' key twice, and then Esc. grep'ing for
'Type: 1' I was able to catch:

Input Layer:  Type: 1  Code: 28  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 30  Value: 1
Input Layer:  Type: 1  Code: 30  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 30  Value: 1
Input Layer:  Type: 1  Code: 30  Value: 0
Input Layer:  Type: 1  Code: 1  Value: 1

A more weird example, again I *swear* I first only touched that info key
*5* times, and then moved the mouse for a few seconds between 2 'A' key
presses, and finishing with Escape, but although it showed the two 'A'
key events properly, it also showed *11* "code 325" and 11 "code 330"
value1 events, out of order!?

Input Layer:  Type: 1  Code: 28  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 30  Value: 1
Input Layer:  Type: 1  Code: 30  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 30  Value: 1
Input Layer:  Type: 1  Code: 30  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 1
Input Layer:  Type: 1  Code: 330  Value: 0
Input Layer:  Type: 1  Code: 325  Value: 0
Input Layer:  Type: 1  Code: 1  Value: 1

(Thank you for your guidance btw! Will an acpidump still be necessary?)
