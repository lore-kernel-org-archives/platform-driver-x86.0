Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B610FD
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jan 2024 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705777121; cv=none; b=iv17u+a8Tj/t7n2uK7hOSdoOLl3ISR8YW963masRx7VUUcAfadT7OJ9Mg6OjebzSTki3G38haeTysWDFmAAE9cJ/+O+JoVMj0i5V/Us3kgPAS8V9XIGOXWBF17Jrlm9ws8Z2UNDXUZCL7DdC1VjcaqF3EQKew0/+POn4yjrcdB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705777121; c=relaxed/simple;
	bh=quTV8iQi3hgkMX9E1RFmkQNSYlBO5j51l6QDkoHcDFk=;
	h=From:Date:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmgqJ7ZFw3Fu5p5Zmzm93BWX+3XdOa3ID+RCm5iLR+8iWMTIushde/Zp/I2SYv/4o9BvUjnBrTC2ZuvRRJIXXK9JODMBLVgsDRWKf2hJiRfLukMBGoIeE2Rq3lC8+cSEc6kXQbcM+BEsFX8L2gX6xr5Ff48nE07r9fJbPEfG+C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=0WR/fvhv; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="0WR/fvhv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1705778019; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=SGO6wX7LeOtvxqbiXYWEyx2lQSWoYa45MRiwVcQq45U=; b=0WR/fvhv
	u/n7+yYYwv1oauwRquLvf5YFdZuW1urXD++IJqH5y2f4dPeqGxtErYxyLvuFZ7fa0UNEC1T3Aswo4
	vDdSvae0TpnUrnwaIaj+SJJCwo2fGC16i0BsUrXFyP1tTBkDNwrgbOyBM0XDT0KN5cTAZaQ2j+8VX
	k250xSEStpNbuDTUSgB6Uapq0DZCAlfZzvRx1zWEgKpC1PAog9HuJ3A9bUJmSo6760pz8GGqRjjnw
	FlTtURqP69C8pnx303ArN2C0fh96BaBONeNpUcg8MYykrg6wMh/38U5AbyjY8+9C0HQ3k2CIbcznu
	GLOS66KI6kaI+e47XtLm/TyYEw==;
Received: from [10.45.79.71] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rRGYA-l1jcy9-8Z
 for platform-driver-x86@vger.kernel.org; Sat, 20 Jan 2024 18:58:38 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rRGY8-DvAIuu-1p
 for platform-driver-x86@vger.kernel.org;
 Sat, 20 Jan 2024 18:58:37 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 13:58:34 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Sat, 20 Jan 2024 13:58:34 -0500
To: platform-driver-x86@vger.kernel.org
Subject: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <ZawX2mquuTCv0tuF@panther>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Smtpcorp-Track: 1rRGY8DvjmII1p.rQfdq4taNWdYx
Feedback-ID: 498822m:498822aoToIo_:498822sSITI4hc2Y
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

Guys, the "info" illuminated touch-key (hotkey?) on my laptop "doesn't
work", showkey doesn't report any keycode or scancode. I don't see any
wmi related error messages from dmesg. All the other illuminated
"hotkeys" work fine, although confusingly evtest and "libinput
debug-events" report that they're coming through the event interface
associated with "AT Translated Set 2 keyboard" instead of "HP WMI
hotkeys", but hey, as long as I receive them I'm okay :p.

hp-wmi.c does seem to reference it:
  { KE_KEY, 0x213b,  { KEY_INFO } },

How can I go about troubleshooting this? (I'm using kernel 6.6.8)
