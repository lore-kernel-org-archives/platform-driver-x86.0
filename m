From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 8/25] sony-laptop: sony_nc_notify rewritten and improved
Date: Sat, 04 Jun 2011 16:42:24 +0200
Message-ID: <4DEA4450.80702@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FFE0.5070506@absence.it> <20110604084338.GD7194@kamineko.org> <20110604124219.GA14809@srcf.ucam.org> <4DEA3FBD.8020602@absence.it> <20110604143012.GA16615@srcf.ucam.org> <4DEA4283.103@absence.it> <20110604143638.GA16747@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:47555 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754473Ab1FDOm2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 10:42:28 -0400
In-Reply-To: <20110604143638.GA16747@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org

Il 04/06/2011 16:36, Matthew Garrett ha scritto:
> On Sat, Jun 04, 2011 at 04:34:43PM +0200, Marco Chiappero wrote:
>
>> Ok, fine. So, should we forward any event (als events, shock
>> protection, hybrid GFX, etc.) to the input core then?
>
> als events and shock protection probably ought to be uevents on the
> appropriate device.

More precisely? As far as I know there is no ALS device class; and I 
know nothing about the other.
