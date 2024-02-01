Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39105F478
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Feb 2024 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706799524; cv=none; b=Os9nUbrgsVNQr1T6YCNzVdaBmAogDlEMXAfWKm63dhj4ZX1IXWdKl/sOCGVTwprlt1h1jzTFwxgY4RXC3ZSth9kvqTfm+FkrmfiL1arBJrJFyajQO2aXy3O4phOq3p3S/f6qfHOWJ90HUXBWunF/vWdGuaFfCTrH2x/IEH6yqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706799524; c=relaxed/simple;
	bh=H8RerZXkUhQ5o2y2EdZeP73WjJ/7Vj7pkGXHBFZGZgE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=attzAU1PWvjXEYs49oKxUbzeqxEBWF5gGRt/s+9RCmZP+VE35dtN5CjRTHncMIvLbOlScLA0hg4lT8scNy1qnYLuZ8mQn1CY0V1ek5XZPiLanhNWnWL5EAFwPYd3Tr2d1ueXSD/IqF1GC2IGa7tZfqeo0snQNuth3MrDci0qF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=ng4pS8an; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="ng4pS8an"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706800419; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=StPsAfIFLyFKJBKpkTq79EACIxCQOSJ1tm9uEnA4NVg=; b=ng4pS8an
	58EVvA1sEvHvbJTcxQdO8eDV8Tecb26FT00YSvxBxJOh90a7/5sOxEbZpkrGixIvGg9M4Xhv7UvEM
	ZVQgx0aSahzItPZPHxayAHMp40K6WpRDCQo0T7EEAtqJa53SIkF8FcFNvFjKUTvpYrYgXIYoOFpmT
	J1Tab+LDmOgPBUWOg6CojmcHJDJGpSMp3Z+Zg2wT95HPBQ83cXzsufHix3CWY/8zDpPHPpWRmUb3I
	AbKHdOOkLocSXrmnkdOUsCjQHhrWuGe0i7Wc1SG33cbxjtWB1aOkSLzXVAbzJJyop//XpuEaWpqOs
	Xchp3kVpZXGTDMhYUvzWqqQKeg==;
Received: from [10.45.33.53] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rVYWR-l1jjKS-Ce; Thu, 01 Feb 2024 14:58:35 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rVYWO-rlkdZs-1E;
 Thu, 01 Feb 2024 14:58:34 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Thu, 01 Feb 2024 09:58:29 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Thu, 1 Feb 2024 09:58:29 -0500
To: Hans de Goede <hdegoede@redhat.com>
Cc: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
Message-ID: <ZbuxlZq6sGEAlI4n@panther>
References: <20240131111641.4418-1-W_Armin@gmx.de> <ZbpqZqyIHuX0s5vz@panther>
 <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de>
 <ZbqAkNe3ONcteSQ9@panther>
 <ed222583-e7e0-46f7-929f-4e076f746883@gmx.de>
 <ZbumN9GuFHp_pJRt@panther>
 <83692b7c-3797-4a78-9f5e-f935c43cceac@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83692b7c-3797-4a78-9f5e-f935c43cceac@redhat.com>
X-Smtpcorp-Track: 1rVYWOr_kdZs1E.IqGPvC0-698I-
Feedback-ID: 498822m:498822aoToIo_:498822soj83CG8eh
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 01 Feb 15:44, Hans de Goede wrote:
> Hi Dennis,
> 
> On 2/1/24 15:09, Dennis Nezic wrote:
> > On 31 Jan 18:36, Armin Wolf wrote:
> >> Am 31.01.24 um 18:17 schrieb Dennis Nezic:
> >>
> >>> On 31 Jan 18:07, Armin Wolf wrote:
> >>>> The issue is that you machine does not support runtime button events on the quickstart button,
> >>>> only wake events.
> >>>>
> >>>> Can you check if you can now use the unresponsive button to wake the system?
> >>> Nope, only the main power button can wake it from a sleep state, those
> >>> quickstart buttons do nothing.
> >>
> >> Can you check if this is still the case when you configure the PNP0C32 ACPI device to be able
> >> to generate wakeup events (from S5, S4 and S3)?
> >> Maybe you should unload the quickstart driver for this test.
> >>
> >> If the button still does nothing, then it could be that the quickstart device is not handling
> >> this button. Then we need some new ideas.
> > 
> > Yea I don't think quickstart/hp-wmi is handling it. As I said, the
> > behavior is exactly the same as if I didn't have it compiled at all.
> > 
> > I enabled it via /proc/acpi/wakeup (it was disabled initially) (the
> > S-state in that file only mentions S5, but I guess that should include
> > all the less sleepy states too). No effect. I tried with and without the
> > quickstart device.
> 
> Perhaps this is simply a hw defect, have you seen the button
> working under Windows? Maybe at some point some liquid
> got inside the keyboard around that button?

Unlikely. I have 2 of these laptops, same behavior. Never saw them with
Windows.

> The main keyboard buttons are typically membrane style buttons.
> 
> But extra media keys might be more remote control style, where
> there are not rubber domes beneath hard plastic keys, but the
> keys themselves are rubber, with some carbon conductor on
> the bottom and they directly connect 2 copper pads on the PCB.
>
> These remote style buttons are quite sensitive to dirt getting
> underneath (just like the buttons in a typical TV remote).
> 
> Assuming you can get things disassembled easily you may want
> to try and clean things.

These ones are more like a phone touchscreen ... it's just a long solid
plastic sheet, no distinct edges (annoying), with leds underneath. All
the led's get illuminated when touched, even this mysterious "info" key.



