From: Alexander Holler <holler@ahsoftware.de>
Subject: samsung-laptop: light sensor?
Date: Sun, 09 Sep 2012 21:31:23 +0200
Message-ID: <504CEE8B.9070905@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from h1446028.stratoserver.net ([85.214.92.142]:58560 "EHLO
	mail.ahsoftware.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589Ab2IITks (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 9 Sep 2012 15:40:48 -0400
Received: from eiche.ahsoftware (p57B20AA0.dip0.t-ipconnect.de [87.178.10.160])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.ahsoftware.de (Postfix) with ESMTPSA id 8CCA78880D5
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Sep 2012 21:35:00 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentincj@iksaif.net>

Hello,

I'm searching some information about how to read the values from the
light sensor found on some Samsung laptops.

Does anyone have any information about how to access the light sensor?
If I would find such information, I would (try) to write a driver (or
enhance samsung-laptop), at least to read the values and maybe something
to adjust the keyboard- and/or the lcd-backlight (on startup and maybe
dynamically at runtime).

Regards,

Alexander
