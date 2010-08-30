From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: Re: [PATCH] intel_ips: quieten "power or thermal limit exceeded"
 messages
Date: Mon, 30 Aug 2010 18:42:55 -0300
Message-ID: <4C7C25DF.3070401@cesarb.net>
References: <1282869660.1836.5.camel@Joe-Laptop>	<4C77171E.6060008@cesarb.net>	<1282894751.1836.41.camel@Joe-Laptop>	<4C784650.2030200@cesarb.net>	<1282962104.1946.179.camel@Joe-Laptop>	<4C78E8EF.1000009@cesarb.net>	<1282994116.1946.226.camel@Joe-Laptop>	<4C790693.1060908@cesarb.net>	<1283002154.1946.268.camel@Joe-Laptop>	<4C791ABA.9070005@cesarb.net>	<20100828152335.GA2212@khazad-dum.debian.net>	<4C795E5C.1080506@cesarb.net> <20100830092958.1c50c8cb@jbarnes-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-04.mandic.com.br ([200.225.81.151]:36986 "EHLO
	smtp-04.mandic.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756163Ab0H3VnF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 Aug 2010 17:43:05 -0400
In-Reply-To: <20100830092958.1c50c8cb@jbarnes-desktop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Joe Perches <joe@perches.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Em 30-08-2010 13:29, Jesse Barnes escreveu:
> It's possible that the main issue here is bad thermal limits.  There's
> obviously a relationship between power and thermal output, but the
> driver tries to monitor both.  However it's up to the BIOS to provide
> the driver with accurate thermal limits, as well as accurate power
> limits.  The power limits sound reasonable at 25W, thus the
> informational output about 35W vs 25W (35W is what the MCP can handle,
> but some platforms are designed to handle less, so they clamp it down a
> bit).  But the temp limits look all wrong.  I'll see if I can find info
> on getting better data into the driver...

If you need more information from this laptop (dmidecode, ACPI AML, 
etc), just ask.

-- 
Cesar Eduardo Barros
cesarb@cesarb.net
cesar.barros@gmail.com
