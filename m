From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [PATCH] Remove ThinkPads from _OSI(Linux) blacklist
Date: Tue, 24 May 2011 06:46:15 -0400
Message-ID: <BANLkTi=VuHBNx+14njxRin+37smM6XDemg@mail.gmail.com>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <2ef7d4696f9eeb60d9dfb85a7bc2efef132f3e96.1306156342.git.luto@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:59388 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753206Ab1EXKqf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2011 06:46:35 -0400
Received: by pvg12 with SMTP id 12so2926676pvg.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2011 03:46:35 -0700 (PDT)
In-Reply-To: <2ef7d4696f9eeb60d9dfb85a7bc2efef132f3e96.1306156342.git.luto@mit.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andy Lutomirski <luto@mit.edu>, Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, May 23, 2011 at 9:15 AM, Andy Lutomirski <luto@mit.edu> wrote:
> Now that thinkpad-acpi knows how to program the hardware mute button
> on recent ThinkPads, the _OSI(Linux) hack is unnecessary.

Please don't apply as-is.  A friendly Gentoo user has pointed out that
this patch will cause problems for people who have
CONFIG_THINKPAD_ACPI_ALSA_SUPPORT=n.  (The previous patch should still
be fine, though, if a little suboptimal.)

--Andy
