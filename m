From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [RFC 5/5] hwmon: add support for Technologic Systems TS-5500
 A-D converter
Date: Sat, 30 Apr 2011 11:20:36 +0100
Message-ID: <20110430112036.1715b351@lxorguk.ukuu.org.uk>
References: <1304115712-5299-1-git-send-email-vivien.didelot@savoirfairelinux.com>
	<1304115712-5299-6-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:36900 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755164Ab1D3KUF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Apr 2011 06:20:05 -0400
In-Reply-To: <1304115712-5299-6-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org, Jonas Fonseca <jonas.fonseca@savoirfairelinux.com>, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, lm-sensors@lm-sensors.org

> +	ts5xxx_sbcinfo_set(&sbcinfo);
> +	if (5500 != sbcinfo.board_id && !sbcinfo.adc) {
> +		printk(MODULE_NAME ": Incompatible TS Board.\n");
> +		return -ENODEV

This is a symptom of creating the devices in the wrong place. If you put
all the ident/creation of boards in one place with the device creation
the drivers will cleanup and these ugly export things will go away
