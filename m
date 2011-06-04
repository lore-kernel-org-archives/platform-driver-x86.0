From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Sat, 04 Jun 2011 15:11:27 +0200
Message-ID: <4DEA2EFF.9040206@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9012E.5040207@absence.it> <20110604080717.GC7194@kamineko.org> <4DEA0C27.1000508@absence.it> <20110604124448.GB14809@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:44664 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755218Ab1FDNLa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 09:11:30 -0400
In-Reply-To: <20110604124448.GB14809@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Il 04/06/2011 14:44, Matthew Garrett ha scritto:
> This event should be sent if hitting the switch is a request to
> userspace. If pressing it causes the hardware to perform the change and
> this is merely a notification that the change has been made, it
> shouldn't be sent.

Ok, I didn't know about this difference, I'll remove it and update the 
patch.
