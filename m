Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9914A85
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jan 2024 21:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705786788; cv=none; b=fsuSbqCyczQYoL47+b6QewSIcHfyThq/9wzouqO6trTkz/7AaNKUYEhUEV/pKB+NpYthh9BqJPSW2zZKKWGE7jnzm7NWQ25LvYMBr2T7xUK456kjvLtP4yRpl8OCuTwjdr8BelJ8IKQCcqgfGZjy5gOCgJUK1VO7dr3a47EvDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705786788; c=relaxed/simple;
	bh=FZ8i027+QPshdyAsvbS9VyWnsFAtujIif6Pq0jDx+ac=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN4g4xtSQXv4dt71cVucAzyeiFxftEH4qbdpZwpUabzqg5B8SOsCOo5qmAMgXhSJ4fG3kJvxfMh3AvHPK+IURxmdkx1Cs90WVFcbnulMc4GLyq4n+XMJhXtLSShcG9NRhbLYsfRPXJE4CHPy4lOOvunjntqa2086gDXp1O6JDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=Jn2Uby6g; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="Jn2Uby6g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1705787685; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=AJY+9umB/KV1xb5V34jYQ0dVTajZRTTkp3kFzGh7hq0=; b=Jn2Uby6g
	4ZDZCnMox8hjX7pGLv6QQjcodK8L/+kCcsaJnaPpHBrOM42KPfUnf8zIpOvOdX9jbwh+If1YdACEN
	P6Q96Ks/rWAMRYEAiIUHksQ0F/0uC/c7t1GghZ+mw6naZTvu4u1g0gMkCmOMPg0gamtqeZWwvWsyw
	A4tRoLk6x3a6+Q+wanPOzjACfqee3hPQwUe3AsRotdhmRaCemraiW3DohEfo0qVzL3uIrjhBdmjxO
	Eat9QX6gwecGWltCU76g7l1n+mtji39y74UIAZ9x9rNWDfAubIyaCkccN0AC+p5El/S5LbXCf5WzA
	otSr0uYe5FF5Mx3zw2oz+HwKVQ==;
Received: from [10.45.79.170] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rRJ41-l1jgf0-Ia; Sat, 20 Jan 2024 21:39:41 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rRJ40-bMV8Vh-0c;
 Sat, 20 Jan 2024 21:39:41 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 16:39:38 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Sat, 20 Jan 2024 16:39:38 -0500
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <Zaw9mnfEL65B5r4O@panther>
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de>
X-Smtpcorp-Track: 1rRJ40PuV8Vh0c.rS2-q6Ea7A33g
Feedback-ID: 498822m:498822aoToIo_:498822sZEw92SIK9
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 20 Jan 21:52, Armin Wolf wrote:
> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
> 
> > Guys, the "info" illuminated touch-key (hotkey?) on my laptop "doesn't
> > work", showkey doesn't report any keycode or scancode. I don't see any
> > wmi related error messages from dmesg. All the other illuminated
> > "hotkeys" work fine, although confusingly evtest and "libinput
> > debug-events" report that they're coming through the event interface
> > associated with "AT Translated Set 2 keyboard" instead of "HP WMI
> > hotkeys", but hey, as long as I receive them I'm okay :p.
> >
> > hp-wmi.c does seem to reference it:
> >    { KE_KEY, 0x213b,  { KEY_INFO } },
> >
> > How can I go about troubleshooting this? (I'm using kernel 6.6.8)
> 
> it can be possible that your machine does not use hp-wmi to deliver keycodes
> to the operating system, but instead emulates a standard keyboard controller.
> 
> Can you check with "kacpimon" that events concerning a PNP0C14 device are being
> received?

Very possible indeed. "kacpimon" doesn't show anything when I press that
touchkey, but it does when I press all the other touchkeys. (I do get
lots of accelerometer noise.)
