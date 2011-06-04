From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control
 file
Date: Sat, 04 Jun 2011 13:15:32 +0200
Message-ID: <4DEA13D4.1000100@absence.it>
References: <4DE8FC4A.9010401@absence.it> <201106031400.36141.dmitry.torokhov@gmail.com> <4DE9563F.9010503@absence.it> <201106031512.38349.dmitry.torokhov@gmail.com> <4DE9904E.7050805@absence.it> <20110604070921.GA5132@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:35070 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754724Ab1FDLPf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 07:15:35 -0400
In-Reply-To: <20110604070921.GA5132@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 04/06/2011 09:09, Mattia Dongili ha scritto:
> the point is that disabling the touchpad is already possible via a
> common interface already,

Well, disabling/powering off and ignoring are not synonyms. It would be 
better to have userspace disabling the touchpad when this feature is 
present and ignoring it when not.

> if there is any additional win in implementing
> the switch in sony-laptop then it's worth using this sony-specific
> quirks otherwise it's totally pointless.

I cannot see how such small code and file will harm, people that don't 
care can ignore it.
