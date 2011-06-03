From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control
 file
Date: Fri, 03 Jun 2011 22:33:05 +0200
Message-ID: <4DE94501.1080905@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE92514.8080405@absence.it> <201106031323.55763.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:50129 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752056Ab1FCUdM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 16:33:12 -0400
In-Reply-To: <201106031323.55763.dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Il 03/06/2011 22:23, Dmitry Torokhov ha scritto:

> Why do we want to do this? X allows to ignore certain pointing devices
> IIRC.

Because I believe it turns off the device, the power state is also 
stored and preserved across reboots and shutdowns. Telling X to ignore 
the input is, IMHO, a workaround if we have the hardware capability for 
that (and why should we suppose that X will be used always and forever?).
