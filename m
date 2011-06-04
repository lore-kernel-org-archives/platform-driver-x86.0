From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control
 file
Date: Sat, 04 Jun 2011 16:28:31 +0200
Message-ID: <4DEA410F.40906@absence.it>
References: <4DE8FC4A.9010401@absence.it> <201106031400.36141.dmitry.torokhov@gmail.com> <4DE9563F.9010503@absence.it> <201106031512.38349.dmitry.torokhov@gmail.com> <4DE9904E.7050805@absence.it> <20110604070921.GA5132@kamineko.org> <4DEA13D4.1000100@absence.it> <20110604124614.GC14809@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:54600 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756456Ab1FDO2g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 10:28:36 -0400
In-Reply-To: <20110604124614.GC14809@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mattia Dongili <malattia@linux.it>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, platform-driver-x86@vger.kernel.org

Il 04/06/2011 14:46, Matthew Garrett ha scritto:
> This feature is present in enough machines that we really need some
> standardised way to present it, rather than it just being yet another
>  random sysfs file.

I agree.

> The problem is working out a good way to standardise
> it.

I know this too, and unfortunately I cannot help here. But, from the 
user standpoint, not having a feature that can be implemented (somehow) 
and may be useful is really bad.
