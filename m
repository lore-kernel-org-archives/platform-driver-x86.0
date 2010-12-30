From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Add Lenovo Ideapad S12 to acer blacklist
Date: Thu, 30 Dec 2010 01:41:47 +0000
Message-ID: <20101230014147.GA1781@srcf.ucam.org>
References: <1293672774-13563-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38966 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754131Ab0L3Bl5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Dec 2010 20:41:57 -0500
Content-Disposition: inline
In-Reply-To: <1293672774-13563-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Thomas Renninger <trenn@suse.de>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>

On Thu, Dec 30, 2010 at 09:32:54AM +0800, Lee, Chun-Yi wrote:
> The Lenovo Ideapad S12's _WDG have GUID that matches with AMW0, it causes
> acer-wmi driver auto-probe when system boot but there already have
> ideapad-laptop driver to support Ideapad serial.
> So, add Lenovo Ideapad S12 to acer blacklist to disable it.

This seems like it could be handled better. Does the interface fail, or 
does it merely duplicate the functionality of the ideapad driver?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
