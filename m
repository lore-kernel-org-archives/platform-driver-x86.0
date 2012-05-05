From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] acer-wmi: add 3 laptops to video backlight vendor mode quirk table
Date: Sun, 06 May 2012 00:09:15 +0100
Message-ID: <1419557.QLNuvvmj4y@valkyrie>
References: <1336220335-7004-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:36632 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752003Ab2EEXJV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 5 May 2012 19:09:21 -0400
Received: by wibhj6 with SMTP id hj6so2374745wib.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 May 2012 16:09:20 -0700 (PDT)
In-Reply-To: <1336220335-7004-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, stable@kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, "Christopher M. Penalver" <christopher.penalver@gmx.com>, Bence Lukacs <lukacs.bence1@gmail.com>, Joern Heissler <kernelbugs2012@joern.heissler.de>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

On Saturday 05 May 2012 20:18:55 Lee, Chun-Yi wrote:
> Acer Extensa 5235, TravelMate 5760 and Aspire 5750 laptop have broken _BCM
> implemenation, the AML code wrote value to EC register but firmware didn't
> change brighenss.
> 
> Fortunately, the brightness control works on those machines with vendor
> mode. So, add this machine to video backlight vendor mode quirk table.

Is there no way we can auto-detect this somehow? Is there something peculiar 
about the broken implementation that we can use to do this detection instead?

-Carlos
